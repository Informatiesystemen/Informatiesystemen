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
* $\FF =$ {costs, belongs to, contains, …}
* $\LL =$ {name, ID, price, color, …}

Next we start identifying their relationships.

* Products
	* belong to categories
	* have a color
	* have an ID
	* have a name
	* cost a price
	* …
* Shopping carts
	* contain products
	* belong to a customer
	* …
* …

# Evaluation

# Extension
