modem = peripheral.wrap("back")

local SERVER_PORT = 0
local CLIENT_PORT = 1
local PHONE_PORT = 2

arg[1] = arg[1] or 0

local interval = .095
local counter = 0
local bars = 8
local totalNotes = bars * 8 * 4
local payloadMessage = "go"
local drift = .05 - math.fmod(.095, .05)
local totalDrift = 0

while counter < totalNotes do
  modem.transmit(CLIENT_PORT, PHONE_PORT, payloadMessage)
  totalDrift = totalDrift + drift
  if totalDrift >= .05 then
    os.sleep(interval - .05)
    totalDrift = totalDrift - .05
  else
    os.sleep(interval)
  end
  counter = counter + 1
end
