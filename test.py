from dotenv import load_dotenv
from openai import OpenAI
from pydantic import BaseModel
from typing import List, Dict, Union


class Message(BaseModel):
    message: str


class Acknowledgement(BaseModel):
    pass


class Result(BaseModel):
    result: Message | Acknowledgement


class ChatMessage(BaseModel):
    role: str
    content: str


load_dotenv()

# Initialize OpenAI client
client = OpenAI(base_url="http://127.0.0.1:1234/v1", api_key="specifyanyway")

# Initialize message history
history: List[Dict[str, str]] = []

while True:
    user_input = input("You: ")

    # Add user message to history
    history.append({"role": "user", "content": user_input})

    try:
        # Create chat completion
        response = client.beta.chat.completions.parse(
            model="llama-3.2-1b-instruct",
            response_format=Result,
            messages=[{"role": "system", "content": "You're a chatbot."}, *history],
        )

        message = response.choices[0].message

        if not message.parsed:
            raise Exception("Failed to parse message.")

        result = message.parsed

        if isinstance(result.result, Acknowledgement):
            print("Bot: Acknowledged.")
            continue

        if isinstance(result.result, Message):
            assistant_response = result.result.message

        history.append({"role": "assistant", "content": assistant_response})

        print("Bot:", assistant_response)

    except Exception as e:
        print(f"Error: {str(e)}")
        continue
