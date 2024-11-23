---@type LazySpec
return {
  "akinsho/flutter-tools.nvim",
  opts = {
    flutter_lookup_cmd = "asdf where flutter",
    widget_guides = {
      enabled = true,
    },
    lsp = {
      color = {
        enabled = true,
        virtual_text = true,
        virtual_text_str = "■",
      },
    },
  },
}
