local _001 = game:GetService("UserInputService")
local _002 = {
bg = Color3.fromRGB(11, 11, 20),
bar = Color3.fromRGB(16, 16, 28),
field = Color3.fromRGB(8, 8, 15),
border = Color3.fromRGB(26, 26, 48),
txt = Color3.fromRGB(218, 224, 240),
dim = Color3.fromRGB(65, 65, 95),
purple = Color3.fromRGB(168, 85, 247),
cyan = Color3.fromRGB(6, 182, 212),
green = Color3.fromRGB(74, 222, 128),
red = Color3.fromRGB(248, 113, 113)
}
math.randomseed(tick())
local _003 = {}
for _004 in ("acdefghjklmnopqrstvwxyz"):gmatch(".") do
table.insert(_003, _004)
end
local _005 = {"<i></i>", "<b></b>", "<s></s>", "<u></u>"}
local function _006(_007)
if _007 == "" then return "" end
local _008 = {}
for _, _009 in utf8.codes(_007) do
table.insert(_008, utf8.char(_009))
end
local _010, _011 = {}, 0
for _012 = 1, #_008 do
local _013 = _008[_012]
if _011 >= 1 or math.random() < 0.52 then
local _014 = _003[math.random(#_003)]
table.insert(_010, "<" .. _014 .. ">" .. _013 .. "</" .. _014 .. ">")
_011 = 0
else
table.insert(_010, _013)
_011 += 1
end
if _012 < #_008 and math.random() < 0.16 then
table.insert(_010, _005[math.random(#_005)])
end
end
return table.concat(_010)
end
local function _013(_014)
if _014 == "" then return "" end
_014 = _014:gsub("<[a-z]+></[a-z]+>", "")
_014 = _014:gsub("<[a-z]+>(.-)</[a-z]+>", "%1")
return _014
end
local function _015(_016, _017, _018)
local _019 = Instance.new(_016)
for _020, _021 in pairs(_018 or {}) do _019[_020] = _021 end
_019.Parent = _017
return _019
end
local function _022(_023, _024)
_015("UICorner", _023, {CornerRadius = UDim.new(0, _024 or 6)})
end
local function _025(_026, _027, _028)
return _015("UIStroke", _026, {
Color = _027 or _002.border,
Thickness = _028 or 1,
ApplyStrokeMode = Enum.ApplyStrokeMode.Border
})
end
local function _029(_030, _031, _032, _033, _034)
_015("UIPadding", _030, {
PaddingTop = UDim.new(0, _031 or 0),
PaddingBottom = UDim.new(0, _032 or 0),
PaddingLeft = UDim.new(0, _033 or 0),
PaddingRight = UDim.new(0, _034 or 0)
})
end
local function _035(_036, _037, _038, _039, _040)
_015("UIListLayout", _036, {
FillDirection = _037 or Enum.FillDirection.Vertical,
HorizontalAlignment = _038 or Enum.HorizontalAlignment.Left,
VerticalAlignment = _039 or Enum.VerticalAlignment.Top,
Padding = UDim.new(0, _040 or 0),
SortOrder = Enum.SortOrder.LayoutOrder
})
end
local _036 = _001.TouchEnabled and not _001.MouseEnabled
local _037 = nil
pcall(function()
local _038 = gethui():FindFirstChild("TagifyGUI")
if _038 then _037 = _038 end
end)
if not _037 then
pcall(function()
local _038 = game:GetService("CoreGui"):FindFirstChild("TagifyGUI")
if _038 then _037 = _038 end
end)
end
if _037 then
local _038 = Instance.new("ScreenGui")
_038.Name = "TagifyDupCheck"
_038.ResetOnSpawn = false
_038.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_038.DisplayOrder = 100
if not pcall(function() _038.Parent = gethui() end) then
pcall(function() _038.Parent = game:GetService("CoreGui") end)
end
local _039 = _015("Frame", _038, {
Size = UDim2.new(1, 0, 1, 0),
BackgroundColor3 = Color3.fromRGB(0, 0, 0),
BackgroundTransparency = 0.5,
BorderSizePixel = 0
})
local _040 = _015("Frame", _039, {
AnchorPoint = Vector2.new(0.5, 0.5),
Size = UDim2.new(0, _036 and 280 or 340, 0, 0),
Position = UDim2.new(0.5, 0, 0.5, 0),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
AutomaticSize = Enum.AutomaticSize.Y
})
_022(_040, 10)
_025(_040, _002.purple, 1)
_015("Frame", _040, {
Size = UDim2.new(1, 0, 0, 3),
BackgroundColor3 = _002.purple,
BorderSizePixel = 0
})
local _041 = _015("Frame", _040, {
Size = UDim2.new(1, 0, 0, 0),
BackgroundTransparency = 1,
AutomaticSize = Enum.AutomaticSize.Y
})
_029(_041, 14, 14, 14, 14)
_035(_041, Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Center, Enum.VerticalAlignment.Top, 10)
_015("TextLabel", _041, {
Size = UDim2.new(1, 0, 0, 0),
AutomaticSize = Enum.AutomaticSize.Y,
LayoutOrder = 1,
BackgroundTransparency = 1,
Text = "Parece que ya has cargado Tagify.",
TextColor3 = _002.txt,
TextSize = _036 and 13 or 14,
Font = Enum.Font.GothamBold,
TextXAlignment = Enum.TextXAlignment.Center,
TextWrapped = true
})
_015("TextLabel", _041, {
Size = UDim2.new(1, 0, 0, 0),
AutomaticSize = Enum.AutomaticSize.Y,
LayoutOrder = 2,
BackgroundTransparency = 1,
Text = "Quieres volver a cargarlo?",
TextColor3 = _002.dim,
TextSize = _036 and 11 or 12,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Center,
TextWrapped = true
})
local _042 = _015("Frame", _041, {
Size = UDim2.new(1, 0, 0, _036 and 30 or 34),
LayoutOrder = 3,
BackgroundTransparency = 1
})
_035(_042, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Center, Enum.VerticalAlignment.Center, _036 and 8 or 10)
local function _043(_044, _045, _046)
local _047 = _015("TextButton", _042, {
Size = UDim2.new(0, _036 and 90 or 110, 1, 0),
BackgroundColor3 = _045,
Text = _044,
TextColor3 = _046,
TextSize = _036 and 11 or 12,
Font = Enum.Font.GothamBold,
AutoButtonColor = false
})
_022(_047, 6)
return _047
end
local _048 = _043("Si", _002.purple, _002.txt)
local _049 = _043("No", _002.border, _002.dim)
local _050 = Instance.new("BindableEvent")
_048.MouseButton1Click:Connect(function() _050:Fire(true) end)
_049.MouseButton1Click:Connect(function() _050:Fire(false) end)
local _051 = _050.Event:Wait()
_038:Destroy()
_050:Destroy()
if not _051 then return end
_037:Destroy()
end
if _036 then
local _041 = Instance.new("ScreenGui")
_041.Name = "TagifyGUI"
_041.ResetOnSpawn = false
_041.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if not pcall(function() _041.Parent = gethui() end) then
pcall(function() _041.Parent = game:GetService("CoreGui") end)
end
local _042, _043 = 330, 360
local _044, _045 = 32, 34
local _046 = _015("Frame", _041, {
Size = UDim2.new(0, _042, 0, _043),
Position = UDim2.new(0.5, -_042 / 2, 0.5, -_043 / 2),
BackgroundColor3 = _002.bg,
BorderSizePixel = 0,
ClipsDescendants = true
})
_022(_046, 10)
_025(_046, _002.border, 1)
local _047 = _015("Frame", _046, {
Size = UDim2.new(1, 0, 0, _044),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
ZIndex = 3
})
_022(_047, 10)
_015("Frame", _047, {
Size = UDim2.new(1, 0, 0.5, 0),
Position = UDim2.new(0, 0, 0.5, 0),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
ZIndex = 3
})
_015("Frame", _047, {
Size = UDim2.new(1, 0, 0, 1),
Position = UDim2.new(0, 0, 1, -1),
BackgroundColor3 = _002.border,
BorderSizePixel = 0,
ZIndex = 4
})
_015("TextLabel", _047, {
Size = UDim2.new(1, -80, 1, 0),
Position = UDim2.new(0, 10, 0, 0),
BackgroundTransparency = 1,
Text = "< tagify />",
TextColor3 = _002.txt,
TextSize = 12,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left,
ZIndex = 4
})
local function _048(_049, _050, _051, _052)
local _053 = _015("TextButton", _047, {
Size = UDim2.new(0, 24, 0, 18),
Position = UDim2.new(1, _049, 0.5, -9),
BackgroundColor3 = _051,
Text = _050,
TextColor3 = _052,
TextSize = 10,
Font = Enum.Font.GothamBold,
ZIndex = 4,
AutoButtonColor = false
})
_022(_053, 4)
return _053
end
local _054 = _048(-52, "-", _002.border, _002.dim)
local _055 = _048(-24, "X", Color3.fromRGB(48, 18, 18), _002.red)
local _056 = _015("Frame", _046, {
Size = UDim2.new(1, 0, 0, _045),
Position = UDim2.new(0, 0, 0, _044),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
ZIndex = 2
})
_029(_056, 5, 5, 8, 0)
_035(_056, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center, 5)
_015("Frame", _046, {
Size = UDim2.new(1, 0, 0, 1),
Position = UDim2.new(0, 0, 0, _044 + _045 - 1),
BackgroundColor3 = _002.border,
BorderSizePixel = 0,
ZIndex = 3
})
local function _057(_058, _059, _060)
local _061 = _015("TextButton", _056, {
Size = UDim2.new(0, 82, 0, 22),
BackgroundColor3 = _002.bg,
Text = _058,
TextColor3 = _059,
TextSize = 10,
Font = Enum.Font.Code,
LayoutOrder = _060,
AutoButtonColor = false
})
_022(_061, 5)
local _062 = _025(_061, _059, 1)
return _061, _062
end
local _063, _064 = _057("Tagify", _002.purple, 1)
local _065, _066 = _057("Untagify", _002.cyan, 2)
local _067 = _015("Frame", _046, {
Size = UDim2.new(1, 0, 0, _043 - _044 - _045),
Position = UDim2.new(0, 0, 0, _044 + _045),
BackgroundTransparency = 1
})
_029(_067, 10, 10, 10, 10)
_035(_067, Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Top, 6)
_015("TextLabel", _067, {
Size = UDim2.new(1, 0, 0, 9),
LayoutOrder = 1,
BackgroundTransparency = 1,
Text = "INPUT",
TextColor3 = _002.dim,
TextSize = 7,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left
})
local _068 = _015("TextBox", _067, {
Size = UDim2.new(1, 0, 0, 52),
LayoutOrder = 2,
BackgroundColor3 = _002.field,
Text = "Hello!",
PlaceholderText = "Type something...",
TextColor3 = _002.txt,
PlaceholderColor3 = _002.dim,
TextSize = 14,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left,
TextYAlignment = Enum.TextYAlignment.Top,
ClearTextOnFocus = false,
MultiLine = true,
TextWrapped = true
})
_022(_068, 6)
_025(_068, _002.border, 1)
_029(_068, 7, 7, 9, 9)
local _069 = _015("Frame", _067, {
Size = UDim2.new(1, 0, 0, 26),
LayoutOrder = 3,
BackgroundTransparency = 1
})
local _070 = _015("TextLabel", _069, {
AnchorPoint = Vector2.new(0, 0.5),
Size = UDim2.new(0, 18, 0, 18),
Position = UDim2.new(0, 0, 0.5, 0),
BackgroundTransparency = 1,
Text = "!",
TextColor3 = _002.red,
TextSize = 16,
Font = Enum.Font.GothamBold,
Visible = false
})
local _071 = _015("Frame", _069, {
AnchorPoint = Vector2.new(1, 0),
Size = UDim2.new(0, 0, 1, 0),
Position = UDim2.new(1, 0, 0, 0),
BackgroundTransparency = 1,
AutomaticSize = Enum.AutomaticSize.X
})
_035(_071, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center, 5)
local function _072(_073, _074, _075)
local _076 = _015("TextButton", _071, {
Size = UDim2.new(0, 74, 1, 0),
LayoutOrder = _075,
BackgroundColor3 = _002.bg,
Text = _073,
TextColor3 = _074,
TextSize = 10,
Font = Enum.Font.Code,
AutoButtonColor = false
})
_022(_076, 5)
local _077 = _025(_076, _074, 1)
return _076, _077
end
local _078, _ = _072("reroll", _002.purple, 1)
local _079, _080 = _072("copy", _002.dim, 2)
_015("TextLabel", _067, {
Size = UDim2.new(1, 0, 0, 9),
LayoutOrder = 4,
BackgroundTransparency = 1,
Text = "OUTPUT",
TextColor3 = _002.dim,
TextSize = 7,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left
})
local _081 = _015("ScrollingFrame", _067, {
Size = UDim2.new(1, 0, 0, 128),
LayoutOrder = 5,
BackgroundColor3 = _002.field,
BorderSizePixel = 0,
ScrollBarThickness = 3,
ScrollBarImageColor3 = _002.border,
CanvasSize = UDim2.new(0, 0, 0, 0),
AutomaticCanvasSize = Enum.AutomaticSize.Y
})
_022(_081, 6)
_025(_081, _002.border, 1)
local _082 = _015("TextLabel", _081, {
Size = UDim2.new(1, 0, 0, 0),
AutomaticSize = Enum.AutomaticSize.Y,
BackgroundTransparency = 1,
Text = "",
TextColor3 = _002.txt,
TextSize = 12,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left,
TextYAlignment = Enum.TextYAlignment.Top,
TextWrapped = true,
RichText = false
})
_029(_082, 9, 9, 9, 12)
local _083 = _015("Frame", _067, {
Size = UDim2.new(1, 0, 0, 20),
LayoutOrder = 6,
BackgroundColor3 = _002.bar,
BorderSizePixel = 0
})
_022(_083, 5)
_025(_083, _002.border, 1)
_029(_083, 0, 0, 8, 8)
local _084 = _015("TextLabel", _083, {
Size = UDim2.new(1, 0, 1, 0),
BackgroundTransparency = 1,
Text = "",
TextColor3 = _002.dim,
TextSize = 8,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left
})
local _085 = "tagify"
local _086 = ""
local function _087()
local _088 = #_068.Text
local _089 = #_086
if _085 == "tagify" and _088 > 0 then
_084.Text = ("IN %d · OUT %d · %.1f×"):format(_088, _089, _089 / _088)
else
_084.Text = ("IN %d · OUT %d"):format(_088, _089)
end
end
local function _090(_091)
_086 = _091
_082.Text = _091
_087()
end
local function _092()
local _093 = 0
for _ in _068.Text:gmatch("%d") do _093 += 1 end
_070.Visible = (_093 > 2)
if _085 == "tagify" then
_090(_006(_068.Text))
else
_090(_013(_068.Text))
end
end
local function _094(_095)
_085 = _095
_078.Visible = (_095 == "tagify")
if _095 == "tagify" then
_063.BackgroundColor3 = Color3.fromRGB(28, 12, 48)
_064.Color = _002.purple
_064.Thickness = 1.5
_065.BackgroundColor3 = _002.bg
_066.Color = _002.dim
_066.Thickness = 1
else
_065.BackgroundColor3 = Color3.fromRGB(6, 22, 30)
_066.Color = _002.cyan
_066.Thickness = 1.5
_063.BackgroundColor3 = _002.bg
_064.Color = _002.dim
_064.Thickness = 1
end
_092()
end
_094("tagify")
_090(_006("Hello!"))
_068:GetPropertyChangedSignal("Text"):Connect(_092)
_063.MouseButton1Click:Connect(function() _094("tagify") end)
_065.MouseButton1Click:Connect(function() _094("untagify") end)
_078.MouseButton1Click:Connect(function()
if _085 == "tagify" then _090(_006(_068.Text)) end
end)
_079.MouseButton1Click:Connect(function()
if _086 == "" then return end
pcall(setclipboard, _086)
_079.Text = "copiado!"
_079.TextColor3 = _002.green
_080.Color = _002.green
task.delay(1.8, function()
_079.Text = "copy"
_079.TextColor3 = _002.dim
_080.Color = _002.dim
end)
end)
_055.MouseButton1Click:Connect(function() _041:Destroy() end)
local _096 = false
_054.MouseButton1Click:Connect(function()
_096 = not _096
_056.Visible = not _096
_067.Visible = not _096
_046.Size = UDim2.new(0, _042, 0, _096 and _044 or _043)
_054.Text = _096 and "+" or "-"
end)
local _097, _098, _099 = false, nil, nil
_047.InputBegan:Connect(function(_100)
if _100.UserInputType == Enum.UserInputType.MouseButton1 or _100.UserInputType == Enum.UserInputType.Touch then
_097 = true
_098 = _100.Position
_099 = _046.Position
_100.Changed:Connect(function()
if _100.UserInputState == Enum.UserInputState.End then _097 = false end
end)
end
end)
_001.InputChanged:Connect(function(_101)
if _097 and (_101.UserInputType == Enum.UserInputType.MouseMovement or _101.UserInputType == Enum.UserInputType.Touch) then
local _102 = _101.Position - _098
_046.Position = UDim2.new(_099.X.Scale, _099.X.Offset + _102.X, _099.Y.Scale, _099.Y.Offset + _102.Y)
end
end)
else
local _041 = Instance.new("ScreenGui")
_041.Name = "TagifyGUI"
_041.ResetOnSpawn = false
_041.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if not pcall(function() _041.Parent = gethui() end) then
pcall(function() _041.Parent = game:GetService("CoreGui") end)
end
local _042, _043 = 520, 420
local _044, _045 = 34, 36
local _046 = _015("Frame", _041, {
Size = UDim2.new(0, _042, 0, _043),
Position = UDim2.new(0.5, -_042 / 2, 0.5, -_043 / 2),
BackgroundColor3 = _002.bg,
BorderSizePixel = 0,
ClipsDescendants = true
})
_022(_046, 10)
_025(_046, _002.border, 1)
local _047 = _015("Frame", _046, {
Size = UDim2.new(1, 0, 0, _044),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
ZIndex = 3
})
_022(_047, 10)
_015("Frame", _047, {
Size = UDim2.new(1, 0, 0.5, 0),
Position = UDim2.new(0, 0, 0.5, 0),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
ZIndex = 3
})
_015("Frame", _047, {
Size = UDim2.new(1, 0, 0, 1),
Position = UDim2.new(0, 0, 1, -1),
BackgroundColor3 = _002.border,
BorderSizePixel = 0,
ZIndex = 4
})
_015("TextLabel", _047, {
Size = UDim2.new(1, -90, 1, 0),
Position = UDim2.new(0, 12, 0, 0),
BackgroundTransparency = 1,
Text = "< tagify />",
TextColor3 = _002.txt,
TextSize = 13,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left,
ZIndex = 4
})
local function _048(_049, _050, _051, _052)
local _053 = _015("TextButton", _047, {
Size = UDim2.new(0, 26, 0, 20),
Position = UDim2.new(1, _049, 0.5, -10),
BackgroundColor3 = _051,
Text = _050,
TextColor3 = _052,
TextSize = 11,
Font = Enum.Font.GothamBold,
ZIndex = 4,
AutoButtonColor = false
})
_022(_053, 4)
return _053
end
local _054 = _048(-58, "-", _002.border, _002.dim)
local _055 = _048(-28, "X", Color3.fromRGB(48, 18, 18), _002.red)
local _056 = _015("Frame", _046, {
Size = UDim2.new(1, 0, 0, _045),
Position = UDim2.new(0, 0, 0, _044),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
ZIndex = 2
})
_029(_056, 6, 6, 10, 0)
_035(_056, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center, 6)
_015("Frame", _046, {
Size = UDim2.new(1, 0, 0, 1),
Position = UDim2.new(0, 0, 0, _044 + _045 - 1),
BackgroundColor3 = _002.border,
BorderSizePixel = 0,
ZIndex = 3
})
local function _057(_058, _059, _060)
local _061 = _015("TextButton", _056, {
Size = UDim2.new(0, 88, 0, 22),
BackgroundColor3 = _002.bg,
Text = _058,
TextColor3 = _059,
TextSize = 11,
Font = Enum.Font.Code,
LayoutOrder = _060,
AutoButtonColor = false
})
_022(_061, 5)
local _062 = _025(_061, _059, 1)
return _061, _062
end
local _063, _064 = _057("Tagify", _002.purple, 1)
local _065, _066 = _057("Untagify", _002.cyan, 2)
local _067 = _015("Frame", _046, {
Size = UDim2.new(1, 0, 0, _043 - _044 - _045),
Position = UDim2.new(0, 0, 0, _044 + _045),
BackgroundTransparency = 1
})
_029(_067, 12, 12, 12, 12)
_035(_067, Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Top, 8)
_015("TextLabel", _067, {
Size = UDim2.new(1, 0, 0, 10),
LayoutOrder = 1,
BackgroundTransparency = 1,
Text = "INPUT",
TextColor3 = _002.dim,
TextSize = 8,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left
})
local _068 = _015("TextBox", _067, {
Size = UDim2.new(1, 0, 0, 58),
LayoutOrder = 2,
BackgroundColor3 = _002.field,
Text = "Hello!",
PlaceholderText = "Type something...",
TextColor3 = _002.txt,
PlaceholderColor3 = _002.dim,
TextSize = 14,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left,
TextYAlignment = Enum.TextYAlignment.Top,
ClearTextOnFocus = false,
MultiLine = true,
TextWrapped = true
})
_022(_068, 7)
_025(_068, _002.border, 1)
_029(_068, 8, 8, 10, 10)
local _069 = _015("Frame", _067, {
Size = UDim2.new(1, 0, 0, 26),
LayoutOrder = 3,
BackgroundTransparency = 1
})
local _070 = _015("TextLabel", _069, {
AnchorPoint = Vector2.new(0, 0.5),
Size = UDim2.new(0, 18, 0, 18),
Position = UDim2.new(0, 0, 0.5, 0),
BackgroundTransparency = 1,
Text = "!",
TextColor3 = _002.red,
TextSize = 18,
Font = Enum.Font.GothamBold,
Visible = false
})
local _071 = _015("Frame", _069, {
AnchorPoint = Vector2.new(1, 0),
Size = UDim2.new(0, 0, 1, 0),
Position = UDim2.new(1, 0, 0, 0),
BackgroundTransparency = 1,
AutomaticSize = Enum.AutomaticSize.X
})
_035(_071, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center, 6)
local function _072(_073, _074, _075)
local _076 = _015("TextButton", _071, {
Size = UDim2.new(0, 80, 1, 0),
LayoutOrder = _075,
BackgroundColor3 = _002.bg,
Text = _073,
TextColor3 = _074,
TextSize = 10,
Font = Enum.Font.Code,
AutoButtonColor = false
})
_022(_076, 5)
local _077 = _025(_076, _074, 1)
return _076, _077
end
local _078, _ = _072("reroll", _002.purple, 1)
local _079, _080 = _072("copy", _002.dim, 2)
_015("TextLabel", _067, {
Size = UDim2.new(1, 0, 0, 10),
LayoutOrder = 4,
BackgroundTransparency = 1,
Text = "OUTPUT",
TextColor3 = _002.dim,
TextSize = 8,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left
})
local _081 = _015("ScrollingFrame", _067, {
Size = UDim2.new(1, 0, 0, 160),
LayoutOrder = 5,
BackgroundColor3 = _002.field,
BorderSizePixel = 0,
ScrollBarThickness = 3,
ScrollBarImageColor3 = _002.border,
CanvasSize = UDim2.new(0, 0, 0, 0),
AutomaticCanvasSize = Enum.AutomaticSize.Y
})
_022(_081, 7)
_025(_081, _002.border, 1)
local _082 = _015("TextLabel", _081, {
Size = UDim2.new(1, 0, 0, 0),
AutomaticSize = Enum.AutomaticSize.Y,
BackgroundTransparency = 1,
Text = "",
TextColor3 = _002.txt,
TextSize = 13,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left,
TextYAlignment = Enum.TextYAlignment.Top,
TextWrapped = true,
RichText = false
})
_029(_082, 10, 10, 10, 14)
local _083 = _015("Frame", _067, {
Size = UDim2.new(1, 0, 0, 22),
LayoutOrder = 6,
BackgroundColor3 = _002.bar,
BorderSizePixel = 0
})
_022(_083, 5)
_025(_083, _002.border, 1)
_029(_083, 0, 0, 10, 10)
local _084 = _015("TextLabel", _083, {
Size = UDim2.new(1, 0, 1, 0),
BackgroundTransparency = 1,
Text = "",
TextColor3 = _002.dim,
TextSize = 9,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left
})
local _085 = "tagify"
local _086 = ""
local function _087()
local _088 = #_068.Text
local _089 = #_086
if _085 == "tagify" and _088 > 0 then
_084.Text = ("IN %d · OUT %d · RATIO %.1f×"):format(_088, _089, _089 / _088)
else
_084.Text = ("IN %d · OUT %d"):format(_088, _089)
end
end
local function _090(_091)
_086 = _091
_082.Text = _091
_087()
end
local function _092()
local _093 = 0
for _ in _068.Text:gmatch("%d") do _093 += 1 end
_070.Visible = (_093 > 2)
if _085 == "tagify" then
_090(_006(_068.Text))
else
_090(_013(_068.Text))
end
end
local function _094(_095)
_085 = _095
_078.Visible = (_095 == "tagify")
if _095 == "tagify" then
_063.BackgroundColor3 = Color3.fromRGB(28, 12, 48)
_064.Color = _002.purple
_064.Thickness = 1.5
_065.BackgroundColor3 = _002.bg
_066.Color = _002.dim
_066.Thickness = 1
else
_065.BackgroundColor3 = Color3.fromRGB(6, 22, 30)
_066.Color = _002.cyan
_066.Thickness = 1.5
_063.BackgroundColor3 = _002.bg
_064.Color = _002.dim
_064.Thickness = 1
end
_092()
end
_094("tagify")
_090(_006("Hello!"))
_068:GetPropertyChangedSignal("Text"):Connect(_092)
_063.MouseButton1Click:Connect(function() _094("tagify") end)
_065.MouseButton1Click:Connect(function() _094("untagify") end)
_078.MouseButton1Click:Connect(function()
if _085 == "tagify" then _090(_006(_068.Text)) end
end)
_079.MouseButton1Click:Connect(function()
if _086 == "" then return end
pcall(setclipboard, _086)
_079.Text = "copied!"
_079.TextColor3 = _002.green
_080.Color = _002.green
task.delay(1.8, function()
_079.Text = "copy"
_079.TextColor3 = _002.dim
_080.Color = _002.dim
end)
end)
_055.MouseButton1Click:Connect(function() _041:Destroy() end)
local _096 = false
_054.MouseButton1Click:Connect(function()
_096 = not _096
_056.Visible = not _096
_067.Visible = not _096
_046.Size = UDim2.new(0, _042, 0, _096 and _044 or _043)
_054.Text = _096 and "+" or "-"
end)
local _097, _098, _099 = false, nil, nil
_047.InputBegan:Connect(function(_100)
if _100.UserInputType == Enum.UserInputType.MouseButton1 then
_097 = true
_098 = _100.Position
_099 = _046.Position
_100.Changed:Connect(function()
if _100.UserInputState == Enum.UserInputState.End then _097 = false end
end)
end
end)
_001.InputChanged:Connect(function(_101)
if _097 and _101.UserInputType == Enum.UserInputType.MouseMovement then
local _102 = _101.Position - _098
_046.Position = UDim2.new(_099.X.Scale, _099.X.Offset + _102.X, _099.Y.Scale, _099.Y.Offset + _102.Y)
end
end)
end
local _100 = game:GetService("TweenService")
local _101 = _036 and 240 or 280
local _102 = _036 and 12 or 16
local _103 = Instance.new("ScreenGui")
_103.Name = "TagifyNotif"
_103.ResetOnSpawn = false
_103.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_103.DisplayOrder = 10
if not pcall(function() _103.Parent = gethui() end) then
pcall(function() _103.Parent = game:GetService("CoreGui") end)
end
local _104 = _015("Frame", _103, {
Size = UDim2.new(0, _101, 0, 0),
AnchorPoint = Vector2.new(0, 1),
Position = UDim2.new(0, -(_101 + _102 + 10), 1, -_102),
BackgroundColor3 = _002.purple,
BorderSizePixel = 0,
AutomaticSize = Enum.AutomaticSize.Y
})
_022(_104, 8)
_025(_104, _002.border, 1)
local _105 = _015("Frame", _104, {
Size = UDim2.new(0, _101 - 3, 0, 0),
Position = UDim2.new(0, 3, 0, 0),
BackgroundColor3 = _002.bar,
BorderSizePixel = 0,
AutomaticSize = Enum.AutomaticSize.Y
})
_029(_105, _036 and 8 or 10, _036 and 8 or 10, _036 and 8 or 10, _036 and 26 or 30)
_035(_105, Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center, _036 and 3 or 4)
local _106 = _015("TextLabel", _105, {
Size = UDim2.new(1, 0, 0, 0),
AutomaticSize = Enum.AutomaticSize.Y,
LayoutOrder = 1,
BackgroundTransparency = 1,
Text = "templatetext",
TextColor3 = _002.txt,
TextSize = _036 and 12 or 13,
Font = Enum.Font.GothamBold,
TextXAlignment = Enum.TextXAlignment.Left,
TextWrapped = true
})
local _107 = _015("TextLabel", _105, {
Size = UDim2.new(1, 0, 0, 0),
AutomaticSize = Enum.AutomaticSize.Y,
LayoutOrder = 2,
BackgroundTransparency = 1,
Text = "templatedesc",
TextColor3 = _002.dim,
TextSize = _036 and 10 or 11,
Font = Enum.Font.Code,
TextXAlignment = Enum.TextXAlignment.Left,
TextWrapped = true
})
local _108 = _015("TextButton", _104, {
Size = UDim2.new(0, _036 and 18 or 20, 0, _036 and 18 or 20),
Position = UDim2.new(1, -(_036 and 20 or 22), 0, 2),
BackgroundColor3 = _002.border,
Text = "X",
TextColor3 = _002.dim,
TextSize = _036 and 9 or 10,
Font = Enum.Font.GothamBold,
ZIndex = 5,
AutoButtonColor = false
})
_022(_108, 4)
local _109 = UDim2.new(0, -(_101 + _102 + 10), 1, -_102)
local _110 = UDim2.new(0, _102, 1, -_102)
local _111 = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local _112 = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
_108.MouseButton1Click:Connect(function()
_100:Create(_104, _112, {Position = _109}):Play()
end)
local function _113()
_104.Position = _109
_100:Create(_104, _111, {Position = _110}):Play()
end
_106.Text = "How to use Tagify?"
_107.Text = "Tagify: Lets you bypass text using rich text systems. For example, in TCO you paste it onto a spray or sign and its already bypassed. Untagify: Makes the exact opposite function."
_113()
