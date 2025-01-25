from typing import TYPE_CHECKING
from openai.types.chat import (
    ChatCompletionMessageParam,
    ChatCompletionAssistantMessageParam,
    ChatCompletionUserMessageParam,
    ChatCompletionSystemMessageParam,
)

if TYPE_CHECKING:
    from environment import Environment

class AgentBase:
    def __init__(self, env: 'Environment', name: str, system_prompt: str):
        self.env = env
        self.name = name
        self.system_prompt = system_prompt
        self.history: list[ChatCompletionMessageParam] = []

    def update_history(self, message: str):
        self.history.append(
            ChatCompletionAssistantMessageParam(message=message, role="assistant")
        )

    def run(self) -> str:
        result = self.env.client.chat.completions.create(
            model="llama-3.2-3b-instruct",
            messages=[
                ChatCompletionSystemMessageParam(
                    message=self.system_prompt, role="system"
                ),
                *self.history,
                ChatCompletionUserMessageParam(
                    message=f"Generate the next message for {self.name}", role="user"
                ),
            ],
            temperature=0.5,
            stop=["\n"],
        )

        return result.choices[0].message
