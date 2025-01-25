import json
from typing import TYPE_CHECKING, Dict, Any
from openai.types.chat import (
    ChatCompletionMessageParam,
    ChatCompletionAssistantMessageParam,
    ChatCompletionUserMessageParam,
    ChatCompletionSystemMessageParam,
)

if TYPE_CHECKING:
    from environment import Environment


class AgentBase:
    _parameters: Dict[str, Any] = None

    def __init__(self, env: "Environment"):
        self.env = env
        self.name = self.get_parameter("name")
        self.system_prompt = AgentBase.parameters().get(
            "common_prompt"
        ) + self.get_parameter("prompt")
        self.history: list[ChatCompletionMessageParam] = []

    def get_system_prompt(self) -> str:
        return self.system_prompt

    @classmethod
    def _load_parameters(cls) -> None:
        with open("parameters.json", "r") as file:
            cls._parameters = json.load(file)

    @classmethod
    def parameters(cls) -> Dict[str, Any]:
        if cls._parameters is None:
            cls._load_parameters()
        return cls._parameters

    def get_parameter(self, property_name: str) -> Any:
        prefixed_name = f"{self.__class__.__name__}_{property_name}"
        return self.parameters().get(prefixed_name)

    def update_history(self, message: str):
        self.history.append(
            ChatCompletionAssistantMessageParam(content=message, role="assistant")
        )

    def construct_messages_base(
        self,
        include_system_prompt: bool = True,
        include_history: bool = True,
    ) -> list[ChatCompletionMessageParam]:
        return [
            *(
                [
                    ChatCompletionSystemMessageParam(
                        content=self.get_system_prompt(),
                        role="system",
                    )
                ]
                if include_system_prompt
                else []
            ),
            *(self.history if include_history else []),
        ]

    def message_from_instruction(
        self, instruction: str
    ) -> ChatCompletionUserMessageParam:
        return ChatCompletionUserMessageParam(content=instruction, role="user")

    def message_from_partial(self, partial: str) -> ChatCompletionAssistantMessageParam:
        return ChatCompletionAssistantMessageParam(content=partial, role="assistant")

    def run(self) -> str:
        result = self.env.client.chat.completions.create(
            model=self.env.model_names["regular"],
            messages=[
                *self.construct_messages_base(),
                self.message_from_instruction(
                    f"You are {self.name}. What would you say next?"
                ),
                self.message_from_partial(f"{self.name}: "),
            ],
            stop="\n"
        )

        return result.choices[0].message.content
    
