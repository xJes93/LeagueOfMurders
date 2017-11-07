page_n = 1
part1 = {}--“”
--Part1.Page1
--chapter1 = require 'codex.lua'
--print(chapter1[1])
page_l = #part1
-----------------

local button_size = { 
  width = 145, 
  height = 37
}

function CreateBookFrame()
  bookframe = CreateFrame("Frame", "BookFrame", UIParent)
  bookframe:EnableMouse(true)
  bookframe:SetMovable(true)
  bookframe:RegisterForDrag("LeftButton")
  bookframe:SetScript("OnDragStart", function(self) 
    self:StartMoving() 
    end)
  bookframe:SetScript("OnDragStop", function(self) 
    self:StopMovingOrSizing() 
  end)
  bookframe:SetWidth(384)
  bookframe:SetHeight(512)
  bookframe:SetPoint("TOPLEFT",20,-104)
  
  local texture_icon = bookframe:CreateTexture(nil, "BACKGROUND", nil, -8)
  texture_icon:SetPoint("TOPLEFT",10,-8)
  texture_icon:SetWidth(58)
  texture_icon:SetHeight(58)
  texture_icon:SetTexture("Interface\\Spellbook\\Spellbook-Icon")
  
  local texture_topleft = bookframe:CreateTexture(nil, "BORDER", nil, -8)
  texture_topleft:SetPoint("TOPLEFT")
  texture_topleft:SetWidth(256)
  texture_topleft:SetHeight(256)
  texture_topleft:SetTexture("Interface\\ItemTextFrame\\UI-ItemText-TopLeft")
  
  local texture_botleft = bookframe:CreateTexture(nil, "BORDER", nil, -8)
  texture_botleft:SetPoint("TOPLEFT", 0, -256)
  texture_botleft:SetWidth(256)
  texture_botleft:SetHeight(256)
  texture_botleft:SetTexture("Interface\\ItemTextFrame\\UI-ItemText-BotLeft")
  
  local texture_topright = bookframe:CreateTexture(nil, "BORDER", nil, -8)
  texture_topright:SetPoint("TOPLEFT", 256, 0)
  texture_topright:SetWidth(128)
  texture_topright:SetHeight(256)
  texture_topright:SetTexture("Interface\\Spellbook\\UI-SpellbookPanel-TopRight")
  
  local texture_botright = bookframe:CreateTexture(nil, "BORDER", nil, -8)
  texture_botright:SetPoint("TOPLEFT", 256, -256)
  texture_botright:SetWidth(128)
  texture_botright:SetHeight(256)
  texture_botright:SetTexture("Interface\\Spellbook\\UI-SpellbookPanel-BotRight")
  
  local close_button = CreateFrame("Button", nil, bookframe)
  close_button:SetPoint("CENTER", BookFrame, "TOPRIGHT", -44, -25)
  close_button:SetWidth(32)
  close_button:SetHeight(32)
  close_button:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
  close_button:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
  close_button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
  close_button:SetScript("OnClick", function(self) 
    PlaySound("igMainMenuOption") 
    self:GetParent():Hide() 
  end)
  
  local header_text = bookframe:CreateFontString("headerText", "ARTWORK", -5)
  header_text:SetFontObject("GameFontNormal")
  header_text:SetText("Глава 1. Основание Лиги")--REPLACE with variable
  header_text:SetPoint("TOP", bookframe, 4, -20)
  
  page_text = bookframe:CreateFontString("pageText", "ARTWORK", -5)
  page_text:SetFont("Fonts\\MORPHEUS.ttf", 14)
  page_text:SetJustifyH("LEFT")--Text alighment
  page_text:SetJustifyV("TOP")
  page_text:SetText(part1[1])
  page_text:SetPoint("TOP", texture_topleft, "CENTER", 58, 35)
  page_text:SetTextColor(0.2,0.15,0.10)
  page_text:SetWordWrap(true)
  
  local pageNtext = page_n .. [[ из ]] .. page_l
  page_number = bookframe:CreateFontString("pageNumber", "ARTWORK", -5)
  page_number:SetFontObject("GameFontNormal")
  page_number:SetText(pageNtext)
  page_number:SetPoint("TOP", bookframe, 7, -50)
  
  next_button = CreateFrame("Button", nil, bookframe)
  next_button:SetPoint("CENTER", BookFrame, "TOPRIGHT", -55, -56)
  next_button:SetWidth(32)
  next_button:SetHeight(32)
  next_button:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
  next_button:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
  next_button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
  next_button:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
  next_button:SetScript("OnClick", function() 
    page_n = page_n+1 
    if page_n>page_l-1 then next_button:Disable() else next_button:Enable() end--??
    if page_n<2 then prev_button:Disable() else prev_button:Enable() end
    pageNtext = page_n .. [[ из ]] .. page_l 
    page_number:SetText(pageNtext) 
    page_text:SetText(part1[page_n])
    PlaySound("igMainMenuOption") 
  end)
  
  prev_button = CreateFrame("Button", nil, bookframe)
  prev_button:Disable()
  prev_button:SetPoint("CENTER", BookFrame, "TOPLEFT", 90, -56)
  prev_button:SetWidth(32)
  prev_button:SetHeight(32)
  prev_button:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
  prev_button:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
  prev_button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
  prev_button:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
  prev_button:SetScript("OnClick", function() 
    page_n = page_n-1 
    if page_n<2 then prev_button:Disable() else prev_button:Enable() end--??
    if page_n>22 then next_button:Disable() else next_button:Enable() end
    pageNtext = page_n .. [[ из ]] .. page_l 
    page_number:SetText(pageNtext) 
    page_text:SetText(part1[page_n])
    PlaySound("igMainMenuOption") 
  end)
end

function button_constructor(x, y, size, text, text_x, text_y, enbld)
  local Frame = CreateFrame("Button", nil, main)
  Frame:SetPoint("LEFT", main, "TOPLEFT", x, y)
  Frame:SetNormalTexture("Interface\\Buttons\\UI-DialogBox-Button-Up")
  Frame:SetPushedTexture("Interface\\Buttons\\UI-DialogBox-Button-Down")
  Frame:SetHighlightTexture("Interface\\Buttons\\UI-DialogBox-Button-Highlight")
  Frame:SetDisabledTexture("Interface\\Buttons\\UI-DialogBox-Button-Disabled")
  Frame:SetScript("OnClick", function() end)
  Frame:SetSize(button_size.width, button_size.height)

  local btn_text = Frame:CreateFontString(nil, "ARTWORK", 1)
  btn_text:SetFont("Fonts\\FRIZQT__.TTF", size)
  btn_text:SetJustifyH("LEFT")
  btn_text:SetJustifyV("TOP")
  btn_text:SetText(text)
  btn_text:SetPoint("CENTER", Frame, "CENTER", text_x, text_y)

  if enbld == 0 then 
    Frame:Disable()
    btn_text:SetTextColor(0.5,0.5,0.5)
    else
    Frame:Enable()
    btn_text:SetTextColor(0.95,0.95,0.95)
  end

  return Frame, btn_text
end

function main_OnLoad()
  ChatFrame1:AddMessage("LoM_addon loaded"); --OnPlayerLogin
  CreateBookFrame()
  bookframe:Hide()
  main:SetPoint("TOPLEFT",20,-104)
  main:SetWidth(185)
  main:SetHeight(182)
  --local options = require 'tst'
  --DEFAULT_CHAT_FRAME:AddMessage(options.title);
end

local FrameBackdrop = {
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = true, tileSize = 32, edgeSize = 32,
  insets = { left = 8, right = 8, top = 8, bottom = 8 }
}

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
logo_main:SetPoint("CENTER", main, "TOPLEFT", 93, 55)
logo_main:SetWidth(142)
logo_main:SetHeight(265)
logo_main:SetTexture("Interface\\AddOns\\LeagueOfMurders\\Main-Logo.tga")

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

