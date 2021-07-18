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

modem = peripheral.wrap("back")
SERVER_PORT = 0
CLIENT_PORT = 1
PHONE_PORT = 2

modem.open(CLIENT_PORT)

while true do
  event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")
  print(msg)
  local params = split(msg, " ")

  light = peripheral.wrap("front")
  print(params[1])

  light.setLampColor(tonumber(params[1]))
end
