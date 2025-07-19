return {
  "doganalper/template.nvim",
  event = "VeryLazy",
  enabled = false,
  -- dev = true,
  -- main = "template",
  -- config = true,
  opts = {
    mappings = {
      switch_template = "<leader>st",
    },
    templates = {
      typescriptreact = {
        {
          name = "1 - React",
          template = {
            "interface I{F_NAME_NO_EXTENSION}Props {|}",
            "export function {F_NAME_NO_EXTENSION}({|}: I{F_NAME_NO_EXTENSION}Props) {|}",
          },
        },
        {
          name = "2 - React No Props",
          template = {
            "export function {F_NAME_NO_EXTENSION}() {|}",
          },
        },
        {
          name = "3 - Test",
          template = {
            "import { render, screen } from '@testing-library/react';",
            "import userEvent from '@testing-library/user-event';",
            "",
            "describe('{F_NAME_NO_EXTENSION}', () => {",
            "  test('|', () => {|});",
            "});"
          }
        }
      },
      javascriptreact = {
        {
          name = "Default",
          template = {
            "export default function Name({}) {}",
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
  },
}
