local gpsRobot = {}

function gpsRobot.getGpsCoordinates()
  local x, y, z = gps.locate()
  while x == nil or y == nil or z == nil do
    x, y, z = gps.locate()
  end
  return x, y, z
end

return gpsRobot
