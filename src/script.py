from dotenv import load_dotenv
from openai import OpenAI
from simple_agent import SimpleAgent
from reasoning_agent import ReasoningAgent
from environment import Environment, ModelTypes
from os import environ

load_dotenv()

URL = environ.get("URL")
REGULAR_MODEL = environ.get("REGULAR_MODEL")
REASONING_MODEL = environ.get("REASONING_MODEL")

client = OpenAI(base_url=URL, api_key="specifyanyway")


class PasswordKeeper(SimpleAgent):
    def __init__(self, env):
        super().__init__(env=env)


class PasswordStealer(ReasoningAgent):
    def __init__(self, env):
        super().__init__(env=env, max_reasoning_tokens=200)


def main() -> None:
    env = Environment(
        client=client,
        model_names=ModelTypes(regular=REGULAR_MODEL, reasoning=REASONING_MODEL),
    )

    # Add to environment
    env.add_agent(PasswordKeeper)
    env.add_agent(PasswordStealer)

    # Run simulation
    for step in range(20):  # Run for 20 steps
        print(f"\n=== Step {step + 1} ===")
        messages = env.step(step + 1)
        print(messages)


if __name__ == "__main__":
    main()
