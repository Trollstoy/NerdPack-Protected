local _, gbl = ...
local _G = _G
local NeP = _G.NeP
gbl.CustomOcr = {}

gbl.CustomOcr.Cast = function(...)
	local _,_, id = ...
	print(id)
  NeP.Faceroll:Set(...)
end

_G.CustomOcr = false

gbl:AddUnlocker('CustomOcr', {
	test = function() return _G.CustomOcr end,
	functions = CustomOcr,
})
