

## Formal Argumentation in Multi-Agent Systems: A Comprehensive Overview

This document outlines a lecture on formal argumentation within the context of multi-agent systems (MAS). It explores various aspects, from fundamental definitions to practical applications and connections with machine learning.

### Introduction to Formal Argumentation
Formal argumentation is a process used by agents (either individual or groups) to:
* Make decisions.
* Adopt new information or beliefs.
* Explain their decisions.

The lecture assumes agents are:

*   **Rational:** They aim to maximize their own utility.
*   **Perfect reasoners:** They don't make mistakes in reasoning.
*   **BDI-based:** Based on beliefs, desires, and intentions.

#### Multi-Criteria Decisions
In real-world scenarios, decision-making often involves multiple, conflicting criteria such as distance, time, and comfort (e.g., in transportation). Agents must be rational and aim to maximize their personal utility, which is affected by these criteria. This motivates the use of argumentation to navigate these complex scenarios.

#### Core Concept: Argumentation
The fundamental unit is the *argument*, which may:

*   "Attack" or contradict other arguments.
*  Involve pros and cons, but not simply boil down to them.
* Be a part of a dynamic process, where a decision and its reason are provided and can evolve.
* Rely on time and reputation as factors to resolve contradictions.
* Be a kind of non-monotonic reasoning that allows for updates and revisions.

### Formal Foundations
Argumentation systems are formally represented as a tuple: `<A, R>`, where:
*   **A** is a non-empty set of arguments.
*   **R** ⊆ A x A is a binary *attack relation* among the arguments. This includes reflexive attacks too.
*   **Admissible sets of arguments**:
    *   **Conflict-free**: No arguments in the set attack each other.
    *   **Defendable**: All arguments attacking an argument within the set are, in turn, attacked by another argument within the set.
  *  S is admissible.
   * Empty set is valid: no attack, no contradiction
   * Complete argurents : The arg that are defended by the set are also in set

   
### Semantic Extensions

#### Preferred Extensions
*   **Motivation**:  To find the largest consistent set of arguments
*   The set of arguments must be a *maximal* admissible set (can't add other arguments without breaking admissibility), and must contains the arg it defends.
*   Preferred extensions represent a "best" interpretation of the set of arguments.
*  If an arg S is preferred then it is also a complete extension.
  
#### Stable Extensions
*   **Motivation**: To find an even stronger level of support
*   Stable extensions are a *preferred extension* that attacks any argument *not* in the extension.
*  Represents the best admissible set since it attacks all arguments that are not in this extension.
  
### Relationships Between Semantic Extensions

There are inclusion relations between these notions:
*   `Stable` is included in `Preferred`
*   `Preferred` is included in `Complete`
*   `Complete` is included in `Admissible`

It's important to note that this is not a *strict* inclusion. It is possible to have for instance stable argumenation system, which is also the only admissible extension. But if an arg is complete it must be admissible, and so on.

### Algorithm for Computing Preferred Extensions

A key part of the lecture is an algorithm to compute all preferred extensions, as outlined by Nofal et al. (2014):

1.  **Formal Notations:**
    *   `(A, R)`: An argumentation system.
    *   μ: A  → {IN, OUT, BLANK, MUST_OUT, UNDEC}: A HashMap to track the state of each argument during processing.
    
2.  **Main Program Steps:**
     *    Initialize all argument states to `BLANK`
     *    Define `PEXT` to hold the preferred extensions.
     *    Call the recursive function find-preferred-extensions(μ)
     *    Returns all preferred extensions from `PEXT`.
 
3. **Recursive procedure** `find-preferred-extensions(μ)`
  * **Termination check**: If every argument's state is not `BLANK` and no argument is marked `MUST_OUT`,
     *  it computes the preferred extension *S* based on all arguments set to `IN`.
     * adds the resulting *S* to `PEXT` if it is not already included in another.
  *  If the termation condition isn't met,
    *  it selects a `BLANK` argument *x* and recurses with either *x* set to `IN` (by `IN-TRANS(x)`) or set to `UNDEC` (by `UNDEC-TRANS(x)`).

4. **Functions:**
    *`IN-TRANS(x)`: Sets x as IN, all those it attacks OUT, and arguments attacking x MUST_OUT
    *`UNDEC-TRANS(x)`: Set argument as UNDEC.

This recursive procedure performs a tree search, representing states and preferred labeling paths.
  
### Logic-Based Argumentation (Besnard and Hunter)

 This section explores how to derive arguments automatically using propositional logic.

*   **Foundation:** Relies on classical logic.
*   **Argument Definition:** An argument is a couple (Φ, α) where:
   *  Φ is a minimal set of consistent formulas (called support)
   *   α is a logical consequence (conclusion) of Φ.
   *  Φ and α belongs to a set of formulas A that the agent can reason with.

*   **Attack Types:**
    *   **Rebuttal:**  Conflicting conclusions.  It is symmetrical ( if A rebuts B then B rebuts A), it is a form of contraposition or equivalence.
    *   **Undercut:**  Conclusion attacking the support of other argument. It implies a defeater attack
    *   **Defeater:** Conclusion attacking another argument's support

#### Example of Propositional Calculus-Based Argumentation:
* A := "My car has an airbag"
* B := "My car is safe"
* C := "Airbags are reliable"
* D := "The newspapers say so"
* E := "The scientists say so"
Examples of Arguments:
* ({a, a => b}, b): if has an airbag the car is safe.
* ({d, d => -c, -c => -b}, -b): "the newspaper says it's not reliable so it's not safe".
* ({e, e => c}, c): the scientists says it is reliable.

Example of attacks:
* ({d, d => -c, -c => -b}, -b) rebuts ({a, a => b}, b)
* ({e, e => c}, c) defeats ({d, d => -c, -c => -b}, -b)

### Bipolar Argumentation
Bipolar argumentation extends the standard system by including a *support relation*, alongside the attack relation. This allows us to express how arguments endorse each other.

#### Formal Representation:
* An argumentation system <A, R, S>
   *  A: A non empty set of arguments
   *  R: A binary attack relation
   *  S: A binary support relation

#### Definition of new notions:
  * **Supported attack**  an arg. A support the attack of arg. B, by some support chain A-> ...->B that ends in an attack.
  * **Indirect attack:** an arg A attacks indirectly another B, via some attack-support chain A-> ...-> B that ends in support.
 * **Set-attack:** a set of argument set-attack another if it is supported or attacked indirectly or directly.

#### New Semantics:
*    **Conflict-free:** No arguments in S *set attack* each other.
*    **Stable extension:** A preferred extension that *set attacks* all args outside S.

#### Logical Extensions for Bipolar Argumentation
* In Bipolar Argumentation we can use the notions of rebuttal, undercut and defeater like with classical logic-based argumentaion system,
* Furthermore, we can model support using logical entailment and thus model different situations.

   

### Application example: Robot's dilemma
The report then applies this formal model to the initial "robot dilemma" example:
1.  The robot has to decide whether to inform the doctor on the patient, while balancing:
    *   Obeying the rules it has been given (to monitor).
    *   Respecting the patient's wishes for privacy.
    *   The information that the patient is in life-threatening condition, which requires reporting.
    
2.  This is expressed with propositional variables for each situation.
3. A series of formulas are used to represent the system's knowledge and logical relations.
4.  This results in a situation where multiple preferred and stable extensions are derived which then leads to the introduction of "set attack" and bipolar argumentation.


### Practical Work Ideas
The lecture suggests several practical exercises to solidify understanding:

1.  **Java Implementation:** Create Java classes to represent arguments, attacks, and a generic argumentation system. Implement the preferred extension algorithm.
2.  **Voting System:** Implement a voting system (e.g., Borda count) that takes into account acceptable candidates determined by argumentation.
3.  **Prisoner's Dilemma:** Model a prisoner's dilemma in the context of argumentation. Investigate the problem of agents who lie to influence the vote result and decide if it is rational for them to do so.
4.   Investigate different approaches to evaluate utility function for reinforcement learning and explore how it can help to provide quick argumentation.
5. Explore how to combine ranking semantics with machine learning or reinforcement learning approach

### Machine learning perspectives:
*   Combining machine learning and reinforcement learning with argumentation to generate a training database, evaluate utility functions, or set priorities.
*   Using argumentation to determine explainability in black box reasoning.

### Summary
*  By making the system reason about ethical aspects and the different ways to model argumentation.
* We learn the relationship between different levels of  argumentation semantic and their use in practice.
*   How to apply logic to formalize argumentation and build a suitable framework.
*  How to use logic to build argumentation system and compute arguments and attacks.
*   How to solve a situation where multiple possible outcomes are feasible and where choosing one of them over another isn't clear.
*   How to integrate machine learning in such a system to model ethical debates and human-reasoning.

This comprehensive lecture provides a solid understanding of formal argumentation, from its underlying principles to its practical use in multi-agent systems and future perspectives for use in machine learning.
