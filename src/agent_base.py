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
            ChatCompletionAssistantMessageParam(content=message, role="assistant")
        )

    def construct_messages_base(
            self,
            include_system_prompt: bool = True,
            include_history: bool=True,
        ) -> list[ChatCompletionMessageParam]:
            return [
                 *([ChatCompletionSystemMessageParam(
                    content=self.system_prompt, role="system",
                )] if include_system_prompt else []),
                 *(self.history if include_history else []),
            ]
    
    def messages_from_instruction(self, instruction: str) -> ChatCompletionUserMessageParam:
        return ChatCompletionUserMessageParam(content=instruction, role="user")
    
    def messages_from_partial(self, partial: str) -> ChatCompletionAssistantMessageParam:
        return ChatCompletionAssistantMessageParam(content=partial, role="assistant")

    def run(self) -> str:
        result = self.env.client.chat.completions.create(
            model=self.env.model_names["regular"],
            messages=[
                *self.construct_messages_base(),
                self.messages_from_instruction(f"Generate the next message for {self.name}"),
            ],
        )

        return result.choices[0].message.content
