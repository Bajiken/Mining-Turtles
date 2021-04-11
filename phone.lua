modem = peripheral.wrap("back")

local SERVER_PORT = 0
local CLIENT_PORT = 1
local PHONE_PORT = 2

local payloadMessage = string.format("%d %d %d %d",
    arg[1], arg[2], arg[3], arg[4]
)

modem.transmit(SERVER_PORT, PHONE_PORT, payloadMessage)
