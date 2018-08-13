local _, gbl = ...
local _G = _G
local NeP = _G.NeP
gbl.CustomOcr = {}

local pxFrame = CreateFrame("Frame", "pxFrame", _G.UIParent)
pxFrame:SetWidth(10)
pxFrame:SetHeight(10)
pxFrame:ClearAllPoints()
pxFrame:SetPoint("TOPLEFT", 0, 0);
pxFrame:Show()

local function GetSpellColor (spellId)
  strspellId = format("%06d", spellId)
  local r = "." .. string.sub(strspellId, 1, 2)
  local g = "." .. string.sub(strspellId, 3, 4)
  local b = "." .. string.sub(strspellId, 5, 6)

  -- print("color", r, g, b)
  return r, g, b
end

local function ChangeColor (spellId)
  -- print("spellId", eva[1].id)
  if spellId ~= nil then
    r, g, b = GetSpellColor(spellId)

    if not pxFrame.BG then
      pxFrame.BG = pxFrame:CreateTexture("BACKGROUND")
      pxFrame.BG:SetAllPoints(pxFrame)
      if not pxFrame:IsVisible() then
        pxFrame:Show()
      end
    end

    pxFrame.BG:SetColorTexture(r, g, b)
  end
end


local cast = NeP.Protected.Cast

gbl.CustomOcr.Cast = function(...)
  local _,_, eva = ...
  ChangeColor(eva[1].id)
  cast(...)
end

_G.CustomOcr = true

gbl:AddUnlocker("CustomOcr", {
  test = function() return _G.CustomOcr end,
  functions = gbl.CustomOcr,
})


-- TODO : figure out how to hook onto Faceroll.Hide to black our frame out
-- local hide = NeP.Faceroll.Hide
--
-- NeP.Faceroll.Hide = function(...)
--   pxFrame:Hide()
--   hide(...)
-- end
