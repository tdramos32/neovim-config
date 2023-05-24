local base_dir = vim.env.LUNARVIM_BASE_DIR
    or (function()
      local init_path = debug.getinfo(1, "S").source
      return init_path:sub(2):match("(.*[/\\])"):sub(1, -2)
    end)()

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

require("lvim.bootstrap"):init(base_dir)

require("lvim.config"):load()

local plugins = require "lvim.plugins"

require("lvim.plugin-loader").load { plugins, lvim.plugins }

require("lvim.core.theme").setup()

local Log = require "lvim.core.log"
Log:debug "Starting LunarVim"

local commands = require "lvim.core.commands"
commands.load(commands.defaults)

require('telescope').setup {
  defaults = {
    -- layout_strategy = 'horizontal',
    layout_config = {
      -- height = 0.95,
      width = 0.95,
    },
  },
}


-- local lspconfig = require('lspconfig')
-- local configs = require('lspconfig/configs')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.emmet_ls.setup({
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
--     "typescriptreact", "vue", "htmldjango", "django-html" },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })

-- require 'lspconfig'.tsserver.setup {
--     on_attach = on_attach,
-- --  cmd = { "typescript-language-server", "--stdio" },
-- --  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
-- --  single_file_support = true
-- }
-- require 'lspconfig'.tailwindcss.setup {
--   --cmd = { "tailwindcss-language-server", "--stdio" },
--   --filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge",
--     --"eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex",
--     --"jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css",
--     --"less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript",
--     --"typescript", "typescriptreact", "vue", "svelte" },

-- }
