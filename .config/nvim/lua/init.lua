-- -- -- -- -- -- -- -- --
-- REQUIRES NVIM >=v0.5 --
-- -- -- -- -- -- -- -- --

local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- Setup packer
vim.cmd [[packadd packer.nvim]]

-- Plugins
require('packer').startup(function()
    -- Let packer manage itself
    use 'wbthomason/packer.nvim'

    use {
        'w0rp/ale',
        ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        }
    }

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'andymass/vim-matchup', event = 'VimEnter' }
    use 'rstacruz/vim-closer'
    use 'neovim/nvim-lspconfig'
    use 'junegunn/limelight.vim'
    use 'hrsh7th/nvim-compe'
    use 'morhetz/gruvbox'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'heavenshell/vim-pydocstring'
    use 'majutsushi/tagbar'
    use 'tpope/vim-fugitive'
    use 'preservim/nerdcommenter'
    use 'bronson/vim-trailing-whitespace'
    use 'godlygeek/tabular'
end)

-- Auto compile when there are changes in init.lua
vim.cmd 'autocmd BufWritePost init.lua PackerCompile'

-- Language server
require('lspconfig').pyright.setup{}
require('lspconfig').sourcekit.setup{}

-- General options
vim.opt.wrap = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.filetype = 'off'
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.background = 'dark'
vim.g.mapleader = ' '
vim.g.limelight_conceal_ctermfg = 'gray'

-- Pydocstring
vim.g.pydocstring_doq_path = '/usr/local/bin/doq'
vim.g.pydocstring_formatter = 'google'

-- Airline
vim.g.airline_theme = 'gruvbox'
vim.g.airline_powerline_fonts = 1
vim.g.airline_mode_map = {
    __ = '-',
    n = 'N',
    i = 'I',
    R = 'R',
    c = 'C',
    v = 'V',
    V = 'V',
    s = 'S',
    S = 'S'
}

-- Styling
vim.cmd 'colorscheme gruvbox'
vim.cmd 'au VimEnter * highlight Comment cterm=italic'

-- Keymappings
vim.api.nvim_set_keymap('n', '<c-k>', ':Limelight!!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<esc>', ':noh<CR><esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-g>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-b>', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-i>', ':Telescope help_tags<CR>', { noremap = true, silent = true })

-- Autocompletion
vim.o.completeopt = 'menuone,noselect'
require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '', '', '', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = true;
        ultisnips = true;
        luasnip = true;
    };
}
