---
title: Pass By Reference and Pass By Value
...

Pass By Reference and Pass By Value
===================================

*26 June 2016*
--------------

Some modern languages like to talk about pass by reference and pass by value.
They'll say that a struct is pass by value, and a class is pass by reference.
D and Swift have this distinction, and probably others as well.

This irked me greatly for a while.
There should be some other way to determine whether or not something will be passed by reference or by value.
It shouldn't be baked into the type itself.
C++ and Rust manage this, so clearly it's manageable.

But I think I understand what the people writing these words are trying to say.
See, pass by reference all the time can be a bad idea; if you return a reference to a function's local variable, it'll point to garbage memory at best and something mission-critical at worst.
So while saying these things are passed by reference or by value is correct, I don't think that's what they really mean.
I think they mean that there is a distinction between stack-allocated and heap-allocated objects.

A stack-allocated object is an object that lives in a stack frame.
It makes sense that this would be pass by value, because of the problem I described above.
It also mimics primitive types, which are always passed by value because copying them is cheap.
So when someone says pass by value, what they really mean is stack-allocated.

This also works for heap-allocated objects.
When you allocate an object on the heap, you can only ever really give a reference to it.
You could dereference the pointer and copy the values into a stack-allocated object and pass that by value, but it's a lot simpler - and quicker - to just pass the pointer.
So pass by reference really means heap-allocated.

It makes sense, then, that these languages would avoid using the terms that make sense to someone like me.
People like me pay attention to things like the heap and stack frames and whatnot.
These things were meant to be abstracted away in higher level languages.
One such abstraction, meant to remove thoughts of the heap, is garbage collection.
And garbage collection is something all the languages that talk about pass by reference and pass by value seem to have in common.

So now I'm less angry about languages using both `struct` and `class` to make objects.
It turns out the distinction might actually matter.
