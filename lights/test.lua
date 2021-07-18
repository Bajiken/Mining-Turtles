modem = peripheral.wrap("back")

local SERVER_PORT = 0
local CLIENT_PORT = 1
local PHONE_PORT = 2

while true do
    local payloadMessage = string.format("%d",
        20499
    )
    modem.transmit(CLIENT_PORT, PHONE_PORT, payloadMessage)
    os.sleep(0.35)
    local payloadMessage = string.format("%d",
        1993
    )
    modem.transmit(CLIENT_PORT, PHONE_PORT, payloadMessage)
    os.sleep(0.35)
end
