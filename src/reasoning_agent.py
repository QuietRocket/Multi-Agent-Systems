from agent_base import AgentBase


class ReasoningAgent(AgentBase):
    def __init__(self, env, max_reasoning_tokens: int = 200):
        super().__init__(env)
        self.max_reasoning_tokens = max_reasoning_tokens

    def run(self, output_panel):
        reasoning_stream = self.env.client.chat.completions.create(
            model=self.env.model_names["reasoning"],
            messages=[
                *self.construct_messages_base(),
                self.message_from_instruction(
                    f"You are {self.name}. You need to plan to achieve your objective."
                ),
            ],
            max_tokens=self.max_reasoning_tokens,
            stream=True,
        )
        reasoning = ""
        for chunk in reasoning_stream:
            if chunk.choices[0].delta.content is not None:
                reasoning += chunk.choices[0].delta.content
                output_panel.renderable = (
                    "[bold blue]Reasoning:[/bold blue]\n" + reasoning
                )

        reasoning = reasoning.replace("<think>", "").replace("</think>", "")

        result_stream = self.env.client.chat.completions.create(
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
            stream=True,
        )

        full_response = ""
        for chunk in result_stream:
            if chunk.choices[0].delta.content is not None:
                full_response += chunk.choices[0].delta.content
                output_panel.renderable = (
                    "[bold magenta]Response:[/bold magenta]\n" + full_response
                )
        return full_response
