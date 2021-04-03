chunkLength = 16

function excavateChunk()
  local x, y, z = gps.locate()
  goToStartLocation(y)
  excavateArea()
end

function goToStartLocation(y)
  while y > 3 do
    if turtle.detectDown() then
      turtle.digDown()
    end

    turtle.down()
    y = y - 1
  end
end

function excavateArea()
  for counter = 1, chunkLength
  do
    excavateLine()

    if counter ~= chunkLength then
      if counter % 2 == 1 then
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
      else
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
      end
    end
  end
end

function excavateLine()
  for counter = 1, chunkLength
  do
    turtle.digUp()
    turtle.digDown()

    if counter ~= chunkLength then
      turtle.dig()
      turtle.forward()
    end
  end
end

excavateChunk()
