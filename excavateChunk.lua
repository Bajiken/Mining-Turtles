-- Issues
-- Sand, gravel falling on top of the robot
-- Sand, gravel falling down into the hole

-- Notes
-- z cordinate increases, we are going south
-- z cordinate decreases, we are going north
-- x cordinate increases, we are going east
-- x cordinate decreases, we are going west

chunkLength = 16
heightLimit = 256

x, y, z = gps.locate()

turnOdd = "left"
turnEven = "right"

blockAbove = true

-- directions = {}
-- directions[0] = "north"
-- directions[1] = "east"
-- directions[2] = "south"
-- directions[3] = "west"

currentDirection = 0

function excavateChunks(numberOfChunks)
  excavateChunk()
end

function excavateChunk()
  goToNewStart()
  while y < heightLimit and blockAbove do
    blockAbove = false
    excavateArea()
    moveUp()
    moveUp()
    moveUp()
    y = y + 3
    turtle.turnRight()
    turtle.turnRight()
    local temp = turnOdd
    turnOdd = turnEven
    turnEven = temp
  end
end

function getDirection()
  local initialX, initialY, initialZ = gps.locate()
  moveSuccess = moveForward()
  while not moveSuccess do
    moveSuccess = moveForward()
  end
  x, y, z = gps.locate()

  if initialZ > z then
    currentDirection = 0
  end
  if initialZ < z then
    currentDirection = 2
  end
  if initialX > x then
    currentDirection = 3
  end
  if initialX < x then
    currentDirection = 1
  end
  moveBackward()
end

function moveTo(endX, endY, endZ)
  x, y, z = gps.locate()
  moveX(x, endX)
  moveZ(z, endZ)
  moveY(y, endY)
end

function moveX(initialX, endX)
  if initialX == endX then
    return
  end

  getDirection()
  -- west
  if initialX > endX then
    while currentDirection ~= 3 do
      turnRight()
    end
    while initialX > endX do
      moveForward()
      initialX = initialX - 1
    end
 -- east
  else
    while currentDirection ~= 1 do
      turnRight()
    end
    while initialX < endX do
      moveForward()
      initialX = initialX + 1
    end
  end
end

function moveY(initialY, endY)
  if initialY == endY then
    return
  end

  -- down
  if initialY > endY then
    while initialY > endY do
      moveDown()
      initialY = initialY - 1
    end
 -- up
  else
    while initialY < endY do
      moveForward()
      initialY = initialY + 1
    end
  end
end

function moveZ(initialZ,  endZ)
  if initialZ == endZ then
    return
  end

  getDirection()
  -- north
  if initialZ > endZ then
    while currentDirection ~= 0 do
      turnRight()
    end
    while initialZ > endZ do
      moveForward()
      initialZ = initialZ - 1
    end
 -- south
  else
    while currentDirection ~= 2 do
      turnRight()
    end
    while initialZ < endZ do
      moveForward()
      initialZ = initialZ + 1
    end
  end
end

function turnRight()
  turtle.turnRight()
  currentDirection = (currentDirection + 1) % 4
end

function moveForward()
  local initialX, initialY, initialZ = gps.locate()

  while turtle.detect() do
    turtle.dig()
  end
  turtle.forward()

  x, y, z = gps.locate()

  if x == initialX and z == initialZ then
    return false
  else
    return true
  end
end

function moveBackward()
  turtle.turnRight()
  turtle.turnRight()
  moveForward()
  turtle.turnRight()
  turtle.turnRight()
end

function moveUp()
  while turtle.detectUp() do
    turtle.digUp()
  end
  turtle.up()
end

function moveDown()
  local initialX, initialY, initialZ = gps.locate()

  while turtle.detectDown() do
    turtle.digDown()
  end
  turtle.down()

  x, y, z = gps.locate()

  if y == initialY then
    return false
  else
    return true
  end
end

function turn(direction)
  if direction == "left" then
    turtle.turnLeft()
  else
    turtle.turnRight()
  end
end

function goToStartLocation()
  while y > 3 do
    if turtle.detectDown() then
      turtle.digDown()
    end

    turtle.down()
    y = y - 1
  end
end

function goToNewStart()
  x, y, z = gps.locate()
  moveTo(x - chunkLength, 3, z - chunkLength)
  x, y, z = gps.locate()
  getDirection()
  while currentDirection ~= 0 do
    turnRight()
  end
end

function excavateArea()
  for counter = 1, chunkLength
  do
    excavateLine()

    if counter ~= chunkLength then
      if counter % 2 == 1 then
        turn(turnOdd)
        moveForward()
        turn(turnOdd)
      else
        turn(turnEven)
        moveForward()
        turn(turnEven)
      end
    end
  end
end

function excavateLine()
  local counter = 1
  while counter < chunkLength do
    while turtle.detectUp() do
      blockAbove = true
      turtle.digUp()
    end
    turtle.digDown()

    local success, table = turtle.inspectUp()
    if (table["name"] == "minecraft:lava" or table["name"] == "minecraft:water" or table["name"] == "minecraft:flowing_water" or table["name"] == "minecraft:flowing_lava" or table["name"] == "thermalfoundation:fluid_redstone" or table["name"] == "biomesoplenty:sand") and table["metadata"] == 0 then
      moveUp()
      moveDown()
    end

    success, table = turtle.inspectDown()
    if (table["name"] == "minecraft:lava" or table["name"] == "minecraft:water" or table["name"] == "minecraft:flowing_water" or table["name"] == "minecraft:flowing_lava" or table["name"] == "thermalfoundation:fluid_redstone" or table["name"] == "biomesoplenty:sand") and table["metadata"] == 0 then
      moveDown()
      moveUp()
    end

    if counter ~= chunkLength then
      local moveSuccess = moveForward()
      if moveSuccess then
        counter = counter + 1
      else
        turtle.attack()
      end
    end
  end

  while turtle.detectUp() do
    blockAbove = true
    turtle.digUp()
  end
  turtle.digDown()
end

excavateChunk()
