return {
  'xixiaofinland/sf.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
  },

  config = function()
    require('sf').setup({
            fetch_org_list_at_nvim_start = true
        })  -- Important to call setup() to initialize the plugin!
  end
}