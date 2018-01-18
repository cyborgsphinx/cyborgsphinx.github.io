Extensions and Syntactic Sugar in ICgrep
========================================

The language of regular expressions really has only four operators: Concatenation, Alternation, Grouping, and the Kleene Closure (the star).
If you're unfamiliar with these terms, it works as follows:

- Concatenation matches sequential regular expressions, so something like `ab` would match `a` followed by `b`.
- Alternation matches any of the given regular expressions, so `a|b` would match `a` or `b`.
- Grouping is just a way ensuring a regular expression is treated as a unit, so while `ab|c` matches `ab` and `ac`, `(ab)|c` matches `ab` or `c`.
- The Kleene Closure matches an unbounded number of repititions of a regular expression. It is equivalent to something like `epsilon` `| RE | RERE | RERERE | ...`, except that the elipsis is not part of the language.

These four operators are enough to make any regular expression, but they are somewhat cumbersome.
Tools often extend this to add in some useful or repeated concepts, like the plus operator, the question mark, or bounded repitition.
Even character classes are an extension on the language.

Since the four operators above can match any regular expression, and these extensions don't add power to the language, they could all be implemented as syntactic sugar;
that is, they could exist only in the parser and be transformed into more primitive operations for the later phases.
Another way would be to make them an extension, with recognition throughout the tool they're given to.

Let's find out what ICgrep, a grep-like tool, does with these.

In order to familiarize ourselves with the parser, we'll give it some simple regular expressions.

    $ ./icgrep -ShowREs 'ab' sample.txt > /dev/null
    Parser:
    (Seq[CC "CC_61" [97]/Unicode,CC "CC_62" [98]/Unicode])
    $ ./icgrep -ShowREs 'a|b' sample.txt > /dev/null
    Parser:
    CC "CC_61_62" [97-98]/Unicode
    $ ./icgrep -ShowREs '(ac)|b' sample.txt > /dev/null
    Parser:
    (Alt[Name "\1" =((Seq[CC "CC_61" [97]/Unicode,CC "CC_63" [99]/Unicode])),CC "CC_62" [98]/Unicode])

Already we're seeing some interesting things:

- `a|b` is converted to a character class, since it's equivalent to `[ab]`
- this means that seeing the `Alt` operator requires more complex expressions, so grouping is required to make it show up

I'll leave the Kleene Closure for later.

First, we can investigate the `?` operator, which takes the regular expression before it and matches its presence or absence - zero or one appearances.

    $ ./icgrep -ShowREs 'x?' sample.txt > /dev/null
    Parser:
    (Alt[CC "CC_78" [120]/Unicode,(Seq[])])

This seems to be converting the regular expression `x?` to its equivalent form using basic regular expression operators, `x|epsilon`.
Since `epsilon` is just the empty string, it is represented internally as an empty sequence `(Seq[])`.

Next, we'll look at the `+` operator, which is used like `a+` and is equivalent to `aa*`.
Let's see what ICgrep uses for this.

    $ ./icgrep -ShowREs 'x+' sample.txt > /dev/null
    Parser:
    Rep(CC "CC_78" [120]/Unicode,1,Unbounded)

It looks like the character `x` is being expected at least once, with no upper bound.
So the Kleene Closure is just a simple `s/1/0/`, right?

    $ ./icgrep -ShowREs 'x*' sample.txt > /dev/null
    Parser:
    (Alt[Rep(CC "CC_78" [120]/Unicode,1,Unbounded),(Seq[])])

Nope.

The closure is actually being treated as an extension on this form of repetition, which expects at least one instance of the regular expression.
So to the rest of ICgrep, `x*` is just `x+|epsilon`.

Let's see if we can change that `Unbounded` to a number, using bounded repititions.

    $ ./icgrep -ShowREs 'x{3,7}' sample.txt > /dev/null
    Parser:
    Rep(CC "CC_78" [120]/Unicode,3,7)

Looks like `Rep` does exactly what one would expect, given the values.

It looks like `x+` may be treated as syntactic sugar for `x{1,}`.
Let's try that out.

    $ ./icgrep -ShowREs 'x{1,}' sample.txt > /dev/null
    Parser:
    Rep(CC "CC_78" [120]/Unicode,1,Unbounded)
    $ ./icgrep -ShowREs 'x+' sample.txt > /dev/null
    Parser:
    Rep(CC "CC_78" [120]/Unicode,1,Unbounded)

As expected, exactly the same.
So with this, and the fact that `x{,}` is just `x*`, we can guess what `x{,}` will look like.

    $ ./icgrep -ShowREs 'x{,}' sample.txt > /dev/null 
    icgrep ERROR: Expecting integer

Looks like they expect you to just use `x*`.
That's good, it's simpler anyway.

But where are they expecting that integer?
After all, I don't want to have to write out the equivalent altenation for `x{,10}`.

    $ ./icgrep -ShowREs 'x{,10}' sample.txt > /dev/null
    Parser:
    (Alt[Rep(CC "CC_78" [120]/Unicode,1,10),(Seq[])])

Okay, that's better.
They expect AN integer, but either one is fine.

That's all the extensions on regular expressions I'm familiar with, but I'm sure that ICgrep supports more.
If you're curious about whether it's treated as syntactic sugar or a full extension, remember the `-ShowREs` flag.
