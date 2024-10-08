local default_templates = {
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
        "type {F_NAME_NO_EXTENSION}Props = {|}",
        "export function {F_NAME_NO_EXTENSION}({|}: {F_NAME_NO_EXTENSION}Props) {|}",
      },
    },
    {
      name = "React No Props",
      template = {
        "export function {F_NAME_NO_EXTENSION}() {}",
      },
    },
    {
      name = "React Native",
      template = {
        "import { View, StyleSheet } from 'react-native'",
        "",
        "type Props = {}",
        "export function Name({}: Props) {}",
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
  astro = {
    {
      name = "Default",
      template = {
        "---",
        "---",
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
}

return {
  "doganalper/template.nvim",
  event = "VeryLazy",
  -- enable = false,
  dev = true,
  -- main = "template",
  -- config = true,
  opts = {
    mappings = {
      switch_template = "<leader>st",
    },
    excluded_file_names = {
      "copilot"
    },
    templates = default_templates,
  },
}
