function excavateArmy(numberOfChunks, yHeight, numberOfRobots)
  local remainder = numberOfChunks % numberOfRobots
  local baseChunks = math.floor(numberOfChunks / numberOfRobots)
  local chunksDone = 0
  for counter = 1, numberOfRobots do
    turtle.select(1)
    turtle.placeDown()
    turtle.select(2)
    turtle.dropDown(1)

    local robotChunks = baseChunks
    if remainder > 0 then
      robotChunks = robotChunks + 1
      remainder = remainder - 1
    end

    -- excavateChunks(chunksDone, robotChunks, numberOfChunks, yHeight)

    event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")

    local payloadMessage = string.format("%d %d %d %d",
        chunksDone, robotChunks, numberOfChunks, yHeight
    )
    modem.transmit(CLIENT_PORT, SERVER_PORT, payloadMessage)
    chunksDone = chunksDone + robotChunks

    event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")
    os.sleep(5)
  end
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

modem = peripheral.wrap("right")
SERVER_PORT = 0
CLIENT_PORT = 1
PHONE_PORT = 2

modem.open(SERVER_PORT)

while true do
  event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")
  local params = split(msg, " ")

  local senderPort = tonumber(replyChannel)
  if senderPort == PHONE_PORT then
    print(params[1])
    print(params[2])
    print(params[3])
    excavateArmy(params[1], params[2], params[3])
  end
end
