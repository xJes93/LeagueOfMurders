local playerName = UnitName("player")--Temp

function main_OnLoad()
  ChatFrame1:AddMessage(test); --OnPlayerLogin addon test
  CreateBookFrame()
  bookframe:Hide()
  main:SetPoint("TOPLEFT",20,-104)
  main:SetWidth(185)
  main:SetHeight(182)
end

local main = CreateFrame("Frame", "main", UIParent)
main:EnableMouse(true)
main:SetMovable(true)
main:SetBackdrop(FrameBackdrop)
main:RegisterForDrag("LeftButton")
main:RegisterEvent("PLAYER_LOGIN")
main:SetScript("OnEvent", function() main_OnLoad() end)
main:SetScript("OnDragStart", function(self) self:StartMoving() end)
main:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
main:SetPoint("TOPLEFT",20,-104)

local logo_main = main:CreateTexture(nil, "ARTWORK", nil, 0)
logo_main:SetPoint("CENTER", main, "TOPLEFT", 93, -12)
logo_main:SetWidth(156)
logo_main:SetHeight(156)
logo_main:SetTexture("Interface\\AddOns\\LeagueOfMurders\\Main-Logo.tga")

--Button creation part
--codex
local codex_btn = button_constructor(20, -85, 13, "Кодекс Убийцы", -1, 5, 1)
--chapter1
local chapter1_btn = button_constructor(20, -85, 13, "Глава 1", -1, 5, 1)
chapter1_btn:Hide()
--chapter2
local chapter2_btn = button_constructor(20, -115, 13, "Глава 2", -1, 5, 0)
chapter2_btn:Hide()
--chapter3
local chapter3_btn = button_constructor(20, -145, 13, "Глава 3", -1, 5, 0)
chapter3_btn:Hide()
--chapter4
local chapter4_btn = button_constructor(20, -175, 13, "Глава 4", -1, 5, 0)
chapter4_btn:Hide()
--chapter5
local chapter5_btn = button_constructor(20, -205, 13, "Глава 5", -1, 5, 0)
chapter5_btn:Hide()
--back
local back_btn = button_constructor(20, -245, 13, "Назад", -1, 5, 1)
back_btn:Hide()
--supply
local btn2 = button_constructor(20, -115, 13, "Отдел снабжения", 0, 5, 0)
--exit
local close_btn = button_constructor(20, -155, 13, "Выход", 0, 5, 1)

codex_btn:SetScript("OnClick", function(self) 
  PlaySound("igMainMenuOption")
  main:SetHeight(272)
  self:Hide()
  close_btn:Hide()
  btn2:Hide()
  chapter1_btn:Show()
  chapter2_btn:Show()
  chapter3_btn:Show()
  chapter4_btn:Show()
  chapter5_btn:Show()
  back_btn:Show()
end)

chapter1_btn:SetScript("OnClick", function(self) 
  bookframe:Show()
end)

back_btn:SetScript("OnClick", function(self)
  PlaySound("igMainMenuOption")
  main:SetHeight(182)
  self:Hide()
  chapter1_btn:Hide()
  chapter2_btn:Hide()
  chapter3_btn:Hide()
  chapter4_btn:Hide()
  chapter5_btn:Hide()
  codex_btn:Show()
  close_btn:Show()
  btn2:Show()
end)

close_btn:SetScript("OnClick", function(self) 
  PlaySound("igMainMenuOption") 
  self:GetParent():Hide() 
end)

