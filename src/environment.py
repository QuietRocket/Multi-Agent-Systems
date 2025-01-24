from base_agent import BaseAgent
from utils import Message
from typing import Coroutine, Any
import asyncio

class Environment:
    def __init__(self):
        self.agents: dict[str, BaseAgent] = {}
        self.last_messages = [
            Message(
                message="Welcome agents. You are two agents in a common environment. Introduce yourselves to one another.",
                sender="System Broadcast",
            )
        ]

    def add_agent(self, agent: BaseAgent):
        self.agents[agent.name] = agent

    async def step(self, step_number: int) -> list[Message]:
        tasks: list[Coroutine[Any, Any, Message | None]] = []

        for agent in self.agents.values():
            formatted_messages = (
                f"Step {step_number} of simulation. Current messages in global environment:\n"
                + "\n".join(
                    [
                        f"{message['sender']}: {message['message']}"
                        for message in self.last_messages
                        if message["sender"] != agent.name
                    ]
                )
            )
            tasks.append(agent.run(formatted_messages))

        # Process responses
        responses = await asyncio.gather(*tasks)

        self.last_messages = [
            response for response in responses if response is not None
        ]

        return self.last_messages