---
title: How I Built This Site
...

How I Built This Site
=====================

*13 May 2016*
-------------

So last time I talked about how annoyed I am about working with websites.
But I made this, clearly, so I must have found a way to deal with things.
That's what this post is about.

So first of all, I don't have many needs in relation to the HTML beyond text, so I use Markdown to write the text you see.
But I do need a few things at the head at foot of each page, which I have templates to insert into each page as needed.
These are really simple templates, just with a link to the CSS I use for the site and the links at the top and bottom of the pages.

It turns out that if you use relative paths for links, they work when online but not as local files.
It is entirely possible to look at each page individually, and only test that links are correct when the site is put online, but I'm lazy and would prefer to just click links to check each page.
So I needed to use relative paths so I could verify locally and on the web.

Keeping all this straight is a little rough at times, so I wrote a build script to make everything work.
But the site kept growing, and I needed to make sure the script got called on every file.
But then it kept growing, and I didn't want to run the script on every file each time I updated one.

Enter Make.
I wrote a makefile from scratch for the first time for this site, and it was an adventure.
Make's syntax is fairly strange if you don't understand where it comes from, and at this point in time that describes a lot of people, myself included.
So I'm probably not taking advantage of the features I should in order to make my life easier, but it works well enough at the moment.
After a while, however, the same could not be said about my build script.

The script was originally made in Bash, with some modifications over time to build everything at once, then back to one at a time when Make was introduced.
But this didn't do quite what I wanted, which for a tinkerer means it needs to go.
I needed more logic than I could get with my knowledge of Bash, and even if I managed it wasn't going to be pretty.

Rewriting the whole thing in Python was easier than I thought it would be at first.
I was a little nervous at first, as there were a few external commands that I needed to run and it's a lot simpler to do those with bash, but making them work in Python wasn't too much work.
Overall, the change was positive because it allowed me to specify what I wanted more easily.
The addition of types beyond strings didn't hurt either.

So that's how this site is built, as well as a bit of history as to why.
Overall, making a usable website isn't the worst thing with the right tools.
