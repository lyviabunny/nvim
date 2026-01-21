local rebuild_thyme = false -- TODO: change to false

vim.api.nvim_create_autocmd(
  "PackChanged",
  {
    callback = function(ev)
      local name = ev.data.spec.name

      if name == "nvim-thyme" or name == "nvim-laurel" then
        rebuild_thyme = true
      end
    end,

    group = vim.api.nvim_create_augroup("init.lua", { clear = true }),
  }
)

vim.pack.add({
  "https://github.com/aileot/nvim-thyme",
  "https://git.sr.ht/~technomancy/fennel",
  "https://github.com/aileot/nvim-laurel",
  "https://github.com/BirdeeHub/lze",
}, { confirm = false })

table.insert(
  package.loaders,
  function(...)
    return require("thyme").loader(...)
  end
)

local thyme_cache_prefix = vim.fn.stdpath("cache") .. "/thyme/compiled"
vim.opt.rtp:prepend(thyme_cache_prefix)

require("thyme").setup()

if rebuild_thyme then
  vim.cmd("ThymeCacheClear")
end

function _G.check_back_space()
  local col = vim.fn.col('.') - 1

  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

require("config")
