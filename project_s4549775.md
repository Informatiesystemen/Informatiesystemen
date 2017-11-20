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
\newcommand{\LL}{\mathcal{L}}
\newcommand{\OO}{\mathcal{O}}
\newcommand{\PP}{\mathcal{P}}

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
$\Omega$ instances of $\OO$
-------- -----------------------------
: Sets \label{th:sets}

------------------------------------ ----------------------------------------------------
$Base : \PP \rightarrow \OO$         Yield the object type associated with the predicator
$Fact : \PP \rightarrow \FF$         Yield the fact type containing the predicator
                                     $Fact(p) = f \leftrightarrow p \in f$
$Pop : \OO \rightarrow \pow(\Omega)$ Yield the instances of an object type
                                     $\pow$ denotes the powerset
------------------------------------ ----------------------------------------------------
: Functions \label{th:functions}

# Application

The subject of our studies will be bol.com, which is the Netherlands leading e-commerce website. They sell an enormous amount of products in a wide range of categories, from books to pet supplies.

## Week 1

We can begin by identifying members of the sets (see \ref{th:sets}) on bol.com.

* $\EE =$ {customer, product, category, shopping cart, …}
* $\FF =$ {costs, belongs to, contains, called, …}
* $\LL =$ {name, ID, price, color, …}

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

$\FF$ = {{p_1, p_2}, {p_3, p_4}, {p_5, p_6}, {p_7, p_8}, {p_9, p_10}, {p_11, p_12}, {p_13, p_14}}

$\LL$ = {price, color}

$\PP$ = {p_1, p_2, …, p_14}

$\begin{aligned}
	Base(p_1) &= product & Base(p_2) &= name\\
	Base(p_3) &= product & Base(p_4) &= price\\
	Base(p_5) &= color & Base(p_6) &= product\\
	Base(p_7) &= product & Base(p_8) &= shopping\ cart\\
	Base(p_9) &= shopping\ cart & Base(p_{10}) &= customer\\
	Base(p_{11}) &= name & Base(p_{12}) &= customer\\
	Base(p_{13}) &= category & Base(p_{14}) &= product\\
\end{aligned}$

# Evaluation

## Week 1

At the basic level the theory is sufficient to model basic objects and their relations. A case that could not be incorporated into the model has not been encountered, yet.

If anything, our model is too permissive, as it allows one person to have multiple names, for example, which is something we would probably want to disallow. This problem will be solved in later weeks with constraints.

# Extension
