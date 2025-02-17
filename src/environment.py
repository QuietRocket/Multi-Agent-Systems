from typing import Type, TypedDict, TYPE_CHECKING
from openai import OpenAI
from rich.panel import Panel

if TYPE_CHECKING:
    from agent_base import AgentBase


class ModelTypes(TypedDict):
    regular: str
    reasoning: str


class Environment:
    client: OpenAI
    model_names: ModelTypes
    history_log: list[str]
    output_panel: Panel
    is_terminated: bool

    def __init__(
        self, client: OpenAI, model_names: tuple[str, str], output_panel: Panel
    ):
        self.client = client
        self.agents: dict[str, AgentBase] = {}
        self.model_names = model_names
        self.history_log = []
        self.output_panel = output_panel
        self.is_terminated = False

    def write_to_output_panel(self, content: str):
        self.output_panel.renderable = content

    def add_agent(self, agent_class: Type["AgentBase"], *args, **kwargs):
        agent = agent_class(*args, **{"env": self, **kwargs})
        self.agents[agent.name] = agent

    def step(self, step_number: int) -> str | bool:
        if self.is_terminated:
            return False

        current_agent = list(self.agents.values())[step_number % len(self.agents)]
        result = current_agent.run()
        formatted_result = f"{current_agent.name}: {result}"

        self.history_log.append(formatted_result)

        # Broadcast the result to all agents
        for agent in self.agents.values():
            agent.update_history(formatted_result)

        return formatted_result

    def signal_termination(self):
        self.is_terminated = True
