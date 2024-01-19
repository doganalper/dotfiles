return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local colors = require("catppuccin.palettes").get_palette()
    require("nvim-web-devicons").setup({
      override = {
        default_icon = {
          icon = "󰈙",
          color = colors.text,
          name = "Default",
        },
        log = {
          icon = "󰺮",
          color = colors.yellow,
          name = "Log",
        },
        html = {
          icon = "",
          color = colors.peach,
          name = "Html",
        },
        css = {
          icon = "",
          color = colors.blue,
          name = "Css",
        },
        scss = {
          icon = "",
          color = colors.pink,
          name = "Scss",
        },
        sass = {
          icon = "",
          color = colors.pink,
          name = "Sass",
        },
        js = {
          icon = "󰌞",
          color = colors.yellow,
          name = "Javascript",
        },
        mjs = {
          icon = "󰌞",
          color = colors.yellow,
          name = "Mjs",
        },
        cjs = {
          icon = "󰌞",
          color = colors.yellow,
          name = "Cjs",
        },
        json = {
          icon = "",
          color = colors.yellow,
          name = "Json",
        },
        ts = {
          icon = "",
          color = colors.blue,
          name = "Typescript",
        },
        ["d.ts"] = {
          icon = "",
          color = colors.text,
          name = "TypescriptDefinition",
        },
        kt = {
          icon = "󱈙",
          color = colors.red,
          name = "Kt",
        },
        png = {
          icon = "",
          color = colors.mauve,
          name = "Png",
        },
        webp = {
          icon = "",
          color = colors.mauve,
          name = "Webp",
        },
        jpg = {
          icon = "",
          color = colors.mauve,
          name = "Jpg",
        },
        jpeg = {
          icon = "",
          color = colors.mauve,
          name = "Jpeg",
        },
        svg = {
          icon = "",
          color = colors.mauve,
          name = "Svg",
        },
        mp3 = {
          icon = "󰎆",
          color = colors.mauve,
          name = "Mp3",
        },
        mp4 = {
          icon = "",
          color = colors.mauve,
          name = "Mp4",
        },
        out = {
          icon = "",
          color = colors.blue,
          name = "Out",
        },
        py = {
          icon = "",
          color = colors.yellow,
          name = "Py",
        },
        toml = {
          icon = "",
          color = colors.blue,
          name = "Toml",
        },
        lock = {
          icon = "",
          color = colors.red,
          name = "Lock",
        },
        zip = {
          icon = "",
          color = colors.yellow,
          name = "Zip",
        },
        lua = {
          icon = "",
          color = colors.blue,
          name = "Lua",
        },
        txt = {
          icon = "󰈙",
          color = colors.blue,
          name = "Txt",
        },
        markdown = {
          icon = "",
          color = colors.mauve,
          name = "Markdown",
        },
        md = {
          icon = "",
          color = colors.blue,
          name = "Md",
        },
        mdx = {
          icon = "",
          color = colors.blue,
          name = "Mdx",
        },
        graphql = {
          icon = "",
          color = colors.pink,
          name = "Graphql",
        },
        env = {
          icon = "",
          color = colors.yellow,
          name = "Dotenv",
        },
        prisma = {
          icon = "",
          color = colors.text,
          name = "Prisma",
        },
        ejs = {
          icon = "",
          color = colors.peach,
          name = "Ejs",
        },
        jsx = {
          icon = "",
          color = colors.sky,
          name = "Jsx",
        },
        tsx = {
          icon = "",
          color = colors.blue,
          name = "Tsx",
        },
        rs = {
          icon = "",
          color = colors.peach,
          name = "Rust",
        },
        xml = {
          icon = "",
          color = colors.peach,
          name = "Xml",
        },
        yml = {
          icon = "",
          color = colors.mauve,
          name = "Yml",
        },
        yaml = {
          icon = "",
          color = colors.mauve,
          name = "Yml",
        },
        ["test.js"] = {
          icon = "",
          color = colors.yellow,
          name = "Javascripttest",
        },
        ["test.jsx"] = {
          icon = "",
          color = colors.sky,
          name = "Reactrest",
        },
        ["test.ts"] = {
          icon = "",
          color = colors.blue,
          name = "Typescripttest",
        },
        ["test.tsx"] = {
          icon = "",
          color = colors.blue,
          name = "Reacttypescripttest",
        },
        ["spec.js"] = {
          icon = "",
          color = colors.yellow,
          name = "Javascriptspectest",
        },
        ["spec.jsx"] = {
          icon = "",
          color = colors.sky,
          name = "Reactspectest",
        },
        ["spec.ts"] = {
          icon = "",
          color = colors.blue,
          name = "Typescriptspec",
        },
        ["spec.tsx"] = {
          icon = "",
          color = colors.blue,
          name = "Reacttypescriptspectest",
        },
        astro = {
          icon = "",
          color = colors.peach,
          name = "Astro",
        },
        zsh = {
          icon = "",
          color = colors.peach,
          name = "Zsh",
        },
        bash = {
          icon = "",
          color = colors.text,
          name = "Bash",
        },
      },
      override_by_filename = {
        [".bashrc"] = {
          icon = "",
          color = colors.text,
          name = "Bashrc",
        },
        [".tmux.conf"] = {
          icon = "",
          color = colors.mauve,
          name = "Tmuxconf",
        },
        [".stylua"] = {
          icon = "",
          color = colors.teal,
          name = "Stylua",
        },
        [".zshrc"] = {
          icon = "",
          color = colors.peach,
          name = "Zshrc",
        },
        ["package.json"] = {
          icon = "",
          color = colors.green,
          name = "PackageJson",
        },
        ["package-lock.json"] = {
          icon = "",
          color = colors.red,
          name = "PackageLockJson",
        },
        [".gitignore"] = {
          icon = "",
          color = colors.overlay0,
          name = "Gitignore",
        },
        ["Dockerfile"] = {
          icon = "󰡨",
          color = colors.blue,
          name = "Dockerfile",
        },
        [".eslintrc.js"] = {
          icon = "",
          color = colors.mauve,
          name = "EslintrcJs",
        },
        [".eslintrc.cjs"] = {
          icon = "",
          color = colors.mauve,
          name = "EslintrcCjs",
        },
        [".eslintrc.json"] = {
          icon = "",
          color = colors.mauve,
          name = "EslintrcJson",
        },
        [".eslintrc.yml"] = {
          icon = "",
          color = colors.mauve,
          name = "EslintrcYml",
        },
        [".eslintignore"] = {
          icon = "",
          color = colors.overlay0,
          name = "EslintIgnore",
        },
        [".travis.yml"] = {
          icon = "",
          color = colors.red,
          name = "Travis",
        },
        [".babelrc"] = {
          icon = "",
          color = colors.yellow,
          name = "Babelrc",
        },
        ["babel.config.js"] = {
          icon = "",
          color = colors.yellow,
          name = "Babelconfig",
        },
        ["tsconfig.build.json"] = {
          icon = "",
          color = colors.blue,
          name = "TSConfigJson",
        },
        ["tsconfig.node.json"] = {
          icon = "",
          color = colors.blue,
          name = "TSConfigJson",
        },
        ["tsconfig.json"] = {
          icon = "",
          color = colors.blue,
          name = "TSConfigJson",
        },
        ["vite.config.js"] = {
          icon = "󰉁",
          color = colors.yellow,
          name = "Viteconfigjs",
        },
        ["vite.config.ts"] = {
          icon = "󰉁",
          color = colors.blue,
          name = "Viteconfigts",
        },
        [".editorconfig"] = {
          icon = "",
          color = colors.sky,
          name = "Editorconfig",
        },
        ["LICENSE"] = {
          icon = "",
          color = colors.yellow,
          name = "License",
        },
        ["docker-compose.yml"] = {
          icon = "󰡨",
          color = colors.blue,
          name = "Dockercompose",
        },
        [".dockerignore"] = {
          icon = "󰡨",
          color = colors.overlay0,
          name = "Dockerignore",
        },
        [".prettierignore"] = {
          icon = "󰬗",
          color = colors.overlay0,
          name = "Prettierignore",
        },
        [".prettierrc"] = {
          icon = "󰬗",
          color = colors.teal,
          name = "PrettierConfig",
        },
        [".prettierrc.yaml"] = {
          icon = "󰬗",
          color = colors.teal,
          name = "PrettierConfig",
        },
        [".prettierrc.yml"] = {
          icon = "󰬗",
          color = colors.teal,
          name = "PrettierConfig",
        },
        [".prettierrc.json"] = {
          icon = "󰬗",
          color = colors.teal,
          name = "PrettierConfig",
        },
        [".prettierrc.js"] = {
          icon = "󰬗",
          color = colors.teal,
          name = "PrettierConfig",
        },
        ["prettier.config.js"] = {
          icon = "󰬗",
          color = colors.teal,
          name = "PrettierConfig",
        },
        [".prettier.yaml"] = {
          icon = "󰬗",
          color = colors.teal,
          name = "PrettierConfig",
        },
        [".env.production"] = {
          icon = "",
          color = colors.yellow,
          name = "Envprod",
        },
        [".env.development"] = {
          icon = "",
          color = colors.yellow,
          name = "Envdev",
        },
        [".env.testing"] = {
          icon = "",
          color = colors.yellow,
          name = "Envtest",
        },
        [".env.example"] = {
          icon = "",
          color = colors.yellow,
          name = "Dotenvexample",
        },
        [".env"] = {
          icon = "",
          color = colors.yellow,
          name = "Dotenv",
        },
      },
      default = true,
    })
  end,
}
