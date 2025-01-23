from dotenv import load_dotenv
from pydantic_ai import Agent
from pydantic_ai.models.openai import OpenAIModel
from pydantic import BaseModel

model = OpenAIModel("llama-3.2-1b-instruct", base_url="http://127.0.0.1:1234/v1", api_key="specifyanyway")

class Message(BaseModel):
    message: str

load_dotenv()

roflbot = Agent[None, str](
    model,
    result_type=str,
    system_prompt="You're a chatbot."
)


history = []

while True:
    response = roflbot.run_sync(
        input("You: "),
        result_type=Message,
        
        message_history=history
    )
    print("Bot:", response.data)

    history = response.all_messages()