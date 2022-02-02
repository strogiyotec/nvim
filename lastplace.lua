local lastplace = require 'nvim-lastplace'
local config = {
  lastplace_ignore_buftype  = {"quickfix","nofile","help"},
  lastplace_ignore_filetype = {"gitcommit","gitrebase","svn","hgcommit"},
  lastplace_open_folds = true
}
lastplace.setup(config)
