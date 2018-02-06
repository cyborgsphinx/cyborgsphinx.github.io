---
title: Why I Don't Think Programming Languages Should Read Like English
...

Why I Don't Think Programming Languages Should Read Like English
================================================================

*12 June 2016*
--------------

Anybody successfully reading this must understand English.
I say this because it is written in English.
A common idea in programming language design that I've started hearing more of recently is having the language read like English.
I think this is a bad idea.
I think it is a bad idea for one primary reason: I think English is a bad language.

English is hard to learn.
Ask anyone for whom it is a second language.
Unless the world has changed, English is ranked as one of the hardest languages to learn known to humans.
This is because, at least in part, English is arbitrary.
It has no governing body, it was not designed.
English has become what it is today through an evolutionary process of constant change.
Even today, English is changing.
Many people don't like how it is changing, but it is changing nonetheless.
And these changes are made by groups of people coming together and deciding that they will communicate a little differently.
This is happening now mostly with the text-based form, focused on punctuation, but it is happening.
So trying to emulate English is going to be hard, because English is arbitrary and chaotic.

But even if we used another language as the target, I don't think it would help.
Some of the things that come out of this may be useful, like using a parameter name in a function call to represent what the parameter is, but that's not because it's more like English.
A very similar effect can be achived simply with descriptive variable names and no magic numbers.
As an example, one might make a function `join()` which takes three strings and joins the first two with the second inbetween.
To keep things straight, proponents of programming languages being like English would suggest it look something like `join("foo", to: "bar", with: ",");` which would produce `"foo,bar"`.
I would put forth that this kind of code, where it is clear what each part does just by looking, is already available:

	first = "foo";
	second = "bar";
	separator = ",";
	join(first, second, separator);

So it doesn't really get us anywhere to suggest the first, in my opinion.

Yes, that was a contrived example.
But the idea of what I'm getting at is still clear.

Another thing that comes out of having code read like English is having many ways to do one thing, which is its own incredibly contentious subject in and of itself.
But this is my blog, so I'll spout my opinions on it anyway.
There exists in Ruby the keyword `unless`, which as far as I can tell is exactly the same as `if not`.
It takes up the same number of keystrokes, it isn't any more clear, and it adds to the number of keywords in the language.
As far as I'm concerned, it doesn't help make the language any better.
So I question its existence in a world where both `if` and `not` are things that can easily be used, and can also apply in other areas.
There's also the `<statement> if <expression>` construct, which is functionally equivalent to `if <expression> then <statement> end`, and not much easier to unerstand.
Especially since you have to mentally change the context of `<statement>` after having already read it.
It's a way to hide what's actually going on, but it reads more like English so it's somehow a benefit.

It's likely that this is only going to grow in popularity as time goes on, but that doesn't mean I should just give up and like it.
There's always C.
