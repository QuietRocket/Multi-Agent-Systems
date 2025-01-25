

# Report: Logic and Argumentation Models of Manipulation in Multi-Agent Systems

## Introduction
This report covers a series of topics related to formal models of manipulation within Multi-Agent Systems (MAS). It draws from presentations on various aspects of logic, argumentation theory, and practical application within agent-based systems, incorporating theoretical frameworks and application examples. 

### Core Concepts

1. **Manipulation:**
   - Deliberate actions by an agent to *instrumentalize* another, often while concealing this intent.
   - Includes influencing an agent and altering judgment to make choices they would not make without manipulation.
   - Unlike coercion (direct pressure) or deception, manipulation is *deliberate* and *invisible*.
   - Requires an *intention* on the part of the manipulator.

2.  **Instrumentalization:**
    - Involves using another agent to perform actions, the consequences of which may be either *soft* (a consequence) or *strong* (a deliberate effect).
    - Two modes:
        - **Soft Instrumentalization**: when it is the consequence of an action.
        - **Strong Instrumentalization**: when it is the deliberate effect of an action.

3. **Concealment:**
   - Achieved through doxastic (belief-related) and epistemic (knowledge-related) operators.
   - Involves preventing another agent from knowing something.
   - Modal logic is key to modeling knowledge and belief.
   - Deliberate concealment is agent-driven concealment.

4.  **Modal Logic:**
   - A system of logic including modal operators to denote concepts like *knowledge (K)*, *belief (B)*, and *effects (E)*.
   - Each agent has individual states.
   -  Includes deliberate effect *Eid* intended by agent `i`. 
   -  Key to understanding epistemic states of agents.

##  Foundational Logical Systems

### 1. Epistemic Modalities
  - **Kᵢφ:** Represents agent i knowing φ (knowledge).
  - **Bᵢφ:** Represents agent i believing φ (belief).
  - **Eᵢφ:** Represents that an action performed by agent i leads to phi.
  - **Eᵢdφ:** Represents a deliberate effect intended by agent i.
  - **Eᵢdφ implies Eᵢφ**

### 2.  Kripke Semantics
   - Uses a system of possible worlds and accessibility relations to interpret modal formulas.
   - Modal operators are interpreted through constraints on relations (e.g., reflexivity, transitivity, confluence).
   - Provides a framework for reasoning about knowledge and belief in various contexts.

### 3. Key Axioms
   - These models assume *strong soundness* and *completeness*.
   -   The principle that "he who acts through another does the act himself" is often considered: `(ΕᵢΕᵢφ ∨ Εᵢ⁻Εᵢφ) ⇒ Εᵢφ`.
   
### 4.  Other Concepts
    -  **Awareness**: A finite set of formulas that an agent can reason about.
    -  Related concepts include coercion, persuasion, and credible lie, which are related to the core notion of manipulation.

### 5.  Types of Effects
   -  **Constructive**: Influences the target agent to take certain action.
   - **Destructive**: Influences the target agent not to take certain action, affecting strategies.
   - Manipulation involves the cartesian product of both instrumentalization and concealment.

## Abstract Argumentation

### 1. Argumentation System

   -   A system is represented by a couple (A, R), where:
        - A is a nonempty set of arguments
        - R is a binary relation on A called the attack relation.
   -   Aims to model decision-making processes.

### 2. Core Concepts
  - **Conflict-free**: A set of arguments where no argument attacks another in the set.
  - **Defense**: A set of arguments defends an argument if it attacks any arguments that attack the argument in question.
  - **Acceptability**: an argument is acceptable with respect to a set, if that set defends it.
  - **Admissibility**: A set of arguments is admissible if it is both conflict-free and its members are acceptable relative to the set.
  - **Complete Extension**: An admissible set that also includes all arguments it defends.
  - **Preferred Extension**: A maximal admissible set.
  - **Stable Extension**: A preferred extension that attacks all arguments that are not in the extension.

### 3. Algorithmic Approaches
  - Algorithms exist for enumerating preferred extensions (e.g., the approach by Nofal et al., 2014).
  - This involve associating labels with arguments (e.g. `IN`, `OUT`, `BLANK`) to track the state of argumentation during algorithm execution.

## Logic-Based Argumentation

### 1. Formalization of Argumentation
   - Arguments are represented as a couple (Φ, α) where:
         - Φ is a minimal set of formulas (supports) from a finite set of formulas.
         - α is a conclusion that can be inferred from Φ.
        - Φ is called the *support* of an argument and α is its *conclusion*.
   -   Uses classical logic to generate arguments, rebuttals, undercuts, and defeaters.
   -   A rebuttal if = a ↔ ¬β (i.e. a ↔ ¬β is a tautology)
   -  An undercut if there exists Ψ' = {ψ1,...,ψn} ⊆ Ψ s.t. = a ≡ ¬ ∧ ψi
   -  A defeater if there exists Ψ' = {ψ1,...,ψn} ⊆ Ψ s.t. a = ¬ ∧ ψi

### 2.  Application Example
   -  Utilizes propositional atoms for the logical model (e.g., a, b, c).
   - Demonstrates the generation of arguments and attacks between them using examples of car safety using the following arguments:
        -   a:= my car has an airbag,
        -  b:= my car is safe,
        -  c:= airbags are reliable,
        -  d:= the newspaper say so,
        -  e:= the scientists say so.
   - Shows that argumentation is not a mere pros and cons system and the need of a graph representation.

### 3. Limitations
   - The standard argumentation system relies on pre-defined arguments which need to be deduced automatically.
   - The need to model symmetrical attacks that lead to the inability to decide which action to take, for instance, with the robot dilemma.
  -  Lack of methods for resolving cases where there are multiple admissible/stable extensions.

## Bipolar Argumentation

### 1.  Formal Definition
    - An argumentation system extended with a support relation denoted by (A, R, S).
   -   R represents the attack relation, S represents the support relation.
   - Arguments are no longer merely attacking each other, but also supporting each other

### 2. Core Concepts
    - **Supported Attack**: An argument supporting an attack of another argument when such relations exist.
    - **Indirect Attack**: An argument indirectly attacks another one through chains of attack and support.
    - **Set-Attacks**: Sets of arguments attacks other sets of arguments.
    - **Defends**: A set defends if for every set that attacks, another set attacks in order to support the argument in question.
    - **Stable extension**: a conflict-free set that set-attacks any argument that is not in the set.

### 3. Logic-Based Bipolar Argumentation

   - Defines arguments and attacks as before using the classical logic framework.
   - A new operator `ASB` is defined as
     if, and only if
      ∃Ψ' = {ψ1,..., ψn} ⊆ Ψ, α ⊨ ∧ ψᵢ

### 4.  Example
  - The application example considers the previous robot dilemma.
  - Defines a set of propositional variables and a set of formulas using classical logic.
  - Creates arguments using logic rules and defines attack and support relations.
  - In the presented application example, there is one stable extension, resolving the issue of choosing between opposite actions.
   
## Practical Work and Application

### 1. Context
   - A practical exercise to implement the above methods using an example of a robotic builder team with a collective decision.
   - Involves choosing a single agent from four that have the same skills, where a series of arguments can be created on the basis of each agent (candidate).
   - The selection process requires implementing a preference model for the agents and a voting system to resolve the collective decision.

### 2. Objectives
   - Implementing an argumentation system.
   - Implementing a vote system to take a collective decision.
   - Implementing a prisoner's dilemma and computing a Nash Equilibrium.

### 3. Steps
   - Define JAVA classes `ArgumentationGraph`, `Extension`, `Preference`, `VoteSystem`, `BordaSystem`.
   - Compute preferred extensions using provided algorithms.
   - Define preference structures for agents.
   - Select a collective choice by voting.
   - Analyze the implications of lying by creating a Nash Equilibrium and using prisoner's dilemma.

### 4. Java Objects Design
  - **Argument**:
    - private String label
    - Getters and setters
  - **ArgumentationGraph**:
    - setOfArguments(as a Set<Argument>) and Attacks(as a Set<Couple<Argument> >)
    - Getters and setters
    - A method:  `computeExtensions(Extension ex) :Set < Set < Argument >> `
  - **Extension Interface**:
      - `computeExtensions(ArgumentationGraph arg) : Set<Set<Argument> >`
  - **PreferredExtension**
   - that implements Extension.
   - **Preference<Generic>**
      - ArrayList with a method: `isPreferred(Generic o1,Generic o2) : Boolean`
   - **Abstract VoteSystem**:
      - private Set<Agent> agents
      - private HashMap<Agent, Preference> preferenceProfiles
      - Getters and Setters
      - A method: `result() : Preference`
  - **BordaSystem**
    - extends VoteSystem.

### 5. Modeling the Interest of Lying
    - Explores rational agents might behave in a vote if they are aware of how their preferences affect outcomes.
    -   Uses a utility function, based on spearman's distance between a profile with true preferences vs a false one.
   -  Defines a counting function based on Borda vote.
    - Models the situation as a prisoner's dilemma, where agents may have an incentive to lie.
    -  Identifies the presence of multiple joint actions (|C|!)^|N|
    - Suggests new utility function by only comparing the vote result.

## Ethical and Moral Reasoning: Further Directions

### 1. Integration of Modal Logics
   - Extends models by using a combination of various modalities.
   -   Includes epistemic logic (Σ), action logic (Π), emotion logic (δ), deontic logic (λ), and privacy logic (ρ).
   -   Introduces new rebuttal rules (+a-defeater, +a-undercut) for attack relationships and moral theories.

### 2. Burden-Like Semantics
     - For each argument, we use a function: S¡(a) = Def¡(a) – Bur¡(a) + 1.
     - Where Bur¡(a) is given by : 1 if i=0 or 1 + (1/B)∑ Burj_1(b), where b are the attacker of a.
      - And Def¡(a) is given by :1 if i=0 or 1/(|A|)p(a) + (ρ(a)/(|Supp|))Σ Defi_1(b) where b are the support of a
   -  Aims to develop methods for decision-making in ethical dilemmas.

### 3. Argumentation and Machine Learning

    -  Explores how argumentation can be integrated with machine learning for more flexible models.
    -   The aim is to use argumentation and machine learning to learn and explain reactive ethical decisions.
    -   Questions include:
        - Using argumentation to generate a dataset for machine learning.
        - Using argumentation to evaluate the utility function for reinforcement learning.
        - Setting value-based argumentations using reinforcement learning.
        - Using ML/RL techniques to decide the best admissible set of arguments.
     - Uses a value-based bipolar argumentation framework (VBAF).
         -  Includes arguments, attack and support relations, values, and mapping functions.
   - Discusses ways to give "quick-argumentation" thanks to Machine Learning and how to combine ranking semantics.
  - Proposed research topics include:
    - Argumentation to generate a training database for Machine Learning?
    - Argumentation to evaluate the utility function for Reinforcement Learning?
    - Reinforcement Learning to set ≻, then use argumentation to decide ?
    - Use ML/RL techniques to decide the best admissible set of arguments?

## Detailed Explanation of  Modal Operators

### 1. Doxastic vs Epistemic Operators
    - **Doxastic Logic (Bᵢ)** focuses on beliefs which may or may not be true.
        - Example: `Bᵢφ`:  Agent i believes φ.
    - **Epistemic Logic (Kᵢ)** focuses on knowledge, which requires truth.
         - Example: `Kᵢφ`: Agent i knows φ, and φ is true.
    -  Epistemic knowledge is stronger than belief.
        - If you know something, then you believe it.

### 2.  Action Modality (E)
   - **Eᵢφ**: Represents that action performed by agent `i` leads to `φ`.
   - **Eᵢᵈφ**: Represents a deliberate effect where agent `i` intended φ to be true.
   -   Used to express both the intent and the impact of an agent's actions.

### 3. Neighborhood Functions
   - A method of generalizing the binary relations of kripke structure by considering sets of possible worlds.
   - Used when modeling deliberative effect because the system doesn't need to know all the possible worlds.
   - Each possible world is associated with a set of other possible worlds, modeling what that agent can "reach" or "access".
    - Useful because it does not assume symmetry of the accessibility relation.

## Manipulation in Logical Terms

### 1. Defining Manipulation
  - Manipulation is described as using another agent to do something and that other agent is unaware of the manipulation, while concealment is when the manipulator hides the fact that he is manipulating.
  - Instrumentalization is the act of using another agent, and can be further divided into soft (as a consequence) or strong instrumentalization (as a deliberate intent).

### 2. Representing Concealment
   - **Epistemic concealment:** prevents the target from knowing something
       - Example : `¬Kᵢ(Eⱼᵈ φ)` represents that agent `i` does not know that agent `j` is deliberately bringing about φ.
  - **Doxastic Concealment:** prevents the target from believing something.
      - Example :  `¬Bᵢ(Eⱼᵈ φ)` represents that agent `i` does not believe that agent `j` is deliberately bringing about φ.

### 3. Constructive and Destructive Manipulation
   -  **Constructive Manipulation**: When an agent induces another agent to do something.
   - **Destructive Manipulation**: When an agent induces another agent not to do something.

### 4.  Combining Concepts
   - Manipulation can be a cartesian product between instrumentalization (soft/strong) and epistemic/doxastic concealment.

### 5. Defining Manipulation with Modal Logic
  - Using the concepts described above we can have the following definitions :
    - **Strong Instrumentalization with Doxastic Concealment:**
           -`¬Bⱼ(Eᵢᵈφ)` and `Eᵢᵈφ`
    - **Soft Instrumentalization with Epistemic Concealment:**
           -`¬Kⱼ(Eᵢφ)` and `Eᵢφ`
   -  The use of deliberation requires the use of an intention.

### 6.  Relations between Modalities

    -   Modal rules are used to link different operators and represent various aspects of the agent behavior.
    -  Example:
           - ` {φ, (φ ⇒ ¬ψ)} ⊨ ¬ψ (Hypothesis)`
           -` ⊨ ((φ ∧ (φ ⇒ ¬ψ)) ⇒ ¬ψ) ⇒ (ψ ⇒ ¬(φ ∧ (φ ⇒ ¬ψ)))  (Contraposition Axiom)`
           -  `⊨ ψ ⇒ ¬(φ ∧ (φ ⇒ ¬ψ)) (Modus ponens on contraposition)`
           - `{ψ}  ⊨ ¬(φ ∧ (φ ⇒ ¬ψ)) (Deduction Theorem)`

### 7.  Types of Agents

    -  Rational Agent: can use rules of inference to form beliefs.
    -   Perfect Reasoner: Can reason based on a pre-defined set of logic rules.

### 8. Example of applying the Robot Dilemma
   - Reapplies the Robot Dilemma to the theory developed.
   - Introduces set of propositional variables and a new set of formulas.
   - Uses the framework to define arguments, and attack relations.
   - Identifies Admissible and Stable extensions.
   - With the example, the decision to not inform the doctor remains a problem due to symmetrical attacks between arguments, for which, a bipolar argumentation system is suggested.

## Conclusion and Future Work

1. **Limitations of Existing Models**:
   - Argumentation alone is costly, and may not provide an answer to multiple and conflicting choices.
   - Classical approaches cannot handle scenarios where many actions are admissible.
   - The symmetry of attacks is also problematic.

2. **Future Directions**:
  - Investigate bipolar argumentation to resolve issues with symmetry and the choice of actions.
  -  Utilize a combination of modal operators to create new and richer frameworks.
  - Develop novel semantics that can incorporate other criteria.
  - Integrate argumentation with machine learning for fast and reactive decision-making.
  - Find a new utility function that only considers the vote outcome.
  - Test if this framework enables manipulation.

3.  **Final Notes:**
  - This work presents a strong theoretical foundation and practical tools for analyzing and understanding manipulation in multi-agent systems.
  - Future research can explore how these approaches can enable more robust, transparent, and ethical agent-based systems.

This report summarizes the concepts, models, and practical exercises presented in the provided material. It emphasizes the importance of formalizing manipulation as a crucial area of research for ensuring ethical and robust multi-agent systems.
