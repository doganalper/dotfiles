local is_dev = false

local template_config = {
  "doganalper/template.nvim",
  event = "VeryLazy",
  config = function()
    require("template").setup({
      mappings = {
        switch_template = "<leader>st",
      },
      templates = {
        vue = {
          {
            name = "Vue 2 JS",
            template = {
              "<template>",
              "<div>",
              "</div>",
              "<template>",
              "",
              "<script>",
              "export default {}",
              "</script>",
            },
          },
          {
            name = "Vue 2 Ts",
            template = {
              "<template>",
              "<div>",
              "</div>",
              "</template>",
              "",
              '<script lang="ts">',
              "import Vue from 'vue';",
              "export default Vue.extend({})",
              "</script>",
            },
          },
          {
            name = "Vue 3",
            template = {
              '<script lang="ts" setup></script>',
              "",
              "<template></template>",
            },
          },
        },
        typescriptreact = {
          {
            name = "React",
            template = {
              "type Props = {}",
              "function Name({}: Props) {}",
              "",
              "export default Name",
            },
          },
          {
            name = "React Native",
            template = {
              "import { View, StyleSheet } from 'react-native'",
              "",
              "type Props = {}",
              "function Name({}: Props) {}",
              "",
              "export default Name",
              "",
              "const styles = StyleSheet.create({})",
            },
          },
        },
        javascriptreact = {
          {
            name = "Default",
            template = {
              "function Name({}) {}",
              "",
              "export default Name",
            },
          },
        },
        markdown = {
          {
            name = "Default",
            template = {
              "---",
              "---",
            },
          },
        },
        lua = {
          {
            name = "Module",
            template = {
              "local M = {};",
              "",
              "return M",
            },
          },
          {
            name = "Empty",
            template = {},
          },
        },
      },
    })
  end,
}

if is_dev then
  template_config = {
    dev = true,
    dir = "~/Desktop/projects/template-plugin",
    config = function() end,
  }
end

return template_config
