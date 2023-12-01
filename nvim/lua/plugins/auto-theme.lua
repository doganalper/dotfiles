require("helpers");

return {
  "f-person/auto-dark-mode.nvim",
  enabled = false,
  opts = {
    update_interval = 15000, -- bu belki ram kullanımını arttırabilir çünkü sürekli çalışan bir interval var
    set_dark_mode = function()
      SetBackground("dark")
    end,
    set_light_mode = function()
      SetBackground("dark")
    end,
  },
}
