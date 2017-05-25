# Vimrc for the font-end development

## vimrc
This configuration is well suited for the front-end development.
And can be use both on Windows and Linux.
It includes a ton of userful plugins, color schemes and configurations.

## Before install
Pelease make sure that your vim support: python3 and lua.
You can test by run these command.
`
    echo has('python3')
    echo has('lua')
`

## How to install on Windows
Download the \_vimrc and put it in the directory `%USERPROFILE%\vimfiles`.
Open Gvim and run the command `:PlugInstall`

## How to install on Linux
Download the \_vimrc and rename it to .vimrc.
Then put it in the directory `$HOME/.vim`.
Open vim and run the command `:PlugInstall`

## FAQ

Q: vimproc cannot compile on windows?
A: You can download it from [Shougo/vimproc.vim](https://github.com/Shougo/vimproc.vim/releases),
and put it in C:\Users\Administrator\vimfiles\plugged\vimproc.vim\lib
