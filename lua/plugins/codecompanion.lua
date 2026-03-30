local prefix = "<Leader>m"

---@type LazySpec
return {
  {
    "olimorris/codecompanion.nvim",
    event = "User AstroFile",
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        acp = {
          codex = function()
            return require("codecompanion.adapters").extend("codex", {
              defaults = {
                auth_method = "chatgpt",
              },
            })
          end,
        },
      },
      mcp = {
        opts = {
          acp_enabled = false,
        },
      },
      interactions = {
        chat = {
          adapter = "codex",
          variables = {},
          roles = {
            llm = function(adapter) return "Merlin (" .. adapter.formatted_name .. ")" end,
            user = "Me",
          },
        },
        cli = {
          agent = "codex",
          agents = {
            codex = {
              cmd = "codex",
              args = {},
              description = "OpenAI Codex CLI",
            },
          },
        },
      },
      display = {
        action_palette = {
          opts = {
            title = "Spellbook",
          },
        },
        chat = {
          window = {
            width = 0.35,
          },
          intro_message = "Welcome, wanderer ✨ Press ? if you dare",
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts) require("modules.merlin").add_statusline_component(opts) end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        commands = {
          merlin_add_file = function(state) require("modules.merlin").add_node_to_chat(state.tree:get_node()) end,
        },
        window = {
          mappings = {
            ["oa"] = "merlin_add_file",
          },
        },
      },
    },
  },
  { "AstroNvim/astroui", opts = { icons = { Merlin = "󱙺" } } },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      if not opts.mappings then opts.mappings = {} end
      opts.mappings.n = opts.mappings.n or {}
      opts.mappings.v = opts.mappings.v or {}
      opts.mappings.n[prefix] = { desc = require("astroui").get_icon("Merlin", 1, true) .. "Merlin" }
      opts.mappings.v[prefix] = { desc = require("astroui").get_icon("Merlin", 1, true) .. "Merlin" }
      opts.mappings.n[prefix .. "m"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle chat" }
      opts.mappings.v[prefix .. "m"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle chat" }
      opts.mappings.n[prefix .. "s"] = { "<cmd>CodeCompanionActions<cr>", desc = "Open spellbook" }
      opts.mappings.v[prefix .. "s"] = { "<cmd>CodeCompanionActions<cr>", desc = "Open spellbook" }
      opts.mappings.n[prefix .. "q"] = { "<cmd>CodeCompanion<cr>", desc = "Open inline assistant" }
      opts.mappings.v[prefix .. "q"] = { "<cmd>CodeCompanion<cr>", desc = "Open inline assistant" }
      opts.mappings.v[prefix .. "a"] = { "<cmd>CodeCompanionChat Add<cr>", desc = "Add selection to chat" }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = function(_, opts)
      if not opts.file_types then opts.file_types = { "markdown" } end
      opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "codecompanion" })
    end,
  },
}
