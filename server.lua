function excavateArmy(numberOfChunks, startHeight, stopHeight, numberOfRobots)
  local remainder = numberOfChunks % numberOfRobots
  local baseChunks = math.floor(numberOfChunks / numberOfRobots)
  local chunksDone = 0
  for counter = 1, numberOfRobots do
    turtle.select(1)
    turtle.placeDown()
    turtle.select(2)
    turtle.dropDown(1)
    turtle.select(3)
    turtle.dropDown(1)

    peripheral.call("bottom", "turnOn")

    local robotChunks = baseChunks
    if remainder > 0 then
      robotChunks = robotChunks + 1
      remainder = remainder - 1
    end

    event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")

    local payloadMessage = string.format("%d %d %d %s %s",
        chunksDone, robotChunks, numberOfChunks, startHeight, stopHeight
    )
    modem.transmit(CLIENT_PORT, SERVER_PORT, payloadMessage)
    chunksDone = chunksDone + robotChunks

    event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")

    while turtle.detectDown() do
      os.sleep(5)
    end
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

modem = peripheral.wrap("left")
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
    excavateArmy(params[1], params[2], params[3], params[4])
  end
end
