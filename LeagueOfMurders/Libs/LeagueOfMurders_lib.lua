--[[
Functions:
CreateBookFrame(chap) - Book frame constructor
  variables:
  chap - number of chapter
button_constructor(x, y, size, text, text_x, text_y, enbld) - Button constructor for mainframe
  variables:
  x - Button x position
  y - Button y position
  size - Button size
  text - Button text
  text_x - Text x position
  text_y - Text y position
  enbld - Enabled
]]

--Temp
test = "Addon is loaded"

--Variables
chapter = {{},{},{},{}}

button_size = { 
  width = 145, 
  height = 37
}

FrameBackdrop = {
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = true, tileSize = 32, edgeSize = 32,
  insets = { left = 8, right = 8, top = 8, bottom = 8 }
}

--Functions
function CreateBookFrame(chap)
  --variables
  page_n = 1
  page_l = #chapter[chap]
  pageNtext = page_n .. [[ из ]] .. page_l
  
  if bookframe == nil then 
    bookframe = CreateFrame("Frame", "BookFrame", UIParent)
    bookframe:EnableMouse(true)
    bookframe:SetMovable(true)
    bookframe:RegisterForDrag("LeftButton")
    bookframe:SetWidth(384)
    bookframe:SetHeight(512)
    bookframe:SetScript("OnShow", function(self)
      page_n = 1
      pageNtext = page_n .. [[ из ]] .. page_l
      prev_button:Disable()
      next_button:Enable()
      page_number:SetText(pageNtext)
      page_text:SetText(chapter[chap][1])
      end)
    bookframe:SetScript("OnDragStart", function(self) --
      self:StartMoving() 
      end)
    bookframe:SetScript("OnDragStop", function(self) --
      self:StopMovingOrSizing() 
      end)
    
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
    
    close_button = CreateFrame("Button", nil, bookframe)
    close_button:SetPoint("CENTER", BookFrame, "TOPRIGHT", -44, -25)
    close_button:SetWidth(32)
    close_button:SetHeight(32)
    close_button:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    close_button:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    close_button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    
    header_text = bookframe:CreateFontString("headerText", "ARTWORK", -5)
    header_text:SetFontObject("GameFontNormal")
    header_text:SetPoint("TOP", bookframe, 4, -20)
    
    page_text = bookframe:CreateFontString("pageText", "ARTWORK", -5)
    page_text:SetFont("Fonts\\MORPHEUS.ttf", 14)
    page_text:SetJustifyH("LEFT")
    page_text:SetJustifyV("TOP")
    page_text:SetPoint("TOP", texture_topleft, "CENTER", 58, 35)
    page_text:SetTextColor(0.2,0.15,0.10)
    page_text:SetWordWrap(true)
    
    page_number = bookframe:CreateFontString("pageNumber", "ARTWORK", -5)
    page_number:SetFontObject("GameFontNormal")
    page_number:SetPoint("TOP", bookframe, 7, -50)
    
    next_button = CreateFrame("Button", nil, bookframe)
    next_button:SetPoint("CENTER", BookFrame, "TOPRIGHT", -55, -56)
    next_button:SetWidth(32)
    next_button:SetHeight(32)
    next_button:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
    next_button:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
    next_button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
    next_button:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
    
    prev_button = CreateFrame("Button", nil, bookframe)
    prev_button:Disable()
    prev_button:SetPoint("CENTER", BookFrame, "TOPLEFT", 90, -56)
    prev_button:SetWidth(32)
    prev_button:SetHeight(32)
    prev_button:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
    prev_button:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
    prev_button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
    prev_button:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
  end



  --functions
  next_button:SetScript("OnClick", function()
    page_n = page_n+1 
    if page_n>page_l-1 then next_button:Disable() else next_button:Enable() end
    if page_n<2 then prev_button:Disable() else prev_button:Enable() end
    pageNtext = page_n .. [[ из ]] .. page_l 
    page_number:SetText(pageNtext) 
    page_text:SetText(chapter[chap][page_n])
    PlaySound("igMainMenuOption") 
  end)
  
  prev_button:SetScript("OnClick", function() --
    page_n = page_n-1 
    if page_n<2 then prev_button:Disable() else prev_button:Enable() end
    if page_n>page_l-1 then next_button:Disable() else next_button:Enable() end
    pageNtext = page_n .. [[ из ]] .. page_l 
    page_number:SetText(pageNtext) 
    page_text:SetText(chapter[chap][page_n])
    PlaySound("igMainMenuOption") 
  end)

  close_button:SetScript("OnClick", function(self) 
    PlaySound("igMainMenuOption") 
    self:GetParent():Hide() 
  end)

  if page_n>page_l-1 then next_button:Disable() else next_button:Enable() end
  if page_n<2 then prev_button:Disable() else prev_button:Enable() end
  page_number:SetText(pageNtext)--every time
  bookframe:SetPoint("TOPLEFT",225,-100)--every time
  header_text:SetText(button_text) -- every time
  page_text:SetText(chapter[chap][1])
end

function button_constructor(x, y, size, text, text_x, text_y, enbld)
  local Frame = CreateFrame("Button", nil, main)
  Frame:SetPoint("LEFT", main, "TOPLEFT", x, y)
  Frame:SetNormalTexture("Interface\\Buttons\\UI-DialogBox-Button-Up")
  Frame:SetPushedTexture("Interface\\Buttons\\UI-DialogBox-Button-Down")
  Frame:SetHighlightTexture("Interface\\Buttons\\UI-DialogBox-Button-Highlight")
  Frame:SetDisabledTexture("Interface\\Buttons\\UI-DialogBox-Button-Disabled")
  Frame:SetSize(button_size.width, button_size.height)

  btn_text = Frame:CreateFontString(nil, "ARTWORK", 1)
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