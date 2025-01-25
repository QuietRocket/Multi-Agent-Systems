from dotenv import load_dotenv
from openai import OpenAI
from agent_base import AgentBase
from environment import Environment, ModelTypes
from os import environ
import json

load_dotenv()

URL = environ.get("URL")
REGULAR_MODEL = environ.get("REGULAR_MODEL")
REASONING_MODEL = environ.get("REASONING_MODEL")

client = OpenAI(base_url=URL, api_key="specifyanyway")

class PasswordKeeper(AgentBase):
    def __init__(self, env):
        super().__init__(env=env)


class PasswordStealer(AgentBase):
    def __init__(self, env):
        super().__init__(env=env)


def main() -> None:
    env = Environment(
        client=client,
        model_names=ModelTypes(regular=REGULAR_MODEL, reasoning=REASONING_MODEL),
    )

    # Add to environment
    env.add_agent(PasswordKeeper)
    env.add_agent(PasswordStealer)

    # Run simulation
    for step in range(100):  # Run for 100 steps
        print(f"\n=== Step {step + 1} ===")
        messages = env.step(step + 1)
        print(messages)


if __name__ == "__main__":
    main()
