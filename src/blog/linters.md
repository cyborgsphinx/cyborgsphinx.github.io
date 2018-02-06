---
title: My First Look at Linters in Atom
...

My First Look at Linters in Atom
================================

*July 24*
---------

In short, not good.
But I'll back up.

So a while ago, I installed [Atom](https://atom.io).
I haven't used it since, but it's more immediately pretty than other text editors, so there's a draw.
It has a lot of linters available as packages.
Many of these linters aren't about writing code, but writing text.
For humans.
What a concept.
I decided to install a bunch of them to help me write text for humans.
I'm currently taking a course on that, so it seemed like a good idea.

It turns out, the linters are hilariously rudimentary.

Three linters in particular stood out: [alex](https://atom.io/packages/linter-alex), [just-say-no](https://atom.io/packages/linter-just-say-no), and [write-good](https://atom.io/packages/linter-alex).

Alex is a tool meant to "catch insensitive, inconsiderate writing" according to the [github page](https://github.com/wooorm/alex).
As an idea, I like it.
There's no need to be a dick, and it is even more important to be inclusive when the number of people who can see what you write is always growing.
This matters less here, because nobody's going to visit my little corner of the internet, but overall I support the idea behind Alex.

In practice, however, it comes off as a little much.
Looking just at the index for this blog, it tossed up a little warning: Reconsider using "Suck", it may be profane.
Really?
Suck?
The thing that vaccums do?
I know it's a part of some sex acts, but really?

It's not even consistent.
It gives me the warning in the title "Websites Suck", but not "Current Language Design Sucks".
This is despite the fact that the use in both titles is functionally equivalent.
This leads me to think that they just have a dictionary of possibly profane words, which contains "suck" but not "sucks".

Profane?
Really?

Anyway, on to the ones that actually take up space in the error box.

The Just Say No linter is meant to eliminate hedge words.
That's what it does.
Says so right on the [tin](https://atom.io/packages/linter-just-say-no).
And it really has a problem with a bunch of my titles.
Specifically, the ones that I have titled "Some Thoughts on X", where X is the topic of that post.
It doesn't like "Some".
Ironically, it points to it as a "possible hedge word".
(I'm pretty sure it's ironic that a linter designed to emilinate hedge words hedges when giving suggestions, despite knowing that it's hard to be certain whether the context requires that word or not.
I'm not an Engligh major though, so it's entirely possible that I'm wrong here.
At least I'm not saying it's like rain on your wedding day.)

It also doesn't like my use of "may" in the paragraph at the top of the page.
I have a lot less to say about that, but felt it was necessary for completion.

Both of these indicate that it is doing what I said alex was: just looking up words in a dictionary, and returning warnings on the ones present.
Not as helpful as I had hoped.

Finally, there is write good.
Write good, as the name suggests, tries to help the user write better.
It has a bunch of checks that it runs on the text - just like a real linter.
And it has problems with two titles: "Yacc isn't all that amazing", and "My thoughts on how math is taught".
Looking at it now, I probably should have titled it "Some thoughts on how math is taught", but that's beside the point.
Write-good doesn't care about consistency in lists.

What write-good doesn't like about that first title is the last word: "'amazing' is wordy or unneeded".
I disagree.
"Yacc isn't all that" feels unfinished.
I am aware that "all that" is a perfectly good phrase that means pretty much what my title does, but this isn't the 00's anymore.
I don't actually know of grown people with actual jobs seriously using "all that" to describe anything.
I am of course excluding actors, because when they use it they are playing fictional characters and I am able to make that distinction.

If anything, I think the problem in that title is actually "all that".
I added it as a hedge originally, if memory serves.
I had "Yacc isn't amazing", and felt that came off a little too strong.
So it begame "Yacc isn't all that amazing" because I couldn't just say no.
If only I had a plugin to tell me to do that...

The problem write-good has with "My thoughts on how math is taught", on the other hand, is that it's in the passive voice.
Or rather, it "may be passive voice".
That's interesting: the error that I would say is wrong is presented as an absolute, whereas the one that is correct is given a hedge.
Another thought for another day.

What I'm trying to get at is that yes, that is in the passive voice.
But I'm not going to avoid that at all costs.
It would be much harder, and come off as more clunky, to use the active voice.
Because then I need to get teachers involved, and decide if it's really teachers or curriculums at fault, and the whole thing just becomes a mess.
Much better to say that math is taught, because the post isn't about who's teaching.
It's about my thoughts on the matter.

There you have it.
That's what I have to say about the linters I installed.
I didn't even write this post in Atom; I stuck to vim.
Despite the lack of linters and general CSS prettiness, I can work with vim.
And I'm pretty sure I'm better at this than a bunch of glorified dictinaries.

They could have at least tossed in a bit of machine learning.
