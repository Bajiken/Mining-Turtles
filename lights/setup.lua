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

wget("https://raw.githubusercontent.com/Bajiken/Mining-Turtles/mainline/lights/client.lua", "startup")

local file = fs.open("config", "w")
file.write(arg[1])
file.write(arg[2])
file.write("back")
file.write("front")
file.close()
