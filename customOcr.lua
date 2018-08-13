local _, gbl = ...
local _G = _G
local NeP = _G.NeP
gbl.CustomOcr = {}

local pixelFrame = CreateFrame("Frame", "PXBFrame", _G.UIParent)
pixelFrame:SetWidth(10)
pixelFrame:SetHeight(10)
pixelFrame:ClearAllPoints()
pixelFrame:SetPoint("TOPLEFT", 0, 0);
pixelFrame:Show()

local function GetSpellColor (spellId)
  strspellId = format("%06d", spellId)
  local r = "." .. string.sub(strspellId, 1, 2)
  local g = "." .. string.sub(strspellId, 3, 4)
  local b = "." .. string.sub(strspellId, 5, 6)

  print("color", r, g, b)
  return r, g, b
end

local function ChangeColor (spellId)
  if spellId ~= nil then
    r, g, b = GetSpellColor(spellId)

    if not pixelFrame.BG then
      pixelFrame.BG = pixelFrame:CreateTexture("BACKGROUND")
      pixelFrame.BG:SetAllPoints(pixelFrame)
      if not pixelFrame:IsVisible() then
        pixelFrame:Show()
      end
    end

    pixelFrame.BG:SetColorTexture(r, g, b)
  end
end


local cast = NeP.Protected.Cast

gbl.CustomOcr.Cast = function(...)
  local _,_, eva = ...

  -- print("spellId", eva[1].id)
  ChangeColor(eva[1].id)

  cast(...)
end

_G.CustomOcr = true

gbl:AddUnlocker("CustomOcr", {
  test = function() return _G.CustomOcr end,
  functions = gbl.CustomOcr,
})
