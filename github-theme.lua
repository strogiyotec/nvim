-- Example config in Lua
require("github-theme").setup({
  transparent = true,
  themeStyle = "dark",
  functionStyle = "italic",
  darkFloat = true,

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})
