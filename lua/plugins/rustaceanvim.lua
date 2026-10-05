return {
  'mrcjkb/rustaceanvim',
  -- To avoid being surprised by breaking changes,
  -- I recommend you set a version range
  version = '^9',
  -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
  -- No need for lazy.nvim to lazy-load it.
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer"

    vim.g.rustaceanvim = {
      server = {
        -- Prefer the rust-analyzer installed/managed by mason.nvim, falling
        -- back to a system install if mason hasn't installed it yet.
        cmd = function()
          if vim.fn.executable(mason_bin) == 1 then
            return { mason_bin }
          end
          return { "rust-analyzer" }
        end,
        default_settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
            },
            checkOnSave = true,
          },
        },
      },
    }

    -- Kick off the mason install in the background, after the registry has
    -- had a chance to load. mason-registry.get_package() throws if called
    -- before its sources are populated, so this must not run synchronously
    -- during plugin setup.
    vim.schedule(function()
      local ok, mason_registry = pcall(require, "mason-registry")
      if not ok then
        return
      end
      mason_registry.refresh(function()
        local pkg_ok, pkg = pcall(mason_registry.get_package, "rust-analyzer")
        if pkg_ok and not pkg:is_installed() then
          pkg:install()
        end
      end)
    end)
  end,
}
