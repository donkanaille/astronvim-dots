--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
	[[ _______             ____   ____.__         ]],
	[[ \      \   ____  ___\   \ /   /|__| _____  ]],
	[[ /   |   \_/ __ \/  _ \   Y   / |  |/     \ ]],
	[[/    |    \  ___(  <_> )     /  |  |  Y Y  \]],
	[[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
	[[        \/     \/                        \/ ]],      }
      return opts
    end,
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts) -- override the options using lazy.nvim
      local get_icon = require("astroui").get_icon
      
      opts.section.buttons.val = {

        opts.button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
        opts.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
        opts.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
        opts.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
        opts.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
        opts.button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
        opts.button("w", "  Notizen", "<CMD>:cd /mnt/daten/OneDrive/notizen<CR>:edit /mnt/daten/OneDrive/notizen/index.norg<CR>"),
        opts.button("q", "󰅚  Quit", "<CMD>quit<CR>"),
      }

    opts.config.layout = {
      { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      opts.section.header,
      { type = "padding", val = 2 },
      opts.section.buttons,
      { type = "padding", val = 3 },
      opts.section.footer,
    }

    opts.section.buttons.opts.spacing = 0
    opts.section.header.opts.hl = "Error"
    opts.section.footer.opts.hl = "Comment"
--    opts.button.opts.hl_shortcut = "Keyword"
--    opts.button.opts.hl=""

    end,
  },

  -- You can disable/enable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
          -- don't add a pair if the next character is %
              :with_pair(cond.not_after_regex "%%")
          -- don't add a pair if  the previous character is xxx
              :with_pair(
                cond.not_before_regex("xxx", 3)
              )
          -- don't move right when repeat character
              :with_move(cond.none())
          -- don't delete if the next character is xx
              :with_del(cond.not_after_regex "xx")
          -- disable adding a newline when you press <cr>
              :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
