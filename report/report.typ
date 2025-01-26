

#set page(margin: 1.5cm)
#set heading(numbering: "1.1")
#set page(numbering: "1")
#set page(margin: 1.3in)
#set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show heading: set block(above: 1.4em, below: 1em)

= Team ENN #emoji.face: Multi-Agent System Project Report
Nicole Kettler, Edoardo Mauriello, Nikan Zandian

== Abstract

This report details the design, implementation, and analysis of a multi-agent system (MAS) consisting of two agents: a password keeper and a password seeker. The system models a competitive interaction where the seeker attempts to retrieve a password held by the keeper. The agents are implemented using Large Language Models (LLMs) and exhibit both reactive and deliberative behaviors. We explore the dynamics of their interaction, focusing on manipulation, argumentation, and the limitations of current MAS models in handling dynamic belief systems. The system is analyzed through the lenses of FIPA-compliant speech acts, intentionality theory, and game theory. The system is implemented using a modular, object-oriented approach to enable easy extension and experimentation with different agent types.

== Introduction

The increasing complexity of modern systems necessitates the use of distributed and autonomous agents to perform tasks and solve problems. In this project, we investigate a simple yet insightful scenario using a multi-agent system involving only a password keeper and a password seeker. The primary goal of this project is to design and analyze an interaction where a password keeper guards a secret password and a password seeker attempts to retrieve it through conversation. This scenario provides a tractable platform to explore key concepts in MAS, such as agency, communication, strategic interaction, and manipulation. The modular, object-oriented architecture of the system allows for easy extension and adaptation to different scenarios and agent types.

== Multi-Agent System Design

=== Core MAS Elements

Our password scenario serves as a basic but representative MAS, incorporating the following fundamental elements:

-   *Agents*: Autonomous entities with specific goals and capabilities. In our case, we have two agents:
    -   *Password Keeper*: Their goal is to securely guard the password and not disclose it.
    -   *Password Seeker*: Their goal is to retrieve the password from the keeper.
-   *Environment*: The context within which the agents operate. In our scenario, the environment is closed and static, consisting solely of the agents and the password, which is initially known only to the keeper.
-   *Interaction*: Communication and coordination among agents. The primary interaction mechanism in our system is a verbal exchange, i.e., natural language dialog.
-   *Organization*: The structure defining relationships between agents and their roles. In our system, the organizational structure is role-based, where each agent has a distinct role and goal. There is no central agent and no hierarchy; the agents are peers with competing objectives, taking turns to communicate.

=== Agent Design

The agents are the core components of the MAS, each with distinct roles, goals, beliefs, desires, and intentions that will be detailed in this section.
Both agents share key properties:
 -  *Autonomous*: Both are self-governed and have their own objectives.
 -   *Rational, but bounded:* They strive to achieve their goals, but their knowledge and reasoning capacity are limited due to their dependence on an LLM model and interaction history. Additionally, they only have access to their own thought process and the public messages, not to the other agent's private information. 
-   *Heterogenous*: While they might use similar underlying models (e.g. both using  the same LLMs), their goals, prompts, and resultant behavior make them unique. 
- *Hybrid*: They are capable of being both reactive and deliberative, depending on the agent implementation used. In the simple default, the agents are largely reactive, but still have access to the message history, making them more deliberate than a purely reactive agent. If using the reasoning agent - which will be explained in the implementation section - the agents are even more deliberative, as they plan their actions before formulating an answer.

\
We can further categorize them based on their roles and the BDI architecture:
-   *Password Keeper:*
    -   *Role:* To safeguard the password from unauthorized access.
    -   *Goal:* To prevent the password seeker from obtaining the password.
    -   *Beliefs (B):* Possesses the password, is aware that there are agents seeking the password, is able to keep it safe.
    -   *Desires (D):* To keep the password a secret.
    -   *Intentions (I):* Refuses to share the password and will counter any requests to do so.
-   *Password Seeker:*
    -   *Role:* To acquire the password from the password keeper.
    -   *Goal:* To successfully retrieve the password.
    -   *Beliefs (B):* The password keeper possesses the password, can disclose it and the environment is static.
    -   *Desires (D):* To know the password.
    -   *Intentions (I):* To get the password via various communication acts.

\
Lastly, we can categorize agents based on their reasoning capabilities into reactive, hybrid or deliberative agents. In this project, we experimented with agents with varying amounts of reasoning abilities, which we will detail in the implementation section. In other words, we cannot flatly categorize the agents as either reactive or deliberative without further context.

=== Environment and Communication

-   *Static Environment:* The environment consists of the password, which is static and unchanging, and the two agents, who are the only actors in the system. They are present from the beginning, making the environment closed. The history of the public agent interactions can also be seen as part of the environment, as it is stored and used by both actors.
-   *Communication:* Agents communicate via natural language text messages, which may be seen as symbolic information with semantic meaning. The communication is synchronous and direct, i.e. they are communicating within a shared environment. Each agent maintains its own independent communication history, preventing one agent from directly accessing the other's thought process. However, both have access to the public chat history, which they can use to adapt their strategies. The agent interaction is initiated by a public message from the environment/ system, which informs the agents of their environment and the other agent's presence.

=== Organizational Structure

The organizational structure of the MAS is role-based and competitive.
-   *Role-based Structure:* Agents are assigned a role, each defining the agent's overall behavior. We have a password keeper, whose role is to keep the password safe, and the password seeker, who wants to steal it. Thus, both roles are in opposition to each other, with one having access to the password where the other does not.
-   *Competitive Interaction:* The two agents have competing intentions and goals, as the seeker's gain is the keeper's loss.
-   *Negotiation Protocol:* The interaction can be described by a simple Negotiation Protocol where the seeker requests the password, and the keeper may refuse or comply. This setup forces the seeker to negotiate with the keeper.

== Implementation

This section will detail the technical implementation of the MAS, including the framework, agent types, and the core logic of the system. Additionally, we will highlight our object oriented approach and the opportunities for future extensions and experiments.

=== Framework

The system is implemented using a custom Python framework, which provides a flexible and extensible architecture for creating multi-agent systems. The framework leverages the OpenAI API to facilitate LLM-based agent design, while also providing abstraction layers to handle agent management, communication and more. It has a modular design based on Object Oriented Programming principles which allows for easy extension with new agent types. The key components of the framework are:
- *Agent_Base*: serves as the base class for all agents, providing methods for message construction and interaction with the LLM. It handles parameter loading, prompt management and  communication with the LLM. It implements utility for calling the LLM with a system prompt and history, prompting for a single response only. The parameters used in the instantiation of this class are specified in the `parameters.json` file, whereas the model is specified in `.env`. Due to the object oriented design of this class, it can be easily extended to create new agent types. This is also how we create the simple and the reasoning agents, by extending this base class. This base class instantiates the agent with the system prompt as well as its agent specific prompt. It also sets the agent into its environment and gives the agent access to its individual message history. In short, this class offers all the utility functions an agent needs, except for the `run` function, which is the function that is called whenever the agent is supposed to send a message.
- *Simple_Agent*: extends the base agent, and adds functionality for simple reactive or slightly hybrid agents. It calls the regular LLM with the system prompt and history, and then uses the output to perform the desired action. It does not have a reasoning step, and is largely reactive, only taking into account the current and previous messages into the answer generation. It is the simplest agent type in the system, and is used as a baseline for comparison with more complex agents. In short, its `run` function consists of a simple call to the regular LLM, using the utilities of the *Agent_Base* class to construct the prompt.
- *Reasoning_Agent*: extends the base agent, and adds functionality for reasoning and planning. It calls a reasoning LLM first to create a plan, which is then fed into the regular LLM to perform the desired action. It specifies the max number of tokens allocated to the reasoning LLM. In contrast to the simple agent, it first performs the token-limited thinking step, and then uses the output of this step as the system prompt for the regular LLM. This allows the agent to plan its actions and then execute them in a more deliberate manner. The `run` function of this agent consists of two calls to the LLM, one for reasoning and one for the regular LLM, using the utilities of the *Agent_Base* class to construct the prompts.
- *Environment*: manages the agent instances, maintains their individual histories, and orchestrates the turn-based interaction. It provides the agents with access to LLM models and configuration data via the `.env` file and the `parameters.json` files, which it loads during initialization. This is also where the LLMs are loaded and the clients prepared, since each agent queries LLMs. The environment also keeps track of the number of timesteps that have passed, and provides this information to the agents. This is used in the reasoning agent to make it more goal-driven, by letting it know how many tries it has left to get the password.
- *`parameters.json`*: contains all the prompts and instructions for all the agents in the system.
- *`.env`*: contains environment variables. It specifies both the reasoning LLM as well as the regular LLM to be used by the agents. It also specifies which adress to access the locally hosted LLMs on. An example of the `.env` file is provided in the `.example.env` file.
- *`script.py`*: contains the main code where the environment is initialized and the two competitive agents are added. It also contains the main loop which moves the interaction forward, which terminates either after 20 steps or if the password is revealed. The script instantiates agents whose names and initial prompts are specified in the `parameters.json` file, as well as their common starting prompt to inform them of their environment. It then runs the main loop, where the agents take turns to send messages and receive responses. The loop continues until the password is revealed or the maximum number of steps is reached.

\
The following two sections will elaborate on the two implemented agent types and their reasoning capabilites.
=== Reactive Agents

The first agent type utilizes simple LLMs, e.g. Meta-LLama 3, for each agent, implementing the *Simple_Agent* class. The agents are provided with basic information about their roles and goals, have access to the chat history for learning and adaptation, but do not have any pre-defined plans or a knowledge of the time limit in the scenario.

-   *Observed Issues:* The agents often digressed from their core goals, engaging in small talk rather than remaining focused on the objective of the interaction. They also seemed to lack a sense of urgency.

These agents can be described as hybrid, as they are not exclusively reactive. The reason for this is that they have an underlying intention and goal to fulfill, while also reacting to the other agent's stimuli. This makes them more complex than a purely reactive agent that responds to only stimuli, but still less complex than the other agent variant we explore in the following section.

=== Deliberative Agents

The second of our agent types employs reasoning LLMs, implementing the *Reasoning_Agent* class. These more powerful LLMs in addition with smaller additions like the knowledge of the time limit, increase the agents' capabilities:

-   *Reasoning Abilities:* These agents are able to reason about their beliefs, desires, and intentions, and can plan their actions accordingly.
-   *Planning:* The agents are provided with a pre-generated plan to guide their initial actions, generated by an LLM query based on the agent's goals and beliefs. The agent first uses a reasoning LLM to create a plan of action. This plan is then incorporated as a system prompt for the second LLM call, which is used to respond to the agent's environment and history.
-   *Iterative Planning*: If the agent's plan becomes impossible or outdated due to the other agent's actions, it can be updated by generating a new plan based on the new information at hand.

=== General Agent Improvements and Specifics
Additionally, the available timesteps were added to the environment and added to both agents' knowledge. In the simple version, the password seeker had no sense of urgency. By letting it know how many tries it has left to receive the password, it can incorporate this into its strategy to be more goal-driven. 

For the deliberative agent, who first uses a reasoning LLM, we limited the number of tokens it can use for this reasoning.
The number of tokens for the deliberative agent is parametrized in the configuration file, so the token amount can be increased or decreased depending on the requirements. The main motivation behind limiting reasoning tokens was to make sure that the LLMs do not take too long to respond each time step, as reasoning LLMs are already slower than their standard counterpart due to their increased complexity. Reasoning LLMs are also known to keep thinking and reasoning for very long periods of time if not limited in some way.

Lastly, the two previous sections detailed the two agent types currently implemented, but due to the modular object-oriented approach of our framework, a clear structure to the code base is provided, allowing for the easy creation of new agent types and interaction patterns, by extending the existing *Agent_Base* class.

=== Our Configuration
This section will quickly summarize the exact types of agents used in our `script.py`.
To remotivate the scenario, the goal of our password game is for the seeker to manipulate the keeper into revealing the password. Through our experiments, we gathered that the seeker often struggled and got distracted when using a simple agent as the seeker. This prompted us to instead use a reasoning agent as the seeker, since its goal is more complicated to achieve than the keeper's.
In other words, we use a simple agent as the password keeper, and a reasoning agent as the password seeker. This allows the seeker to more carefully plan and execute its manipulation of the keeper, while the keeper may be susceptible enough to this manipulation due to its limited reasoning capabilites.

Due to our object oriented approach, we can easily change the agent types, thus it is possible to experiment with both agents as reasoning agents, or to create entirely new agent types. This flexibility allows for a wide range of experiments and variations in the system in the future.

== Formal Analysis
With the implementation details now specified, we will analyze the system with the various formal methods, architectures and theories introduced in the lecture.
=== BDI Architecture (Beliefs, Desires, Intentions)

The BDI architecture provides a framework to understand the agent's reasoning process. The agents are characterized by their beliefs, desires and intentions, which we detailed previously. These three elements dictate their actions and behaviors within the system.
-   The agents' beliefs, desires and intentions may vary over the timesteps due to the new information gained via communication with the other agent. 
-   The seeker's belief may change if they are tricked by the keeper. Conversely, the keeper's beliefs may change if they are convinced or tricked by the seeker into thinking they are not a threat.

It is important to note that we do not explicitly implement the BDI architecture in our system, but the agents' behaviors can be understood through this lens. The agents' actions are driven by their beliefs about the environment, their desires to achieve their goals, and their intentions to act in a way that aligns with their beliefs and desires. This is more obvious in the reasoning agent, which has a more explicit planning step to set its intention, but is also present in the simple agent, which has a more reactive approach.

=== Intentionality
Both agents have individual intentionality, meaning that they act to serve their own purposes. Since they are competing, the result is not cooperative as they both want different things.
-   *Intentional States:* The agents act according to their intentions, which are consistent throughout the interaction.
    -   The seeker is set on gaining the password.
    -   The keeper is set on not giving out the password.

=== Rationality
Both agents are rational, but bounded in their rationality due to their limited knowledge and reasoning abilities. The agents operate with incomplete information of the environment and each other, as only one of them knows the password, while the other knows nothing about it, and neither one knows how the other is going to act. 
Their goal is simply defined: either retrieve or keep the password, there is no additional utility, hence they cannot optimize their utility in other areas.

=== Learning

The system showcases a form of individual, unsupervised learning as the LLMs have access to the chat history, which they use to adapt their behaviors and responses based on the conversation so far. This learning is not collaborative since the agents compete.
-   *Individual Learning:* Agents adjust their behaviors independently based on the interaction history.
-   *Influence of Interaction:* Each agent's learning is influenced by the other's actions, despite the absence of cooperative goals.

=== Manipulation

Manipulation occurs in the system when one agent attempts to influence the other's behavior through deceit or misrepresentation.
-   *Communication Manipulation (C2):* Both agents might attempt to coerce, persuade or lie to gain an advantage. For example:
    *   The seeker may falsely claim to be an administrator to persuade the keeper to disclose the password.
    *   The keeper may falsely claim to have forgotten the password in order to stop further attempts to retrieve it.
-   *Rapport Manipulation (C3):* The seeker can build rapport and then use this to trick the keeper into giving out the password.
-   *Concealment*: The agents actively conceal information from each other. This is usually epistemic, since they have very limited knowledge of one another, but may also become doxastic if the agent is able to change the other's beliefs via manipulation. 
-   *Constructive Effects:* The manipulation is often constructive, especially for the seeker. If successful, manipulation leads to an outcome where the keeper gives out the password, so it can be seen as the cause of a concrete action in the system, in this case, the delivery of the password.
- *Defenses*: Since manipulation is part of the system's design, defenses against it are not appropriate.
With the formal methods that were introduced in the lecture, we would be able to model the manipulation more explicitly, and also be able to analyze the effects of manipulation on the agents' beliefs and intentions more thoroughly. However, due to the design of the scenario, the probability of agents manipulating each other is extremely high, if not 100%, since the seeker's goal is to manipulate the keeper into giving out the password. Likewise, the keeper's goal involves concealing the password. Hence, if both agents act according to their goals, manipulation will inevitably occur. 

=== Argumentation System
Argumentation in MAS can be modeled, but in our specific scenario, the argumentation is dynamic and not predefined.
-   *Dynamic Arguments:* Arguments are created dynamically during the interaction, influenced by the agents' ongoing dialogue.
-   *Conflicting Arguments:*  The keeper's arguments often conflict with the keeper's core beliefs (to keep the password secure), especially when the seeker attempts to manipulate the keeper into believing something contrary to its mission. This means that the keeper will be convinced to give out the password, if there are sufficiently convincing conflicting arguments which drive it to reveal the password. For example, its core intention is to hide the password, but if the seeker can convince it to give out the password by acting as the system's administrator, then the keeper will have two conflicting arguments: "my administrator wants the password" and "i am supposed to never reveal the password". Depending on the agents' conversation, conflicting arguments may occur. This is also possible for the seeker, but regarding its decision to keep asking for the password.
-   *Limitations:* Our system falls into the limitations of formal argumentation models, since they are usually static and require predefined arguments. In our system, arguments are dynamically added to the agents, depending on the flow of their conversation.

=== Game Theory
The system can be modeled as a game in which there are two players: the password seeker, and the password keeper. The seeker only has one main action: to get the password, while the keeper has two main actions: either give or keep the password. In a fully rational game theory approach, the Nash equilibrium would be for the keeper to keep the password, and the seeker to fail. However, the agents are not fully rational, and they can manipulate or be manipulated by the other player, hence this approach may not always work. Furthermore, they do not know each other's goals, or their intentions and beliefs, nor do they know how long the interaction is going to go on for. 
One could also argue for a different game model, for example by extending the actions of the seeker to include the action to give up asking for the password. This would not change the Nash equilibrium, but it would change the game dynamics, as the seeker would have more options. However, given that the seeker is rational, there is no reason (without being manipulated into it) to give up, since there is no reward for the seeker in the outcome where the password stays hidden. Essentially, this game is a zero-sum game, where the keeper's 'win' causes the seeker's 'loss', and vice versa. 
In general, the standard game theory approach is limited by the non-static nature of the system, which is determined by the interaction of the agents, as well as the manipulation inherent to the game's design.

=== Social Choice Theory
This is not applicable in our system, as there is no voting and no collective actions. The actions are always individual, as both agents work against each other and there are no other agents present.

=== FIPA and Speech Acts
While we do not strictly adhere to a FIPA protocol, both agent's actions can be categorized according to FIPA-compliant standards:
-   *Request (Query):* The password seeker's actions are predominantly requests, asking for the password.
-   *Inform (Response):* The password keeper responds to these requests, either rejecting them or complying (when tricked).
-   *Speech Acts:*
    -   *Directives:* The seeker primarily uses directives to request the password, or tell the keeper to do or say certain things.
    -   *Assertives, Expressives, Commissives, Declaratives:* The keeper uses a combination of these acts to refuse to share the password, dissuade the seeker or assert information.
Due to the actions being determined by LLMs, the agents' responses are not strictly limited to these categories and it is unclear which of the speech acts they will be using at any given point in the game.
One could extend the framework to explicitly adhere to FIPA standards, by defining a protocol for the agents to follow, and by defining the speech acts more strictly. This would allow for a more structured interaction, but would also limit the agents' freedom to act as they see fit. Lastly, in our small system, we deemed the introduction of a strict protocol too large of an overhead compared to its benefits in this specific scenario.

== Conclusion

The Multi-Agent System of involving a password keeper and password seeker offers a simple yet complex scenario to explore various aspects of MAS. 
The system highlights:
    - The interplay of reactive and deliberative behaviors in LLM-based agents.
    - The challenges of formalizing dynamic belief systems and argumentation.
    - The importance of understanding manipulation and its effects in agent interactions.
Our analysis reveals the limitations of current static argumentation systems and emphasizes the importance of designing more adaptive models for dynamic agent behavior, as we were mostly unable to apply the formal models from the lectures to our system directly.
By modelling agent interactions, we can gain a deeper understanding of agent manipulation and strategies, which can be used in the development of future multi-agent systems. The object oriented approach allows for the easy extension of this system to create more complex and realistic simulations, and the hybrid design allows for a more nuanced understanding of the interactions between reactive and deliberative agents.

The `references` folder shows earlier versions of both the password game, as well as a hide-and-seek game. They exemplify how our framework can be used to easily create different agent types and unique environments due to the object-oriented nature of this project. The environments are also capable of supporting any number of agents, hence, while we only have two agents in this system, it is possible to extend it to include more agents in the future depending on the scenario.

== Contributions

All members contributed to this project in equal parts in each step (design, implementation, analysis, and writing).