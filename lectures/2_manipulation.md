
**Manipulations in Multi-Agent Systems**

**I. Introduction**

*   **The Scenario**: A group of robots tasked with building a smart home, but lack the skills to do so. They must enlist the help of external skilled agents. But they face the issue of how to select a trustworthy agent.
*   **Challenge**: How do robots know which agents to trust?  The solution lies in **reputation systems**, where agents share information about their past interactions, forming a collective trust evaluation.
*   **The Goal of the Course**: To analyze manipulation in multi-agent systems (MAS) using a cognitive approach, and consider ways that manipulation could be used and methods for defending against it.
*   **Core Assumptions**: Agents are cognitive, rational, perfect reasoners, but they may also be malevolent and manipulative.
*   **Objectives**
    *   Understand manipulation using three MAS types:
        *   Reputation systems: How do agents evaluate trust?
        *   Normative systems: How do agents define rules?
        *   Voting systems: How do agents make collective decisions?
    *   Answer key questions about manipulation:
        *   What is manipulation in MAS?
        *   How are manipulation strategies constructed?
*   **Course Outline**:
    1.  Manipulate agents with reputation: 
        *   Presentation of reputation systems
        *   Manipulation strategies & defenses
    2.  Study incentive mechanisms with game theory (GT):
        *   Normative systems (NS)
        *   Introduction to game theory
    3.  Influence a collective decision:
        *   Introduction to Social Choice Theory
        *   Manipulation in voting systems
    4. What is a manipulation?

**II. Manipulate Agents with Reputation**

*   **Reputation System Definition**: Systems where agents interact, collect, share, and aggregate past interactions to decide whom to trust.
    *   Examples: Product rating systems (Amazon), driver evaluation (Blablacar), search engine referencing (Google).
*   **Reputation**: An agent’s belief in another agent’s ability, honesty, and reliability, based on testimonials.
    *   **Representation**: How testimonials are expressed (direct or aggregated).
    *   **Dissemination**: How testimonials are shared (centralized or decentralized).
*   **Reputation Function**: The algorithm to compute reputation values, it can be global (same for everyone) or individual (subjective).

   *    **BetaRep** example: a specific kind of representation of trust modeled by a positive and negative part of an agent's evaluation of another agent. Then a formula to aggregate the reputation is used based on received testimonials.
*   **Weaknesses of Reputation Systems**: Vulnerable to malevolent, dishonest, or manipulative agents, which leads to manipulation strategies.
*  **Manipulation Strategies**:
    *   **C1: Persistence**: Agents must be persistent over time
        *   **Sybil attack**: Creating false identities to affect reputations.
        *   **Whitewashing**: Leaving the system to re-enter under a new identity.
        *   **Discrimination**: Targeting interactions with trusted and non-trusted agents.
    *   **C2: Communication**: Interaction results must be communicated and accessible.
        *   **Promotion**: Sharing false positive testimony.
        *   **Self-Promotion**: Using Sybil agents to share false positive testimonies.
        *   **Defamation**: Sharing false negative testimony.
   *   **C3: Guiding Decisions**:  Decision-making must rely on interaction results
        *   **Betrayal**: Building up reputation to carry out bad actions later.
        *   **Planned Attack**: Similar to betrayal but with the intent to harm.

*  **Defense Strategies**:
    1.  **Robustness Axiomatics**: Build systems where manipulation is impossible.
        *   **Forgetfulness**:  Avoid information persistence, quickly detect treachery.
        *   **Certificate of Origin**:  Certify messages, prevent promotions where agents fake interactions
        *   **No persistent identity**: Force use of short-term disposable identifiers to prevent discrimination.
    2.  **Detect manipulation**: Detect when manipulations occur through statistical measures or by automatic reasoning.
    3.  **Build Complex Systems**: Complex systems make manipulation harder.
        *   **CAPTCHA mechanism**: Complex authentication to avoid Sybil attacks.
    4.  **Design Incentive Mechanisms**: Encourage good behavior, and discourage manipulation.
        *   **Payment mechanisms**: Induce true testimonials.
        *   **Stochastic Strategy**:  Force malicious agents to use stochastic behaviors.
        *   **Normative Systems**: Punish bad and reward good behavior.

**III. Normative Systems and Game Theory**

*   **Normative System Concept**: Systems that define laws (norms) that agents must respect. Violating them leads to punishment while following them is rewarded.
   *   Game Theory is used to model these incentive mechanisms.
*   **Normative Multi-Agent System (NMAS)**: MAS organized by mechanisms to represent, communicate, distribute, detect, create, modify, and enforce norms, and mechanisms to deliberate about them.
     *   Examples: National legal systems or group norms.
*   **Incentive Mechanisms**: Ensure agents are interested in adhering to system norms using Game Theory by assuming agents will try to maximize utility.
    *   Detecting violations of norms can be difficult and costly.
*   **Game Theory**: A mathematical theory to model interactions of rational agents.
   *   Applications: Board games, nature, resource sharing, contract negotiation, military strategies, and Norms systems.
*   **Taxonomy of games**: Players=agents.
    *   **n-player game**: Number of players
    *   **Cooperative / non-cooperative**: Can agent form coalitions?
    *   **Simultaneous / sequential**: Do agents play simultaneously?
    *   **Perfect / imperfect information**: Is information known by all the agents?
    *   **Zero-sum / non-zero sum**: Are the agent's interest strictly opposed?
*   **Game Definition**: G = (N, {Si}i∈N, {μi}i∈N)
    *   N = Set of agents
    *   {Si}i∈N = Set of strategies for each agent
    *   μi : Sx...xSn -> R is the utility function, a subjective measure of gains or losses of a joint action.
*   **Prisoner's Dilemma**:
     * Two prisoners interrogated and are given the option to betray or stay silent. 
    *   Each prisoner will receive a punishment depending on what he does, and what the other prisoner does.
    *  **Rules**: 
       *  If prisoner 1 betrays while prisoner 2 stays silent: 1 gets 1 year, 2 gets 10 years
       *  If prisoner 2 betrays while prisoner 1 stays silent: 2 gets 1 year, 1 gets 10 years
       *  If both stay silent: both get 2 years
       *  If both betray: both get 5 years
    *   **Formal Model**:
      *   N={1,2}; Si = {Betrays(B), Stays silent(C)}
     *   Joint actions J = {(B, B); (B, C); (C, B); (C, C)}
     *   Utility functions :
           *   μ1((B,B))=-5;  μ2((B,B))=-5
           *   μ1((B,C))=-1;   μ2((B,C))=-10
           *  μ1((C,B))=-10; μ2((C,B))=-1
           *  μ1((C,C))=-2;   μ2((C,C))=-2
      *   This leads to payoff matrix, with the classic resolution at Nash Equilibrium, which is for each agent to betray.
*   **Nash Equilibrium (NE)**:
    *  If all agents are assumed to be rational (i.e. maximize utility), the best rational choice is to betray.
    *  Laws are created in a way to encourage you to choose the NE (which is typically better).
    *   If you try to deviate from a NE, you are a loser.
    *   But, it is possible to get a better utility if agents coordinate with one another and trust that their partner will keep their strategy. This is risky though.

*   **Modeling Incentives with Normative System**: Modeling a normative system with two agents (a company & supervisor).
   *   Company can be honest(H) or malevolent (M); Supervisory agent can supervise(S) or not(S).
   *    Supervision costs 'c', detecting a malevolent agent gains a bonus 'b' and imposes a penalty 'pc'. If a malevolent agent is missed, penalty 'ps'. If an honest agent is detected, small reward 'r'.
   *   **Formal Model**
      *   N = {as, ac}; Sas = {S, S̅}; Sac= {H, M}
     *   Possible joint actions : I = {(S, M); (S, H); (S̅, M); (S̅, H)}
     *   Utility functions:
          *   μas ((S̅, M)) = ps; μac((S̅,M)) = m
         *   μas ((S̅, H)) = 0; μac ((S̅,H)) = 0
         *   μas ((S, M)) = c+b; μac((S,M))= pc
         *   μas ((S,H)) = c ; μac((S,H)) = r
       *   This model generates a game similar to Prisoner's dilemma.
       *  We then use obvious hypotheses to simplify modeling.
       *   The result is two Nash Equilibriums (S,H) and (S̅,H).
*   **Other application for normative systems**: violation games, institutionalized games, negotiation games, norm creation games, and control games.

**IV. Collective Decision**

*   **Social Choice Theory (SCT)**: The goal is to study and analyze how the combination of individual opinions can lead to collective choices and outcomes.
*   **Voting Systems Modeled by SCT**: Majoritarian, Plurality and Proportional systems.
*   **Formal Definition of a Voting System**: S = (N, O, {>i}i∈N, f)
    *   N = a set of agents
    *   O = set of outcomes (candidates, etc.)
    *   {>i}i∈N is a set of binary relations on O (preference relations)
    *   f : PN -> P is the social choice function.
    *    *Note:* A preference profile is an instance of agents’ individual preferences, with possible set P of all possible preference profiles.
*   **Total Strict Order**: Properties of preference relations
    *   Transitivity:  If a > b and b > c, then a > c
    *   Irreflexivity:  A cannot be preferrable to itself.
    *   Totality:  All elements of the set of outcomes are comparable.
*   **Standard Properties of a Binary relation**: 
    *   Reflexive, symmetrical, antisymmetrical, acyclic, pre-order, order.
*   **Borda System Definition**: a system in which the social choice function has a condition based on a counting function gs,P that corresponds to every option and each agent's preference profile.
     *   A winner of the vote is the candidate that obtains most points.
*   **Example of manipulation in Borda System**:
   *   Three agents must choose between A, B, C, and D.
   *   True preferences: 1: A>B>C>D; 2: C>B>A>D; 3: B>A>D>C.
   *   If they give 3 points to the most preferred, and 0 to the last, then B is the winner with 7 points.
    *  If agent 1 lies and presents his preferences as A>C>D>B, then the winner will be A with 6 points.
    *  If agent 1 introduces a sybil agent that has the same profile as him (A>C>D>B), then A would win with 9 points.
*   **Plurality System Definition**: The candidate that gets the maximum of points wins.
    *   Sybil attacks work in this system but lying does not.

**V. What is Manipulation?**

*   **Manipulation in Computer Systems**: 
    *   Reputation systems: Lying about identity to self-promote.
    *   Voting systems: False preferences to influence outcome.
    *   Peer-to-peer networks: Making a node believe it is alone in the network.
*  **Understanding the Meaning**: 
  *   Manipulation is "not exactly coercion, not precisely persuasion, and not entirely similar to deception".
  *   **Not coercion**: Coercion is not concealed. 
  *   **Not persuasion**: Persuasion comes from a sincere person. 
  *   **Not deception**: Deception has no intent to instrumentalize.
*   **Manipulation**: A deliberate, concealed influence. 
   *  In reputation and voting systems: a manipulator may use trust to influence other agents or systems to its advantage.
   *  To do so, the manipulator will need to apply a deliberate strategy (such as whitewashing, treachery, sybil attack).
   *  Manipulation must be concealed, since a rational agent won’t be influenced if they know that you are lying.
*  **Main characteristics of manipulation**:
   1. It is *premeditated*, or a *deliberate* act.
    2. It is an *instrumentalization*, an *influence* exercised on the victim.
   3. It is *invisible* when it happens.
*   **Formal Definition of Manipulation in MAS** [Leturc and Bonnet, 2020]: A manipulation in a multi-agent system is a *deliberate effect* of a *manipulator* to *influence* a *victim*, while making sure to *conceal that effect*.
*    **Connection with other fields**:
       *   In psychiatry, manipulation is instrumentalizing a victim in the manipulator's interests.
       *   In politics and marketing, manipulation alters the judgment of individuals, removing some of their deliberation.
       *   In economics, it influences the final outcome of a game by concealing the agent’s intentions.

**VI. Exercises**

*   **Practical Work**:
    *   Implementing a voting system to make collective decisions
    *   Implementing a Prisoner's Dilemma and computing a Nash Equilibrium
*   **Data of the Problem**:
    *   7 agents need to choose between four candidates
    *   Set of preferences with different rankings of candidates
    *   In one scenario, agents give 3 points to the option they most prefer, 0 to the last.
    *  In a second scenario, it must be defined what is the influence of Sybil agents or dishonest votes.
*   **Exercise 1:  Deciding By a Vote**
    *   Implement Java classes for Vote Systems, Preference, Borda System
    *   Use the result of the Borda Vote to make a collective decision.
*   **Exercise 2: Modeling the Interest of Lying**
     *   Model a lying behavior with a prisoner's dilemma
    *   Which agents can lie and influence the vote result?
    *   Implement algorithms for solving a Nash Equilibrium (NE)
    *   Decide if it is rational to lie (i.e. a false preference belongs to a NE).
*   **Ideas for JAVA objects for Vote Systems**:
   1. **Preference** extends ArrayList with an isPreferred method
   2. **VoteSystem** is abstract with agents, preference profiles, and a result method
   3. **BordaSystem** extends VoteSystem
*   **Modelling the Interest of Lying**:
    *   With a Prisoner's Dilemma, we will consider g_P : C -> N a Borda counting function.
    *  We will also define a P and a P', and model the utility with a spearman distance.
        *   U_i = - ∑(β_-i(C) - gp'(C))^2
        *    where β_i(C) = |C| - (\{C' ∈ C : C' >¡ C}| + 1).

*    **Further discussion on the Model**
     *   What is the issue with such definition of utility?
     *   Propose a new definition of utility that compares only the result of the vote.

