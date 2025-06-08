-- or modify lualine when inactive to show file name on the right 
return{
  'b0o/incline.nvim',
  config = function()
    require('incline').setup()
  end,
  -- Optional: Lazy load Incline
  event = 'VeryLazy',
}
