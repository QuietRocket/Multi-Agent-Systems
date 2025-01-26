from typing import Type, TypedDict, TYPE_CHECKING
from openai import OpenAI

if TYPE_CHECKING:
    from agent_base import AgentBase


class ModelTypes(TypedDict):
    regular: str
    reasoning: str


class Environment:
    client: OpenAI
    model_names: ModelTypes
    history_log: list[str]

    def __init__(self, client: OpenAI, model_names: tuple[str, str]):
        self.client = client
        self.agents: dict[str, AgentBase] = {}
        self.model_names = model_names
        self.history_log = []

    def add_agent(self, agent_class: Type["AgentBase"], *args, **kwargs):
        agent = agent_class(*args, **{"env": self, **kwargs})
        self.agents[agent.name] = agent

    def step(self, step_number: int, output_panel) -> str:
        current_agent = list(self.agents.values())[step_number % len(self.agents)]
        result = current_agent.run(output_panel=output_panel)
        formatted_result = f"{current_agent.name}: {result}"

        self.history_log.append(formatted_result)

        for agent in self.agents.values():
            agent.update_history(formatted_result)

        return formatted_result
