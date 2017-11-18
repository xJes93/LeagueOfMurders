local playerName = UnitName("player")--Temp
button_text = ""

function main_OnLoad()
  ChatFrame1:AddMessage(test); --OnPlayerLogin addon test
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
chapter1_btn, chap1_txt = button_constructor(20, -85, 13, "Глава 1", -1, 5, 1)
chapter1_btn:Hide()
--chapter2
chapter2_btn, chap2_txt = button_constructor(20, -115, 13, "Глава 2", -1, 5, 1)
chapter2_btn:Hide()
--chapter3
chapter3_btn, chap3_txt = button_constructor(20, -145, 13, "Глава 3", -1, 5, 1)
chapter3_btn:Hide()
--chapter4
chapter4_btn, chap4_txt = button_constructor(20, -175, 13, "Глава 4", -1, 5, 0)
chapter4_btn:Hide()
--chapter5
chapter5_btn, chap5_txt = button_constructor(20, -205, 13, "Глава 5", -1, 5, 0)
chapter5_btn:Hide()
--back
back_btn = button_constructor(20, -245, 13, "Назад", -1, 5, 1)
back_btn:Hide()
--supply
btn2 = button_constructor(20, -115, 13, "Отдел снабжения", 0, 5, 0)
--exit
close_btn = button_constructor(20, -155, 13, "Выход", 0, 5, 1)

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
  button_text = chap1_txt:GetText()
  CreateBookFrame(1)
  bookframe:Show()
end)

chapter2_btn:SetScript("OnClick", function(self) 
  button_text = chap2_txt:GetText()
  CreateBookFrame(2)
  bookframe:Show()
end)

chapter3_btn:SetScript("OnClick", function(self) 
  button_text = chap3_txt:GetText()
  CreateBookFrame(3)
  bookframe:Show()
end)

chapter4_btn:SetScript("OnClick", function(self) 
  button_text = chap4_txt:GetText()
  CreateBookFrame(4)
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

