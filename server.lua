modem = peripheral.wrap("back")

local SERVER_PORT = 0
local CLIENT_PORT = 1

local payloadMessage = string.format("%d %d",
    arg[1], arg[2]
)

modem.transmit(CLIENT_PORT, SERVER_PORT, payloadMessage)
