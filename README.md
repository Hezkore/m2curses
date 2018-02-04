# m2curses.git
A [curses](http://www.tldp.org/HOWTO/html_single/NCURSES-Programming-HOWTO/) library wrapper for Monkey2 that supports Windows and Linux.

macOS support will eventually be added.

On Windows [PDCurses](https://github.com/wmcbrine/PDCurses) is used.

On Linux [Ncurses](https://en.wikipedia.org/wiki/Ncurses) is used.

![](https://github.com/Hezkore/m2curses/blob/master/tests/demo.png)


## Instructions
* On Linux you will need to install 'ncurses-dev' (sudo apt install ncurses-dev)
* Download or Git Clone to your Monkey2 ‘Modules’ folder
* Recompile module
* Compile tests inside the ‘tests’ folder
* Run tests via your ‘products’ folder and not via Ted2Go