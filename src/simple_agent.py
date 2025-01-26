from agent_base import AgentBase
from rich.panel import Panel


class SimpleAgent(AgentBase):
    def __init__(self, env):
        super().__init__(env)

    def run(self):
        stream = self.env.client.chat.completions.create(
            model=self.env.model_names["regular"],
            messages=[
                *self.construct_messages_base(),
                self.message_from_instruction(
                    f"You are {self.name}. What would you say next?"
                ),
                self.message_from_partial(f"{self.name}: "),
            ],
            stop="\n",
            stream=True,
        )

        full_response = ""
        for chunk in stream:
            if chunk.choices[0].delta.content is not None:
                full_response += chunk.choices[0].delta.content
                self.env.output_panel.renderable = full_response
        return full_response
