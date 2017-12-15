---
title: Information Systems Project
author: Hendrik Werner s4549775
date: \today
fontsize: 12pt
geometry: margin=5em
header-includes:
	- \usepackage[mathscr]{euscript}
---

\newcommand{\CC}{\mathcal{C}}
\newcommand{\EE}{\mathcal{E}}
\newcommand{\FF}{\mathcal{F}}
\newcommand{\GG}{\mathcal{G}}
\newcommand{\II}{\mathcal{I}}
\newcommand{\LL}{\mathcal{L}}
\newcommand{\OO}{\mathcal{O}}
\newcommand{\PP}{\mathcal{P}}
\renewcommand{\SS}{\mathcal{S}}

\newcommand{\gen}[2]{#1\ Gen\ #2}

\newcommand{\pow}{\mathscr{P}}
\newcommand{\spec}[2]{#1\ Spec\ #2}

# Introduction

In this document we want to apply, evaluate, and try to improve the information model theory. The improvement will be done by extending the theory. We do this with the goal of finding the limits of the current model, by way of applying it to a real world case. It will be evaluated what works well, and what does not, and finally improvements will be proposed.

## Theory overview

--------- -------------------------------------------------------
$\PP$     predicators / roles
$\OO$     object types
$\Omega$  instances of $\OO$
$\CC$     schema types
          $\CC \subseteq \OO$
$\EE$     entity types
          $\mathcal{E} \subseteq \OO$
$\FF$     fact types
          $\FF \subseteq \OO$
          $\FF$ is a partition of $\PP$
$\GG$     group types / power types
          $\GG \in \OO$
$\LL$     label types
          $\LL \subseteq \OO$
$\SS$     sequence types
          $\SS \in \OO$
$\II$     information structure
          $\II = \{\CC, \EE, \FF, \GG, \LL, …\}$
$POP_\II$ all possible populations of information structure $\II$
--------- -------------------------------------------------------
: Sets \label{th:sets}

--------------------------------------------- ---------------------------------------------------------------
$Base : \PP \rightarrow \OO$                  Yield the object type associated with the predicator
$Elt : \GG \cup \SS \rightarrow \OO$          Yield the element type associated with a group or sequence type
$Fact : \PP \rightarrow \FF$                  Yield the fact type containing the predicator
                                              $Fact(p) = f \leftrightarrow p \in f$
$Pop : \OO \rightarrow \pow(\Omega)$          Yield the instances of an object type
                                              $\pow$ denotes the powerset
$\sqcap : \OO \rightarrow \OO$                Yield the pater familias of an object type
                                              idempotent: $\sqcap(x) = \sqcap(\sqcap(x)$)
$\prec \subseteq \CC \times \OO$              decomposition of schema types
                                              $X \prec A \leftrightarrow X$ contains $A$
$Spec \subseteq \EE \times \OO \setminus \LL$ specialization of entity types
                                              $\spec{X}{Y} \leftrightarrow X$ is a specialization of $Y$
$Gen \subseteq \EE \times \OO \setminus \LL$  generalization of entity types
                                              $\gen{X}{Y} \leftrightarrow X$ is a generalization of $Y$
$\sim \subseteq \OO \times \OO$               type relatedness
                                              $X \sim Y \leftrightarrow X$ and $Y$ are type related
                                              $X \not \sim Y \rightarrow Pop(X) \cap Pop(Y) = ø$
--------------------------------------------- ---------------------------------------------------------------
: Functions and Relations \label{th:functions}

# Application

The subject of our studies will be bol.com, which is the Netherlands leading e-commerce website. They sell an enormous amount of products in a wide range of categories, from books to pet supplies.

## Week 1

We can begin by identifying members of the sets (see \ref{th:sets}) on bol.com.

* $\EE =$ {customer, product, category, shopping cart, name, price, color, …}
* $\FF =$ {costs, belongs to, contains, called, …}
* $\LL =$ {product ID, customer ID, shopping cart ID, …}

Next we start identifying their relationships.

* Products
	* belong to categories
	* have a color
	* have an ID
	* are called a name
	* cost a price
	* …
* Shopping carts
	* contain products
	* belong to a customer
	* …
* Customers
	* own shopping carts
	* are called a name
	* …
* …

With this information we can already draw our first diagram.

![Diagram 1](diagrams/diagram_1.pdf)\ 

$\OO = \EE \cup \FF \cup \LL$

$\EE$ = {price, category, product, shopping cart, customer, color, name}

$\FF = \{\{p_1, p_2\}, \{p_3, p_4\}, \{p_5, p_6\}, \{p_7, p_8\}, \{p_9, p_{10}\}, \{p_{11}, p_{12}\}, \{p_{13}, p_{14}\}\}$

$\LL$ = {product ID, customer ID, shopping cart ID, category ID}

$\PP = \{p_1, p_2, …, p_{14}\}$

$\begin{aligned}
	Base(p_1) &= product & Base(p_2) &= name\\
	Base(p_3) &= product & Base(p_4) &= price\\
	Base(p_5) &= color & Base(p_6) &= product\\
	Base(p_7) &= product & Base(p_8) &= shopping\ cart\\
	Base(p_9) &= shopping\ cart & Base(p_{10}) &= customer\\
	Base(p_{11}) &= name & Base(p_{12}) &= customer\\
	Base(p_{13}) &= category & Base(p_{14}) &= product\\
\end{aligned}$

## Week 2

### Group Types

bol.com might suggest groups of products to be bought together, like Amazon does. We would like an object type that contains multiple entity types. The order of the contained entity types is not important. Group types fulfill this purpose.

We disregard the other object types we identified for now, and just look at the products. The model of a product grouping using group types could look like this.

![Diagram 2a](diagrams/diagram_2a.pdf)\ 

Which implicitly contains the fact type $\epsilon_{Product Group}$, or $\epsilon_{PG}$ for short.

![Diagram 2b](diagrams/diagram_2b.pdf)\ 

$\OO = \EE \cup \FF \cup \GG \cup \LL$

$\EE$ = {product}

$\FF = \{\epsilon_{PG}\}, \epsilon_{PG} = \{\epsilon_{PG}^e, \epsilon_{PG}^p\}$

$\GG$ = {product group}

$\LL$ = {product ID}

$\PP = \{\epsilon_{PG}^e, \epsilon_{PG}^p\}$

$\begin{aligned}
	Base(\epsilon_{PG}^e) &= product & Base(\epsilon_{PG}^p) &= product\ group\\
\end{aligned}$

$Elt(product\ group) = product$

We can populate the model with an example population. The craftsman pack consists of a hammer, and nails.

$Pop(product)$ = {hammer, nails}

$Pop(product\ group)$ = {craftsman pack}

$Pop(\epsilon_{PG}) = \{t_1, t_2\}$

$\begin{aligned}
	t_1(\epsilon_{PG}^p) &= craftsman\ pack & t_2(\epsilon_{PG}^p) &= craftsman\ pack\\
	t_1(\epsilon_{PG}^e) &= hammer & t_2(\epsilon_{PG}^e) &= nails\\
\end{aligned}$

### Sequence Types

There may also be groups of products with an ordering inherent to them. Think of books, movies, … with sequels, for example. The group types are not sufficient to represent this, as there is no ordering to the element types. Therefore sequence types are introduced, which supplement group types with an ordering.

![Diagram 3a](diagrams/diagram_3a.pdf)\ 

In addition to the implicit fact type $\epsilon_{PS}$, there is also an implicit objectification of $\epsilon_{PS}$, as well as the implicit fact type $@_{PS}$ between the objectification of $\epsilon_{PS}$, and index $I$.

![Diagram 3b](diagrams/diagram_3b.pdf)\ 

$\OO = \EE \cup \FF \cup \GG \cup \LL$

$\EE$ = {product}

$\FF = \{\epsilon_{PS}, @_{PS}\}, \epsilon_{PS} = \{\epsilon_{PS}^s, \epsilon_{PS}^e\}, @_{PS} = \{@_{PS}^s, @_{PS}^i\}$

$\GG$ = {product sequence}

$\LL$ = {product ID, I}

$\PP = \{\epsilon_{PS}^s, \epsilon_{PS}^e, @_{PS}^s, @_{PS}^i\}$

$\begin{aligned}
	Base(\epsilon_{PS}^s) &= product\ sequence & Base(\epsilon_{PS}^e) &= product\\
	Base(@_{PS}^s) &= product\ sequence & Base(@_{PS}^i) &= index\\
\end{aligned}$

$Elt(product\ sequence) = product$

We can again try to populate the model, to show its viability. We take the Matrix movies as an example, but we pretend the third one was never made.

$Pop(product)$ = {the Matrix, the Matrix reloaded}

$Pop(product\ sequence)$ = {Matrix franchise}

$Pop(\epsilon_{PS}) = \{t_1, t_2\}$

$\begin{aligned}
	t_1(\epsilon_{PS}^s) &= Matrix\ franchise & t_2(\epsilon_{PS}^s) &= Matrix\ franchise\\
	t_1(\epsilon_{PS}^e) &= the\ Matrix & t_2(\epsilon_{PS}^e) &= the\ Matrix\ reloaded\\
\end{aligned}$

$Pop(@_{PS}) = \{t_3, t_4\}$

$\begin{aligned}
	t_3(@_{PS}^s) &= t_1 & t_4(@_{PS}^s) = t_2\\
	t_3(@_{PS}^i) &= 1 & t_4(@_{PS}^i) = 2\\
\end{aligned}$

## Week 3

### Schema Types

We came across objectifications of fact types before, but what about objectifying whole submodels? As I cannot identify a use case for this on bol.com, we will do an abstract example.

Let there be chemical reactions R, and substances S. A chemical reaction has substances as inputs, and substances as outputs. Substances are either inputs to reactions, outputs of reactions, or both. Substances and reaction may be decomposed. A substance may consist of several other substances. Reactions might produce intermediary substances, that take part in subreactions, and so on.

An example of this could look as follows:

![Diagram 6a](diagrams/diagram_6a.pdf)\ 

$s_1$ is the input of reaction $r_1$, which turns it into $s_2$.

Substance $s_1$ decomposes into $s_3$, and $s_4$. Reaction $r_1$ decomposes into subreactions $r_2, r_3$, as well as intermediate substance $s_5$.

$r_2$ consumes $s_3$, and outputs $s_5$. $r_3$ consumes $s_4$, and $s_5$, and outputs $s_2$.

By applying these decompositions we get this diagram:

![Diagram 6b](diagrams/diagram_6b.pdf)\ 

Schema types allow us to model these processes. The following model can describe processes and their decompositions.

![Diagram 7](diagrams/diagram_7.pdf)\ 

$\OO = \CC \cup \EE \cup \FF$

$\CC$ = {D}

$\EE$ = {R, S}

$\FF$ = {i, o, dr, ds}, i = {$p_1, p_2$}, o = {$p_3, p_4$}, dr = {$p_5, p_6$}, ds = {$p_7, p_8$}

$\PP = \{p_1, p_2, …, p_8\}$

$\begin{aligned}
	D &\prec R & D &\prec S & D &\prec i & D &\prec o\\
\end{aligned}$

$\begin{aligned}
	Base(p_1) &= R & Base(p_2) &= S & Base(p_3) &= R & Base(p_4) &= S\\
	Base(p_5) &= R & Base(p_6) &= D & Base(p_7) &= D & Base(p_8) &= S\\
\end{aligned}$

Now we try to populate this model with the process from above.

$Pop(R) = \{r_1, r_2, r_3\}$

$Pop(S) = \{s_1, s_2, s_3, s_4, s_5\}$

$Pop(i) = \{t_1, t_2, t_3\}$

$\begin{aligned}
	t_1(p_1) &= r_2 & t_2(p_1) &= r_3 & t_3(p_1) &= r_3\\
	t_1(p_2) &= s_3 & t_2(p_2) &= s_4 & t_3(p_2) &= s_5\\
\end{aligned}$

$Pop(o) = \{t_4, t_5\}$

$\begin{aligned}
	t_4(p_3) &= r_2 & t_5(p_3) &= r_3\\
	t_4(p_4) &= s_5 & t_5(p_4) &= s_2\\
\end{aligned}$

$POP_I$ describes the set of all possible population of the whole model $I$ (see \ref{th:sets}). We call the schema contained in D schema J, so the set of its possible populations is $POP_J$.

$Pop(D) = \{Pop_{r_1}, Pop_{s_1}\}, Pop_{r_1}, Pop_{s_1} \in POP_J$

$Pop(dr) = \{t_6\}$

$\begin{aligned}
	t_6(p_5) &= r_1 & t_6(p_6) &= Pop_{r_1}\\
\end{aligned}$

$\begin{aligned}
	Pop_{r_1}(R) &= \{r_2, r_3\} & Pop_{r_1}(i) &= \{t_3\}\\
	Pop_{r_1}(S) &= \{s_5\} & Pop_{r_1}(o) &= \{t_4\}\\
\end{aligned}$

$Pop(ds) = \{t_7\}$

$\begin{aligned}
	t_7(p_7) &= Pop_{s_1} & t_7(p_8) &= s_1\\
\end{aligned}$

$\begin{aligned}
	Pop_{s_1}(R) &= ø & Pop_{s_1}(i) &= ø\\
	Pop_{s_1}(S) &= \{s_3, s_4\} & Pop_{s_1}(i) &= ø\\
\end{aligned}$

## Week 4

### Specialization

Bol.com sells a lot of different products, which all have a price, a category, …, which we left out of this model for simplicity's sake. There are subcategories of these products which have additional attributes. Take books, for example, which have an author. Not every product has an author, and we do not want to many null column in the data base, so we make a specialization of products, which has a relation with the author entity type.

![Diagram 9](diagrams/diagram_9.pdf)\ 

$\OO = \EE \cup \FF \cup \LL$

$\EE$ = {product, book, author}

$\FF$ = {{$p_1, p_2$}}

$\LL$ = {product ID, author name}

$\PP = \{p_1, p_2\}$

$\begin{aligned}
	Base(p_1) &= Book & Base(p_2) &= Author\\
\end{aligned}$

$Spec$ = {(Book, Product)}

### Generalization

Bol.com may keep different records for employees, customers, and resellers, with different attributes, which are not shown here, to keep the model simple. However, all of these entity types have some attributes in common, like an address. We could define a fact type for each of them, linking to the address label type. Alternatively we create a generalization of the entity types, and have a single fact type linking their generalization to the address.

![Diagram 10](diagrams/diagram_10.pdf)\ 

$\OO = \EE \cup \FF \cup \LL$

$\EE$ = {customer, employee, reseller, person}

$\FF$ = {{$p_1, p_2$}}

$\LL$ = {address, customer ID, employee ID, reseller ID}

$\PP = \{p_1, p_2\}$

$\begin{aligned}
	Base(p_1) &= Person & Base(p_2) &= Address\\
\end{aligned}$

$Gen$ = {(Person, Customer), (Person, Employee), (Person, Reseller)}

### Type Relatedness

Type relatedness is a concept that tells us whether it is theoretically possible for two populations to overlap. It can be used by databases and compilers, to check whether some statement or query is theoretically possible.

If we have the following statement $Pop(X) = Pop(Y)$, then the compiler can use type relatedness to check, whether the condition can ever be true. We know that $X \not \sim Y \rightarrow Pop(X) \cap Pop(Y) = ø$, so if the types are not related, than the statement can never be true. The compiler could issue a warning in such a case, as writing statements that can never be true was probably not the programmers intention.

There is a set of simple derivation rules that can be followed to derive all type relations. Once we hit a fixed point, meaning that we cannot derive further type relations from the derivation rules, we know that we found all related types.

## Week 5

### Integrity Constraints

If you look at the information structure from week one, a product could, for example, have multiple prices, which is generally not desirable. There is no known way to impose that limit on the level of the information structure, but we still want to avoid this situation.

We could take care, to not insert multiple prices per product into the database, but that approach is error prone and has multiple drawbacks. If, for example, it was at first allowed for each customer to have multiple shopping carts, but then bol.com decides that one cart per customer is enough, the database might already contain instances where this assumption is violated. These instances would need to be found and fixed manually, while taking care not to introduce additional problems, or violating other integrity constraints.

Formalizing additional rules that govern what data is allowed in the database can help with these problems. Therefore static and dynamic integrity constraints are introduced that restrict the information system. Static constraints disallow entering certain populations form the Universe of Discourse into the database, like population where products have multiple prices. Dynamic constraints restrict transitions between allowed populations in the Universe of Discourse, like switching customers from "married" to "unmarried". A customer can be "unmarried", but after he has been "married", he can only become "divorced", or "widowed", but not "unmarried" again.

In the following we focus on static integrity constraints.

### Uniqueness Constraints

![Diagram 10a](diagrams/diagram_10a.pdf)\

$\begin{aligned}
	\OO &= \EE \cup \FF \cup \LL & \EE &= \{product\} & \FF &= \{\{p_1, p_2\}\} & \LL &= \{product\ ID\} & \PP &= \{p_1, p_2\}\\
\end{aligned}$

$\begin{aligned}
	Base(p_1) &= product & Base(p_2) &= price\\
\end{aligned}$

![Diagram 10b](diagrams/diagram_10b.pdf)\

![Diagram 10c](diagrams/diagram_10c.pdf)\

# Evaluation

## Week 1

### The Basics

At the basic level the theory is sufficient to model basic objects and their relations. A case that could not be incorporated into the model has not been encountered, yet.

If anything, our model is too permissive, as it allows one person to have multiple names, for example, which is something we would probably want to disallow. This problem will be solved in later weeks with constraints.

## Week 2

With the way product types, and sequence types are modeled, we get a lot of duplication. We were able to represent groups and sequences of objects, but in a very verbose way.

### Group Types

It would be nice if instead of

$\begin{aligned}
	t_1(\epsilon_{PG}^p) &= craftsman\ pack & t_2(\epsilon_{PG}^p) &= craftsman\ pack\\
	t_1(\epsilon_{PG}^e) &= hammer & t_2(\epsilon_{PG}^e) &= nails\\
\end{aligned}$

we could do something like

$\begin{aligned}
	t_1(\epsilon_{PG}^p) &= craftsman\ pack & t_1(\epsilon_{PG}^e) &= \{hammer, nails\}\\
\end{aligned}$

or

craftsman pack $\epsilon_{PG}$ hammer

craftsman pack $\epsilon_{PG}$ nails

or even

craftsman pack $\epsilon_{PG}$ {hammer, nails}

With a group of only two items this does not seem like much of a difference, but for big groups it could significantly reduce duplication.

### Sequence Types

The way indices are bound to the objectification of the implicit fact type $\epsilon$, you can have non total relations. This means that there can exists an $\epsilon_X$ for which there is no corresponding $@_X$. This should not happen, as that is not what sequence types are for. If we do not impose an ordering on the elements of a sequence type, then it does not have any differentiation from group types.

We can take care to never end up in such a situation, but it would be even better to forbid this ever happening on the modeling level. Instead of binding the index to the objectification of the fact type $\epsilon_X$, we could use implicit ternary fact types.

## Week 3

### Schema Types

As we have shown we can describe the processes and their decomposition using schema types. You may wonder what happened to the first model, before we applied the decomposition. For example, we do not explicitly list $s_1$ as an input to $r_1$. If you look closely it becomes apparent that the first model is deducible from the second model, including the fact that after applying composition D, $s_1$ is an input to $r_1$.

If we take a decomposable $r_x$, and a decomposable $s_y$, then $s_y$ is an input to $r_x$, iff there is an $s_y'$ in the decomposition of $s_y$, that is an input to $r_x'$, which is part of the decomposition of $r_x$. Similarly, $s_y$ is an output of $r_x$, iff there is an $s_y'$ in the decomposition of $s_y$, that is an output of $r_x'$, which is part of the decomposition of $r_x$.

We can try to formalize these deduction rules:

$\forall r, s: ((r, Pop_r) \in Pop(dr) \land (Pop_s, s) \in Pop(ds)) \rightarrow ((r, s) \in Pop(i) \leftrightarrow (\exists s' \in Pop_s(S) \exists r' \in Pop_r(R): (r', s') \in Pop(i)))$

$\forall r, s: ((r, Pop_r) \in Pop(dr) \land (Pop_s, s) \in Pop(ds)) \rightarrow ((r, s) \in Pop(o) \leftrightarrow (\exists s' \in Pop_s(S) \exists r' \in Pop_r(R): (r', s') \in Pop(o)))$

This is pretty unwieldy, but if you look at an example it becomes clear. Take the following model:

![Diagram 8a](diagrams/diagram_8a.pdf)\ 

$Pop(R) = \{r_1, r_2\}$

$Pop(S) = \{s_1, s_2, s_3, s_4\}$

$Pop(i) = \{t_1\}, t_1 = (r_1, s_1)$

$Pop(o) = \{t_2\}, t_2 = (r_1, s_2)$

$Pop(D) = \{Pop_{r_2}, Pop_{s_3}, Pop_{s_4}\}$

$Pop(dr) = \{(r_2, Pop_{r_2})\}$

$Pop(ds) = \{(s_3, Pop_{s_3}), (s_4, Pop_{s_4})\}$

$\begin{aligned}
	Pop_{r_2}(R) &= \{r_1\} & Pop_{r_2}(S) &= ø & Pop_{r_2}(i) &= ø & Pop_{r_2}(o) &= ø \\
	Pop_{s_3}(R) &= ø & Pop_{s_3}(S) &= \{s_1\} & Pop_{s_3}(i) &= ø & Pop_{s_3}(o) &= ø \\
	Pop_{s_4}(R) &= ø & Pop_{s_4}(S) &= \{s_2\} & Pop_{s_4}(i) &= ø & Pop_{s_4}(o) &= ø \\
\end{aligned}$

What can be deduced from the model? Lets break the formula down like this: $\forall r, s: p \rightarrow (\phi \leftrightarrow \psi)$, where precondition $p$ is necessary, and $\psi$ is the sufficient condition for $\phi$.

$p = (r, Pop_r) \in Pop(dr) \land (Pop_s, s) \in Pop(ds)$

The only $r$ and $s$ meeting the precondition are $r_2$ because $(r_2, Pop_{r_2}) \in Pop(dr)$, $s_3$ because $(s_3, Pop_{s_3}) \in Pop(ds)$, and $s_4$ because $(s_4, Pop_{s_4}) \in Pop(ds)$.

We look at the inputs first. For which of the possible combinations $Pop_{r_2}(R) \times (Pop_{s_3}(S) \cup Pop_{s_4}(S))$ does $(r', s') \in Pop(i)$ hold?

$\begin{aligned}
	(Pop_{r_2}(R) \times (Pop_{s_3}(S) \cup Pop_{s_4}(S))) \cap Pop(i) &= (\{r_1\} \times \{s_1, s_2\}) \cap Pop(i)\\
	&= \{(r_1, s_1), (r_1, s_2)\} \cap Pop(i) &= \{(r_1, s_1)\}\\
\end{aligned}$

$\psi$ holds for $(r_1, s_1)$, so as per $\phi$ we deduced that $(r_2, s_3) \in Pop(i)$. Now we look at the outputs.

For which of the combinations $Pop_{r_2}(R) \times (Pop_{s_3}(S) \cup Pop_{s_4}(S))$ does $(r', s') \in Pop(o)$ hold?

$\begin{aligned}
	(Pop_{r_2}(R) \times (Pop_{s_3}(S) \cup Pop_{s_4}(S))) \cap Pop(o) &= (\{r_1\} \times \{s_1, s_2\}) \cap Pop(o)\\
	&= \{(r_1, s_1), (r_1, s_2)\} \cap Pop(o) &= \{(r_1, s_2)\}\\
\end{aligned}$

$\psi$ holds for $(r_1, s_2)$, so as per $\phi$ we deduced that $(r_2, s_4) \in Pop(o)$.

We successfully demonstrated that even though we did not explicitly put these relations into the knowledge base, they are deducible. Our deductions result in the following diagram.

![Diagram 8b](diagrams/diagram_8b.pdf)\ 

This is what you would expect, looking at the version we started with.

Careful observation reveals that $Pop_X(i), Pop_X(o)$ are also deducible from $Pop_X(R), Pop_X(S)$, Pop(i), Pop(o):

$\forall (r, s) \in Pop(i): (r, s) \in Pop_X(i) \leftrightarrow r \in Pop_X(R) \land s \in Pop_X(S)$

$\forall (r, s) \in Pop(o): (r, s) \in Pop_X(o) \leftrightarrow r \in Pop_X(R) \land s \in Pop_X(S)$

## Week 4

### Type Relatedness

Let's look the soundness of the derivation rules. This means checking whether every type relation that can be derived is actually true.

* T1: $\vdash x \sim x$

	It is self evident that an object type can contain instances of itself.

* T2: $x \sim y \vdash y \sim x$

	Type relatedness is symmetric, which makes sense, as $Pop(x) \cup Pop(y) = Pop(y) \cup Pop(x)$.

* T3: $\sqcap(x) = \sqcap(y) \land y \sim z \vdash x \sim z$

	$\sqcap(x) = \sqcap(y) = a \rightarrow Pop(x) \subseteq Pop(a) \land Pop(y) \subseteq Pop(a) \rightarrow x \sim a \land y \sim a$

	$y \sim z \rightarrow Pop(y) \cap Pop(z)$ may not be empty, so $a \sim z$, so it follows that $x \sim z$.

* T4: $\gen{x}{y} \land y \sim z \vdash x \sim z$

	$\gen{x}{y} \rightarrow Pop(y) \subseteq Pop(x)$

	$y \sim z \rightarrow Pop(y) \cap Pop(z)$ may not be empty, so $Pop(x) \cap Pop(z)$ may not be empty.

* T5: $x, y \in \GG \land Elt(x) \sim Elt(y) \vdash x \sim y$

	This is pretty self evident as well, but we can give a population of a model that satisfies the contraints, and in which $Pop(x) \cap Pop(y) \neq ø$. Since type relatedness says, that it is **possible** to have population overlap, but not **necessary**, showing en example in which there is overlap is sufficient.

	$\begin{aligned}
		\OO &= \EE \cup \GG & \EE &= \{A\} & \GG &= \{X, Y\}
	\end{aligned}$

	$\begin{aligned}
		Elt(X) &= A & Elt(Y) &= A\\
	\end{aligned}$

	$\begin{aligned}
		Pop(A) &= \{a_1\} & Pop(X) &= \{b_1\} & Pop(Y) &= \{b_1\}\\
	\end{aligned}$

	$\begin{aligned}
		Pop(\epsilon_X) &= \{t_1\} & Pop(\epsilon_Y) &= \{t_2\}\\
	\end{aligned}$

	$\begin{aligned}
		t_1(\epsilon_X^e) &= a_1 & t_1(\epsilon_X^p) &= b_1\\
		t_2(\epsilon_Y^e) &= a_1 & t_2(\epsilon_Y^p) &= b_1\\
	\end{aligned}$

	As you can see $X, Y \in \GG$ and $Elt(X) \sim Elt(Y)$ (as per T1), and $Pop(X) \cap Pop(Y) \neq ø$, so T5 is sound.

* T6: $x, y \in \SS \land Elt(x) \sim Elt(y) \vdash x \sim y$

	Take the same model as for T5, except that instead of $\GG = ø$, but $\SS = \{X, Y\}$.

	$\begin{aligned}
		\OO &= \EE \cup \SS & \EE &= \{A\} & \SS &= \{X, Y\}
	\end{aligned}$

	We can use exactly the same population, such that $X, Y \in \SS$ and $Elt(X) \sim Elt(Y)$ (as per T1), and $Pop(X) \cap Pop(Y) \neq ø$, so T6 is sound.

* T7: $\OO_x = \OO_y \vdash x \sim y$

	This should also be pretty self explanatory, so let's do another example.

	$\begin{aligned}
		\OO &= \EE \cup \CC & \EE &= \{A\} & \CC &= \{X, Y\}\\
	\end{aligned}$

	$\prec$ = {(X, A), (Y, A)}

	$Pop(A) = \{a_1\}$

	$Pop(X) = Pop(Y) = \{Pop_J\}$

	$Pop_J(A) = \{a_1\}$

	$\OO_X = \OO_Y$, and $Pop(X) \cap Pop(Y) \neq ø$, so T7 holds.

Applying the type relatedness derivation rules by hand is tedious and error prone, so I implemented a type relatedness derivation algorithm in Prolog, pretty much literally translating the derivation rules.

# Extension

## Week 2

### Group types

If we wanted to keep using functions like this

$\begin{aligned}
	t_1(\epsilon_{PG}^p) &= craftsman\ pack & t_1(\epsilon_{PG}^e) &= \{hammer, nails\}\\
\end{aligned}$

we would need to change the type from $t : \epsilon \rightarrow \Omega$ to $t : \epsilon \rightarrow \pow(\Omega)$. $Pop$ is the only function that interacts with $t_i$s (in its codomain), so we need to take a look at that.

In chapter 2.2.3 of the dictate containing the theory the universe of instances is formally defined. This definition includes mappings. Functions are just specialized mapping, so the type of $Pop$ holds.

I think the universe of instances can be more easily defined like this: $\sigma \in \Omega \leftrightarrow \exists \phi \in \OO: \sigma \in Pop(\phi)$. That is a pretty broad definition, but it should be correct, and has the advantage that we do not need to worry about it anymore. By definition, if an element of a set returned by $Pop$, it is an element of $\Omega$.

Let us check whether this extension still works with normal fact types. For this we take a very simple model:

![Diagram 5](diagrams/diagram_5.pdf)\ 

$\OO = \EE \cup \FF$

$\EE$ = {A}

$\FF$ = {f}, f = {$p_1, p_2$}

$\PP$ = {$p_1, p_2$}

$\begin{aligned}
	Base(p_1) &= A & Base(p_2) &= A\\
\end{aligned}$

$\begin{aligned}
	Pop(A) &= \{a_1\} & Pop(f) &= \{t_1\}\\
\end{aligned}$

$\begin{aligned}
	t_1(p_1) &= \{a_1\} & t_1(p_2) &= \{a_1\}\\
\end{aligned}$

Evidently the theory extension does not interfere with earlier constructs. We can still express what was expressible before. We made the theory strictly more powerful.

If instead we wanted to use the relations, we could represent them as sets of ordered pairs.

$Pop(\epsilon_{PG}) = \{t_1\}, t_1$ = {(craftsman pack, hammer), (craftsman pack, nails)}

$t_1 : \Omega \rightarrow \pow(\Omega)$

or shorter

$Pop(\epsilon_{PG}) = \{t_1\}, t_1$ = {(craftsman pack, {hammer, nails})}

At this point, we can even go all the way, and put everything in one relation, skipping the intermediary $t_i$s.

$Pop(\epsilon_B)$ = {($b_1$, {$a_1, a_2$}), ($b_2$, {$a_2, a_3$})}

$Pop : \OO \rightarrow \Omega \rightarrow \pow(\Omega)$

We again try to populate our simple model, to check whether this extension interferes with normal fact types.

![Diagram 5](diagrams/diagram_5.pdf)\ 

$\OO = \EE \cup \FF$

$\EE$ = {A}

$\FF$ = {f}, f = {$p_1, p_2$}

$\PP$ = {$p_1, p_2$}

$\begin{aligned}
	Base(p_1) &= A & Base(p_2) &= A\\
\end{aligned}$

$\begin{aligned}
	Pop(A) &= \{a_1\} & Pop(f) &= \{(a_1, \{a_1\})\}\\
\end{aligned}$

This extension is also compatible with the earlier constructs.

In conclusion, both of these proposed extensions are compatible with the theory. They do not allow us to specify things we would not before, but they let us represent groups and sequences of object types in a more efficient manner.

### Sequence Types

We could represent sequence types with implicit ternary relations.

![Diagram 4](diagrams/diagram_4.pdf)\ 

$\OO = \EE \cup \FF \cup \LL \cup \SS$

$\EE$ = {A}

$\FF = \{\epsilon_B\}, \epsilon_B = \{\epsilon_B^s, \epsilon_B^e, \epsilon_B^i\}$

$\LL$ = {I}

$\PP = \{\epsilon_B^s, \epsilon_B^e, \epsilon_B^i\}$

$\SS$ = {B}

$\begin{aligned}
	Base(\epsilon_B^s) &= B & Base(\epsilon_B^e) &= A & Base(\epsilon_B^i) &= I\\
\end{aligned}$

This way we ensure that every member of a sequence has an associated index on the model level, but can we still populate the model?

$\begin{aligned}
	Pop(A) &= \{a_1, a_2\} & Pop(B) &= \{b_1\} & Pop(I) &= \{1, 2\} & Pop(\epsilon_B) &= \{t_1, t_2\}\\
\end{aligned}$

$\begin{aligned}
	t_1(\epsilon_B^s) &= b_1 & t_1(\epsilon_B^e) &= a_1 & t_1(\epsilon_B^i) &= 1\\
	t_2(\epsilon_B^s) &= b_1 & t_2(\epsilon_B^e) &= a_2 & t_2(\epsilon_B^i) &= 2\\
\end{aligned}$

We can still populate the model with our extension.

Can we combine this extension with the simplified group types extension, that was also proposed? The form $Pop(\epsilon_B) = \{(b_1, \{a_1, a_2\})\}$ we chose to represent group types does not capture the order of the element types. We have two possibilities to resolve this issue. We could either do it like this

$Pop(\epsilon_B) = \{(b_1, a_1, 1), (b_1, a_2, 2)\}$

$Pop : \OO \rightarrow \pow(\Omega \times \Omega \times \Omega)$

or, simpler and closer to the group types, like this

$Pop(\epsilon_B) = \{(b_1, (a_1, a_2))\}$

Here we use the ordering inherent to tuples to store the position of element types in the sequence. Similar to the ternary fact type extension, this also guarantees that every element has a position (its position in the n-tuple). Additionally this representation is much shorter that the original theory we started with.

In this representation it is more difficult to define the type of $Pop$, let us have a try:

$Pop : \OO \rightarrow \Omega \rightarrow ø \cup \Omega \cup (\Omega \times \Omega) \cup (\Omega \times \Omega \times \Omega) \cup …$

Basically we need some equivalent of power sets, but for tuples. As far as I am aware such a tool does not exist, but we can define it:

$\pow_\times(A) := ø \cup A \cup (A \times A) \cup (A \times A \times A) \cup …$

With this new device, we can finally define the type of the proposed $Pop$ as

$Pop : \OO \rightarrow \Omega \rightarrow \pow_\times(\Omega)$

## Week 4

### Type Relatedness

Literally translating the type relatedness derivation rules into Prolog resulted in infinite recursion, caused by the reordering of terms, and recursive nature of the derivation rules.

To solve this problem, it is possible to impose a total ordering on the object types, and use that ordering to break infinite recursion. How the ordering is established is not important, I used the lexicographical ordering of their string representations.

For T2, a literal translation looks like this:

`related(X, Y) :- related(Y, X).`

However this just leads to infinite recursion, so a total ordering was imposed on the object types:

```
% T2
related(X, Y) :-
	atom(X), atom(Y),
	atom_string(X, XS),
	atom_string(Y, YS),
	XS > YS,
	related(Y, X).
```

If we take care to define our knowledge base such that $\forall X, Y \in \OO:$ `related(X, Y).` $\rightarrow X < Y$, then we do not run into this infinite loop anymore.

With T3 we run into a similar problem with the literal translation:

```
% T3
related(X, Z) :-
	pater_familias(X, Top),
	pater_familias(Y, Top),
	related(Y, Z).
```

The total ordering solves this problem as well:

```
% T3
related(X, Z) :-
	pater_familias(X, Top),
	pater_familias(Y, Top),
	atom_string(X, XS),
	atom_string(Y, YS),
	XS < YS,
	related(Y, Z).
```

I propose to add a total ordering $<_\OO$ to all object types. It does not matter what the order is, it just needs to be transitive. We can represent $<_\OO$ as a sequence which contains all the object types.
