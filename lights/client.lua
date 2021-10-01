local require

do
  local requireCache = {}

  require = function(file)
        local absolute = shell.resolve(file)

        if requireCache[absolute] ~= nil then
          --# Lucky day, this file has already been loaded once!
          --# Return its cached result.
          return requireCache[absolute]
        end

        --# Create a custom environment so that loaded
        --# source files also have access to require.
        local env = {
          require = require
        }

        setmetatable(env, { __index = _G, __newindex = _G })

        --# Load the source file with loadfile, which
        --# also allows us to pass our custom environment.
        local chunk, err = loadfile(absolute, env)

        --# If chunk is nil, then there was a syntax error
        --# or the file does not exist.
        if chunk == nil then
          return error(err)
        end

        --# Execute the file, cache and return its return value.
        local result = chunk()
        requireCache[absolute] = result
        return result
  end
end

local function wget(option, url, ziel)
  if type(url) ~= "string" and type(ziel) ~= "string" then
        return
  elseif type(option) == "string" and option ~= "-f" and type(url) == "string" then
        ziel = url
        url = option
  end
  if http.checkURL(url) then
        if fs.exists(ziel) and option ~= "-f" then
          printError("<Error> Target exists already")
          return
        else
          term.write("Downloading ... ")
          local timer = os.startTimer(60)
          http.request(url)
          while true do
                local event, id, data = os.pullEvent()
                if event == "http_success" then
                  print("success")
                  local f = io.open(ziel, "w")
                  f:write(data.readAll())
                  f:close()
                  data:close()
                  print("Saved as " .. ziel)
                  return true
                elseif event == "timer" and timer == id then
                  printError("<Error> Timeout")
                  return
                elseif event == "http_failure" then
                  printError("<Error> Download")
                  os.cancelAlarm(timer)
                  return
                end
          end
        end
  else
        printError("<Error> URL")
        return
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

local config = fs.open("config", "r")
local track = config.readLine()
local gitPrefix = "https://raw.githubusercontent.com/Bajiken/Mining-Turtles/mainline/"
wget("-f", gitPrefix .. "lights/Industry/" .. track, track)

local modemSide = config.readLine()
local lightSide = config.readLine()
modem = peripheral.wrap(modemSide)
light = peripheral.wrap(lightSide)

config.close()

local music = fs.open(track, "r")

SERVER_PORT = 0
CLIENT_PORT = 1
PHONE_PORT = 2

modem.open(CLIENT_PORT)

local data = music.readLine()

while data ~= nil do
  local values = split(data, " ")
  for _, value in ipairs(values) do
    event, side, senderChannel, replyChannel, msg, distance = os.pullEvent("modem_message")
    light.setLampColor(tonumber(value))
  end
  data = music.readLine()
end
