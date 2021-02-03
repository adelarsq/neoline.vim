# neoline.vim ✅

A light statusline/tabline plugin for [Neovim](https://github.com/neovim/neovim) using [Lua](https://www.lua.org).

Using neoline.vim with [ayu-vim](https://github.com/ayu-theme/ayu-vim) light theme and [vim-emoji-icon-theme](https://github.com/adelarsq/vim-emoji-icon-theme):

<img width="782" src="https://user-images.githubusercontent.com/430272/105769010-f13dcb00-5f3b-11eb-8a46-2dc633ee9d66.png">

## Installation 🧙

### [Plug](https://github.com/junegunn/vim-plug)

Add the following lines on the Vim/NeoVim config file:

```vim
Plug 'https://github.com/adelarsq/neoline.vim'
```

Then open the editor and install with `PlugInstall`.

### [Dein](https://github.com/Shougo/dein.vim)

Add the following lines on the Vim/NeoVim config file:

```vim
call dein#add('adelarsq/neoline.vim')
```

Then open the editor and install with `call dein#install()`.

## Features/Todos ⚙️

- Support for plugins
  - [x] [vim-signify](https://github.com/mhinz/vim-signify)
  - [x] [coc.nvim](https://github.com/neoclide/coc.nvim)
  - [x] [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
  - [x] ~~[nvim-lua/lsp-status.nvim](https://github.com/nvim-lua/lsp-status.nvim)~~
  - [x] [preservim/nerdtree](https://github.com/preservim/nerdtree)
    - [x] Show cwd path **(requires Neovim 0.5)**
    - [ ] Trim cwd path
  - [x] [ms-jpq/chadtree](https://github.com/ms-jpq/chadtree)
    - [ ] Show cwd path
    - [ ] Trim cwd path
  - [x] [adelarsq/neovcs.vim](https://github.com/adelarsq/neovcs.vim)
  - [x] [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)
  - [x] [glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
  - [x] [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
  - [ ] [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)
- [x] LSP status support **(Requires Neovim 0.5)**
- [x] TreeSitter support **(Requires Neovim 0.5)**
- [x] Mode color for current tab
- [ ] Support one color [per tab](https://marketplace.visualstudio.com/items?itemName=orepor.color-tabs-vscode-ext)
- [x] Line cored based on mode
- [ ] Animations? [1](https://www.reddit.com/r/neovim/comments/gu7h0i/how_would_i_go_about_writing_an_animation_for_my)
- [ ] Move all code to Lua
- [ ] Add theme support
- [x] Rounded borders
- [ ] Detect window size to show the right elements

## Others 🦕

- [bubbly.nvim](https://github.com/datwaft/bubbly.nvim)
- [fancystatus](https://github.com/Wafelack/fancystatus)
- [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
- [onestatus](https://github.com/narajaon/onestatus)
- [vim-airline](https://github.com/vim-airline/vim-airline)

## Acknowledgments 💡

Thanks goes to these people/projects for inspiration:

- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [haorenW1025 dotfiles](https://github.com/haorenW1025/config)
- [ahmedelgabri/statusline.vim](https://gist.github.com/ahmedelgabri/b9127dfe36ba86f4496c8c28eb65ef2b)

## License 📜

[MIT](License)

