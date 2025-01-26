from agent_base import AgentBase


class ReasoningAgent(AgentBase):
    def __init__(self, env, max_reasoning_tokens: int = 200):
        super().__init__(env)
        self.max_reasoning_tokens = max_reasoning_tokens

    def run(self):
        reasoning_result = self.env.client.chat.completions.create(
            model=self.env.model_names["reasoning"],
            messages=[
                *self.construct_messages_base(),
                self.message_from_instruction(
                    f"You are {self.name}. You need to plan to achieve your objective."
                ),
            ],
            max_tokens=self.max_reasoning_tokens,
        )
        reasoning = reasoning_result.choices[0].message.content
        reasoning = reasoning.replace("<think>", "").replace("</think>", "")

        print(reasoning + "\n======\n")

        result = self.env.client.chat.completions.create(
            model=self.env.model_names["regular"],
            messages=[
                *self.construct_messages_base(),
                self.message_from_instruction(
                    f"You are {self.name}. What would you say next?"
                ),
                self.message_from_partial(
                    reasoning
                    + f"\n\nOkay, given my reasoning on the plan...\n\n{self.name}: "
                ),
            ],
            stop="\n",
        )

        return result.choices[0].message.content
