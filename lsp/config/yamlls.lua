return {
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      keyOrdering = false,
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}
