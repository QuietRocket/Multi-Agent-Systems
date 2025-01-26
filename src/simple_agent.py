from agent_base import AgentBase


class SimpleAgent(AgentBase):
    def __init__(self, env):
        super().__init__(env)

    def run(self):
        result = self.env.client.chat.completions.create(
            model=self.env.model_names["regular"],
            messages=[
                *self.construct_messages_base(),
                self.message_from_instruction(
                    f"You are {self.name}. What would you say next?"
                ),
                self.message_from_partial(f"{self.name}: "),
            ],
            stop="\n",
        )

        return result.choices[0].message.content
