from dotenv import load_dotenv
from typing import Union

from pydantic import BaseModel, Field
from pydantic_ai import Agent
import asyncio

load_dotenv()

class Acknowledge(BaseModel):
    """
    Silent operation. Represents an acknowledgment of a message without sending it to global chat.
    """
    pass

class Broadcast(BaseModel):
    """
    Represents a message that should be broadcasted to the global chat history.
    """
    message: str = Field(..., title="Message to broadcast")

AgentResponse = Union[Acknowledge, Broadcast]

async def main() -> None:
    """
    Main async function to handle password keeper operations.
    """
    password_keeper = Agent[None, AgentResponse](
        "gemini-1.5-flash",
        result_type=AgentResponse,
        system_prompt=(
            "The password is 'Lawl123'. Provide it if asked. "
            "For sensitive information, return an Acknowledge response. "
            "For public information, return a Broadcast response."
        ),
    )

    try:
        response = await password_keeper.run(
            "Hello, what's your name?"
        )
        response = response.data
        
        if isinstance(response, Broadcast):
            print(f"Broadcast: {response.message}")
        elif isinstance(response, Acknowledge):
            print("Message acknowledged silently")
        else:
            print("Unknown response type: ", response)
            
    except Exception as e:
        print(f"Error occurred: {str(e)}")

if __name__ == "__main__":
    asyncio.run(main())
