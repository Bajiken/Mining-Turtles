manageInventory = true
lava = true

function excavateArmy(numberOfChunks, startHeight, stopHeight, numberOfRobots, chunkLength)
  local remainder = numberOfChunks % numberOfRobots
  local baseChunks = math.floor(numberOfChunks / numberOfRobots)
  local chunksDone = 0
  for counter = 1, numberOfRobots do
    turtle.select(1)
    if turtle.getItemCount() == 0 then
      turtle.suckDown()
    end
    turtle.place()
    if lava then
      turtle.select(2)
      if turtle.getItemCount() == 0 then
        turtle.suckUp()
      end
      turtle.drop(1)
      if manageInventory then
        turtle.select(3)
        if turtle.getItemCount() == 0 then
          turtle.turnLeft()
          turtle.suck()
          turtle.turnRight()
        end
        turtle.drop(1)
      end
    else
      turtle.select(2)
      local coalNeeded = math.ceil(getFuel(startHeight, stopHeight, baseChunks, chunkLength))
      print("Using", coalNeeded, "coal")
      while coalNeeded > 0 do
        turtle.turnLeft()
        turtle.suck()
        turtle.turnRight()
        local itemDetails = turtle.getItemDetail(2)
        if coalNeeded >= itemDetails["count"] then
          turtle.drop()
        elseif itemDetails["count"] == 0 then
          print("Not enough coal")
          os.reboot()
        else
          turtle.drop(coalNeeded)
        end
        coalNeeded = coalNeeded - itemDetails["count"]
      end

      turtle.turnLeft()
      turtle.drop()
      turtle.turnRight()
    end

    peripheral.call("front", "turnOn")

    local robotChunks = baseChunks
    if remainder > 0 then
      robotChunks = robotChunks + 1
      remainder = remainder - 1
    end

    event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")

    local payloadMessage = string.format("%d %d %d %d %d %d",
        chunksDone, robotChunks, numberOfChunks, startHeight, stopHeight, chunkLength
    )

    print(payloadMessage)
    modem.transmit(CLIENT_PORT, SERVER_PORT, payloadMessage)
    chunksDone = chunksDone + robotChunks

    event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")

    while turtle.detect() do
      os.sleep(5)
    end
  end
end

function getFuel(startHeight, stopHeight, numberOfChunks, chunkLength)
  local totalHeight = stopHeight - startHeight
  return math.ceil((((totalHeight / 3) * chunkLength * chunkLength * numberOfChunks) + (16 + 16 + 256)) / 80)
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

modem = peripheral.wrap("left")
SERVER_PORT = 0
CLIENT_PORT = 1
PHONE_PORT = 2

modem.open(SERVER_PORT)

while true do
  event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")
  print(msg)
  local params = split(msg, " ")

  local senderPort = tonumber(replyChannel)
  if senderPort == PHONE_PORT then
    print(params[1])
    print(params[2])
    print(params[3])
    excavateArmy(params[1], params[2], params[3], params[4], params[5])
  end
end
