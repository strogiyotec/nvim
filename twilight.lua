 require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dimming = {
    alpha = 0.5, -- amount of dimming
    -- we try to get the foreground from the highlight groups or fallback color
    color = { "Normal", "#ffffff" },
  },
  }
