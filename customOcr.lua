local _, gbl = ...
local _G = _G
local NeP = _G.NeP
gbl.CustomOcr = {}

local cast = NeP.Protected.Cast

gbl.CustomOcr.Cast = function(...)
	local _,_, eva = ...
	print(eva[1].id)
  cast(...)
end

_G.CustomOcr = true

gbl:AddUnlocker('CustomOcr', {
	test = function() return _G.CustomOcr end,
	functions = gbl.CustomOcr,
})
