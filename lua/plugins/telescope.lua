-- from https://github.com/nvim-telescope/telescope.nvim/issues/2201#issuecomment-1284691502
local ts_select_dir_for_grep = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local fb = require("telescope").extensions.file_browser
  local live_grep = require("telescope.builtin").live_grep
  local current_line = action_state.get_current_line()

  fb.file_browser({
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        live_grep({
          results_title = relative .. "/",
          cwd = absolute,
          default_text = current_line,
        })
      end)

      return true
    end,
  })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
      end,
    },
    keys = {
      { "<leader><leader>", false },
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        -- "<leader><leader>",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        -- "<leader>sg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        ";sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
      -- { ";F", ":Telescope find_files cwd=", desc = "Find Files In" },
      -- {
      --   ";R",
      --   ":Telescope live_grep cwd=",
      --   desc = "Search string in specific folder",
      -- },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-n>"] = "preview_scrolling_down",
            ["<C-p>"] = "preview_scrolling_up",
          },
        },
      },
      pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
        live_grep = {
          mappings = {
            i = {
              ["<C-f>"] = ts_select_dir_for_grep,
            },
            n = {
              ["<C-f>"] = ts_select_dir_for_grep,
            },
          },
        },
      },
      -- extensions = {
      --   file_browser = {
      --     theme = "dropdown",
      --     -- disables netrw and use telescope-file-browser in its place
      --     hijack_netrw = true,
      --     mappings = {
      --       -- your custom insert mode mappings
      --       ["n"] = {
      --         -- your custom normal mode mappings
      --         ["N"] = require("telescope").extensions.file_browser.actions.create,
      --         ["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
      --         ["/"] = function()
      --           vim.cmd("startinsert")
      --         end,
      --         ["<C-u>"] = function(prompt_bufnr)
      --           for i = 1, 10 do
      --             require("telescope.actions").move_selection_previous(prompt_bufnr)
      --           end
      --         end,
      --         ["<C-d>"] = function(prompt_bufnr)
      --           for i = 1, 10 do
      --             require("telescope.actions").move_selection_next(prompt_bufnr)
      --           end
      --         end,
      --         ["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
      --         ["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
      --       },
      --     },
      --   },
      -- },
    },
  },
}
