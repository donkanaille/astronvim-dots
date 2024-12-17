-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.filetype.add({
  filename = { ["todo.txt"] = "todotxt" },
})


--vim.filetype.add {
--  extension = {
--    foo = "fooscript",
--  },
--  filename = {
--    ["Foofile"] = "fooscript",
--  },
--  pattern = {
--    ["~/%.config/foo/.*"] = "fooscript",
--  },
--}

-- Autocommands

-- vim.api.nvim_create_autocmd("BufEnter", {
--  pattern = { "todo.txt" },
  -- Options for neomutt files
--  command = [[set filetype=todotxt]],
-- })

