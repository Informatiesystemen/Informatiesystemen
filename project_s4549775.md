---
title: Information Systems Project
author: Hendrik Werner s4549775
date: \today
fontsize: 12pt
geometry: margin=5em
header-includes:
	- \usepackage[mathscr]{euscript}
---

\newcommand{\EE}{\mathcal{E}}
\newcommand{\FF}{\mathcal{F}}
\newcommand{\GG}{\mathcal{G}}
\newcommand{\LL}{\mathcal{L}}
\newcommand{\OO}{\mathcal{O}}
\newcommand{\PP}{\mathcal{P}}
\renewcommand{\SS}{\mathcal{S}}

\newcommand{\pow}{\mathscr{P}}

# Introduction

In this document we want to apply, evaluate, and try to improve the information model theory. The improvement will be done by extending the theory. We do this with the goal of finding the limits of the current model, by way of applying it to a real world case. It will be evaluated what works well, and what does not, and finally improvements will be proposed.

## Theory overview

-------- -----------------------------
$\PP$    predicators / roles
$\OO$    object types
$\LL$    label types
         $\LL \subseteq \OO$
$\EE$    entity types
         $\mathcal{E} \subseteq \OO$
$\FF$    fact types
         $\FF \subseteq \OO$
         $\FF$ is a partition of $\PP$
$\GG$    group types / power types
         $\GG \in \OO$
$\SS$    sequence types
         $\SS \in \OO$
$\Omega$ instances of $\OO$
-------- -----------------------------
: Sets \label{th:sets}

------------------------------------ ---------------------------------------------------------------
$Base : \PP \rightarrow \OO$         Yield the object type associated with the predicator
$Elt : \GG \cup \SS \rightarrow \OO$ Yield the element type associated with a group or sequence type
$Fact : \PP \rightarrow \FF$         Yield the fact type containing the predicator
                                     $Fact(p) = f \leftrightarrow p \in f$
$Pop : \OO \rightarrow \pow(\Omega)$ Yield the instances of an object type
                                     $\pow$ denotes the powerset
------------------------------------ ---------------------------------------------------------------
: Functions \label{th:functions}

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

# Extension

## Week 2

### Group types

If we wanted to keep using functions like this

$\begin{aligned}
	t_1(\epsilon_{PG}^p) &= craftsman\ pack & t_1(\epsilon_{PG}^e) &= \{hammer, nails\}\\
\end{aligned}$

we would need to change the type from $t : \epsilon \rightarrow \Omega$ to $t : \epsilon \rightarrow \pow(\Omega)$. $Pop$ is the only function that interacts with $t_i$s (in its codomain), so we need to take a look at that.

In chapter 2.2.3 of the dictate containing the theory the universe of instances is formally defined. This definition includes mappings. Functions are just specialized mapping, so the type of $Pop$ holds.

I think the universe of instances can be more easily defined line this: $\sigma \in \Omega \leftrightarrow \exists \phi \in \OO: \sigma \in Pop(\phi)$. That is a pretty broad definition, but it should be correct, and has the advantage that we do not need to worry about it anymore. By definition, if an element of a set returned by $Pop$, it is an element of $\Omega$.

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
