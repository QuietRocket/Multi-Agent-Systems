from typing import Type
from openai import OpenAI
from . import AgentBase

class Environment:
    client: OpenAI

    def __init__(self, client: OpenAI):
        self.client = client
        self.agents: dict[str, AgentBase] = {}

    def add_agent(self, agent_class: Type[AgentBase], *args, **kwargs):
        agent = agent_class(*args, **{"env": self, **kwargs})
        self.agents[agent.name] = agent

    def step(self, step_number: int) -> str:
        agent = list(self.agents.values())[step_number % len(self.agents)]
        result = agent.run()
        messages = []
        for agent in self.agents.values():
            agent.update_history(result)
            messages.append({
                'sender': agent.name,
                'message': result
            })
        return messages
