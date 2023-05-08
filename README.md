# vim-zeioth-config
The best vimconfig you are gonna find out there. Most likely.

## DEMO (video)
[Here](https://www.youtube.com/watch?v=JJqClkIQMOo) I explain every plugin of this VIM distro:

## How to install
Clone the project and run

     ./install_vimrc.sh 


## Plugins included
```
"    -> yankStack              - Cycle through the things you've copied.
"    -> fzf.vim                - Find in project.
"    -> far.vim                - Find and replace in project.
"    -> zen mode               - VIM no distraction mode
"    -> vim-table-mode         - Markdown tables that grow or decrease as you write.

"    -> ctrl-p                 - Allow VIM to display interactive menus (used py vim-ctrlpobsession)
"    -> vim-prosession         - VIM session management
"    -> vim-ctrlpobsession     - VIM session management (keybinding)
"    -> vim-fugitive           - Git integration for VIM
"    -> git-gutter             - Same thing vim-fugitive has, but nicer
"    -> ultisnippets           - Vim snippets
"    -> gutentags-plus         - Vim TAG file automated generation
"    -> markdown-preview       - Markdown preview
"    -> neural                 - AI integration for vim
"    -> vim-autosave           - auto-save the file periodically

"    -> vim-coc                - linter/intellisense/beautifier
"    -> vimspector             - debugger
"    -> vim-dispatch           - compile/run
"    -> vim-test               - unit testing/e2e
"    -> vim-doxygen            - project documentation (C/C#/Java/Python...)
"    -> vim-typedoc            - project documentation (typescript)

"    -> lightline              - status line for vim.
"    -> vim-whichkey           - show keybindings on screen.
```

## Other plugins included
* vim-comments: Press gcc to convert your current relection into code comments.
* vim-surround: keybindings to add/remove "", '', (), [], {}
* vim-startify: Show the last files an projects you've been working on when VIM opens.
* Theme: Tokyo night (enabled by default)
* Theme: Monokai

## FAQ
* This config uses colemak-dh! But I use qwerty/other!: Go to ./myconfings.vim and comment/delete the part where the colemak-dh is defined. Everything colemak-dh related is defined in this file. But it is always a good idea to take a look into ./vimrcs/plugins_config.vim and chance the keybindings to your personal taste.
