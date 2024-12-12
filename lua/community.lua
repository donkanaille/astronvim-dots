-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    import = "astrocommunity.colorscheme.mellifluous-nvim",
    opts = {
       colorset = "mellifluous",
       plugins = {
        cmp = true,
        blink_cmp = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
        neo_tree = {
            enabled = true,
        },
        telescope = {
            enabled = true,
            nvchad_like = true,
        },
        startify = true,
        gitsigns = true,
        neorg = true,
        nvim_notify = true,
        aerial = true,
        neotest = true,
        lazy = true,
        mason = true,
    },
    dim_inactive = false,
    styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
        main_keywords = {},
        other_keywords = {},
        types = {},
        operators = {},
        strings = {},
        borders = true,
        functions = {},
        constants = {},
        comments = { italic = true },
        markup = {
            headings = { bold = true },
        },
        folds = {},
    },
    transparent_background = {
        enabled = false,
        lightness = function(bg) -- used for bg shades
            -- This method tries to keep brighter colorsets bright and
            -- dimmer colorsets dim and still lighten the shades up so that
            -- the colorsets have more chance to look good with transparent
            -- background on brighter wallpapers.
            local old_lightness = bg:get_hsl().l
            local threshold = 20
            local baseline = 10
            if old_lightness < threshold then
                -- We will assume that the dimmest of transparent
                -- background over users wallpaper is at least of baseline
                -- lightness. Presuming old range is [0, threshold], let's
                -- position the lightness relatively in a new range of
                -- [baseline, threshold].
                local position = old_lightness / threshold
                local new_lightness = baseline + ((threshold - baseline) * position)
                return new_lightness
            end
        end,
        floating_windows = false,
        telescope = false,
        file_tree = false,
        cursor_line = false,
        status_line = false,
    },
    flat_background = {
        line_numbers = true,
        floating_windows = true,
        file_tree = true,
        cursor_line_number = true,
    },
  },
  }, 
     {
    import = "astrocommunity.note-taking/neorg",
    opts = {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.keybinds"] = {},  -- Adds default keybindings
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Enables support for completion plugins
        ["core.journal"] = {
          config = {
            journal_folder = "./journal",
          },
        },                  -- Enables support for the journal module
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notizen = "~/OneDrive/notizen",
            },
            autochdir = true,     -- Automatically change the directory to the current workspace's root every time

            index = "index.norg", -- The name of the main (root) .norg file
            default_workspace = "notizen",
          },
        },
      },
    },
  },
}
