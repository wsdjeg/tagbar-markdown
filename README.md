# tagbar markdown extension

<!-- vim-markdown-toc GFM -->

- [Intro](#intro)
- [Screenshot](#screenshot)
- [Install](#install)

<!-- vim-markdown-toc -->

### Intro

tagbar-markdown is a tagbar extension for markdown.

### Screenshot

![2017-02-01_1359x723](https://cloud.githubusercontent.com/assets/13142418/22514376/12f8a792-e8da-11e6-9897-fb0136732a31.png)

### Install

- [vim-plug]

```viml
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'
```

- Use [dein.vim] to lazy load plugin, and check the requirements.

```viml
call dein#add('majutsushi/tagbar', {'on_cmd' : 'TagbarToggle'})
call dein#add('lvht/tagbar-markdown', {'on_ft' : 'markdown', 'if' : executable('php')})
```

Please make sure php, python or lua is in your `$PATH`.

Enjoy :)

[vim-plug]: https://github.com/junegunn/vim-plug
[dein.vim]: https://github.com/Shougo/dein.vim
