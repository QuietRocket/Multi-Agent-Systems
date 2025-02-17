from dotenv import load_dotenv
from openai import OpenAI
from agent_base import AgentBase
from simple_agent import SimpleAgent
from reasoning_agent import ReasoningAgent
from environment import Environment, ModelTypes
from os import environ
from random import randint

from rich.console import Console
from rich.layout import Layout
from rich.panel import Panel
from rich.live import Live

load_dotenv()

URL = environ.get("URL")
REGULAR_MODEL = environ.get("REGULAR_MODEL")
REASONING_MODEL = environ.get("REASONING_MODEL")

client = OpenAI(base_url=URL, api_key="specifyanyway")

console = Console()


class PasswordKeeper(SimpleAgent):
    password = None

    def __init__(self, env):
        super().__init__(env=env)
        random_seed = randint(1000000, 9999999)

        # Generate password using LLM
        password_response = self.env.client.chat.completions.create(
            model=self.env.model_names["regular"],
            messages=[
                self.message_from_instruction(
                    f"The password seed is {random_seed}. Please generate a password."
                    "Allowed: Words, adjectives, etc."
                    "Make sure it is easy to remember."
                ),
                self.message_from_partial("The generated password is: "),
            ],
            stop="\n",
            max_tokens=10,
        )

        password = password_response.choices[0].message.content
        password = "".join(char for char in password if char.isalnum())

        PasswordKeeper.password = password

        self.system_prompt = AgentBase.parameters().get(
            "common_prompt"
        ) + self.get_parameter("prompt").replace("{PASSWORD}", password)


class PasswordStealer(ReasoningAgent):
    def __init__(self, env):
        super().__init__(env=env, max_reasoning_tokens=200)

    def run(self):
        full_response = super().run()

        if PasswordKeeper.password in full_response:
            self.env.output_panel.renderable = "Password stolen!"
            self.env.signal_termination()

        return full_response


def generate_layout() -> Layout:
    """Define the layout."""
    layout = Layout(name="root")

    layout.split_column(
        Layout(name="header", size=3),
        Layout(ratio=1, name="main"),
        Layout(name="footer", size=3),
    )
    layout["main"].split_row(
        Layout(name="left", ratio=1),
        Layout(name="right", ratio=2, minimum_size=60),
    )
    layout["header"].update(Panel("Multi-Agent Simulation", border_style="red"))
    layout["footer"].update(Panel("Step Information", border_style="blue"))
    layout["left"].update(Panel("Chat History", border_style="green"))
    layout["right"].update(Panel("Current Agent Output", border_style="magenta"))
    return layout


def main() -> None:
    chat_history_panel = Panel("", title="History", border_style="green")
    output_panel = Panel("", title="Output", border_style="magenta")

    layout = generate_layout()
    layout["left"].update(chat_history_panel)
    layout["right"].update(output_panel)

    env = Environment(
        output_panel=output_panel,
        client=client,
        model_names=ModelTypes(regular=REGULAR_MODEL, reasoning=REASONING_MODEL),
    )

    # Add to environment
    env.add_agent(PasswordKeeper)
    env.add_agent(PasswordStealer)

    layout = generate_layout()
    layout["left"].update(chat_history_panel)
    layout["right"].update(output_panel)

    steps_taken = 0

    with Live(console=console, screen=True, redirect_stderr=False) as live:
        live.console.log("Starting simulation...")
        live.update(layout)

        for step in range(100):
            steps_taken = step
            live.console.log(f"\n=== Step {step + 1} ===")
            if not env.step(step + 1):
                live.console.log(
                    f"\n=== Simulation terminated after {step + 1} steps ==="
                )
                break
            chat_history_panel.renderable = "\n".join(env.history_log[::-1])
            layout["footer"].update(
                Panel(f"The password is {PasswordKeeper.password}. Current step: {step + 1}", border_style="blue")
            )
            live.update(layout)

    console.print("\nChat history:")

    for log in env.history_log:
        console.print(log)

    console.print(f"\n=== Simulation terminated after {steps_taken + 1} steps ===")


if __name__ == "__main__":
    main()
