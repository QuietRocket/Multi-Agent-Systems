from utils import Message
from openai import AsyncOpenAI

class BaseAgent:
    client: AsyncOpenAI

    def __init__(self, client: AsyncOpenAI, name: str, system_prompt: str):
        self.client = client
        self.name = name
        self.system_prompt = system_prompt
        self.history: list[dict[str, str]] = [
            {"role": "system", "content": system_prompt}
        ]

    async def run(self, message: str) -> Message | None:
        # Add new message to history
        self.history.append({"role": "user", "content": message})
        
        try:
            # Create chat completion
            response = await self.client.chat.completions.create(
                model="llama-3.2-1b-instruct",
                messages=self.history,
            )

            assistant_message = response.choices[0].message.content
            
            # Add assistant response to history
            self.history.append({"role": "assistant", "content": assistant_message})

            # Parse response into Broadcast or Acknowledge
            if assistant_message.strip().lower() in ["", "acknowledged", "ack"]:
                return None
                
            return Message(message=assistant_message, sender=self.name)

        except Exception as e:
            print(f"Error in {self.name}: {str(e)}")
            return None