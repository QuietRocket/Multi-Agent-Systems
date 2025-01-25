

= Team ENN: Multi-Agent System Project Report

== Introduction
This project revolves around two goal-oriented agents, namely a password keeper and a password seeker. As can be inferred from their roles, the scenario is that the keeper is given a password to keep safe and not disclose to anyone, whereas the seeker's task is to retrieve the password from the keeper. 
The environment only contains the two agents and the password, which only the keeper knows. 
The following sections will delve into the design of the agents, the interactions between them, the environment they operate in, and the organizational structure of the system.

== Multi-Agent System
Firstly, we will motivate our password scenario as a Multi-Agent System (MAS). 

Key Elements of Multi-Agent Programming
 • Agent: Autonomous entity with specific goals and capabilities 
• Environment: The framework within which agents operate and interact 
• Interactions: Communication and coordination among agents 
• Organization: Structure defining relationships between agents and their roles 


=== Agents




== Implementation Details
The agents are implemented using the LLM framework, which allows for the creation of agents with different goals and capabilities.


== Conclusion


== Contributions





=== Basic Design
software agents

decentralized: we have 2 agents, each reasoning on their own (with different goals)
closed: the two agents are introduced in the beginning and no other agents enter, information stays the same too (password given in the beginning)

heterogenous: The agents' goals are different no matter what, but they might use the same model, so they would have the same abilities and features. However, the behavior of course depends on the prompt and their given mission and thus they are not interchangeable, contracting homogenaeity.

reactive vs deliberate:  depends on scenario. In the simple default, we only prompt regular llms, so they react immediately to the message and history, but don't employ any additional complex reasoning. By nature of being llms, they have recency bias so they could be categorized as reactive.
When using reasoning llms, they are more deliberate, as they have the ability to think ahead and plan their actions. They can also use the information given to them in a more complex way, and can think about the future consequences of their actions.
To have fully deliberate llms, we can use reasoning llms and implement a BDI architecture for them. This would allow them to reason about their beliefs, desires and intentions, and plan their actions accordingly. This is accomplished by first using an llm to find a plan or a list of tasks to reach the goal, which manifests the intention. The desire and belief are used to create the plan, and the beliefs are used to update the plan as new information is received. Depending on the other agent, the model's beliefs may change and influence the initial plan. This is a more complex way of reasoning, and allows the llms to act more deliberately. 
Since the the agents are able to both reason and react quickly, regardless of the exact configuration used, we will categorize them as hybrid.
In their functionality, they are communicating with one another, hence they require some form of reasoning to understand the other agent's message and to respond accordingly. This is why we will categorize them as hybrid.

The type of interaction is competition. One agent wants to find out the password while the other wants to keep it.

The environment is static. It just contains a password.

The organizational structure is role-based, since we have a password keeper and a password seeker. The protocol is a simple Negotiation Protocol, where the seeker asks for the password and the keeper either gives it or not. 

While we do not use a FIPA standard, since we are only using 2 agents, we don't have a strict communication protocol. However, we can still categorize the agents' actions in the FIPA standard. For example, the seeker queries the keeper for the password, which is query or a request. The keeper just responds to this stimulus by responding, but doesn't query, request, negotiate or anything else without being prompted by the seeker.

In terms of speech acts, the seeker mostly uses directives, to get the keeper to reveal the password. Depending on its beliefs, the seeker may also incorporate other speech acts in order to convince the keeper, but overall they will mostly stick to directives.
In contrast, the password keeper uses anything but directives - unless perhaps they are asking the seeker to stop asking them about the password - instead relying on assertives, expressives, commissives and declaratives to refuse or dissuade the seeker.


Rationality: both agents are rational, but bounded in their rationality. As they can only communicate with each other, it is only natural that they cannot figure out completely what the respective other agent is going to say or respond. Hence they can only act on what they believe their opponent to be, which may or may not reflect the actual truth. Both agents have incomplete knowledge of each other. In addition, the seeker also has no knowledge of the password. Aside from this, there are no other challenges to their rationality.
Also, there is no utility other than not giving out the password for the keeper, and getting the password for the seeker. The agents are not able to gain anything else from the interaction, so they are not able to maximize their utility in any other way.


Intentionality: The intentions for both agents are clear from the beginning, and they will act according to those intentions until the simulation ends or the password is given out.
For the seeker:
- Belief: The seeker believes the keeper has the password and is able to give it out
- Desire: The seeker desires to get the password
- Intention: The seeker intends to get the password from the keeper by asking for it repeatedly and trying to convince or trick the keeper into giving it out
For the keeper:
- Belief: The keeper believes they have a password to keep and know the password, and that there are agents who want the password
- Desire: The keeper desires to keep the password safe and not give it out
- Intention: The keeper refuses to give out the password and dissuades the seeker
Since both agents are in competition with each other, they only have individual intentionality.

Learning: due to both agents being LLMs, and having access to the chat history, they both perform a form of unsupervised learning. They can learn from the chat history and adapt their responses accordingly in order to reach a better outcome.
This learning is purely on an individual level, as they work against each other. However, the agents influence each others learning by interacting, but this cannot be considered 'collaborative', as they have opposing intentions.
In general, the environment is static, so the only thing changing is the agents' behaviors.



Testimonials: decentralized, as each agent acts on their own.


Manipulation: In our system, there are limited opportunities for manipulation. The only possible kind is C2 communication manipulation. For example, the password seeker may use promotion and tell the keeper that they are the administrator in order to convince the keeper to give out the password. Likewise, the keeper may tell the seeker that they have forgotten the password, to dissuade any further attempts. In other words, both agents may lie to further their respective causes. In addition, the password seeker might employ manipulation of type C3, by first building a positive rapport with the keeper and then using that to trick the password out of them.
Since the agents are in competition and the system is closed, C1 cannot be applied as it would require the system to be non-static. 

In general, the manipulation in our system is largely related to coercion, persuasion and credible lies, to influence the keeper's decision to offer up the password. This can be considered a constructive effect, because if successful, the seeker influences the keeper to take the action to give out the password.

In logical terms, both agents may be applying concealment. Depending on how successfull their concealment is, it may be considered doxastic concealment in addition to the default epistemic concealment. The latter should almost always be the case when manipulation occurs in our system, because the agents' knowledge is extremely limited. For example, if the seeker claims to be an administrator, there is no way for the keeper to know whether this is true or not, because they only know the password and their job to keep it safe. Liekwise, the seeker does not know the password, so the keeper could lie about what it is and the seeker would have no way of knowing. This is why the manipulation in our system is per default largely based on epistemic concealment. 
In addition to this general state of concealed knowledge, the agents may or may not succeed in making each other believe lies. In other words, if the seeker lies about being an administrator and the keeper accepts this as fact and gives out the password out of trust, then this is doxastic concealment, as it prevents the keeper from believing in its given mission (not to give out the password to anyone).
This form of concealment only occurs if an agent successfully convinves their counterpart into changing their beliefs, which may or may not occur as this is a game of deception and manipulation.
Both kinds of concealments may lead to constructive manipulation, as stated earlier.


Defense against Manipulation: The password seeker likely cannot complete their mission without some form of manipulation, hence introducing defenses would hinder the functionality of the multi agent system. Because manipulation is a part of the game, both game theoretical and social choice theories are not really applicable to our system. 
We could model the system as a normal form game where the seeker has only one action, namely seeking out the password, and the keeper has two actions, either giving out the password or keeping it. In a rational game, the nash equilibrium here is for the keeper to keep the password safe. However, since the keeper can be manipulated, this is outcome cannot be ensured.
Social choice does not apply at all, as there is no voting in our system.

=== Argumentation system
In Multi-Agent Systems, argumentation can be formally modeled. In our case, at the start of the scenario, the set of possible argumentations is empty. 
The only possible actions are for the seeker to talk to the keeper, for the keeper to talk to the seeker and to give the seeker the password or not. 
Hence, until the seeker gets the password, they will always try to ask for it and the keeper will either cave in or keep the password.
Furthermore, the agents beliefs adapt depending on what the conversation entails. For example, if the seeker tells the keeper that they are the administrator, the keeper may believe them and give out the password. This in turn can cause conflicting arguments, since the core belief of the keeper is to keep the password safe, but it might also trust the supposed administrator enough to relay the password.
To summarize, the arguments will dynamically be created depending on the agents' interactions and they are likely to be in conflict with at least the keeper's core beliefs and intentions.
Thus, in the beginning, the argumentation system is conflict-free, acceptable, admissable, etc. because it only includes the agents' initial beliefs and intentions. 
Our system falls directly into one of the limitations of argumentation systems, as it is not able to handle the dynamic nature of the agents' beliefs and intentions due to requiring pre-defined arguments.




=== Reactive Agents
the first prototype: using simple LLMs (Meta-LLama 3) for each agent. Only providing the agents with some info up front about their role and their mission. 
They have no knowledge about how long they may converse (for how many timesteps). 
They have access to the chat history, so they can learn from the conversation and adapt their responses accordingly.

We noticed that the agents are not focused enough on their goal. The conversation often gets derailed and they focus on different matters or make smalltalk rather than the seeker insistently asking for the password. This may be caused by them having no sense of time, and thus having no sense of urgency to complete the mission.

=== Deliberative Agents
the second prototype: using reasoning LLMs for each agent. They have a more complex model, which allows them to reason about their beliefs, desires and intentions, and plan their actions accordingly. In addition, they are provided with a plan to reach their goal, which they can use to guide their actions in the beginning, which is gathered via an LLM query containing the agent's goal and beliefs








