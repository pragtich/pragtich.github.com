---
layout: post
title: "Setting PATH for Emacs when launched from Dock"
category: "Computer stuff"
tags: [Emacs OSX PATH]
indeximage: EmacsAutomator.jpg
comment_id: EmacsPath
summary: "How to get Emacs' PATH setup properly so that python-mode will work"
---

# Setting PATH for applications started from the Dock in OS X 10.10 Yosemite

I recently switched from Fink to Homebrew, the most up-to-date packaging system for Mac OS X. With that, I also decided to install the Emacs 24.1 directly from Homebrew instead of from one of the OS X-specific compiled versions available. This works fine:

    brew install emacs --cocoa


However, there is a problem: when an application is run from the Dock, it has only a very minimal environment, and it definitely does not get a PATH from any of the shell configuration files. Without this PATH, all kinds of things do not work. The first thing I noticed, was that python-mode was finding Mac OS's builtin Python instead of my updated version.

## Solution

We need a trick to start the program (Emacs in this case) from the shell, instead of straight from the Dock. This way, the shell will start with the limited environment, but will load its own profile files, thus delivering the standard PATH and other settings. The solution [was given here](https://korewanetadesu.com/emacs-on-os-x.html) [and here](https://superuser.com/questions/828716/how-to-create-a-mac-app-launcher-for-emacs-via-homebrew).

Cocretely, I have attached an Automator script to the Dock, that starts Emacs for me. The drawback is, that even if you give it the same icon, the running instance of Emacs will get a separate icon on the dock. I have not yet found a solution for this, and am experiencing the same on Windows 7. Not a problem.

The Automator code:

    echo '/Applications/Emacs.app/Contents/MacOS/Emacs "$@"' | bash --login -s &> /dev/null &

The `&> /dev/null &` part makes sure that the Automator task does not hang around waiting for the Emacs instance to exit or close its pipes. 
