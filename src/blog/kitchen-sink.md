---
title: The Kitchen Sink Approach is Bad Design
...

The Kitchen Sink Approach is Bad Design
=======================================

*22 June 2016*
--------------

When designing a programming language, it is tempting to put in everything that is thought to be useful.
This approach is bad.
It doesn't help make your language more usable.
It doesn't help your users solve more problems.
It just creates a lot of technical debt right off the bat.

When I started to learn Ruby, I used for loops to iterate across arrays.
This is because the `for` loop is the idiomatic way to iterate through linear collections (lists, arrays, vectors, etc.) in languages that have them.
After a while, I learned that this is not the case in Ruby.

There are two ways (at least) to do pretty much the same thing in Ruby: the `for` loop, and the `each` method.
The main difference, as was told to me, is that the `each` method creates a scope separate from the enclosing scope, in which you don't have access to the outer scope.
This means that if you have a variable inside the `each` method's block that has the same name as one outside, the two are separate variables.
This is not the case in a `for` loop.

Because there are two ways to do the same thing, I needed guidance.
The community said to use the `each` method, citing mainly what I said above.
This is a terrible reason.
In fact, using the same reason, I assert that using a `for` loop should be preferred.

There are two cases to consider: when the difference in scope makes no difference, and when it matters.
When it makes no difference, programmers who have used any other language that is at all similar will reach for the `for` loop.
It's what they're used to.
It's universal.
It's idiomatic.
The `each` method is only really in Ruby, and will only cause confusion when someone new comes along.
When it matters, you shouldn't code yourself into a trap of shadowing a variable unless that's what you meant.
If you don't want things inside your loop to affect things outside your loop, don't give them the same name.
Again, this will help those who are coming to your language from another one.
Other languages don't have the seemingly arbitrary scoping rules that allow you to give two different variables the same name and have them not interact.
So introducing it makes your language harder to learn without really offering benefits.

If I didn't want my variable to affect the one outside its scope, I would have named it something else.
