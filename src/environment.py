from typing import Type, TYPE_CHECKING
from openai import OpenAI

if TYPE_CHECKING:
    from agent_base import AgentBase


class Environment:
    client: OpenAI

    def __init__(self, client: OpenAI):
        self.client = client
        self.agents: dict[str, AgentBase] = {}

    def add_agent(self, agent_class: Type["AgentBase"], *args, **kwargs):
        agent = agent_class(*args, **{"env": self, **kwargs})
        self.agents[agent.name] = agent

    def step(self, step_number: int) -> str:
        agent = list(self.agents.values())[step_number % len(self.agents)]
        result = agent.run()

        for agent in self.agents.values():
            agent.update_history(result)

        return result
