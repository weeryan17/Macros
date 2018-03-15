lmc_assign_keyboard('MACROS');

lmc_set_handler('MACROS',function(button, direction)
  if (direction == 1) then return end
  file = io.open("C:/Users/thewe/Documents/macros/button.txt", "w")
  io.output(file)
  io.write(button)
  io.close(file)
  lmc_send_keys('{F24}')
end)
