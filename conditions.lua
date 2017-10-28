local NeP = _G.NeP

NeP.Condition:Register("advanced", function()
	return _G.HackEnabled ~= nil
end)

NeP.Condition:Register("ishackenabled", function(_, hack)
	return _G.HackEnabled and _G.HackEnabled(hack)
end)
