return {
  "echasnovski/mini.animate",
  name = "Animations",
  event = "VeryLazy",
  
  config = function()
    local animate = require("mini.animate")
    animate.setup({
      cursor = {
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      },
      scroll = {
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },
      resize = {
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      },
      open = {
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },
      close = {
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      },
    })
  end,
}