vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 50;
  max_kind_width = 5;
  max_menu_width = 50;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lua = true;
    spell = true;
    my_lsp = true;
    crates = true;
  };
}


local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


vim.cmd("inoremap <silent><expr> <C-Space> compe#complete()")
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")


-- Forked compe source initialization
local source_ids = {}

local compe = require'compe'
local Source = require'nv-compe.source'

vim.api.nvim_exec([[
augroup compe_nvim_lsp
autocmd InsertEnter * lua require"nv-compe".register()
augroup END
]], false)

return {
    register = function()
        -- unregister
        for _, source_id in ipairs(source_ids) do
            compe.unregister_source(source_id)
        end
        source_ids = {}

        -- register
        local filetype = vim.bo.filetype
        for _, client in pairs(vim.lsp.buf_get_clients(0)) do
            table.insert(source_ids, compe.register_source('my_lsp', Source.new(client, filetype)))
        end
    end;
}
