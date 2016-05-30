Thoughts On Exception Hnadling
==============================

*30 May 2016*
-------------

When I first came across expetions and the things that surround them, I wasn't a fan.
To be fair, that was because it was new and, like most other people, I didn't like new things.
I've since had time to think about how exception handling works and why it might exist, and I still don't like it.

As far as I can tell, exception handling exists because how errors are handled in C is not great.
No way to tell which functions might fail, have to include a header to get any real information out of it, stuff like that.
It's really not a great way to go about handling errors.

Since the type system wasn't incredibly powerful back then, the idea came around that functions could throw exceptions, like the computer itself does.
So all you need to do is wrap your function in a `try` block, toss in a `catch` block corresponding to the error that can be thrown, and you're good to go.
Put your error handling code in the `catch`, anything that needs to go with the fallible function in the `try`, and move on.
No importing another header.
No checking a global variable that can potentially be modified in another thread.
Sounds pretty good.

Except how large should the `try` block be?
Should you put your entire function in one large block, and catch all the errors in succeeding `catch`es?
Or should you put as little as possible in a single `try`, and only `catch` the errors from that block?
I'm in favour of the second, personally.

I'm in favour of it because it is closer to the method I prefer, which is for errors to be imbedded in the return of the function, like in Go and Rust.
Go supports multiple returns, allowing for returning an error value along side the value expected, and the programmer is supposed to handle it themselves.
Rust has entire types dedicated to possible failures, made possible by algrbraic data types, which again must be handled before the value can be used.
This method makes it clear which functions can fail, which helps future readers of the code.
I believe that code should be for the reader, with the compiler taking care of optimizations wherever possible.

In light of this, I don't mind exception handling when done in the second way for the same reason; code is for the reader, and having `try` wrapping as little as possible gives more information to the reader.
However, I do believe that exception handling is a red flag.
It is an indication that the programming language is not built in such a way that error handling can be done gracefully by simply returning a value.
