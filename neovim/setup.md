# Installing NeoVim on Windows

You can install Neovim from [here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## Initialize and Setup

I will be using this [video](https://www.youtube.com/watch?v=w7i4amO_zaE) to setup my computer. The GitHub repo is [repo](https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/packer.lua)

Some of the learnings are as below:

- Create a new folder named **nvim** inside the directory C:\Users\\${username}\AppData\Local

```mkdir nvim```

- Go to **nvim** folder. We are going into current directory from our file system to vim.

```vim .```

> To create a new file, press **%** and to create new directory, press **d**

- Create a file named ```init.lua``` that is the entry point to the vim. It is similar to index.html

- Create a directory named ```lua```. Any directory within the **lua** directory is requirable by **lua**.

> If we want to go to explorer from the normal/edit mode, we can type ```:Ex```

- We can do the **Remap** of the Keys. For example, we do not want to type ```:Ex``` everytime to go the explorer. While in normal mode ("n"), if I press \<leader> pv , it will execute the vim command ```:Ex``` . The leader is nothing but a "space bar" on keyboard.

```vim
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv, vim.cmd.Ex)
```

> If we want to source a file, we can use the command `%so`

## Plugin Managers and fuzzy finders

- **Packer:**  Go to the [link](https://github.com/wbthomason/packer.nvim#quickstart) to get the packer plugin.

- Run ```PackerSync``` to install the packer plugin

- **Fuzzy finders** Go to the [link](https://github.com/nvim-telescope/telescope.nvim) to install Fizzy finder **Telescope**

> We can press `=ap` to format the line

- **Color Schema** Go to the [link](https://github.com/rose-pine/neovim) to install Rose Pine color
