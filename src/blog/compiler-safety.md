---
title: Compilers Are Only as Safe as Their Code Generation
...

Compilers Are Only as Safe as Their Code Generation
===================================================

*2 Aug 2016*
------------

A compiler takes text of one kind and outputs text of another kind that is functionally equivalent.
Generally, this is done to produce machine code in order to make an executable.
Sometimes, it is translating from one programming language to another.
In both of these scenarios, the safety guarantees of the program often go out the window once the compiler has done its job.

It's harder to see this with the machine code version, simply because we don't see the machine code.
Such compilers sometimes add other checks directly into the machine code as well, so it's not as obvious that it's not really safer than writing it all yourself.
But it becomes a lot more clear in the second scenario, speifically with compilers to JavaScript.

Many compilers exist which emit JavaScript.
This is because many people don't want to write JavaScript.
TypeScript, for example, is essentially a superset of JavaScript made to give static type checking to JavaScript.
But that all goes away when you compile a TypeScript program into JavaScript.
Specifically, if the TypeScript code generation emits code that isn't well thought out, the result is not actually an improvement over what you could write yourself.

CoffeeScript, another compiler to JavaScript, used to have this problem.
I can't say for sure whether or not it still does, but it used to emit code that the programmer had to fix afterward.
This not only defeats the whole purpose of the compiler, but also hurts the overall safety of the code.
Because the fix wasn't run through some sort of checker, it has significantly fewer restrictions on what it can do, which may lead to a great deal of oddities.

Once again, I don't have anything truly profound to say about this.
I just think it's important enough to deserve a few words.
