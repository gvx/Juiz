local http = require("socket.http")
function cmd_webinstall(recp, sender, file)
    if sender:lower() ~= config.owner:lower() then
        say(recp, sender..": You're not my owner.")
        return true
    end
    local fcon = http.request(file)
    local fopn = io.open("modules/tmp.lua", "w+")
    fopn:write(fcon)
    fopn:close()
    msg("TRACE", string.format("Downloaded this data: %s", fcon))
    require("modules.tmp")
    say(recp, sender..": Done!")
    return true
end

ccmd.Add("webinstall", cmd_webinstall)
msg("INSTALL", "Loaded Web Install (http://code.google.com/p/juiz/wiki/webinstall)")