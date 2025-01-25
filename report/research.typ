== Conversation Sequence
What is the optimal sequence for a conversation between multiple agents?

=== Initial idea
Have each agent present itself at the beginning.
Agent A: "Hello, I am agent A."
Agent B: "Hello, I am agent B."

Then, in a step manner, have each agent generate following messages in async.

Step 1:
Agent A: "Nice to meet you, agent B."
Agent B: "Nice to meet you, agent A."

Step 2:
Agent A: "How are you doing?"
Agent B: "What's on your mind today?"

==== Pros
If there are more than 2 agents, an "ackknowledge" message can be emitted which isn't broadcasted to other agents, but indicates that the agent currently has nothing to say.

Step 3:
Agent A: ACK
Agent B: "I am doing well, thank you for asking."
Agent C: ACK

==== Cons
For two agents, conversations are way too chaotic because the ACK's are not well synchronized. It's as if the conversation doesn't happen in a sequential order. At each response, each agent is responding to the previous message, not the current message.

=== Proposed solution
Have a "conversation mediator" that decides on who should speak next given the context, and possibly who the previous LLM was addressing to. If there's only two agents, just flip-flop between the two.