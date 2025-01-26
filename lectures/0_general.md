Multi-Agent Systems

Christopher Leturc
PhD, Assistant Professor at Université Côte d'Azur
Academic Year 2024/2025

**Who am I?**
I am a PhD in AI, a RESEARCHER at I3S and a lecturer at Université Côte d'Azur.

**What am I?**
There are several statuses for research professors:
*   Doctoral contract lecturers: when doing a PhD and teaching (after a Master's degree and selection)
*   PRAG: Teaching-focused lecturer, 100% dedicated to teaching (after a Master's degree and AGREG)
*   PostDoc lecturer: researcher and lecturer at the university (after a PhD)
*   Assistant Professor: researcher and lecturer at the university (after a PhD, MCF qualification, and passing an international MCF exam)

**What is research?**
*   Identify research questions
*   Review existing literature
*   Prepare grant applications for funding
*   Supervise PhD theses or serve as a reviewer
*   Build theories and prove theorems
*   Set up experiments and benchmarks
*   Write publications or review articles
*   Present work at conferences
*   Organize conferences

**What research do I conduct?**
*   Study and build Multi-Agent Systems
*   My expertise: modal logic, formal argumentation, and semantic web
*   Develop mathematical theories to reason about ethics, deontics, doxastics, manipulation, and trust
*   Co-supervised thesis with Elisabetta de Maria on spiking neural networks

**Any questions?**
(Are some of you interested in pursuing a PhD?)

---

**Multi-Agent System**
*   Formel argumentation
*   Semantic web

**Hyperagent:** capable of using the web
Skynet used the web

*   Be careful about implications.
*   All artifical agents can become dangerouis.
*   How can we be sure they're safe?  => Math.
*   Hyperagent modeled so skynet can't exist.
*   Mathematical model for manipulation.
*   Modeling trust.
*   Reputation system (Amazon)
*   Grade is provided by a multi-agent system can be human or software.
*   Recommendation System
*   Voting system
*   Video games
*   Drone in your environment.
*   Agent: Autonomous entity that con evolve in its environment.

---

**Agent reasoning about "deontics"?**
*   Ethics
*   Morals
*   Meth can model abstract things like ethics and meth.
*   Everything can be modeled with logic! (first order).
*   Ethics describs relatively a system of values.
*   Mardi Absolute way of what's right and wrong.

**"God Machine"**
*   An artificial agent, if it decides to destroy us...
*   Do we deserve it?

*   spiking neural networks. Checking them.
*   medical applications.
    *   predict as physician would.

*   Cifre: Industry and academic world.
    *   Working and PhD 50%/50%.
    *   Tax reduction: credit impot recherche.
    *   usually up to company on % you can research.
    *   ex: Thales asked to work on something not related to PhD.

*   Pay attention with whom you work. PhD supervisor is very important.
*   If not sure, don't do it with them.
*   Being complementary is very important. communication very important.

---

**Game Theory**
**Prisoner's Dilemma**
*  10 years ago gov. was considering AI seriously
*  Help industrial companies adopt AI

---

**Chapter 1 : Introduction to Multi-Agent Systems**
**You say.. Artificial Intelligence ?**
**Examples of AI in Everyday Life**
*   Voice Assistants: Siri, Alexa, Google Assistant
*   Image Recognition: medical image analysis, automatic photo sorting
*   Autonomous Vehicles: Tesla, Waymo
*   Recommendation Systems: Netflix, YouTube, Amazon

**AI Application Areas**
*   Healthcare: AI-assisted medical diagnosis
*   Finance: fraud detection, automated trading
*   Industry: predictive maintenance, industrial robotics
*   Education: writing courses and exams..

**What is Artificial Intelligence?**
Artificial Intelligence (AI) refers to systems or machines capable of performing tasks that typically require human intelligence.

**Definitions of AI**
*   Strong AI: intelligence comparable to that of humans, capable of understanding, learning, and reasoning autonomously.
*   Weak AI: specialized in specific tasks without real understanding of the broader context.
*   Generative AI: systems capable of creating new content, such as text, images, and sounds.

**Standard AI Techniques that you may know**
*   Supervised Learning: AI learns from labeled examples.
*   Unsupervised Learning: AI identifies patterns in unlabeled data.
*   Reinforcement Learning: AI learns through trial and error, optimizing for a reward.
*   Neural Networks: inspired by the structure of the human brain for data processing.
*   But AI is not only based on Machine Learning !!

**Artificial Intelligence Beyond Machine Learning**
Artificial Intelligence (AI) is not limited to Machine Learning (ML); it also encompasses symbolic AI, a field with a distinct approach to building intelligent systems.

**What is Machine Learning?**
Machine Learning is a subset of AI where systems learn from data to make predictions or decisions.
*   Uses statistical techniques to find patterns in data
*   Adapts to new information without explicit programming
*   Common applications include image recognition, recommendation systems, and natural language processing

---

**Example:** A spam filter that identifies spam emails based on past email patterns
**Limitations of Machine Learning**
*   Data Dependence: ML models require large, high-quality datasets
*   Interpretability: Complex ML models, like deep learning, are often "black boxes" and hard to interpret
*   Knowledge Transfer: Difficult for ML models to generalize across vastly different scenarios without retraining
These limitations highlight the need for alternative approaches within AI.

**What is Symbolic AI?**
Symbolic AI, also known as "Good Old-Fashioned AI" (GOFAI), relies on symbolic representations and logical rules to mimic human reasoning.
*   Uses symbols to represent concepts, objects, and relationships
*   Operates through logic-based reasoning, structured rules, and symbolic manipulation
*   Designed to handle complex problem-solving tasks where explicit knowledge representation is key
**Key Characteristics of Symbolic AI**
*   Explicit Knowledge Representation: Knowledge is represented using rules, facts, and logic
*   Reasoning: Systems can perform logical deductions and draw conclusions
*   Transparency: The decision-making process is interpretable and explainable
*   Flexibility in Problem-Solving: Useful in areas like theorem proving, planning, and expert systems

**Example of Symbolic AI - Expert Systems**
Expert systems are a classic application of symbolic AI. They use a set of if-then rules to simulate the expertise of a human in a specific field.
*   Medical Diagnosis System: Uses knowledge from medical experts to diagnose diseases based on symptoms and conditions
*   Legal Decision Support: Assists legal experts by applying complex legal rules and case precedents

**Comparing Symbolic AI and Machine Learning**
| Feature                      | Symbolic AI                | Machine Learning                         |
|------------------------------|---------------------------|-------------------------------------------|
| Knowledge Representation     | Explicit, rule-based      | Implicit, data-driven                    |
| Interpretability             | Highly interpretable       | Low interpretability (for complex models) |
| Data Requirement             | Low                       | High                                      |
| Adaptability                 | Limited without reprogramming    | High with sufficient data              |

**Symbolic AI + Machine Learning = Hybrid AI**
Hybrid AI combines the strengths of both approaches:
*   Symbolic AI: Provides explicit reasoning, rule-based structure, and interpretability
*   Machine Learning: Offers adaptability, data-driven insights, and generalization from patterns
*   Hybrid systems aim to enhance AI’s versatility in real-world applications

---

**What To Remember**
*   AI is a broad field that encompasses more than just machine learning.
*   Symbolic AI offers structured, logical reasoning and is useful for tasks requiring transparency and interpretability
*   Machine learning excels with data-rich tasks and adaptability but lacks interpretability
*   Combining both approaches in Hybrid AI can produce more powerful and flexible systems
**Limitations of all of these techniques**
*   Focuses on a single intelligent entity
*   Primarily follows a sequential approach
*   Not well-suited for functionally distributed, heterogeneous problems
*   Limited in simulating complex social phenomena

**Why Distribute Intelligence?**
Exploring the reasons and benefits of distributing intelligence in multi-agent systems

**Better Task Distribution**
Distributing intelligence allows for sharing responsibilities and resources across multiple agents:
*   Reduces workload on a single agent or central system
*   Increases efficiency and productivity
*   Adapts to specialized tasks per agent

**Example:** Smart sensor networks where each sensor monitors a specific part of an environment

**Scalability**
Distributed systems can scale by adding new agents without major redesign:
*   Easy expansion to handle growing data volumes
*   Supports progressive system evolution based on needs
*   Capable of operating on heterogeneous architectures

**Example:** Adaptive communication networks that increase capacity with more users

**Resilience and Fault Tolerance**
Distributing intelligence enhances resilience against failures:
*   Each agent can take over if another fails
*   Minimizes the risk of complete system failure
*   Enables quick recovery after incidents

**Example:** Backup systems in power or communication networks

**Adaptability and Flexibility**
Intelligent agents can quickly adapt to changes in their environment:
*   Real-time response to new information
*   Reprioritize based on needs. Coordinate to accomplish goals.
*   Facilitates collective intelligence.

---

**☆Resource Optimization**
ie: Optimial wage of local resources.

☆Can adept. Better equipped for dynamic environment.
- Decentralized decision meveing. No operator reeded.
- Sometimes humans are  less quick compared to these systems.

---

**☆Distributed AI**
*   Set of intelligent agents working in decentralized way.
*   Often collaborate. But usually work bully.

**DAI vs centralized**
*   Absence of global control.

**Distribution vs Decentralization**
*   Problem solving through parallilization.
*   Working together is elaborte.

**☆ Multi-agent System**
*  1950: Turing machine
*   Dartmouth coined "Artificial Intelligence".

**Big Problem** → srall problems → send to agents
80's: Multi-agent achieved from centralized → deantralized.
*   interaction of agents.
    *   competition, cooperation, persuasion.

*  Game theory for agents.
*  Protocol for communication and coordination.

**Why shift to multi-agent?**
*   Scelibility and dynamic situestions.

*   Agents focus on interactions of multiple agents. Each own goal.
collaborate. Negociation cooperation.
*  In distributed Al we don't talle about the environment.

---

**DAI solues a specific problem collectively.**
**Taxonomy: A lot of literature behind it.**

---

**Agent reasoning about "deontics"?**
*   Ethics
*   Morals
*   Meth can model abstract things like ethics and meth.
*   Everything can be modeled with logic! (first order).
*   Ethics describs relatively a system of values.
*   Mardi Absolute way of what's right and wrong.

**"God Machine"**
*   An artificial agent, if it decides to destrol us...
*   Do we deserve it?

*   spiking neural networks. Cheeking them.
*   medical applications.
    *   predict as physician would.

*   Cifre: Industry and academic world.
    *   Working and PhD 50%/50%.
    *   Tax reduction: credit impot recherche.
    *   usually up to company on % you can research.
    *   ex: Thales asked to work on something not related to PhD.

*   Pay attention with whom you work. PhD supervisor is very important.
*   If not sure, don't do it with them.
*   Being complementary is very important. communication very important.

---

Also, a reminder of the content of the course that was also explained:

*   Multi-agent system.
    *   Formal argumentation
    *   Semantic web

*  AI are artificial agents.
*  There is not necessarily based on learning. It can be obtained.
*  Systems capable of tastes which ustelly requires human intelligence.
    *   The definition can evolve in time.
*   Strong Al: I compactble to humans. understand/learn/reason
*   weak Al:
*   Gererative Al:
*   Supervised: abeled
*   unsupervised: (clustering ex). Finding patterns-
*   Reinforcerend: leans thragh error. Reward.
*   Neural network: supervised. learning from data
*  Machine learning can be symbolic Al
*  ML: can be subset of Al. Learning from data. No explicit programming.
*  Limitations of ML: Data dependence. Black box. Difficult to generalize without retraining

**Symbolic AI**
* Arka: good old fashioned. expert system
* relies on logicel rules and symbolic relationship.
* operates on logic based reasoning, structured rules, symbolic manipulation;
* Explicit throwledge representation is key. rules facts logic.
* Reasoning: logical deduction.
* transparency: interpactable and explairath.
* useful in theaven proving, plamig, expert systems.
* **Expert system**
    * used to decide early on if you should have a grant or not.
    * a bunch of if/ then rules.
    * Legal experts. apply complex rules. reason about law.
    *
  
|          | Symbolic Al                       | Machine learning     |
|-----------|------------------------------------|-----------------------|
| know/rear  | explicit rules                    | implicit/data   |
| interpretebility   | inte, prtable          | low for complex|
| datu | low | high|
| adeptibility| limited without reprogramming | high  with sufficita data |
  
**Hybrid Al:** Try to combine the strengths of both reasoning rule based. interpretable.
    * ⇒ versatile.

**Limitation of all:**
*  Focused on a single intelligent entity
    *  Limitation about
* sequential approach: Follw steps. Different from distributed
* not good for heterogenous problems
* limited in simulating complex social phenomena.
* If you use mono-agent (ai sequential) you are limited in modeling capability.

**"Distributing Intelligence"**
* sharing responsibilities with multiple agents.
    *  parallize, increase efficiency,
    * specialized creural retwortes).
* Can scale by adding new agents. No major redesign.
* can handle growing duta volume.
* can handle tetesserous architecture.
* Peer to peer: Distributed resources.
* Erables replacement if agent dies. Minimize risk of complete failure.
* Quickly adopt to changes in their environment.
* Reprioritize based on needs. Coordinate to accomplish goals.
* Facilitates collective intelligence.

---

PHD:
* Teaching
    * Teaching as Prag
* Postdoc researcher. can become assistant professor.

**What's a researcher?**
* Propose new solutions
* Position work wrt literature
* you don't have as much time as when you were phid.
* Apply for grants supervise phd thesis Mureye students.
* theories.
* experimentation.

**what's the point of math?**
* You're sure your ales will work.
* helps build new system.
* Start with theory, then implement the system.
* understand why reural networks conveде.
* paper review. like an interrational competition.
* presenting work in conferences.
* Model logic field.
    * reasoning about completeness.
* modeling
    * ratteratial theory
* Proof not wrong, but initial conditions-
* 1% algo wrong.
* Model problems in nath and you can make better decisions.

---

*  We have many different areas where AI application.
   *  skr
   *  finance
   *  industry
   *  education
*  we have multi-agent system and symbolic reasoning,
    *  it was early work on problem solving and search algorithms.
* But during the 70's
   *  ai research we had very famous expert system like mycin for medical chemical analysis.
   *  but we started at this moment to explore distributed artifical intelligence
   *  to focus on decentralization and collaboration because we notice that only one agent is not enough and most of the time we need to have many different agents which are specialized or can collaborate.
   *  and so this is at this moment we start to use massively distributed ai.
   *  and also we started to get more and more data in medical application and we did not have the compultation to do that. and it was an early early idea about agent for solving sub problems.

So we have a big problem and we divided it into sub problems and send it to agent.
So of course many changes about compultation limits and lack of real world data at this period. So this is why also we mainly used symbolic AI.
Neural network was started to be created but actually it was not possible.
And during the 80's we started to talk about multi agent system. It was a shift from centralized AI to decentralized system.
and it focus on autonomous agents with individual goals. And as a difference with distributed intelligence, we can have interactions between agents through cooperation, competition or negotiation.
and we got very very notable advancement in this period like the actor model for concurrent compultation or development of distributed problem solving.
And exactly a multi agent system was formalized during 1990's and multi agent system established as distinct field of study.
And we started to have the theorical foundation, so the mathematical math how we can model multi agent system and how we can model the behavior of agent at this period.
So one tool that was designed was game theory for agent interaction, how my agent can negociate.
or i can be sure that they will act correclty or we designed also protocol for communication and coordination. But also it was the beginning of the model checking technique. we have a very complex agent how we can model the behavior of my agent with the logical tool.
And we started to to have application in robotics simulation and distributed computation.
why we started to have a shift to multi agent system.
indeed as I told you traditional AI struggle with scalability in large and complex problem but also in handling dynamic and uncertain environment while multi agent system was addresed exactly for leveraging those challenges.
So to do it in decentralised decision making. by and why doing it in autonomy and by using the adaptability of our agents.
So now actually today the current trends and the future directions is integrating multi agent with advanced AI model for instance reinforcement learning for adaptive agents or application in smart city or IoT which is internet of things or web semantic for instance or we can use multi agent system on the web to get data.
And of course we have still many research challenge like scalability, coordination, communication answering security and trust in multi agent system and this is what we will talk in this course.
So just before do you at which hour this course is over just because i think just it's 45. Yes. But uh should we consider a break or normally we have a few minutes break.  Yeah i think you need it? Yes. Yeah yeah so we will take we will take like 15 if you want 15 minutes for a break. Yeah. And yeah we will uh we will pursue the course. because yeah I talked a lot and maybe you need to I need to do a little rest and uh.
On a que 45 minutes parce que la nuit commence à 13h. Ah c'est chaud. Ah ouais, vous avez que 45 minutes. Mais si vous voulez, moi je vous lâcherai plus tôt. Si on fait genre là on fait vite fait une petite pause, 5 ou 10 minutes mais moi je peux vous laisser à 30 si vous avez besoin de manger par exemple. Ouais 30 ce serait bien. Ouais si vous voulez je vous laisse à 30 pour les décaler. Si ça peut vous arranger pour la 15 heure. C'est vrai qu'on finissait pour midi. Merci. Alors que dans. Ouais, c'est ça, c'est le problème d'avant. Plusieurs profs nous ont dit on veut commencer à 9h. Ouais. Du coup on a fait 9h midi mais on a pas le nombre d'heures exactement. Donc a fini à midi pendant deux mois et les cours ont été décalés jusqu'à 13h. Ah c'est Ah mais du coup c'est c'est chaud. Là là vos cours ils sont à quelle heure cet après-midi ? 13h à 15h en principe. Ah ouais, ça vous laisse pas beaucoup de temps pour manger. Mais si vous voulez vous avez moi je peux vous laisser à 30 et si ça ça vous permet parce que il faut au moins minimum une heure quoi pour manger quoi. Ouais. au moins enfin genre. Moi je je je vais vous laisser à 30, de toute façon au cours. A 30 comme ça ça vous laissera une heure et puis et éventuellement si certains d'entre vous avaient des questions, bon ben voilà. Mais sinon moi moi je peux vous laisser à 30, sans problème parce que ouais c'est c'est un peu chaud quand même prendre le temps de manger. Puis en plus à mon avis l'après-midi vous devez avoir des journées bien chargés. Genre je crois que ça doit être du 4h de cours l'après-midi, donc c'est un peu violent donc. Ouais, je vais essayer de pas vous euh pas vous matraquer avec trop d'informations, essayer d'aller en phase et puis que vous ayez temps aussi de manger quoi, c'est.

---
