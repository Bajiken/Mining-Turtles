modem = peripheral.wrap("back")

local SERVER_PORT = 0
local CLIENT_PORT = 1
local PHONE_PORT = 2

arg[1] = arg[1] or 0

local payloadMessage = string.format("%d",
    arg[1]
)

modem.transmit(CLIENT_PORT, PHONE_PORT, payloadMessage)
