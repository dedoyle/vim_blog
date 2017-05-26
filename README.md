# Vimrc for the font-end development

## vimrc

This configuration is well suited for the front-end development.
And can be used on Windows and Linux.
It includes a ton of useful plugins, color schemes and configurations.


## Install on Windows

### Install Prerequisites

[git](https://git-scm.com/download): For downloading and updating plugins

[lua](http://luabinaries.sourceforge.net/download.html): For Vimfiler

[python(2/3)](https://www.python.org/downloads): Support job and part of plugins. Recommend to install both

[gvim](https://github.com/vim/vim-win32-installer/releases): Vim's main program

[DejaVu Sans Mono for PowerLine](https://github.com/wsdjeg/DotFiles/blob/master/fonts/DejaVu%20Sans%20Mono%20for%20Powerline.ttf): For airline

[vimproc\_win64(32).dll](https://github.com/Shougo/vimproc.vim/releases): vimporc needs this, NECESSARY


### Check prerequisites
1. git --version

The correct result:
> git version 2.12.2.windows.2

2. lua53 -v
The correct result:
> Lua 5.3.3 Copyright (C) 1994-2016 Lua.org, PUC-Rio

3. python -V
The correct result:
> Python 3.6.0

4. Gvim
The correct result:
> Opened a program

### Start to install

Download the \_vimrc and put it in the directory `%USERPROFILE%\vimfiles`.
Open Gvim and run the command `:PlugInstall`


## Install on Linux

### Install Prerequisites

git: For downloading and updating plugins

lua: For Vimfiler

python2/3: Support job and part of plugins. Recommend to install both

vim/gvim: Vim's program

[DejaVu Sans Mono for PowerLine](https://github.com/wsdjeg/DotFiles/blob/master/fonts/DejaVu%20Sans%20Mono%20for%20Powerline.ttf): For airline

### Check prerequisites
1. git --version

The correct result:
> git version 2.12.2

2. lua -v
The correct result:
> Lua 5.3.3 Copyright (C) 1994-2016 Lua.org, PUC-Rio

3. python -V
The correct result:
> Python 3.6.0

4. vim
The correct result:
> You can see vim in your terminal

### Start to install

Download the \_vimrc and rename it to .vimrc.
Then put it in the directory `$HOME/.vim`.
Open vim and run the command `:PlugInstall`


## FAQ

Q: vimproc cannot compile on windows?

A: You can download it from [Shougo/vimproc.vim](https://github.com/Shougo/vimproc.vim/releases),
and put it in C:\Users\Administrator\vimfiles\plugged\vimproc.vim\lib

Q: How to check whether my vim has '+lua and +python' feature on windows?

A: Firstly, use :version to check out. Normally you'll see `+lua/dyn, +python/dyn and +python3/dyn`

Secondly, check whether your Lua and python2/3 really works by two command:
`echo has('lua'), echo has('python3')` and `echo has('python2')`

- Lua returns: 1
- Python3 returns: 1
- Python returns: 1

**Notice: `echo has('python2') and echo has('python3')`, only one of them returns 1 instead of returning 0 at the same time.This depends on vim.**

Q: How to check whether my vim has `+lua and +python` feature on Linux?

A: Firstly, use vim --version | grep -E 'lua|python' to check out

Secondly, check whether you Lua and python2/3 really works by two command:
`echo has('lua'), echo has('python3')` and `echo has('python2')`

- Lua returns: 1
- Python3 returns: 1
- Python returns: 1

**Notice: `echo has('python2') and echo has('python3')`, both of them could return 1 instead of returning 0**
