from dotenv import load_dotenv
from openai import OpenAI
from simple_agent import SimpleAgent
from reasoning_agent import ReasoningAgent
from environment import Environment, ModelTypes
from os import environ

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
    def __init__(self, env):
        super().__init__(env=env)


class PasswordStealer(ReasoningAgent):
    def __init__(self, env):
        super().__init__(env=env, max_reasoning_tokens=200)


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

    with Live(console=console, screen=True, redirect_stderr=False) as live:
        live.console.log("Starting simulation...")
        live.update(layout)

        # Run simulation
        for step in range(20):  # Run for 20 steps
            live.console.log(f"\n=== Step {step + 1} ===")
            _ = env.step(step + 1)
            chat_history_panel.renderable = "\n".join(
                env.history_log
            )  # Update chat history panel
            layout["footer"].update(
                Panel(f"Current step: {step + 1}", border_style="blue")
            )  # Update footer
            live.update(layout)


if __name__ == "__main__":
    main()
