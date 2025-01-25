**Report: Multi-Agent Systems**


**1. Definition and Core Concepts:**

*   **Multi-Agent Systems (MAS):** These systems are composed of multiple autonomous agents interacting within a shared environment and under a certain organization. Key components of MAS include:
    *   **Agents:** Autonomous entities, which can be natural or artificial. They make decisions, act in the environment, and can interact with each other. They can be humans, software or other AI agents. These have specific properties like autonomy, reactivity, proactivity, interaction, and persistence, which is the ability to maintain a goal and act to satisfy it.
    *   **Environment:** A shared space or context in which agents interact. It can be perceived by agents through sensors or observation. It also includes resources and tools that agents can utilize. The environment is not considered an agent itself, but influences it.
    *   **Interactions:** Communication or actions among agents, which occur in the shared environment.
    *   **Organization:** The structure defining how agents interact, coordinate, and cooperate to achieve collective goals. It structures the roles of agents and influences the distribution of responsibilities and resources.

*   **Centralized vs. Decentralized MAS:**
    *   In centralized MAS, a single central agent controls the overall system.  These are simpler to implement but have a single point of failure and are less scalable with large systems.
    *   In decentralized MAS, control is distributed among agents, which perform local reasoning. They are more robust, scalable, and flexible.

*   **Open vs. Closed MAS:**
    *   Open systems dynamically add and remove agents, while closed systems have a predefined set of agents.
    *   The closed-world assumption, used in closed MAS, assumes that no new information or agents will be added to the system.

*   **Homogeneous vs. Heterogeneous MAS:**
    *  Homogeneous systems contain agents that share identical characteristics, while heterogeneous systems are composed of agents with different abilities and features.

**2. Architectures for Agents**

*   **Reactive Agents:**
    *   They react immediately to their environment using direct response to environmental stimuli. They do not use complex internal models.
    *   They are simple, fast, and robust, but are limited in handling complex tasks, and can have suboptimal behavior.
    *   They can be implemented with a subsumption architecture, which organizes behaviors in layers of priority.
*   **Deliberative Agents:**
    *   They explicitly represent the world and have the ability to reason about it.
    *   They exhibit goal-directed behavior, and can plan and adapt actions based on prediction.
    *   They are often implemented with a Belief-Desire-Intention (BDI) architecture.
        *   Belief: How an agent represents the world.
        *   Desire: The goals that the agent wishes to achieve.
        *   Intention: The commitment of agents to actions or plans to achieve their desires.
*   **Hybrid Agents:** Agents that combine reactive and deliberative behaviors for better adaptability. They may use a layered architecture to respond to immediate stimuli while pursuing long-term goals.

**3. Types of Interaction**

*   **Independence:** Agents have compatible goals, and sufficient resources and skills.
*   **Cooperation:** Agents have compatible goals, but insufficient resources or skills, they have to collaborate to reach goals.
*   **Competition:** Agents have incompatible goals. This can be broken down to pure competition (sufficient resources and skills) or negotiation-based competition (insufficient resources or skills).

**4. Interaction Management and Protocols**

*   **Interaction Management:** Organization and communication are key for agents' interactions.
*   **Interaction Protocols** Define structured communication rules between agents. They aim to avoid conflict and allow for meaningful exchanges so agents can achieve shared goals in a collaborative manner.
    *   **Contract Net Protocol:** Used for task distribution, where one agent announces a task and others bid for it.
    *   **Negotiation Protocols:** Help facilitate agreements between agents for shared goals or resources.
    *   **Auction Protocols:** Facilitate competitive resource allocation using bidding mechanisms.
    *   **Argumentation-Based Protocols:** Help agents reach agreements in conflict situations using logical arguments.

*   **FIPA:** The Foundation for Intelligent Physical Agents provides standards for creating interoperable MAS using an agent communication language (ACL), which standardizes:
    *   The message structure including *performative* which specifies the type of communication, *content* which is the information, an *ontology* or shared vocabulary and a *language* or the syntax used.

*   **Speech Act Theory:** Behind the communication protocols, provides a framework for understanding different types of speech acts in agent interaction. This includes:
    *   Assertive - Declaring a fact
    *   Directive - asking another agent to do something
    *   Commissives - committing an agent to an action
    *   Expressives - expressing an emotional state
    *   Declaratives - changing the state of the world.
    *   Every communication reflects an intention.
        *  This implies a Locutionary, which is the construction of a sentence following syntactic rules. An Illocutionary, which is the meaning and strength of intention, and the Perlocutionary effect of the speech act on the recipient.

**5. Rationality and Intentionality**
*   **Rationality** is the quality of making decisions that maximizes expected utility.
    *   Perfect rationality requires complete information and unlimited resources to compute the best decision.
    *   Bounded rationality acknowledges limits in knowledge and resources.
    *   Utility-based rationality focuses on maximizing a utility function.
*   **Intentionality** reflects that actions are based on mental states like beliefs, desires, and intentions.
    *   Intentions can be defined as a choice with commitment. This implies that, unlike desires, an agent will persist with an intention until it is achieved, or it is deemed impossible.
  * It's a fundamental aspect of creating goal-oriented behavior, that enables agents to collaborate and coordinate actions.

**6. Learning in Multi-Agent Systems:**

*   **Learning:** Agents improve behavior or gain knowledge through experience. It can be individual or collective where agents share knowledge, experiences, etc.
   *   Supervised Learning: Agents learn from labeled data.
    *   Unsupervised Learning: Agents find patterns without labels.
    *   Reinforcement Learning: Agents learn through trial and error by maximizing rewards and minimizing penalties.
*   **Collaborative learning** Agents cooperate to reach common learning goals through knowledge sharing. It is useful for complex distributed problems.
*   **Collective Learning** Learning emerges from local interactions and shared experiences. It does not require explicit communication, and can result in group-level adaptation and emergent behavior.
* Different kinds of agent need different learning styles.
*   Learning can be multidimensional and include the environment, task, and agents.
*    Learning is not enough, agents need a model of reasoning.
*   For example, to model a voting system, the agents must negotiate with each other, in a robust way, and have a consistent and coherent vote.

**7. Multi-Agent Programming**

*   A new development approach that allows autonomous and intelligent entities (agents) to interact to solve complex problems.
*   It involves:
        *   encoding different behaviors for autonomous agents;
        *   managing how agents interact together, are adaptable, and how emergent behavior may arise.
* Programming Languages and Frameworks: JADE, Jason, Gama, and JaCaMo.
*   These tools allow agents to make autonomous decisions, to respond to changes and to organize and structure their interactions in order to achieve a goal.
    *   When developing MAS using such tools, you are developing a software with clear phases:
            *  *Problem Modeling:*  Involves defining the problems, actors, roles and environmental characteristics.
            * *Analysis Phase:* System requirements are examined and necessary interactions and agents are defined.
            *  *Design Phase:*  Defining agent models, communication, protocols, system architecture, and implementation.
            *  *Agent Development:* Implementing the system and testing them in an environment.
            * *Agent Integration:* Involves assembling agents in a shared environment and testing their interactions.
            *  *Testing and Validation:* Testing the MAS to ensure it meets objectives, is robust, secure.

**8. Two Approaches to MAS**

*   **Engineering Approach:**
    *   Focuses on building functional systems; Emphasis is placed on implementation, performance, scalability and usability.
    *  Use tools and methodologies to design architecture, define agent behaviour, and communication protocols.
    * It's the approach used most often by software engineers.

*   **Formal Approach:**
    *   Focuses on mathematical modeling and proofs to provide guarantees and ensure the desirable behavior of agents.
    *   Uses mathematical concepts and tools to model, verify and analyze agents.
        *  Model Logic: For reasoning about agents' beliefs, desires, and intentions.
        *   Formal argumentation: For modeling negotiation and conflict resolution.
        *  Game Theory: For analyzing agents' strategies.
        *   Social Choice Theory: For aggregating preferences in voting scenarios.

**9. Key Highlights**

*   Multi-Agent systems are a distributed form of artificial intelligence, well suited for solving complex problems.
*   The key concepts that should be understood are:
    *  agents as  autonomous entities in an environment,
     *  agents interactions and structure,
    *  and agents organization.
* They provide an avenue for studying complex problems, and can enhance robustness, flexibility, scalability, and adaptability.
* The study of MAS involves both an engineering approach and a formal approach.

**Conclusion:**
This lecture provided an introduction to the fascinating field of multi-agent systems, outlining the core concepts, architectures, and protocols. Emphasis was given to the core components, the importance of interaction between agents, and the need for a well defined organizational structure. The discussion also compared and contrasted reactive and deliberative architectures.

Furthermore, the lecture addressed the core importance of rationality and intention in multi-agent systems and the impact they have on how the system will be modeled and designed. It also provided a brief overview of the FIPA-ACL standard, and the speech act theory which serves as its basis.

The discussion also gave insight into the research fields that are driving these systems, like:
       * distributed systems,
       * collaborative learning,
       * game theory,
       * reinforcement learning.
       * and the need for formal methods to model agent behavior.

The presentation concluded by noting that it is very important to ensure you choose the approach and architecture best suited for your specific needs.
