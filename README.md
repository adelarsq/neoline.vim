# neoline.vim ✅

A light statusline/tabline plugin for [Neovim](https://github.com/neovim/neovim) using [Lua](https://www.lua.org).

Using neoline.vim with [material](https://github.com/marko-cerovac/material.nvim) dart theme and [vim-emoji-icon-theme](https://github.com/adelarsq/vim-emoji-icon-theme):

<img width="782" src="https://user-images.githubusercontent.com/430272/115162411-c4500e80-a079-11eb-8315-7b1d30265e3a.png">

Using neoline.vim with [material](https://github.com/marko-cerovac/material.nvim) light theme and [vim-emoji-icon-theme](https://github.com/adelarsq/vim-emoji-icon-theme):

<img width="782" src="https://user-images.githubusercontent.com/430272/115162557-9d460c80-a07a-11eb-859d-5ab66e625f1a.png">

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
  - Icons and themes:
    - [x] [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
    - [ ] [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
  - Dev experience:
    - [x] [coc.nvim](https://github.com/neoclide/coc.nvim)
    - [x] ~~[nvim-lua/lsp-status.nvim](https://github.com/nvim-lua/lsp-status.nvim)~~
  - File tree:
    - [x] [preservim/nerdtree](https://github.com/preservim/nerdtree)
      - [x] Show cwd path **(requires Neovim 0.5)**
      - [x] Trim cwd path
    - [x] [ms-jpq/chadtree](https://github.com/ms-jpq/chadtree)
      - [ ] Show cwd path
      - [ ] Trim cwd path
  - VCS:
    - [x] [adelarsq/neovcs.vim](https://github.com/adelarsq/neovcs.vim)
    - [x] [vim-signify](https://github.com/mhinz/vim-signify)
  - Database:
    - [x] [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)
  - Start window:
    - [x] [glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
  - Plugin manager:
    - [x] [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
  - Debug:
    - [x] [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
  - Distraction free:
    - [ ] [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)
    - [ ] [kdav5758/TrueZen.nvim](https://github.com/kdav5758/TrueZen.nvim)
  - Languages:
    - [ ] [akinsho/flutter-tools.nvim](https://github.com/akinsho/flutter-tools.nvim)
- [x] LSP status support **(Requires Neovim 0.5)**
- [x] TreeSitter support **(Requires Neovim 0.5)**
- [x] Mode color for current tab
- [ ] Support one color [per tab](https://marketplace.visualstudio.com/items?itemName=orepor.color-tabs-vscode-ext)
- [ ] Line cored based on mode **(disabled until dark mode to be supported)**
- [ ] Animations? [1](https://www.reddit.com/r/neovim/comments/gu7h0i/how_would_i_go_about_writing_an_animation_for_my)
- [ ] Move all code to Lua
- [ ] Add theme support
- [ ] Custom borders
  - [x] Rounded borders
- [ ] Detect window size to show the right elements
- [ ] Better support for MS Windows
- [ ] Better support for dark themes
- [ ] Add hint about position history
- [ ] Setting per-filetype [1](https://www.reddit.com/r/neovim/comments/nbdgh9/statusline_plugin_with_perfiletype_settings/)
- [ ] Show LSP diagnostics for the whole workspace
- [x] Use normal mode hightlight on inative tabs/buffers for better UX
- [ ] Runner status [1](https://www.reddit.com/r/vimporn/comments/nv0pi7/simple_runner/)

## Others 🦕

- [bubbly.nvim](https://github.com/datwaft/bubbly.nvim)
- [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim)
- [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
- [onestatus](https://github.com/narajaon/onestatus)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [staline.nvim](https://github.com/tamton-aquib/staline.nvim)

## Acknowledgments 💡

Thanks goes to these people/projects for inspiration:

- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [haorenW1025 dotfiles](https://github.com/haorenW1025/config)
- [ahmedelgabri/statusline.vim](https://gist.github.com/ahmedelgabri/b9127dfe36ba86f4496c8c28eb65ef2b)

## License 📜

[MIT](License)

## Self-plug 🔌

If you liked this plugin, also check out:

- [vim-emoji-icon-theme](https://github.com/adelarsq/vim-emoji-icon-theme) - Emoji/Unicode Icons Theme for Vim and Neovim with support for 40+ plugins and 300+ filetypes
- [neovcs.vim](https://github.com/adelarsq/neovcs.vim) - VCS support for Neovim

