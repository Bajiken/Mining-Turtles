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

excavateXStart = 0
excavateZStart = 0

function excavateChunks(chunksDone, robotChunks, numberOfChunks, yHeight)
  excavateXStart, y, excavateZStart = gps.locate()
  chunkCount = 0
  perfectSquare = math.floor(math.sqrt(numberOfChunks))
  remainder = numberOfChunks - math.pow(perfectSquare, 2)
  chunkLines = perfectSquare
  if remainder > 0 then
    chunkLines = chunkLines + 1
  end

  for counter = chunksDone + 1, chunksDone + robotChunks
  do
    print(counter)
    print(chunkLines)
    print(excavateXStart)
    print(excavateZStart)
    refuel()

    local payloadMessage = string.format("DONE FUELING")

    modem.transmit(SERVER_PORT, CLIENT_PORT, payloadMessage)

    local chunkCoordinates = findNextChunkStart(counter - 1, chunkLines, excavateXStart, excavateZStart)

    print(chunkCoordinates[0])
    print(chunkCoordinates[1])

    moveTo(chunkCoordinates[0], yHeight, chunkCoordinates[1])
    getDirection()
    while currentDirection ~= 0 do
      turnRight()
    end
    blockAbove = true
    turnOdd = "left"
    turnEven = "right"
    y = yHeight
    excavateChunk()
  end
end

function findNextChunkStart(chunksDone, chunkLines, startX, startZ)
  local lineNumber = math.floor(chunksDone / chunkLines)
  local lineEveness = lineNumber % 2
  local linePosition = chunksDone % chunkLines
  local lineOffset = 0

  if lineEveness == 0 then
    lineOffset = linePosition
  else
    lineOffset = chunkLines - linePosition - 1
  end

  local coordinates = {}
  coordinates[0] = startX - (chunkLength * lineNumber)
  coordinates[1] = startZ - (chunkLength * lineOffset)

  return coordinates
end

function excavateChunk()
  while y < heightLimit and blockAbove do
    blockAbove = false
    excavateArea()
    moveUp()
    moveUp()
    moveUp()
    y = y + 3
    turn180()
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

function turn180()
  turnRight()
  turnRight()
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
  turn180()
  moveForward()
  turn180()
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
  local counter = 0
  while counter < chunkLength do
    while turtle.detectUp() do
      blockAbove = true
      turtle.digUp()
    end
    turtle.digDown()

    local success, table = turtle.inspectUp()
    if isNonSolidBlock(table["name"]) and table["metadata"] == 0 then
      moveUp()
      moveDown()
    end

    success, table = turtle.inspectDown()
    if isNonSolidBlock(table["name"]) and table["metadata"] == 0 then
      moveDown()
      moveUp()
    end

    if counter ~= chunkLength - 1 then
      local moveSuccess = moveForward()
      if moveSuccess then
        counter = counter + 1
      else
        turtle.attack()
      end
    else
      counter = counter + 1
    end
  end
end

function isNonSolidBlock(blockName)
  local nonSolidBlocks = {"minecraft:lava", "minecraft:water", "minecraft:flowing_water",
                          "minecraft:flowing_lava","thermalfoundation:fluid_redstone","biomesoplenty:sand"}

  for _, block in ipairs(nonSolidBlocks) do
    if block == blockName then
      return true
    end
  end
  return false
end

function split (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function refuel()
  turtle.digDown()
  turtle.select(1)
  turtle.placeDown()
  local fuelLevel = turtle.getFuelLevel()
  while fuelLevel < 20000 do
    turtle.suckDown()
    local itemName = turtle.getItemDetail(1)

    while itemName == "minecraft:bucket" do
      turtle.dropDown()
      os.sleep(2)
      turtle.suckDown()
      itemName = turtle.getItemDetail(1)
    end

    turtle.refuel()
    turtle.dropDown()
    fuelLevel = turtle.getFuelLevel()
  end
  turtle.digDown()
end

-- excavateChunk()

modem = peripheral.wrap("right")
SERVER_PORT = 0
CLIENT_PORT = 1

modem.open(CLIENT_PORT)

local payloadMessage = string.format("READY")

modem.transmit(SERVER_PORT, CLIENT_PORT, payloadMessage)

event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")

local params = split(msg, " ")

print(params[1])
print(params[2])
print(params[3])
print(params[4])

excavateChunks(tonumber(params[1]), tonumber(params[2]), tonumber(params[3]), tonumber(params[4]))
