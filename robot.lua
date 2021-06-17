-- Issues
-- Sand, gravel falling on top of the robot
-- Sand, gravel falling down into the hole
-- Robot gets blocked by something/mob
-- Robot destroys other robot
-- Robots do not go to bedrock roof in the nether

-- Robot destroys other robot with getting direction
-- Robot running out of fuel - lower the fuel threshold
-- Check that robots dont use all coal for refuel

-- Survival
-- Use coal for fuel
-- Return to original spot

-- Nether height is 126 for max


-- Notes
-- z cordinate increases, we are going south
-- z cordinate decreases, we are going north
-- x cordinate increases, we are going east
-- x cordinate decreases, we are going west

chunkLength = 16
heightLimit = 256
minimumFuelLevel = 10

-- slate, marble, andesite

x, y, z = gps.locate()

turnOdd = "left"
turnEven = "right"

blockAbove = true
nether = true
lava = true
stash = false

-- directions = {}
-- directions[0] = "north"
-- directions[1] = "east"
-- directions[2] = "south"
-- directions[3] = "west"

currentDirection = 0

excavateXStart = 0
excavateZStart = 0
excavateYStart = 0

manageInventory = true

function Set (list)
  local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end

DROPPED_ITEMS = Set{
        "minecraft:stone",
        "minecraft:dirt",
        "minecraft:cobblestone",
        "minecraft:sand",
        "minecraft:gravel",
        "minecraft:redstone",
        "minecraft:flint",
        "minecraft:sandstone",
        "chisel:basalt2",
        "railcraft:ore_metal",
        "extrautils2:ingredients",
        "minecraft:dye",
        "thaumcraft:nugget",
        "thaumcraft:crystal_essence",
        "thermalfoundation:material",
        "projectred-core:resource_item",
        "thaumcraft:ore_cinnabar",
        "deepresonance:resonating_ore",
        "forestry:apatite",
        "chisel:marble2",
        "rustic:slate",
        "biomesoplenty:gem",
        "chisel:limestone2",
        "thaumcraft:amber",
        "railcraft:ore_metal_poor",
        "minecraft:clay_ball"
}

function dropItems()
  local keptItems = 0
  for slot = 1, 16 do
    local item = turtle.getItemDetail(slot)
    if item ~= nil then
      if DROPPED_ITEMS[item["name"]] then
        turtle.select(slot)
        turtle.dropDown()
      else
        keptItems = keptItems + 1
      end
    end
  end

  if stash and keptItems > 9 then
    turtle.select(2)
    turtle.placeDown()
    for counter = 3, 16 do
      turtle.select(counter)
      turtle.dropDown()
    end
    turtle.select(2)
    turtle.digDown()
  end
  turtle.select(1)
end

function stashInventory()
  turtle.select(2)
  turtle.placeDown()
  for slot = 3, 16 do
    turtle.select(slot)
    turtle.dropDown()
  end
  turtle.select(2)
  turtle.digDown()
end

function excavateChunks(chunksDone, robotChunks, numberOfChunks, startHeight, stopHeight)
  excavateXStart, excavateYStart, excavateZStart = getGpsCoordinates()
  y = excavateYStart
  excavateZStart = excavateZStart - 1
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
    checkFuel()

    local payloadMessage = string.format("DONE FUELING")

    modem.transmit(SERVER_PORT, CLIENT_PORT, payloadMessage)

    local chunkCoordinates = findNextChunkStart(counter - 1, chunkLines, excavateXStart, excavateZStart)

    print(chunkCoordinates[0])
    print(chunkCoordinates[1])

    moveTo(chunkCoordinates[0], startHeight, chunkCoordinates[1])
    getDirection()
    while currentDirection ~= 0 do
      turnRight()
    end
    blockAbove = true
    turnOdd = "left"
    turnEven = "right"
    y = startHeight
    excavateChunk(stopHeight)
  end

  if manageInventory then
    stashInventory()
  end

  moveToY(excavateXStart, excavateYStart, excavateZStart)
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

function excavateChunk(stopHeight)
  while y < stopHeight and (blockAbove or nether) do
    blockAbove = false
    excavateArea()
    local counter = 0
    while counter < 3 do
      local moveSuccess = moveUpGuaranteed()
      if moveSuccess then
        counter = counter + 1
      end
    end
    _, y, _ = getGpsCoordinates()
    turn180()
    if chunkLength % 2 == 0 then
      local temp = turnOdd
      turnOdd = turnEven
      turnEven = temp
    end
  end
end

function getDirection()
  local initialX, initialY, initialZ = getGpsCoordinates()
  moveSuccess = moveForward()
  while not moveSuccess do
    moveSuccess = moveForward()
  end
  x, y, z = getGpsCoordinates()

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
  x, y, z = getGpsCoordinates()
  moveX(x, endX)
  moveZ(z, endZ)
  moveY(y, endY)
end

function moveToY(endX, endY, endZ)
  x, y, z = getGpsCoordinates()
  moveY(y, endY)
  moveX(x, endX)
  moveZ(z, endZ)
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
      safeForward()
      initialX = initialX - 1
    end
 -- east
  else
    while currentDirection ~= 1 do
      turnRight()
    end
    while initialX < endX do
      safeForward()
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
      safeDown()
      initialY = initialY - 1
    end
 -- up
  else
    while initialY < endY do
      safeUp()
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
      safeForward()
      initialZ = initialZ - 1
    end
 -- south
  else
    while currentDirection ~= 2 do
      turnRight()
    end
    while initialZ < endZ do
      safeForward()
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

function safeForward()
  local _, table = turtle.inspect()
  local counter = 0
  while table["name"] == "computercraft:turtle_expanded" do
    os.sleep(30)
    counter = counter + 1
    if counter > 2 then
      print("Blocked by another turtle. Shutting down.")
      dropItems()
      os.shutdown()
    end
    _, table = turtle.inspect()
  end
  moveForwardGuaranteed()
end

function safeUp()
  local _, table = turtle.inspectUp()
  local counter = 0
  while table["name"] == "computercraft:turtle_expanded" do
    os.sleep(30)
    counter = counter + 1
    if counter > 2 then
      print("Blocked by another turtle. Shutting down.")
      dropItems()
      os.shutdown()
    end
    _, table = turtle.inspectUp()
  end
  moveUpGuaranteed()
end

function safeDown()
  local _, table = turtle.inspectDown()
  local counter = 0
  while table["name"] == "computercraft:turtle_expanded" do
    os.sleep(30)
    counter = counter + 1
    if counter > 2 then
      print("Blocked by another turtle. Shutting down.")
      dropItems()
      os.shutdown()
    end
    _, table = turtle.inspectDown()
  end
  moveDownGuaranteed()
end

function moveForward()
  while turtle.detect() do
    turtle.dig()
  end
  checkFuel()
  return turtle.forward()
end

function moveForwardGuaranteed()
  local moveSuccess = moveForward()
  while not moveSuccess do
    turtle.attack()
    moveSuccess = moveForward()
  end
  return moveSuccess
end

function moveDownGuaranteed()
  local moveSuccess = moveDown()
  while not moveSuccess do
    turtle.attackDown()
    moveSuccess = moveDown()
  end
  return moveSuccess
end

function moveUpGuaranteed()
  local moveSuccess = moveUp()
  while not moveSuccess do
    turtle.attackUp()
    moveSuccess = moveUp()
  end
  return moveSuccess
end

function moveBackward()
  turn180()
  moveForward()
  checkFuel()
  turn180()
end

function moveUp()
  while turtle.detectUp() do
    turtle.digUp()
  end
  checkFuel()
  return turtle.up()
end

function moveDown()
  while turtle.detectDown() do
    turtle.digDown()
  end
  checkFuel()
  return turtle.down()
end

function getGpsCoordinates()
  local x, y, z = gps.locate()
  while x == nil or y == nil or z == nil do
    x, y, z = gps.locate()
  end
  return x, y, z
end

function checkFuel()
  local fuelLevel = turtle.getFuelLevel()
  if fuelLevel < minimumFuelLevel then
    if lava then
       refuel()
    else
      coalRefuel()
    end
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
        moveForwardGuaranteed()
        turn(turnOdd)
      else
        turn(turnEven)
        moveForwardGuaranteed()
        turn(turnEven)
      end
    end
  end
end

function excavateLine()
  local counter = 0
  while counter < chunkLength do
    local _, table = turtle.inspectUp()
    while table["name"] ~= "minecraft:bedrock" and turtle.detectUp() do
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
  if manageInventory then
    stashInventory()
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
  turtle.digUp()
  turtle.select(1)
  turtle.placeUp()
  local _, table = turtle.inspectUp()
  while table["name"] ~= "enderstorage:ender_storage" do
    turtle.digUp()
    turtle.attackUp()
    turtle.placeUp()
    _, table = turtle.inspectUp()
  end
  local fuelLevel = turtle.getFuelLevel()
  while fuelLevel < 2000 do
    turtle.suckUp()
    local itemDetails = turtle.getItemDetail(1)

    while itemDetails == nil or itemDetails["name"] == "minecraft:bucket" do
      turtle.dropUp()
      os.sleep(2)
      turtle.suckUp()
      itemDetails = turtle.getItemDetail(1)
    end

    turtle.refuel()
    turtle.dropUp()
    fuelLevel = turtle.getFuelLevel()
  end
  turtle.digUp()
end

function coalRefuel()
  local fuelLevel = turtle.getFuelLevel()

  while fuelLevel < minimumFuelLevel do
    local slot = 1
    while slot < 17 do
      local item = turtle.getItemDetail(slot)
      if item ~= nil and item["name"] == "minecraft:coal" then
        turtle.select(slot)
        turtle.refuel()
        break
      end

      if slot == 16 then
        print("No coal to use for fuel. Shutting down.")
        os.shutdown()
      end
      slot = slot + 1
    end
    fuelLevel = turtle.getFuelLevel()
  end

  turtle.refuel()
end

-- excavateChunk()

modem = peripheral.wrap("left")
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

if params[6] ~= nil then
  chunkLength = tonumber(params[6])
end

excavateChunks(tonumber(params[1]), tonumber(params[2]), tonumber(params[3]), tonumber(params[4]), tonumber(params[5]))
