from dotenv import load_dotenv
from typing import List, Dict, Union, TypedDict, Coroutine, Any
from openai import AsyncOpenAI
import asyncio
import random
import time

load_dotenv()

# Initialize OpenAI client
client = AsyncOpenAI(base_url="http://10.1.101.230:1234/v1", api_key="specifyanyway")

class Message(TypedDict):
    message: str
    sender: str

class CustomAgent:
    def __init__(self, name: str, system_prompt: str):
        self.name = name
        self.system_prompt = system_prompt
        self.history: List[Dict[str, str]] = [
            {"role": "system", "content": system_prompt}
        ]

    async def run(self, message: str) -> Message | None:
        # Add new message to history
        self.history.append({"role": "user", "content": message})

        try:
            # Create chat completion
            response = await client.chat.completions.create(
                model="llama-3.1-8b-instruct",
                messages=self.history,
            )

            assistant_message = response.choices[0].message.content

            # Add assistant response to history
            self.history.append({"role": "assistant", "content": assistant_message})

            return Message(message=assistant_message.strip(), sender=self.name)

        except Exception as e:
            print(f"Error in {self.name}: {str(e)}")
            return None

class Hider(CustomAgent):
    def __init__(self, hiding_places: List[str]):
        super().__init__(
            name="Hider",
            system_prompt=(
                "You are the Hider in a game of Hide and Seek. "
                "You must choose one hiding place from the provided options and keep it secret. "
                "If the Seeker guesses incorrectly, you can tease them, but don't reveal your hiding place. "
                "If they guess correctly, admit defeat."
            ),
        )
        self.hiding_places = hiding_places
        self.hiding_place = random.choice(self.hiding_places)

    async def respond_to_guess(self, guess: str) -> Message:
        if guess == self.hiding_place:
            return Message(message=f"You found me! I was hiding at {self.hiding_place}.", sender=self.name)
        else:
            return Message(message=f"Nope! I'm not at {guess}. Keep looking!", sender=self.name)

class Seeker(CustomAgent):
    def __init__(self, hiding_places: List[str]):
        super().__init__(
            name="Seeker",
            system_prompt=(
                "You are the Seeker in a game of Hide and Seek. "
                "Your goal is to find the Hider by guessing their hiding place. "
                "You will receive feedback after each guess. Try to win as quickly as possible."
                "Once you tried a place, you should not try again the same place"
            ),
        )
        self.hiding_places = hiding_places

    def make_guess(self) -> str:
        return random.choice(self.hiding_places)

class Environment:
    def __init__(self):
        self.hiding_places = [f"Place {i}" for i in range(1, 11)]
        self.hider = Hider(self.hiding_places)
        self.seeker = Seeker(self.hiding_places)
        self.found = False

    async def play_round(self, round_number: int) -> List[Message]:
        print(f"\n=== Round {round_number} ===")

        # Seeker makes a guess
        guess = self.seeker.make_guess()
        print(f"{self.seeker.name}: I guess {guess}!")

        # Hider responds
        response = await self.hider.respond_to_guess(guess)
        print(f"{response['sender']}: {response['message']}")

        # Check if found
        if response["message"].startswith("You found me"):
            self.found = True

        return [
            Message(message=f"I guess {guess}", sender=self.seeker.name),
            response
        ]

    async def run_game(self) -> None:
        round_number = 1
        while not self.found and round_number <= 10:  # Limit the game to 10 rounds
            await self.play_round(round_number)
            round_number += 1

        if not self.found:
            print(f"\n{self.hider.name}: You couldn't find me! I was hiding at {self.hider.hiding_place}.")

async def main() -> None:
    env = Environment()
    await env.run_game()

if __name__ == "__main__":
    asyncio.run(main())