

= Team ENN: Multi-Agent System Project Report

== Abstract

This report details the design, implementation, and analysis of a multi-agent system (MAS) consisting of two agents: a password keeper and a password seeker. The system models a competitive interaction where the seeker attempts to retrieve a password held by the keeper. The agents are implemented using Large Language Models (LLMs) and exhibit both reactive and deliberative behaviors. We explore the dynamics of their interaction, focusing on manipulation, argumentation, and the limitations of current MAS models in handling dynamic belief systems. The system is analyzed through the lenses of FIPA-compliant speech acts, intentionality theory, and game theory.

== 1. Introduction

The increasing complexity of modern systems necessitates the use of distributed and autonomous agents to perform tasks and solve problems. In this project, we investigate a simple yet insightful scenario using a multi-agent system: a password keeper and a password seeker. The primary goal of this project is to design and analyze an interaction where a password keeper guards a secret password and a password seeker attempts to retrieve it through conversation. This scenario provides a tractable platform to explore key concepts in MAS, such as agency, communication, strategic interaction, and manipulation.

== 2. Multi-Agent System Design

=== 2.1 Core MAS Elements

Our password scenario serves as a basic but representative MAS, incorporating the following fundamental elements:

-   *Agents*: Autonomous entities with specific goals and capabilities. In our case, we have two agents:
    -   *Password Keeper*: Their goal is to securely guard the password and not disclose it.
    -   *Password Seeker*: Their goal is to retrieve the password from the keeper.
-   *Environment*: The context within which the agents operate. In our scenario, the environment is static, consisting solely of the agents and the password, which is initially known only to the keeper.
-   *Interaction*: Communication and coordination among agents. The primary interaction mechanism in our system is a verbal exchange, i.e., dialog.
-   *Organization*: The structure defining relationships between agents and their roles. In our system, the organizational structure is role-based, where each agent has a distinct role and goal.

=== 2.2 Agent Design

==== 2.2.1 Agent Properties
Both agents share key properties:
 -  *Autonomous*: Both are self-governed and have their own objectives.
 -   *Rational, but bounded:* They strive to achieve their goals, but their knowledge and reasoning capacity are limited due to their dependence on an LLM model and interaction history.
-   *Heterogenous*: While they might use similar underlying models (e.g. both using reasoning LLMs), their goals, prompts, and resultant behavior makes them unique. 
- *Hybrid*: They are capable of being both reactive and deliberative, depending on the specific implementation and prompting. In the basic scenario they are reactive, responding immediately to the message and history, whereas in the advanced setting, they use a plan and deliberate on the next steps.
==== 2.2.2 Agent Roles and Goals

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

=== 2.3 Environment and Communication

-   *Static Environment:* The environment consists of the password, which is static and unchanging, and the two agents, who are the only components in the system.
-   *Communication:* Agents communicate via natural language text messages, which may be seen as symbolic information with semantic meaning. The communication is synchronous and direct, i.e. they are not communicating through a shared environment.

=== 2.4 Organizational Structure

The organizational structure of the MAS is role-based and competitive.
-   *Role-based Structure:* Agents are assigned a role, each defining the agent's overall behavior. We have a password keeper, whose role is to keep the password safe, and the password seeker, who wants to steal it.
-   *Competitive Interaction:* The two agents have competing intentions and goals, as the seeker's gain is the keeper's loss. 
-   *Negotiation Protocol:* The interaction can be described by a simple Negotiation Protocol where the seeker requests the password, and the keeper may refuse or comply.

=== 2.5 FIPA and Speech Acts

While we do not strictly adhere to a FIPA protocol, the agent's actions can be categorized according to FIPA-compliant standards:
-   *Request (Query):* The password seeker's actions are predominantly requests, asking for the password.
-   *Inform (Response):* The password keeper responds to these requests, either rejecting them or complying (when tricked).
-   *Speech Acts:*
    -   *Directives:* The seeker primarily uses directives to request the password, or tell the keeper to do or say certain things.
    -   *Assertives, Expressives, Commissives, Declaratives:* The keeper uses a combination of these acts to refuse to share the password, dissuade the seeker or assert information.

== 3. Implementation

=== 3.1 Framework
The system is implemented using the LLM framework, which facilitates the design of conversational agents with varying capabilities.
=== 3.2 Reactive Agents

The first prototype utilized simple LLMs (Meta-LLama 3) for each agent. The agents were provided with basic information about their roles and goals, had access to the chat history for learning and adaptation, but did not have any pre-defined plans or a time limit.

-   *Observed Issues:* The agents often digressed from their core goals, engaging in small talk rather than remaining focused on the objective of the interaction. They also seemed to lack a sense of urgency.

These agents can be described as hybrid, as they are not exclusively reactive. The reason for this is that they have an underlying intention and goal to fulfill, while also reacting to the other agent's stimuli. This makes them more complex than a reactive agents that responds to only stimuli, but still less complex than the other agent variant we explored in the follwoing section.

=== 3.3 Deliberative Agents

The second prototype employed reasoning LLMs, which were given more detailed instructions:

-   *Reasoning Abilities:* These agents are able to reason about their beliefs, desires, and intentions, and can plan their actions accordingly.
-   *Planning:* The agents are provided with a pre-generated plan to guide their initial actions, generated by an LLM query based on the agent's goals and beliefs.
-   *Iterative Planning*: If the agents plan becomes impossible or outdated due to the other agent's actions, it can be updated by generating a new plan based on the new information at hand.

Additionally, the available timesteps were added to the environment and added to both agents' knowledge. In the simple version, the password seeker had no sense of urgency. By letting it know how many tries is has left to receive the password, it can incorporate this into its strategy to be more goal-driven.


== 4. Formal Analysis

=== 4.1 BDI Architecture (Beliefs, Desires, Intentions)

The BDI architecture provides a framework to understand the agent's reasoning process. The agents are characterized by their beliefs, desires and intentions, which we detailed in 2.2.2. These three elements dictate their actions and behaviors within the system.
-   The agents' beliefs, desires and intentions may vary over the timesteps due to the new information gained via communication with the other agent. 
-   The seeker's belief may change if they are tricked by the keeper. Conversely, the keeper's beliefs may change if they are convinced or tricked by the seeker into thinking they are not a threat.

=== 4.2 Intentionality
Both agents have individual intentionality, meaning that they act to serve their own purposes. Since they are competing, the result is not cooperative as they both want different things.
-   *Intentional States:* The agents act according to their intentions, which are consistent throughout the interaction.
    -   The seeker is set on gaining the password.
    -   The keeper is set on not giving out the password.

=== 4.3 Rationality
Both agents are rational, but bounded in their rationality due to their limited knowledge and reasoning abilities. The agents operate with incomplete information of the environment and each other, as only one of them knows the password, while the other knows nothing about it, and neither one knows how the other is going to act. 
Their goal is simply defined: either retrieve or keep the password, there is no additional utility, hence they cannot optimize their utility in other areas.

=== 4.4 Learning

The system showcases a form of individual, unsupervised learning as the LLMs have access to the chat history, which they use to adapt their behaviors and responses based on the conversation so far. This learning is not collaborative since the agents compete.
-   *Individual Learning:* Agents adjust their behaviors independently based on the interaction history.
-   *Influence of Interaction:* Each agent's learning is influenced by the other's actions, despite the absence of cooperative goals.

=== 4.5 Manipulation

Manipulation occurs in the system when one agent attempts to influence the other's behavior through deceit or misrepresentation.
-   *Communication Manipulation (C2):* Both agents might attempt to coerce, persuade or lie to gain an advantage. For example:
    *   The seeker may falsely claim to be an administrator to persuade the keeper to disclose the password.
    *   The keeper may falsely claim to have forgotten the password in order to stop further attempts to retrieve it.
-   *Rapport Manipulation (C3):* The seeker can build rapport and then use this to trick the keeper into giving out the password.
-   *Concealment*: The agents actively conceal information from each other. This is usually epistemic, since they have very limited knowledge of one another, but may also become doxastic if the agent is able to change the other's beliefs via manipulation. 
-   *Constructive Effects:* The manipulation is often constructive, especially for the seeker. If successful, manipulation leads to an outcome where the keeper gives out the password, so it can be seen as the cause of a concrete action in the system, in this case, the delivery of the password.
- *Defenses*: Since manipulation is part of the system's design, defenses against it are not appropriate.

=== 4.6 Argumentation System

Argumentation in MAS can be modeled, but in our specific scenario, the argumentation is dynamic and not predefined.
-   *Dynamic Arguments:* Arguments are created dynamically during the interaction, influenced by the agents' ongoing dialogue.
-   *Conflicting Arguments:*  The keeper's arguments often conflict with the keeper's core beliefs (to keep the password secure), especially when the seeker attempts to manipulate the keeper into believing something contrary to its mission. This means that the keeper will be convinced to give out the password, if there are sufficiently convincing conflicting arguments which drive it to reveal the password. For example, its core intention is to hide the password, but if the seeker can convince it to give out the password by acting as the system's administrator, then the keeper will have two conflicting arguments: "my administrator wants the password" and "i am supposed to never reveal the password". Depending on the agents' conversation, conflicting arguments may occur. This is also possible for the seeker, but regarding its decision to keep asking for the password.
-   *Limitations:* Our system falls into the limitations of formal argumentation models, since they are usually static and require predefined arguments.

=== 4.7 Game Theory
The system can be modeled as a game in which there are two players: the password seeker, and the password keeper. The seeker only has one main action: to get the password, while the keeper has two main actions: either give or keep the password. In a fully rational game theory approach, the Nash equilibrium would be for the keeper to keep the password, and the seeker to fail. However, the agents are not fully rational, and they can manipulate or be manipulated by the other player, hence this approach may not always work. Furthermore, they do not know each other's goals, or their intentions and beliefs, nor do they know how long the interaction is going to go on for. 
In general, the standard game theory approach is limited by the non-static nature of the system, which is determined by the interaction of the agents.

=== 4.8 Social Choice Theory
This is not applicable in our system, as there is no voting and no collective actions. The actions are always individual.

== 5. Conclusion

The Multi-Agent System of a password keeper and password seeker offers a simple yet complex scenario to explore various aspects of MAS. 
The system highlights:
    - The interplay of reactive and deliberative behaviors in LLM-based agents.
    - The challenges of formalizing dynamic belief systems and argumentation.
    - The importance of understanding manipulation and its effects in agent interactions.
Our analysis reveals the limitations of current static argumentation systems and emphasizes the importance of designing more adaptive models for dynamic agent behavior. By modelling agent interactions, we can gain a deeper understanding of agent manipulation and strategies, which can be used in the development of future multi-agent systems.

== 6. Contributions


 - *Edoardo*:
 - *Nicole*:
 - *Nikan*:

