-- Rayfield Columns v1.0.0
-- A fan-made two-column edition of Rayfield Gen2. Unofficial: not made, endorsed or supported by Sirius.
--
-- local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/aesthetic143147-arch/Rayfield-preview-Gen2/main/dist/RayfieldColumns.luau"))()
--
-- Built on Rayfield Gen2 1.2.0 by Sirius - https://sirius.menu - https://github.com/SiriusSoftwareLtd/rayfield-gen2
-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
--
-- Source: https://github.com/aesthetic143147-arch/Rayfield-preview-Gen2
--
local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,c,d,e={function()local b,c,d=a(1)local e return(
function(...)local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.
types)export type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
ColumnSide=j.ColumnSide export type WindowConfiguration=j.WindowConfiguration export type WindowProps=j.WindowProps
export type TabProps=j.TabProps export type TagProps=j.TagProps export type SectionProps=j.SectionProps export type
GroupProps=j.GroupProps export type ButtonProps=j.ButtonProps export type ToggleProps=j.ToggleProps export type
SliderProps=j.SliderProps export type DropdownProps=j.DropdownProps export type InputProps=j.InputProps export type
KeybindProps=j.KeybindProps export type ColorPickerProps=j.ColorPickerProps export type StatProps=j.StatProps export
type ProgressProps=j.ProgressProps export type ConsoleProps=j.ConsoleProps export type ChatProps=j.ChatProps export type
ChatMessage=j.ChatMessage export type ChatTransport=j.ChatTransport export type TextProps=j.TextProps export type
DividerProps=j.DividerProps export type NotifyProps=j.NotifyProps export type ToastProps=j.ToastProps export type
PopupBox=j.PopupBox export type PopupOption=j.PopupOption export type PopupProps=j.PopupProps export type Moveable=j.
Moveable export type Lockable=j.Lockable export type Window=j.Window export type Tab=j.Tab export type Column=j.Column
export type Group=j.Group export type Button=j.Button export type Toggle=j.Toggle export type Slider=j.Slider export
type Dropdown=j.Dropdown export type Input=j.Input export type Keybind=j.Keybind export type ColorPicker=j.ColorPicker
export type Stat=j.Stat export type Progress=j.Progress export type Console=j.Console export type Chat=j.Chat export
type Nameplate=j.Nameplate export type NameplateProps=j.NameplateProps export type NameplateStyle=j.NameplateStyle
export type Section=j.Section export type TabSection=j.TabSection export type Text=j.Text export type Divider=j.Divider
export type Tag=j.Tag export type Popup=j.Popup export type Rayfield=j.Rayfield type WindowModule={new:(j.WindowProps)->
j.Window}local k={}::Rayfield function k.CreateWindow(l,m:j.WindowProps):j.Window local n:j.Window?,o:(()->())?if f.
secureMode then g.preload(function(p)if p<=0 then return end local function q()if not n or n.unloaded then return end n:
Notify{title=h.resolve'Secure mode',content=if p==1 then h.resolve"An asset couldn't be cached and won't appear."else h.
resolve"Some assets couldn't be cached and won't appear."}end if n then q()else o=q end end)end local p=(d(c.components.
window)::WindowModule).new(m)n=p if o then task.spawn(o)o=nil end if f.secureMode then task.spawn(function()local q,r=f.
fontManager:loadFont(i.fontAsset,Enum.FontWeight.Medium),f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.SemiBold)if
not p.unloaded and q and r and q~=f.fallbackFont and r~=f.fallbackFont then p:ChangeTheme{Font=q,TitleFont=r}end end)end
task.spawn(function()task.wait(0.5)if not p.unloaded then p:Show()end end)return p end return k end)()end,[3]=function()
local b,c,d=a(3)local e return(function(...)local f={}f.__index=f f.__type='Action'local g=c.Parent.Parent.utility local
h,i,j,k,l,m,n,o,p,q,r,s,t=d(g.variables),d(g.log),d(g.HapticEngine),d(g.constants),d(g.image),24,20,44,30,64,30,12,22
function f.new(u,v)v=if typeof(v)=='table'then v else{}local w=setmetatable({window=assert(u,
'Missing argument #1 (Window expected)'),name=v.name or v.Name or'Action',icon=assert(v.icon or v.Icon,
'Missing argument (Icon expected)'),callback=assert(v.callback or v.Callback,'Missing argument (Function expected)'),
linkedTab=v.linkedTab or v.LinkedTab},f)table.insert(w.window.actions,w)w.action=w.window:Create('Frame',{Name=w.name,
BorderSizePixel=0,LayoutOrder=-(v.order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Parent=w.window.
actionContainer})w.iconLabel=w.window:Create('ImageLabel',{Image=w.icon,Size=UDim2.fromOffset(20,20),BorderSizePixel=0,
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,ImageTransparency=1,Parent=w
.action},{ImageColor3='ActionColor'})w.interact=w.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,
Parent=w.action})local function x()if not w.window:_settled()then return end if w.linkedTab and w.window.selectedTab==w.
linkedTab then return end if w.isLit and w:isLit()then return end h.tweenService:Create(w.iconLabel,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end w.window:Connect(w.interact.
MouseButton1Click,function()j.click()task.spawn(function()local y,z=pcall(w.callback)if not y then i.warn(`Rayfield encountered an error, with the callback for a {
w.__type} component named '{w.name}':`)i.print(z)end x()end)end)w.window:Connect(w.interact.MouseEnter,function()if not
w.window:_interactive()then return end h.tweenService:Create(w.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.2}):Play()end)w.window:Connect(w.interact.MouseLeave,x)w:_fit()return w end
function f._fit(u)local v=h.userInputService.TouchEnabled==true local w=if v then t else n if v then local x=math.clamp(
math.ceil(o/(u.window.scale or 1)),p,q)u.action.Size=UDim2.fromOffset(r,x)u.interact.Size=UDim2.new(1,s,1,0)else u.
action.Size=UDim2.fromOffset(m,m)u.interact.Size=UDim2.fromScale(1,1)end local x=math.round(w*(k.actionIconScale[u.icon]
or 1))u.iconLabel.Size=UDim2.fromOffset(x,x)u.window.actionsListLayout.Padding=UDim.new(0,if v then 4 else 5)end
function f._setIcon(u,v)u.icon=v l.assign(u.iconLabel,'Image',v)u:_fit()end return f end)()end,[4]=function()local b,c,d
=a(4)local e return(function(...)local f={}f.__index=f f.__type='Button'local g=c.Parent.Parent.utility local h,i,j,k,l,
m=d(g.variables),d(g.functions),d(g.moveable),d(g.lockable),d(g.locale),d(g.HapticEngine)function f.new(n,o)o=if typeof(
o)=='table'then o else{}local p=setmetatable({tab=assert(n,'Missing argument #1 (Tab expected)'),window=n.window,name=o.
name or o.Name or'Button',icon=o.icon or o.Icon,description=o.description or o.Description,compact=n.compact or false,
callback=o.callback or o.Callback or function()end},f)if p.compact then p:_buildCompact()else p:_buildFull()end if p.
description and not p.compact then p.descriptor=d(c.Parent.descriptor).new(p.tab,{description=p.description})end return
p end function f._runCallback(n)n.window:_runGuarded(n,n.callback)end function f._buildFull(n)n.main=n.window:Create(
'Frame',{Size=UDim2.new(1,-20,0,43),BorderSizePixel=0,Name=n.name,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=n.tab.tabPage},{BackgroundTransparency='ElementTransparency'})n.stroke=n.window:
StyleElementBody(n.main)n.hoverOverlay=n.window:CreateHoverOverlay(n.main)n.container=n.window:Create('Frame',{
BorderSizePixel=0,Parent=n.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5)
,BackgroundTransparency=1})n.containerLayout=n.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,Parent=n.container})if n.icon then n.iconLabel=n.window:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=n.container},{ImageColor3='ContentColor'})end
n.title=n.window:Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=n.container},{TextColor3='ContentColor',FontFace='Font'})n.
interact=n.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=
UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=n.main})n.window:_wireElementHover(n
)n.window:ConnectFor(n,n.interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25
,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:Create(n.main,TweenInfo.new(0.6
,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,43)}):Play()n:_runCallback()task.wait(
0.11)h.tweenService:Create(n.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,43)}):Play()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{Transparency=n.window.theme.ElementStrokeTransparency}):Play()end)end function f._buildCompact(n)local o=n.window
n.main,n.stroke,n.interact=o:_buildCompactRow(n.tab,n.name)n.hoverOverlay=n.interact o:Create('UIPadding',{PaddingLeft=
UDim.new(0,16),PaddingRight=UDim.new(0,16),Parent=n.interact})o:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=
UDim.new(0,6),Parent=n.interact})if n.icon then n.iconLabel=o:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16
,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=n.interact},{ImageColor3=
'ContentColor'})end n.title=o:Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=n.interact},{TextColor3='ContentColor',
FontFace='Font'})o:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=n.title})n.window:_wireElementHover(n)n.
window:ConnectFor(n,n.interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()n:_runCallback()task.wait(0.11)h.tweenService:
Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=n.window.theme.
ElementStrokeTransparency}):Play()end)end function f._setShown(n,o,p)if o then n.window:_revealCommon(n,p)else n.window:
_hideCommon(n,p)end end function f._minWidth(n)local o=32 if n.icon then o+=22 end o+=i.textWidth(n.window.theme.Font,16
,l.resolve(n.name))return o end j(f)k(f)return f end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)
local f={}f.__index=f f.__type='Chat'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D
,E,F,G=d(g.variables),d(g.moveable),d(g.locale),d(g.relayClient),d(g.HapticEngine),260,140,14,18,10,34,28,10,10,3,1.5,12
,60,1.5,300,60,8,30,{'\u{1f600}','\u{1f602}','\u{1f923}','\u{1f60a}','\u{1f60d}','\u{1f60e}','\u{1f914}','\u{1f605}',
'\u{1f62d}','\u{1f621}','\u{1f972}','\u{1f634}','\u{1f44d}','\u{1f44e}','\u{1f44f}','\u{1f64f}','\u{1f91d}','\u{1f4aa}',
'\u{1f525}','\u{1f4af}','\u{2764}\u{fe0f}','\u{1f480}','\u{2728}','\u{1f389}','\u{1f440}','\u{1f3ae}','\u{1f680}',
'\u{2705}','\u{274c}','\u{2b50}','\u{1f48e}','\u{1f44b}'},{'discord%.gg/[%w%-]+','discord%.com/invite/[%w%-]+',
'discordapp%.com/invite/[%w%-]+'},{connecting='Connecting\u{2026}',live='\u{25cf} Live',offline='\u{25cf} Offline',
unconfigured='Not connected'}local function H(I:string):string I=I:gsub('<a?(:[%w_]+:)%d+>','%1')return I end
local function I(J:string):string?for K,L in F do local M=J:match(L)if M then return'https://'..M end end return nil end
local function J(K:number?):string if type(K)~='number'then return''end local L=os.date('*t',math.floor(K))if type(L)~=
'table'then return''end return string.format('%02d:%02d',L.hour,L.min)end function f.new(K,L)L=if typeof(L)=='table'then
L else{}local M=setmetatable({tab=assert(K,'Missing argument #1 (Tab expected)'),window=K.window,name=L.name or L.Name
or'Chat',description=L.description or L.Description,endpoint=L.endpoint or L.Endpoint,channel=L.channel or L.Channel or
'general',key=L.key or L.Key,transport=L.transport or L.Transport,height=math.max(tonumber(L.height or L.Height)or m,n),
pollInterval=math.max(tonumber(L.pollInterval or L.PollInterval)or v,w),autoPoll=L.poll~=false and L.Poll~=false,
maxMessages=math.max(tonumber(L.maxMessages or L.MaxMessages)or B,1),placeholder=L.placeholder or L.Placeholder or
'Message\u{2026}',emojis=L.emojis or L.Emojis or E,onMessage=L.onMessage or L.OnMessage,messages={},rows={},version=nil,
failures=0,lastSent=-math.huge,status='connecting',_textTransparency=1,_alive=true},f)M.endpoint=k.base(M.endpoint)if
not M.endpoint and not M.transport then M.status='unconfigured'end M:_build()M:_setStatus(M.status)if M.description then
M.descriptor=d(c.Parent.descriptor).new(M.tab,{description=M.description})end if M.autoPoll and M.status~='unconfigured'
then M:_startPolling()end return M end function f._request(K,L:string,M:string,N:any?)return k.request(K,L,M,N)end
local function K(L)return'/v1/chat/'..k.segment(L.channel)end function f.Refresh(L):boolean if not L._alive or L.status
=='unconfigured'then return false end local M=K(L)if L.version~=nil then M..='?since='..tostring(L.version)end local N,O
=L:_request('GET',M)if not N or type(O)~='table'then L.failures+=1 L:_setStatus'offline'return false end L.failures=0 L:
_setStatus'live'if O.unchanged then return true end L.version=O.version if type(O.messages)=='table'then L:_apply(O.
messages)end return true end function f.Send(L,M):(boolean,string?)if not L._alive then return false,'removed'end M=if
type(M)=='string'then M else tostring(M or'')M=M:gsub('^%s+',''):gsub('%s+$','')if M==''then return false,'empty'end if
utf8.len(M)and utf8.len(M)>A then return false,j.resolve('Messages can be up to '..A..' characters.')end local N=os.
clock()if N-L.lastSent<z then return false,j.resolve'Slow down a little.'end L.lastSent=N local O=h.localPlayer local P=
{id=if O then O.UserId else 0,name=if O then O.Name else'Player',displayName=if O then O.DisplayName else'Player'}local
Q,R=L:_request('POST',K(L),{content=M,user=P})if not Q then local S=if type(R)=='table'and type(R.error)=='string'then R
.error else"Couldn't send that message."return false,S end if type(R)=='table'and type(R.message)=='table'then local S=
table.clone(L.messages)table.insert(S,R.message)L:_apply(S)end return true end function f._startPolling(L)task.spawn(
function()while L._alive and not L.window.unloaded do L:Refresh()local M=L.pollInterval if L.window.hidden or not L:
_onScreen()then M=math.max(M,x)end if L.failures>0 then M=math.min(M*2^math.min(L.failures,5),y)end task.wait(M)end end)
end function f._onScreen(L):boolean local M=L.tab local N=M.tab or M return L.window.selectedTab==nil or L.window.
selectedTab==N end function f._build(L)local M,N=L.window,o+p+q+L.height+q+r+o L.main=M:Create('Frame',{Size=UDim2.new(1
,-20,0,N),BorderSizePixel=0,Name=L.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=L.
tab.tabPage},{BackgroundTransparency='ElementTransparency'})L.stroke=M:StyleElementBody(L.main)L.title=M:Create(
'TextLabel',{Text=j.t(L.name),Size=UDim2.new(0.6,0,0,p),Position=UDim2.fromOffset(o+2,o),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=L.main},{TextColor3=
'ContentColor',FontFace='Font'})L.statusLabel=M:Create('TextLabel',{Text='',AnchorPoint=Vector2.new(1,0),Size=UDim2.new(
0.4,0,0,p),Position=UDim2.new(1,-o-2,0,o),BackgroundTransparency=1,BorderSizePixel=0,TextSize=13,TextXAlignment=Enum.
TextXAlignment.Right,TextTransparency=1,Parent=L.main},{TextColor3='ContentColor',FontFace='Font'})local O=o+p+q L.panel
=M:Create('Frame',{Position=UDim2.fromOffset(o,O),Size=UDim2.new(1,-o*2,0,L.height),BorderSizePixel=0,ClipsDescendants=
true,BackgroundTransparency=1,Parent=L.main},{BackgroundColor3='StatBackground'})M:Create('UICorner',{Parent=L.panel},{
CornerRadius='ElementCornerRadius'})L.panelStroke=M:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=1,Parent=L.panel},{Color='SurfaceStroke'})L.scroll=M:Create('ScrollingFrame',{Size=UDim2.new(1,-u*2,1,-u*2)
,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=2,ScrollBarImageTransparency=
0.6,ScrollingDirection=Enum.ScrollingDirection.Y,Parent=L.panel},{ScrollBarImageColor3='ContentColor'})L.scrollLayout=M:
Create('UIListLayout',{Padding=UDim.new(0,t),FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.
LayoutOrder,Parent=L.scroll})L.emptyLabel=M:Create('TextLabel',{Text=j.t'No messages yet. Say hi!',Size=UDim2.fromScale(
1,1),BackgroundTransparency=1,TextSize=13,TextTransparency=1,Parent=L.panel},{TextColor3='ContentColor',FontFace='Font'}
)L.window:ConnectFor(L,L.scrollLayout:GetPropertyChangedSignal'AbsoluteContentSize',function()if L._pinned~=false then L
:_pin()end end)L.window:ConnectFor(L,L.scroll:GetPropertyChangedSignal'CanvasPosition',function()local P=L.scroll.
AbsoluteCanvasSize.Y-L.scroll.AbsoluteWindowSize.Y L._pinned=L.scroll.CanvasPosition.Y>=P-24 end)L:_buildInput(O+L.
height+q)L:_buildEmojiPicker()end function f._buildInput(L,M)local N,O=L.window,64 L.box=N:Create('Frame',{Position=
UDim2.fromOffset(o,M),Size=UDim2.new(1,-(o*2+r+O+16),0,r),BorderSizePixel=0,BackgroundTransparency=1,Parent=L.main},{
BackgroundColor3='FieldBackground'})N:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=L.box})L.boxStroke=N:Create(
'UIStroke',{Transparency=1,Parent=L.box},{Color='SurfaceStroke'})L.input=N:Create('TextBox',{Text='',PlaceholderText=j.
t(L.placeholder),Size=UDim2.new(1,-28,1,0),Position=UDim2.fromOffset(14,0),BackgroundTransparency=1,BorderSizePixel=0,
TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ClearTextOnFocus=false,
TextTransparency=1,Parent=L.box},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})L.
window:ConnectFor(L,L.input:GetPropertyChangedSignal'Text',function()local P=L.input.Text local Q=utf8.len(P)local R=if
Q and Q>A then utf8.offset(P,A+1)else nil if R then L.input.Text=P:sub(1,R-1)end end)L.window:ConnectFor(L,L.input.
FocusLost,function(P)if P then L:_submit()end end)L.emojiButton=N:Create('TextButton',{Text='\u{1f60a}',Size=UDim2.
fromOffset(r,r),Position=UDim2.new(1,-(o+O+8+r),0,M),BorderSizePixel=0,TextSize=16,AutoButtonColor=false,
BackgroundTransparency=1,TextTransparency=1,Parent=L.main},{BackgroundColor3='FieldBackground'})N:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=L.emojiButton})L.window:ConnectFor(L,L.emojiButton.MouseButton1Click,function()l.
click()L:_toggleEmojiPicker()end)L.sendButton=N:Create('TextButton',{Text=j.t'Send',Size=UDim2.fromOffset(O,r),Position=
UDim2.new(1,-(o+O),0,M),BorderSizePixel=0,TextSize=14,TextColor3=Color3.fromRGB(255,255,255),AutoButtonColor=false,
BackgroundTransparency=1,TextTransparency=1,Parent=L.main},{BackgroundColor3='AccentColor',FontFace='Font'})N:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=L.sendButton})L.window:ConnectFor(L,L.sendButton.MouseButton1Click,
function()l.click()L:_submit()end)end function f._buildEmojiPicker(L)local M,N=L.window,math.ceil(#L.emojis/C)L.picker=M
:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-6,1,-6),Size=UDim2.fromOffset(C*D+12,N*D+12),
BorderSizePixel=0,Visible=false,ZIndex=20,Parent=L.panel},{BackgroundColor3='WindowColor'})M:Create('UICorner',{Parent=L
.picker},{CornerRadius='ElementCornerRadius'})M:Create('UIStroke',{Transparency=0.85,Parent=L.picker},{Color=
'SurfaceStroke'})M:Create('UIPadding',{PaddingTop=UDim.new(0,6),PaddingBottom=UDim.new(0,6),PaddingLeft=UDim.new(0,6),
PaddingRight=UDim.new(0,6),Parent=L.picker})M:Create('UIGridLayout',{CellSize=UDim2.fromOffset(D,D),CellPadding=UDim2.
fromOffset(0,0),SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.picker})for O,P in L.emojis do local Q=M:Create(
'TextButton',{Text=P,TextSize=18,LayoutOrder=O,BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false,ZIndex=
21,Parent=L.picker})L.window:ConnectFor(L,Q.MouseButton1Click,function()l.click()L:_insert(P)end)end end function f.
_toggleEmojiPicker(L,M)if M==nil then M=not L.picker.Visible end L.picker.Visible=M end function f._insert(L,M)local N=L
.input.Text L.input.Text=N..(if N~=''and not N:match'%s$'then' 'else'')..M end function f._submit(L)local M=L.input.Text
if M:match'^%s*$'then return end L:_toggleEmojiPicker(false)task.spawn(function()local N,O=L:Send(M)if N then if L.input
.Text==M then L.input.Text=''end elseif O~='empty'and O~='removed'then L.window:Toast{title=j.resolve'Message not sent',
subtitle=O}end end)end function f._setStatus(L,M)L.status=M if L.statusLabel then L.statusLabel.Text=j.resolve(G[M]or M)
end end function f._pin(L)local M=L.scroll if not M or not M.Parent then return end M.CanvasPosition=Vector2.new(0,M.
AbsoluteCanvasSize.Y)end function f._apply(L,M)local N,O,P={},math.max(1,#M-L.maxMessages+1),{}for Q=O,#M do local R=M[Q
]if type(R)=='table'and R.id~=nil then local S=tostring(R.id)if not N[S]then N[S]=true table.insert(P,R)end end end for
Q,R in L.rows do if not N[Q]then R.frame:Destroy()L.rows[Q]=nil end end for Q,R in P do local S=tostring(R.id)local T,U=
L.rows[S],H(tostring(R.content or''))if not T then T=L:_makeRow(R,U)L.rows[S]=T if L.version~=nil and L._primed and L.
onMessage then L.window:_runGuarded(L,L.onMessage,R)end elseif T.content~=U then T.contentLabel.Text=U T.content=U end T
.frame.LayoutOrder=Q end L.messages=P L._primed=true L.emptyLabel.Visible=#P==0 end function f._makeRow(L,M,N)local O,P=
L.window,if type(M.author)=='table'then M.author else{}local Q,R,S,T=tostring(P.name or'Unknown'),P.discord==true,L.
_textTransparency,O:Create('Frame',{Size=UDim2.new(1,-4,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1
,BorderSizePixel=0,Parent=L.scroll})local U=O:Create('ImageLabel',{Size=UDim2.fromOffset(s,s),BackgroundTransparency=if
S<1 then 0.2 else 1,BorderSizePixel=0,ImageTransparency=S,Image=if tonumber(P.roblox)then`rbxthumb://type=AvatarHeadShot&id={
tonumber(P.roblox)}&w=48&h=48`else'',Parent=T},{BackgroundColor3=if R then'AccentColor'else'FieldBackground'})O:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=U})local V if not tonumber(P.roblox)then V=O:Create('TextLabel',{Text=
string.upper(Q:sub(1,1)),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,TextSize=13,TextColor3=Color3.fromRGB(255,
255,255),TextTransparency=S,Parent=U},{FontFace='Font'})end local W=O:Create('Frame',{Position=UDim2.fromOffset(s+10,0),
Size=UDim2.new(1,-(s+10),0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,Parent=T})O:
Create('UIListLayout',{Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder,Parent=W})local X=J(M.time)local Y,Z=O
:Create('TextLabel',{Text=Q..(if R then'  \u{b7}  Discord'else'')..(if X~=''then'  \u{b7}  '..X else''),Size=UDim2.new(1
,0,0,14),BackgroundTransparency=1,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.
AtEnd,RichText=false,LayoutOrder=1,TextTransparency=if S<1 then 0.45 else 1,Parent=W},{TextColor3='ContentColor',
FontFace='Font'}),O:Create('TextLabel',{Text=N,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,TextSize=14,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,RichText=false,LayoutOrder=2,TextTransparency=S,Parent=W},{TextColor3='ContentColor',FontFace='Font'}
)local _,aa={frame=T,avatar=U,initial=V,nameLabel=Y,contentLabel=Z,content=N},I(N)if aa then local ab=O:Create(
'TextButton',{Text=j.t'Copy invite',Size=UDim2.fromOffset(92,24),BorderSizePixel=0,TextSize=12,AutoButtonColor=false,
LayoutOrder=3,BackgroundTransparency=if S<1 then 0 else 1,TextTransparency=S,Parent=W},{BackgroundColor3='NeutralButton'
,TextColor3='ContentColor',FontFace='Font'})O:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=ab})L.window:
ConnectFor(L,ab.MouseButton1Click,function()l.click()L:_copy(aa)end)_.inviteButton=ab _.invite=aa end return _ end
function f._copy(aa,ab)local L=(getgenv and getgenv().setclipboard)or setclipboard local M=typeof(L)=='function'and(
pcall(L,ab))aa.window:Toast{title=j.resolve(if M then'Invite copied'else"Couldn't copy"),subtitle=ab}return M end
function f._setShown(aa,ab,L)local M=aa.window local N=M.theme M:_reveal(aa.main,{BackgroundTransparency=if ab then N.
ElementTransparency or 0 else 1},L)M:_reveal(aa.stroke,{Transparency=if ab then N.ElementStrokeTransparency else 1},L)M:
_reveal(aa.title,{TextTransparency=if ab then 0 else 1},L)M:_reveal(aa.statusLabel,{TextTransparency=if ab then 0.4 else
1},L)M:_reveal(aa.panel,{BackgroundTransparency=if ab then 0 else 1},L)M:_reveal(aa.panelStroke,{Transparency=if ab then
0.9 else 1},L)M:_reveal(aa.emptyLabel,{TextTransparency=if ab then 0.6 else 1},L)M:_reveal(aa.box,{
BackgroundTransparency=if ab then N.FieldTransparency else 1},L)M:_reveal(aa.boxStroke,{Transparency=if ab then 0.85
else 1},L)M:_reveal(aa.input,{TextTransparency=if ab then 0 else 1},L)M:_reveal(aa.emojiButton,{BackgroundTransparency=
if ab then N.FieldTransparency else 1,TextTransparency=if ab then 0 else 1},L)M:_reveal(aa.sendButton,{
BackgroundTransparency=if ab then 0 else 1,TextTransparency=if ab then 0 else 1},L)aa._textTransparency=if ab then 0
else 1 for O,P in aa.rows do M:_reveal(P.avatar,{ImageTransparency=aa._textTransparency,BackgroundTransparency=if ab
then 0.2 else 1},L)if P.initial then M:_reveal(P.initial,{TextTransparency=aa._textTransparency},L)end M:_reveal(P.
nameLabel,{TextTransparency=if ab then 0.45 else 1},L)M:_reveal(P.contentLabel,{TextTransparency=aa._textTransparency},L
)if P.inviteButton then M:_reveal(P.inviteButton,{BackgroundTransparency=if ab then 0 else 1,TextTransparency=aa.
_textTransparency},L)end end if not ab then aa:_toggleEmojiPicker(false)end if aa.descriptor then M:_reveal(aa.
descriptor.titleLabel,{TextTransparency=if ab then 0.7 else 1},L)end end function f.SetChannel(aa,ab,L)aa.channel=ab or
aa.channel if L then aa.endpoint=k.base(tostring(L))end aa.version=nil aa._primed=false aa:_apply{}local M=aa.status==
'unconfigured'aa:_setStatus'connecting'if M and aa.autoPoll then aa:_startPolling()end task.spawn(function()aa:Refresh()
end)end function f.Clear(aa)aa:_apply{}end function f.Remove(aa)aa._alive=false if aa.descriptor then aa.descriptor:
Remove()end if aa.tab._forget then aa.tab:_forget(aa)end aa.window:DestroySubtree(aa.main)end i(f)return f end)()end,[6]
=function()local aa,ab,b=a(6)local c return(function(...)local d=ab.Parent.Parent.utility local e,f,g,h,i,j,k=b(d.
variables),b(d.filesystem),b(d.constants),b(d.locale),b(d.HapticEngine),{},5 function j.buildCollapsedFace(l)local m=l.
showIconOnly l.collapsedIcon=l:Create('ImageLabel',{Name='CollapsedIcon',AnchorPoint=if m then Vector2.new(0.5,0.5)else
Vector2.new(0,0.5),Position=if m then UDim2.fromScale(0.5,0.5)else UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),
BackgroundTransparency=1,Image=l.showIcon,ZIndex=g.zIndex.restoreContent,ImageTransparency=1,Parent=l.main},{ImageColor3
='TitlingColor'})l:Create('UICorner',{Parent=l.collapsedIcon},{CornerRadius='PillCornerRadius'})local n=l:Create('Frame'
,{Name='CollapsedText',Visible=not m,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,
0,32),BackgroundTransparency=1,ZIndex=g.zIndex.restoreContent,Parent=l.main})l:Create('UIListLayout',{Padding=UDim.new(0
,1),VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=n})l.collapsedTitle=l:
Create('TextLabel',{Name='Title',Text=l.showName,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=e.brandFont(
Enum.FontWeight.Medium),RichText=true,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1
,ZIndex=g.zIndex.restoreContent,TextTransparency=1,Parent=n},{TextColor3='TitlingColor'})l.collapsedSubtitle=l:Create(
'TextLabel',{Name='Subtitle',Text=h.t'Tap to show',Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,FontFace=e.
brandFont(Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=g.zIndex.
restoreContent,TextTransparency=1,Parent=n},{TextColor3='TitlingColor'})l.collapsedInteract=l:Create('TextButton',{Name=
'CollapsedInteract',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,Visible=false,ZIndex=g
.zIndex.restoreInteract,Parent=l.main})j.bindCollapsedDrag(l)end function j.bindCollapsedDrag(l)local m,n,o,p,q=e.
userInputService,false,false,Vector2.zero,Vector2.zero local function r()if l.screenGui and l.screenGui.IgnoreGuiInset
then return e.guiService:GetGuiInset()end return Vector2.zero end l:Connect(l.collapsedInteract.InputBegan,function(s,t)
if t or not l.hidden or l.animating then return end local u=s.UserInputType.Name if u~='MouseButton1'and u~='Touch'then
return end n,o=true,false q=m:GetMouseLocation()p=l.main.AbsolutePosition+l.main.AbsoluteSize*l.main.AnchorPoint-q end)l
:Connect(m.InputEnded,function(s)local t=s.UserInputType.Name if t~='MouseButton1'and t~='Touch'then return end if not n
then return end n=false if o then l._collapsedPosition=l.main.Position return end i.click()l:ToggleHide()end)l:Connect(m
.WindowFocusReleased,function()n=false end)l:Connect(e.runService.RenderStepped,function()if not n then return end if
not l.hidden or l.animating then n=false return end local s=m:GetMouseLocation()if not o and(s-q).Magnitude<k then
return end o=true local t=s+p+r()l.main.Position=UDim2.fromOffset(t.X,t.Y)end)end function j.isNewUser()local l=e.
localPlayer if not l then return false end if typeof(f.isfile)~='function'or typeof(f.writefile)~='function'then return
true end local m,n,o=e.fileSystemManager:getPath'lastuser.txt',tostring(l.UserId),true pcall(function()if f.isfile(m)
then o=f.readfile(m)~=n end end)pcall(function()f.writefile(m,n)end)return o end function j.setCollapsedShown(l,m,n)
local o={[l.collapsedIcon]={ImageTransparency=if m then 0 else 1}}if not l.showIconOnly then o[l.collapsedTitle]={
TextTransparency=if m then 0 else 1}o[l.collapsedSubtitle]={TextTransparency=if m then 0.5 else 1}end for p,q in o do if
n then e.tweenService:Create(p,n,q):Play()else for r,s in q do p[r]=s end end end end return j end)()end,[7]=function()
local aa,ab,b=a(7)local c return(function(...)local d={}d.__index=d d.__type='ColorPicker'local e=ab.Parent.Parent.
utility local f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x=b(e.variables),b(e.functions),b(e.moveable),b(e.lockable),b(e.
constants),b(e.locale),b(e.HapticEngine),ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),
ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,0,255)),
ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))},41,52,
Vector2.new(150,120),184,10,214,10,240,62,8,400 local y,z,A,B,C,D,E,F={wide={height=190,previewPos=UDim2.new(1,-20,0,o+
39),previewSize=UDim2.new(1,-(u+20),0,78),hexPos=UDim2.new(0,u,0,o+90),hexSize=UDim2.new(1,-(u+20+v+w),0,30),
alphaFieldPos=UDim2.new(1,-(20+v),0,o+90),alphaFieldSize=UDim2.new(0,v,0,30)},narrow={height=296,previewPos=UDim2.new(1,
-20,0,o+p.Y+40),previewSize=UDim2.new(1,-40,0,56),hexPos=UDim2.new(0,20,0,o+p.Y+78),hexSize=UDim2.new(1,-(40+v+w),0,30),
alphaFieldPos=UDim2.new(1,-(20+v),0,o+p.Y+78),alphaFieldSize=UDim2.new(0,v,0,30)}},UDim2.new(1,-16,0,n/2),UDim2.
fromOffset(40,22),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo
.new(0.12,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out)local function G(H)return math.clamp(H,0,1)end local function H(I)return math.clamp(math.round(I),0,255)end local I
={black=Color3.fromRGB(0,0,0),white=Color3.fromRGB(255,255,255),red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(0,255,0
),blue=Color3.fromRGB(0,0,255),yellow=Color3.fromRGB(255,255,0),cyan=Color3.fromRGB(0,255,255),magenta=Color3.fromRGB(
255,0,255),orange=Color3.fromRGB(255,165,0),purple=Color3.fromRGB(128,0,128),pink=Color3.fromRGB(255,105,180),brown=
Color3.fromRGB(139,69,19),gray=Color3.fromRGB(128,128,128),grey=Color3.fromRGB(128,128,128)}local function J(K,L,M)if L
<=0 then return Color3.new(M,M,M)end local function N(O,P,Q)Q=Q%1 if Q<0.16666666666666666 then return O+(P-O)*6*Q
elseif Q<0.5 then return P elseif Q<0.6666666666666666 then return O+(P-O)*(0.6666666666666666-Q)*6 end return O end
local O=if M<0.5 then M*(1+L)else M+L-M*L local P=2*M-O return Color3.new(N(P,O,K+0.3333333333333333),N(P,O,K),N(P,O,K-
0.3333333333333333))end local function K(L)local M={}for N in L:gmatch'[%d%.]+'do table.insert(M,tonumber(N))end return
M end local function L(M)if typeof(M)~='string'then return nil end local N=(M:lower():match'^%s*(.-)%s*$')or''if N==''
then return nil end if I[N]then return I[N]end local O,P=N:match'^(%a+)',K(N)if(O=='hsv'or O=='hsb')and#P>=3 then local
Q,R,S=(P[1]%360)/360,if P[2]>1 then P[2]/100 else P[2],if P[3]>1 then P[3]/100 else P[3]return Color3.fromHSV(Q,G(R),G(S
))end if O=='hsl'and#P>=3 then local Q,R,S=(P[1]%360)/360,if P[2]>1 then P[2]/100 else P[2],if P[3]>1 then P[3]/100 else
P[3]return J(Q,G(R),G(S))end if(O=='rgb'or O=='rgba')and#P>=3 then return Color3.fromRGB(H(P[1]),H(P[2]),H(P[3]))end
local Q=N:match'^#?(%x%x%x%x%x%x)$'or N:match'^#?(%x%x%x)$'or N:match'^0x(%x%x%x%x%x%x)$'if Q then local R,S=pcall(
Color3.fromHex,Q)if R then return S end end if#P>=3 and not O then if P[1]<=1 and P[2]<=1 and P[3]<=1 then return Color3
.new(G(P[1]),G(P[2]),G(P[3]))end return Color3.fromRGB(H(P[1]),H(P[2]),H(P[3]))end return nil end local function M(N,O)
if typeof(N)=='Color3'then return N end if typeof(N)=='string'then return L(N)or O end return O end function d.new(N,O)O
=if typeof(O)=='table'then O else{}local P=setmetatable({tab=assert(N,'Missing argument #1 (Tab expected)'),window=N.
window,name=O.name or O.Name or'Color Picker',icon=O.icon or O.Icon,description=O.description or O.Description,
forgetState=O.forgetState or O.ForgetState or N.forgetState,callback=O.callback or O.Callback or function()end,_isOpen=
false},d)P.value=M(O.color or O.Color or O.value or O.Value or O.default,Color3.fromRGB(255,255,255))P.hue,P.sat,P.val=P
.value:ToHSV()local Q=O.alpha or O.Alpha P.alpha=if type(Q)=='number'then G(Q)else 1 P.flag=O.flag or O.Flag or(not P.
forgetState and g.deriveFlagFromName(P.name)or nil)P.window:_registerControl(P)P.main=P.window:Create('Frame',{Size=
UDim2.new(1,-20,0,n),BorderSizePixel=0,Name=P.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1
,Parent=P.tab.tabPage},{BackgroundTransparency='ElementTransparency'})P.stroke=P.window:StyleElementBody(P.main)P.
hoverOverlay=P.window:CreateHoverOverlay(P.main)P:_buildHeader()P:_buildPicker()P.window:ConnectFor(P,P.interact.
MouseButton1Click,function()l.click()if P._isOpen then P:_close()else P:_open()end end)P.window:ConnectFor(P,P.main.
MouseEnter,function()if P._isOpen or not P.window:_interactive()then return end local R=P.window.theme f.tweenService:
Create(P.stroke,C,{Transparency=R.ElementStrokeHoverTransparency,Color=R.ElementStrokeHover}):Play()f.tweenService:
Create(P.title,C,{TextColor3=R.ElementTextHoverColor}):Play()f.tweenService:Create(P.hoverOverlay,C,{
BackgroundTransparency=0.97}):Play()end)P.window:ConnectFor(P,P.main.MouseLeave,function()local R=P.window.theme f.
tweenService:Create(P.stroke,C,{Transparency=R.ElementStrokeTransparency,Color=R.ElementStroke}):Play()f.tweenService:
Create(P.title,C,{TextColor3=R.ContentColor}):Play()f.tweenService:Create(P.hoverOverlay,C,{BackgroundTransparency=1}):
Play()end)if P.description then P.descriptor=b(ab.Parent.descriptor).new(P.tab,{description=P.description})end P:
_applyPickerVisibility(false,false)P:_setControlsVisible(false)P.window:ConnectFor(P,P.main:GetPropertyChangedSignal
'AbsoluteSize',function()if P.window.animating or(P.window.hidden and P.window.hasShownOnce)then return end P:
_applyLayout()end)P:_applyLayout()P:_render'instant'return P end function d._buildHeader(N)N.container=N.window:Create(
'Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0,n/2),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency
=1,BorderSizePixel=0,ZIndex=5,Parent=N.main})N.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=N.
container})if N.icon then N.iconLabel=N.window:Create('ImageLabel',{Image=N.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=N.container},{ImageColor3='ContentColor'}
)end N.title=N.window:Create('TextLabel',{Text=k.t(N.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=N.container},{TextColor3='ContentColor',FontFace='Font'})N.preview=N.
window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=z,Size=A,BackgroundColor3=N.value,BorderSizePixel=0,
ZIndex=3,BackgroundTransparency=1,Parent=N.main})N.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=N.preview
})N.previewShadow=N.window:CreateGlow(N.preview,N.value,20,1)N.invisibleGroup=N.window:Create('Frame',{Size=UDim2.
fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=N.preview})N.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal
,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,
6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=N.invisibleGroup})N.invisibleIcon=N.window:Create('ImageLabel',{Image=j.
icons.colorpicker,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,ImageTransparency=1,
Parent=N.invisibleGroup},{ImageColor3='ContentColor'})N.invisibleText=N.window:Create('TextLabel',{Text=k.t'Invisible',
Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=N.invisibleGroup},{TextColor3='ContentColor',FontFace='Font'})N.
interact=N.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,n),Position=UDim2.fromScale(0,0),
BorderSizePixel=0,Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=10,Parent=N.main})end function d._buildMap(N)N
.map=N.window:Create('Frame',{Position=UDim2.fromOffset(20,o),Size=UDim2.fromOffset(p.X,p.Y),BackgroundColor3=Color3.
fromHSV(N.hue,1,1),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=N.main})N.window:Create('UICorner',{
CornerRadius=UDim.new(0,8),Parent=N.map})N.mapStroke=N.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Transparency=1,Parent=N.map})N.satOverlay=N.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=N.map})N.window:Create('UICorner',{
CornerRadius=UDim.new(0,8),Parent=N.satOverlay})N.window:Create('UIGradient',{Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)},Parent=N.satOverlay})N.valOverlay=N.window:Create(
'Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=4,
BackgroundTransparency=1,Parent=N.map})N.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=N.valOverlay})N.
window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0)},Parent=N.valOverlay})end function d._buildPicker(N)N:_buildMap()N.satCursor=N.window:
Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(12,12),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=6,BackgroundTransparency=1,Parent=N.map})N.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=N.satCursor})N.satCursorStroke=N.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2
,Transparency=1,Parent=N.satCursor})N.mapInteract=N.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=7,Parent=N.map})N.hueBar=N.window:Create('Frame',
{Position=UDim2.fromOffset(q,o),Size=UDim2.fromOffset(r,p.Y),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=N.main})N.window:Create('UICorner',{CornerRadius=UDim.new(1,0
),Parent=N.hueBar})N.window:Create('UIGradient',{Color=m,Rotation=90,Parent=N.hueBar})N.hueHandle=N.window:Create(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(r+8,8),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=N.hueBar})N.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=N.hueHandle})N.hueHandleStroke=N.window:Create('UIStroke',{Color=Color3.
fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=N.hueHandle})N.hueInteract=N.window:Create('TextButton',{
BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=N.hueBar})N.alphaBar=N.window:Create('Frame',{Position=
UDim2.fromOffset(s,o),Size=UDim2.fromOffset(t,p.Y),BackgroundColor3=N.value,BorderSizePixel=0,ZIndex=2,
BackgroundTransparency=1,Parent=N.main})N.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=N.alphaBar})N.
alphaGradient=N.window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)},Parent=N.alphaBar})N.alphaHandle=N.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(t+8,8),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=N.alphaBar})N.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=N.alphaHandle})N.alphaHandleStroke=N.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Thickness=2,Transparency=1,Parent=N.alphaHandle})N.alphaInteract=N.window:Create('TextButton',{BackgroundTransparency=1,
Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Text='',TextTransparency=1,
AutoButtonColor=false,ZIndex=6,Parent=N.alphaBar})N.hexBox=N.window:Create('Frame',{Position=UDim2.new(0,u,0,o+90),Size=
UDim2.new(1,-(u+20),0,30),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency
=1,Parent=N.main})N.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=N.hexBox})N.hexBoxStroke=N.window:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=N.hexBox})N.hexInput=N.window:Create(
'TextBox',{Text='#'..N.value:ToHex():upper(),PlaceholderText=k.t'Smart Input',Size=UDim2.new(1,-14,1,0),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency=1,Parent=N.hexBox},{
TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})N.alphaBox=N.window:Create('Frame',{
Position=UDim2.new(0,u,0,o+90),Size=UDim2.fromOffset(v,30),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=
0,ZIndex=2,BackgroundTransparency=1,Parent=N.main})N.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=N.
alphaBox})N.alphaBoxStroke=N.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=N.
alphaBox})N.alphaInput=N.window:Create('TextBox',{Text=tostring(math.round(N.alpha*100))..'%',PlaceholderText='100%',
Size=UDim2.new(1,-10,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency
=1,Parent=N.alphaBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})N.window:
ConnectFor(N,N.mapInteract.InputBegan,function(O)if O.UserInputType==Enum.UserInputType.MouseButton1 or O.UserInputType
==Enum.UserInputType.Touch then N:_beginDrag('sat',O.UserInputType==Enum.UserInputType.MouseButton1)end end)N.window:
ConnectFor(N,N.hueInteract.InputBegan,function(O)if O.UserInputType==Enum.UserInputType.MouseButton1 or O.UserInputType
==Enum.UserInputType.Touch then N:_beginDrag('hue',O.UserInputType==Enum.UserInputType.MouseButton1)end end)N.window:
ConnectFor(N,N.alphaInteract.InputBegan,function(O)if O.UserInputType==Enum.UserInputType.MouseButton1 or O.
UserInputType==Enum.UserInputType.Touch then N:_beginDrag('alpha',O.UserInputType==Enum.UserInputType.MouseButton1)end
end)N.window:ConnectFor(N,f.userInputService.InputEnded,function(O)if(O.UserInputType==Enum.UserInputType.MouseButton1
or O.UserInputType==Enum.UserInputType.Touch)and N._drag then N:_endDrag()end end)N.window:ConnectFor(N,N.hexInput.
FocusLost,function()local O=L(N.hexInput.Text)if O then N:Set(O)else N.hexInput.Text='#'..N.value:ToHex():upper()end end
)N.window:ConnectFor(N,N.alphaInput.FocusLost,function()local O=tonumber((N.alphaInput.Text:gsub('[^%d%.]','')))if O
then N:SetAlpha(G(O/100))else N.alphaInput.Text=tostring(math.round(N.alpha*100))..'%'end end)end function d._beginDrag(
N,O,P)if not N._isOpen then return end N._drag=O N._dragIsMouse=P N:_setHeld(O)N:_pump()if N._dragConnection then N.
_dragConnection:Disconnect()N._dragConnection=nil end N._dragConnection=f.runService.RenderStepped:Connect(function()
local Q=N._dragIsMouse and not f.userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)if N.window.
unloaded or not N._drag or Q then if Q then N:_endDrag()return end if N._dragConnection then N._dragConnection:
Disconnect()N._dragConnection=nil end return end N:_pump()end)end function d._endDrag(N)N._drag=nil N:_setHeld(nil)if N.
_dragConnection then N._dragConnection:Disconnect()N._dragConnection=nil end N.window:_persist(N)end function d._setHeld
(N,O)local P,Q,R=if O=='sat'then UDim2.fromOffset(16,16)else UDim2.fromOffset(12,12),if O=='hue'then UDim2.fromOffset(r+
12,10)else UDim2.fromOffset(r+8,8),if O=='alpha'then UDim2.fromOffset(t+12,10)else UDim2.fromOffset(t+8,8)f.tweenService
:Create(N.satCursor,F,{Size=P}):Play()f.tweenService:Create(N.hueHandle,F,{Size=Q}):Play()f.tweenService:Create(N.
alphaHandle,F,{Size=R}):Play()end function d._mouseLocation(N)local O,P=f.userInputService:GetMouseLocation(),N.window.
screenGui if P and P.IgnoreGuiInset then return O-f.guiService:GetGuiInset()end return O end function d._pump(N)local O,
P,Q,R=N.hue,N.sat,N.val,N.alpha if N._drag=='sat'then local S=N.map.AbsoluteSize if S.X<=0 or S.Y<=0 then return end
local T=N:_mouseLocation()N.sat=G((T.X-N.map.AbsolutePosition.X)/S.X)N.val=1-G((T.Y-N.map.AbsolutePosition.Y)/S.Y)elseif
N._drag=='hue'then local S=N.hueBar.AbsoluteSize.Y if S<=0 then return end local T=N:_mouseLocation()N.hue=G((T.Y-N.
hueBar.AbsolutePosition.Y)/S)elseif N._drag=='alpha'then local S=N.alphaBar.AbsoluteSize.Y if S<=0 then return end local
T=N:_mouseLocation()N.alpha=1-G((T.Y-N.alphaBar.AbsolutePosition.Y)/S)else return end if N.hue==O and N.sat==P and N.val
==Q and N.alpha==R then return end N.value=Color3.fromHSV(N.hue,N.sat,N.val)N:_render'drag'N:_fireCallback()end function
d._render(N,O)local P,Q,R,S,T,U=Color3.fromHSV(N.hue,1,1),UDim2.new(N.sat,0,1-N.val,0),UDim2.new(0.5,0,N.hue,0),UDim2.
new(0.5,0,1-N.alpha,0),1-N.alpha,1-0.4*N.alpha if O=='instant'then N.map.BackgroundColor3=P N.satCursor.Position,N.
satCursor.BackgroundColor3=Q,N.value N.hueHandle.Position,N.hueHandle.BackgroundColor3=R,P N.alphaBar.BackgroundColor3=N
.value N.alphaHandle.Position,N.alphaHandle.BackgroundColor3=S,N.value N.preview.BackgroundColor3=N.value N.
previewShadow.Color=N.value if not N.window.hidden then N.preview.BackgroundTransparency=T N.previewShadow.Transparency=
U end else local V=if O=='drag'then E else D f.tweenService:Create(N.map,V,{BackgroundColor3=P}):Play()f.tweenService:
Create(N.satCursor,V,{Position=Q,BackgroundColor3=N.value}):Play()f.tweenService:Create(N.hueHandle,V,{Position=R,
BackgroundColor3=P}):Play()f.tweenService:Create(N.alphaHandle,V,{Position=S,BackgroundColor3=N.value}):Play()f.
tweenService:Create(N.alphaBar,D,{BackgroundColor3=N.value}):Play()local W,X={BackgroundColor3=N.value},{Color=N.value}
if not N.window.hidden then W.BackgroundTransparency=T X.Transparency=U end f.tweenService:Create(N.preview,D,W):Play()f
.tweenService:Create(N.previewShadow,D,X):Play()end if not N.hexInput:IsFocused()then N.hexInput.Text='#'..N.value:
ToHex():upper()end if not N.alphaInput:IsFocused()then N.alphaInput.Text=tostring(math.round(N.alpha*100))..'%'end N:
_renderInvisible(O~='instant')end function d._renderInvisible(N,O)local P=0 if N._isOpen and not N.window.hidden then P=
G((0.12-N.alpha)/0.12)end local Q=1-P if O then f.tweenService:Create(N.invisibleIcon,C,{ImageTransparency=Q}):Play()f.
tweenService:Create(N.invisibleText,C,{TextTransparency=Q}):Play()else N.invisibleIcon.ImageTransparency=Q N.
invisibleText.TextTransparency=Q end end function d._fireCallback(N)N.window:_runGuarded(N,N.callback,N.value,N.alpha)
end function d._open(N)if N._isOpen then return end N._isOpen=true N:_setControlsVisible(true)if N._outsideClickConn
then N.window:Disconnect(N._outsideClickConn)end N._outsideClickConn=N.window:Connect(f.userInputService.InputBegan,
function(O)if O.UserInputType~=Enum.UserInputType.MouseButton1 and O.UserInputType~=Enum.UserInputType.Touch then return
end local P,Q,R=O.Position,N.main.AbsolutePosition,N.main.AbsoluteSize if P.X<Q.X or P.X>Q.X+R.X or P.Y<Q.Y or P.Y>Q.Y+R
.Y then N:_close()end end)f.tweenService:Create(N.main,B,{Size=UDim2.new(1,-20,0,N._openHeight)}):Play()f.tweenService:
Create(N.preview,B,{Position=N._previewOpenPos,Size=N._previewOpenSize}):Play()N:_applyPickerVisibility(true,true)N:
_renderInvisible(true)end function d._close(N)if not N._isOpen then return end N._isOpen=false if N._outsideClickConn
then N.window:Disconnect(N._outsideClickConn)N._outsideClickConn=nil end if N._drag then N:_endDrag()end if N.hexInput:
IsFocused()then N.hexInput:ReleaseFocus()end if N.alphaInput:IsFocused()then N.alphaInput:ReleaseFocus()end N:
_applyPickerVisibility(false,true)N:_renderInvisible(true)f.tweenService:Create(N.preview,B,{Position=z,Size=A}):Play()f
.tweenService:Create(N.main,B,{Size=UDim2.new(1,-20,0,n)}):Play()task.delay(C.Time,function()if not N._isOpen then N:
_setControlsVisible(false)end end)end function d._applyPickerVisibility(N,O,P)local Q={[N.map]={BackgroundTransparency=
if O then 0 else 1},[N.satOverlay]={BackgroundTransparency=if O then 0 else 1},[N.valOverlay]={BackgroundTransparency=if
O then 0 else 1},[N.mapStroke]={Transparency=if O then 0.9 else 1},[N.satCursor]={BackgroundTransparency=if O then 0
else 1},[N.satCursorStroke]={Transparency=if O then 0 else 1},[N.hueBar]={BackgroundTransparency=if O then 0 else 1},[N.
hueHandle]={BackgroundTransparency=if O then 0 else 1},[N.hueHandleStroke]={Transparency=if O then 0 else 1},[N.alphaBar
]={BackgroundTransparency=if O then 0 else 1},[N.alphaHandle]={BackgroundTransparency=if O then 0 else 1},[N.
alphaHandleStroke]={Transparency=if O then 0 else 1},[N.hexBox]={BackgroundTransparency=if O then 0.9 else 1},[N.
hexBoxStroke]={Transparency=if O then 0.85 else 1},[N.hexInput]={TextTransparency=if O then 0.4 else 1},[N.alphaBox]={
BackgroundTransparency=if O then 0.9 else 1},[N.alphaBoxStroke]={Transparency=if O then 0.85 else 1},[N.alphaInput]={
TextTransparency=if O then 0.4 else 1}}for R,S in Q do if P then f.tweenService:Create(R,C,S):Play()else for T,U in S do
R[T]=U end end end end function d._setControlsVisible(N,O)for P,Q in{N.map,N.hueBar,N.alphaBar,N.hexBox,N.alphaBox}do Q.
Visible=O end end function d._applyLayout(N)local O=N.main.AbsoluteSize.X local P=if O>0 and O<x then'narrow'else'wide'
if P==N._layoutMode then return end N._layoutMode=P local Q=y[P]N._openHeight=Q.height N._previewOpenPos=Q.previewPos N.
_previewOpenSize=Q.previewSize N.hexBox.Position=Q.hexPos N.hexBox.Size=Q.hexSize N.alphaBox.Position=Q.alphaFieldPos N.
alphaBox.Size=Q.alphaFieldSize if N._isOpen then f.tweenService:Create(N.main,B,{Size=UDim2.new(1,-20,0,N._openHeight)})
:Play()f.tweenService:Create(N.preview,B,{Position=N._previewOpenPos,Size=N._previewOpenSize}):Play()end end function d.
Set(N,O,P)N.value=M(O,N.value)N.hue,N.sat,N.val=N.value:ToHSV()N:_render(if N._isOpen then'animate'else'instant')if not
P then N:_fireCallback()N.window:_persist(N)end end function d.SetAlpha(N,O,P)N.alpha=G(if type(O)=='number'then O else
N.alpha)N:_render(if N._isOpen then'animate'else'instant')if not P then N:_fireCallback()N.window:_persist(N)end end
function d._serialize(N)return N.value:ToHex()..string.format('%02x',math.clamp(math.round((N.alpha or 1)*255),0,255))
end function d._deserialize(N,O)local P,Q=(tostring(O))if#P>=8 then Q=(tonumber(P:sub(7,8),16)or 255)/255 P=P:sub(1,6)
end local R,S=pcall(Color3.fromHex,P)if not R then return end if Q then N:SetAlpha(Q,true)end N:Set(S)end function d.
_setShown(N,O,P)local Q=N.window if O then Q:_revealCommon(N,P)Q:_reveal(N.preview,{BackgroundTransparency=1-N.alpha},P)
Q:_reveal(N.previewShadow,{Transparency=1-0.4*N.alpha},P)else Q:_hideCommon(N,P)Q:_reveal(N.preview,{
BackgroundTransparency=1},P)Q:_reveal(N.previewShadow,{Transparency=1},P)if N._isOpen then N:_close()end end end h(d)i(d
)return d end)()end,[8]=function()local aa,ab,b=a(8)local c return(function(...)local d={}d.__index=d d.__type='Column'
local e,f=b(ab.Parent.Parent.utility.ordering),7 function d.new(g,h)local i=setmetatable({tab=assert(g,
'Missing argument #1 (Tab expected)'),window=g.window,side=h,name=h,forgetState=g.forgetState,compact=false,direction=
Enum.FillDirection.Vertical,elements={}},d)i.main=i.window:Create('Frame',{Name=h,BackgroundTransparency=1,
BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.fromScale(0.5,0),LayoutOrder=if h=='Left'then 1 else 2,
Visible=false,Parent=g.columnsRow})i.layout=i.window:Create('UIListLayout',{Padding=UDim.new(0,f),FillDirection=Enum.
FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=i.main})i.tabPage=i.main i.scrollPage=g.tabPage return i end function d.
_register(g,h)table.insert(g.elements,h)e(h,#g.elements*10)table.insert(g.tab.elements,h)g.window:_restoreLate(h)if not
g.window.hidden then h:_setShown(true,true)end g.tab:_layoutColumns()return h end function d.CreateButton(g,h)return g:
_register(b(ab.Parent.button).new(g,h))end function d.CreateToggle(g,h)return g:_register(b(ab.Parent.toggle).new(g,h))
end function d.CreateSwitch(g,h)return g:CreateToggle(h)end function d.CreateSection(g,h)return g:_register(b(ab.Parent.
section).new(g,h))end function d.CreateText(g,h)return g:_register(b(ab.Parent.text).new(g,h))end function d.
CreateDivider(g,h)return g:_register(b(ab.Parent.divider).new(g,h))end function d.CreateStat(g,h)return g:_register(b(ab
.Parent.stat).new(g,h))end function d.CreateProgress(g,h)return g:_register(b(ab.Parent.progress).new(g,h))end function
d.CreateConsole(g,h)return g:_register(b(ab.Parent.console).new(g,h))end function d.CreateChat(g,h)return g:_register(b(
ab.Parent.chat).new(g,h))end function d.CreateSlider(g,h)return g:_register(b(ab.Parent.slider).new(g,h))end function d.
CreateDropdown(g,h)return g:_register(b(ab.Parent.dropdown).new(g,h))end function d.CreateInput(g,h)return g:_register(
b(ab.Parent.input).new(g,h))end function d.CreateKeybind(g,h)return g:_register(b(ab.Parent.keybind).new(g,h))end
function d.CreateColorPicker(g,h)return g:_register(b(ab.Parent.colorpicker).new(g,h))end function d.CreateGroup(g,h)
return g:_register(b(ab.Parent.group).new(g,h))end function d._forget(g,h)local i=table.find(g.elements,h)if i then
table.remove(g.elements,i)for j,k in g.elements do e(k,j*10)end end local j=table.find(g.tab.elements,h)if j then table.
remove(g.tab.elements,j)end g.window:_unregisterControl(h)if h.connections then g.window:DisconnectMany(h,h.connections)
h.connections=nil end g.tab:_layoutColumns()end function d._moveElement(g,h,i)local j=table.find(g.elements,h)if not j
then return end table.remove(g.elements,j)i=math.clamp(i,1,#g.elements+1)table.insert(g.elements,i,h)for k,l in g.
elements do e(l,k*10)end end return d end)()end,[9]=function()local aa,ab,b=a(9)local c return(function(...)local d={}d.
__index=d d.__type='Console'local e=ab.Parent.Parent.utility local f,g,h,i,j,k,l,m,n,o,p=b(e.moveable),b(e.locale),120,
48,24,17,12,12,1.25,200,Font.fromEnum(Enum.Font.Code)function d.new(q,r)r=if typeof(r)=='table'then r else{}local s=
setmetatable({tab=assert(q,'Missing argument #1 (Tab expected)'),window=q.window,name=r.name or r.Name,description=r.
description or r.Description,height=math.max(tonumber(r.height or r.Height)or h,i),follow=r.follow or r.Follow or false,
maxLines=math.max(tonumber(r.maxLines or r.MaxLines)or o,1),lines={},lineLabels={},head=1,nextOrder=1,textDirty=true},d)
s:_build()s:_setLines(r.text or r.Text or'')if s.description then s.descriptor=b(ab.Parent.descriptor).new(s.tab,{
description=s.description})end return s end function d.Get(q):string if q.textDirty then q.text=table.concat(q.lines,
'\n')q.textDirty=false end return q.text end function d._setLines(q,r)r=if type(r)=='string'then r else tostring(r)table
.clear(q.lines)if r~=''then for s in string.gmatch(r..'\n','([^\n]*)\n')do table.insert(q.lines,s)end end q:_trim()q:
_flush()end function d._trim(q)local r=#q.lines-q.maxLines if r<=0 then return end table.move(q.lines,r+1,#q.lines,1)for
s=#q.lines,#q.lines-r+1,-1 do q.lines[s]=nil end end function d._makeLabel(q)return q.window:Create('TextLabel',{Size=
UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,FontFace=p,TextSize=m,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,LineHeight=n,RichText=
false,TextTransparency=q._textTransparency or 1,Parent=q.scroll},{TextColor3='ContentColor'})end local function q(r:
string):string return if r==''then' 'else r end function d._flush(r)r.textDirty=true for s,t in r.lines do local u=r.
lineLabels[s]if not u then u=r:_makeLabel()r.lineLabels[s]=u end u.LayoutOrder=s u.Text=q(t)u.Visible=true end for s=#r.
lines+1,#r.lineLabels do r.lineLabels[s].Visible=false end r.head=1 r.nextOrder=#r.lines+1 r:_follow()end function d.
_pushLine(r,s:string)r.textDirty=true if#r.lines<r.maxLines then table.insert(r.lines,s)local t=#r.lines local u=r.
lineLabels[t]if not u then u=r:_makeLabel()r.lineLabels[t]=u end u.LayoutOrder=r.nextOrder u.Text=q(s)u.Visible=true r.
nextOrder+=1 return end table.move(r.lines,2,#r.lines,1)r.lines[#r.lines]=s local t=r.lineLabels[r.head]t.LayoutOrder=r.
nextOrder t.Text=q(s)t.Visible=true r.nextOrder+=1 r.head=(r.head%#r.lineLabels)+1 end function d._build(r)local s=if r.
name then j else 0 r.main=r.window:Create('Frame',{Size=UDim2.new(1,-20,0,r.height+s+k*2),BorderSizePixel=0,Name=r.name
or'Console',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=r.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})r.stroke=r.window:StyleElementBody(r.main)if r.name then r.container=r.
window:Create('Frame',{Size=UDim2.new(1,-k*2,0,16),Position=UDim2.new(0,k,0,k),BackgroundTransparency=1,BorderSizePixel=
0,Parent=r.main})r.title=r.window:Create('TextLabel',{Text=g.t(r.name),Size=UDim2.fromScale(1,1),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=r.container},{
TextColor3='ContentColor',FontFace='Font'})end r.panel=r.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=
UDim2.new(0.5,0,1,-k),Size=UDim2.new(1,-k*2,0,r.height),BorderSizePixel=0,ClipsDescendants=true,BackgroundTransparency=1
,Parent=r.main},{BackgroundColor3='StatBackground'})r.window:Create('UICorner',{Parent=r.panel},{CornerRadius=
'ElementCornerRadius'})r.panelStroke=r.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=1,Parent=r.panel},{Color='SurfaceStroke'})r.scroll=r.window:Create('ScrollingFrame',{Size=UDim2.new(1,-l*2,
1,-l*2),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.
ScrollingDirection.Y,Parent=r.panel})r.scrollLayout=r.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=r.scroll})r:_watchCanvas()end function d._pin(r)local s=r.scroll if not s or not s.Parent
then return end s.CanvasPosition=Vector2.new(0,s.AbsoluteCanvasSize.Y)end function d._follow(r)if not r.follow then
return end r:_pin()task.defer(function()r:_pin()end)end function d._watchCanvas(r)r.window:ConnectFor(r,r.scrollLayout:
GetPropertyChangedSignal'AbsoluteContentSize',function()if r.follow then r:_pin()end end)end function d.Set(r,s)r:
_setLines(s)end function d.Append(r,s)s=if type(s)=='string'then s else tostring(s)for t in string.gmatch(s..'\n',
'([^\n]*)\n')do r:_pushLine(t)end r:_follow()end function d.Clear(r)table.clear(r.lines)r:_flush()end function d.Copy(r)
:boolean local s=(getgenv and getgenv().setclipboard)or setclipboard if typeof(s)~='function'then return false end
return(pcall(s,r:Get()))end function d.SetHeight(r,s)r.height=math.max(tonumber(s)or h,i)local t=if r.name then j else 0
r.panel.Size=UDim2.new(1,-k*2,0,r.height)r.main.Size=UDim2.new(1,-20,0,r.height+t+k*2)end function d._setShown(r,s,t)
local u=r.window u:_reveal(r.main,{BackgroundTransparency=if s then u.theme.ElementTransparency or 0 else 1},t)u:
_reveal(r.stroke,{Transparency=if s then u.theme.ElementStrokeTransparency else 1},t)u:_reveal(r.panel,{
BackgroundTransparency=if s then 0 else 1},t)u:_reveal(r.panelStroke,{Transparency=if s then 0.9 else 1},t)r.
_textTransparency=if s then 0.15 else 1 for v,w in r.lineLabels do u:_reveal(w,{TextTransparency=r._textTransparency},t)
end if r.title then u:_reveal(r.title,{TextTransparency=if s then 0 else 1},t)end if r.descriptor then u:_reveal(r.
descriptor.titleLabel,{TextTransparency=if s then 0.7 else 1},t)end end function d.Remove(r)if r.descriptor then r.
descriptor:Remove()end if r.tab._forget then r.tab:_forget(r)end r.window:DestroySubtree(r.main)end f(d)return d end)()
end,[10]=function()local aa,ab,b=a(10)local c return(function(...)local d={}d.__index=d d.__type='Descriptor'local e=b(
ab.Parent.Parent.utility.locale)function d.new(f,g)g=if typeof(g)=='table'then g else{}local h=setmetatable({tab=assert(
f,'Missing argument #1 (Tab expected)'),window=f.window,description=g.description or g.Description or''},d)h.main=h.
window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.new(1,-30,0,0),Parent=h.
tab.tabPage})h.window:Create('UIListLayout',{SortOrder=Enum.SortOrder.LayoutOrder,Parent=h.main})h.titleLabel=h.window:
Create('TextLabel',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,RichText=true,Size=UDim2.new(1,-90,0,0),
Text=e.t(h.description),TextSize=12,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=h
.main},{TextColor3='ContentColor',FontFace='Font'})h.window:Create('Frame',{BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=1,Size=UDim2.fromOffset(0,15),Parent=h.main})return h end function d.Remove(f)if f.main then f.window:
DestroySubtree(f.main)f.main=nil end end return d end)()end,[11]=function()local aa,ab,b=a(11)local c return(function(
...)local d={}d.__index=d d.__type='Divider'local e,f,g,h,i,j,k,l,m=b(ab.Parent.Parent.utility.moveable),b(ab.Parent.
Parent.utility.locale),1,12,10,14,12,0.88,0.55 function d.new(n,o)o=if typeof(o)=='table'then o else{}local p,q=o.
spacing or o.Spacing,o.text or o.Text local r=setmetatable({tab=assert(n,'Missing argument #1 (Tab expected)'),window=n.
window,text=if q~=nil then tostring(q)else'',spacing=if type(p)=='number'then math.max(p,0)else h,line=o.line~=false and
o.Line~=false},d)r.main=r.window:Create('Frame',{Size=UDim2.new(1,-40,0,0),BorderSizePixel=0,Name='Divider',
BackgroundTransparency=1,Parent=r.tab.tabPage})r.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,Padding=UDim.new(0,i),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Center,Parent=r.main})if r.line then r.left=r:_buildHalf(1)end if r.text~=
''then r:_buildLabel()end r:_applyHeight()return r end function d._buildHalf(n,o)local p=n.window:Create('Frame',{Size=
UDim2.new(0,0,0,g),BorderSizePixel=0,LayoutOrder=o,BackgroundTransparency=1,Parent=n.main},{BackgroundColor3=
'ContentColor'})n.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=p})return p end function d.
_buildLabel(n)n.title=n.window:Create('TextLabel',{Text=f.t(n.text),Size=UDim2.fromOffset(0,j),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=k,TextXAlignment=Enum.TextXAlignment.Center,
LayoutOrder=2,TextTransparency=1,Parent=n.main},{TextColor3='ContentColor',FontFace='Font'})if n.line then n.right=n:
_buildHalf(3)end end function d._applyHeight(n)local o=if n.text~=''then j elseif n.line then g else 0 n.main.Size=UDim2
.new(1,-40,0,n.spacing*2+o)end function d.Set(n,o)n.text=if o~=nil then tostring(o)else''if n.text~=''and not n.title
then n:_buildLabel()if not n.window.hidden then n:_setShown(true,true)end end if n.title then n.window:_bindLocale(n.
title,'Text',n.text)local p=n.text~=''n.title.Visible=p if n.right then n.right.Visible=p end end n:_applyHeight()end
function d._setShown(n,o,p)local q,r=n.window,if o then l else 1 q:_reveal(n.left,{BackgroundTransparency=r},p)q:
_reveal(n.right,{BackgroundTransparency=r},p)q:_reveal(n.title,{TextTransparency=if o then m else 1},p)end e(d)return d
end)()end,[12]=function()local aa,ab,b=a(12)local c return(function(...)local d={}d.__index=d d.__type='Drag'local e=ab.
Parent.Parent.utility local f,g=b(e.variables),b(e.constants)function d.new(h,i)i=if typeof(i)=='table'then i else{}
local j=setmetatable({window=assert(h,'Missing argument #1 (Window expected)')},d)j.drag=j.window:Create('Frame',{
BackgroundTransparency=1,Size=UDim2.fromOffset(150,20),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,j.
window:_hang(j.window.size.Y.Offset)),ZIndex=g.zIndex.drag,Visible=false,Parent=j.window.screenGui})j.dragCosmetic=j.
window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.3),ZIndex=g.zIndex.drag,BackgroundTransparency=1,Size=UDim2.fromOffset(0,4),Parent=j.drag})j.window:
Create('UICorner',{CornerRadius=UDim.new(0,20),Parent=j.dragCosmetic})j.window:CreateGlow(j.dragCosmetic,Color3.fromRGB(
255,255,255),10,0.5)j.dragInteract=j.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
TextTransparency=1,ZIndex=g.zIndex.drag,Parent=j.drag})local k,l,m,n=false,Vector2.zero,(j.window.screenGui)if m and m.
IgnoreGuiInset then l=f.guiService:GetGuiInset()end local function o()local p,q,r=f.userInputService and f.
userInputService:GetMouseLocation()or Vector2.new(0,0),n or Vector2.new(0,0),l or Vector2.new(0,0)return p+q+r end
local function p()local q=o()local r,s=q.X,q.Y if j.window.settings and j.window.settings.keepOnScreen then local t,u,v=
j.window.main.AbsoluteSize,j.window.screenGui.AbsoluteSize,8 local w,x=t.X/2,t.Y/2 r=math.clamp(r,w+v,math.max(w+v,u.X-w
-v))s=math.clamp(s,x+v,math.max(x+v,u.Y-x-v))end local t,u=UDim2.fromOffset(r,s),UDim2.fromOffset(r,s+j.window:_hang(j.
window.main.Size.Y.Offset))return t,u end j.window:Connect(j.drag.MouseEnter,function()if not k and not j.window.hidden
then f.tweenService:Create(j.dragCosmetic,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
BackgroundTransparency=0.5,Size=UDim2.new(0,120,0,4)}):Play()end end)j.window:Connect(j.drag.MouseLeave,function()if not
k and not j.window.hidden then f.tweenService:Create(j.dragCosmetic,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.
EasingDirection.Out),{BackgroundTransparency=0.7,Size=UDim2.new(0,100,0,4)}):Play()end end)local function q()if not k
then return end k=false if not j.window:_interactive()then return end f.tweenService:Create(j.dragCosmetic,TweenInfo.
new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,100,0,4),BackgroundTransparency=0.7}):Play()
local r,s,t=TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),p()f.tweenService:Create(j.window.main,r,
{Position=s}):Play()f.tweenService:Create(j.drag,r,{Position=t}):Play()end j.window:Connect(j.dragInteract.InputBegan,
function(r,s)if s then return end local t=r.UserInputType.Name if t=='MouseButton1'or t=='Touch'then if not j.window:
_interactive()then return end k=true if m and m.IgnoreGuiInset then l=f.guiService:GetGuiInset()end n=j.window.main.
AbsolutePosition+j.window.main.AbsoluteSize*j.window.main.AnchorPoint-f.userInputService:GetMouseLocation()if not j.
window.hidden then f.tweenService:Create(j.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.
Out),{Size=UDim2.new(0,110,0,4),BackgroundTransparency=0}):Play()end end end)j.window:Connect(f.userInputService.
InputEnded,function(r)local s=r.UserInputType.Name if s=='MouseButton1'or s=='Touch'then q()end end)j.window:Connect(f.
userInputService.WindowFocusReleased,q)local r,s=1e-7,1e-60 j.window:Connect(f.runService.RenderStepped,function(t)if
not k then return end if not j.window:_interactive()then q()return end local u,v=p()j.window.main.Position=j.window.main
.Position:Lerp(u,1-r^t)j.drag.Position=j.drag.Position:Lerp(v,1-s^t)end)return j end return d end)()end,[13]=function()
local aa,ab,b=a(13)local c return(function(...)local d={}d.__index=d d.__type='Dropdown'local e=ab.Parent.Parent.utility
local f,g,h,i,j,k,l,m=b(e.variables),b(e.functions),b(e.image),b(e.constants),b(e.locale),b(e.HapticEngine),b(e.
windowSizing),b(e.lockable)local n,o,p,q,r,s,t,u,v,w,x,y,z,A,B=i.icons.chevron,i.icons.check,i.icons.dot,i.icons.search,
UDim.new(0,12),UDim.new(0,7),30,38,38,5,2,41,6,7,6 local C,D,E,F,G,H,I=A+B,4,22,TweenInfo.new(0.2,Enum.EasingStyle.Quint
,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.4,TweenInfo.new(0.35,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)local function J(K)local L,M={},{}for N,O in K do if typeof(O)==
'string'and not L[O]then L[O]=true table.insert(M,O)end end return M end local function K(L,M)if L==nil then return{}end
if typeof(L)=='string'then return{L}end if typeof(L)=='table'then local N=J(L)if not M and#N>1 then return{N[1]}end
return N end return{}end local function L(M,N)local O={}for P,Q in M do if table.find(N,Q)then table.insert(O,Q)end end
return O end local function M(N,O)if#N~=#O then return false end for P,Q in N do if not table.find(O,Q)then return false
end end return true end function d.new(N,O)O=if typeof(O)=='table'then O else{}local P,Q=O.options or O.Options or{},O.
multiSelect or O.MultiSelect or O.MultipleOptions or false local R=setmetatable({tab=assert(N,
'Missing argument #1 (Tab expected)'),window=N.window,name=O.name or O.Name or'Dropdown',icon=O.icon or O.Icon,
description=O.description or O.Description,forgetState=O.forgetState or O.ForgetState or N.forgetState,flag=O.flag or O.
Flag or(not(O.forgetState or O.ForgetState or N.forgetState)and g.deriveFlagFromName(O.name or O.Name or'Dropdown')or
nil),callback=O.callback or O.Callback or function()end,options=J(P),multiSelect=Q,placeholderText=j.resolve(O.
placeholder or O.Placeholder or'None'),value=K(O.value or O.Value or O.currentOption or O.CurrentOption,Q),_isOpen=false
,_optionFrames={}},d)R._desiredValue=R.value R.value=L(R.value,R.options)R.window:_registerControl(R)R.main=R.window:
Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=R.name,BackgroundTransparency=1,Parent=R.tab.tabPage})
R.top=R.window:Create('Frame',{Size=UDim2.new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,BackgroundColor3
=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ZIndex=1,Parent=R.main},{BackgroundTransparency=
'ElementTransparency'})R.stroke=R.window:StyleElementBody(R.top)R.hoverOverlay=R.window:CreateHoverOverlay(R.top)R.
flashTarget=R.top R.container=R.window:Create('Frame',{BorderSizePixel=0,Parent=R.top,Size=UDim2.new(0,170,0,16),
Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,ZIndex=5})R.containerLayout=R.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=R.container})if R.icon then R.
iconLabel=R.window:Create('ImageLabel',{Image=R.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=R.container},{ImageColor3='ContentColor'})end R.title=R.
window:Create('TextLabel',{Text=j.t(R.name),Size=UDim2.fromOffset(150,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=R.container},{TextColor3='ContentColor',FontFace='Font'})R.selectedLabel=R.window:
Create('TextLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-41,0.5,0),Size=UDim2.new(0.5,-41,0,15),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,TextXAlignment=Enum.TextXAlignment.Right,TextTruncate=Enum.
TextTruncate.AtEnd,TextTransparency=1,ZIndex=5,Parent=R.top},{TextColor3='ContentColor',FontFace='Font'})R.window:
Create('UISizeConstraint',{MaxSize=Vector2.new(168,15),Parent=R.selectedLabel})R.chevron=R.window:Create('ImageLabel',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,0.5,0),Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,Image='rbxassetid://'..tostring(n),Rotation=180,ImageTransparency=1,ZIndex=5,Parent=R.top},{
ImageColor3='ContentColor'})R.interact=R.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,41),
Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=10,AutoButtonColor=false,Parent=R.main
})R.panel=R.window:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),Size=UDim2.new(1,0,1,-(y+z))
,BorderSizePixel=0,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=1,BackgroundTransparency=1,
Parent=R.main})R.panelStroke=R.window:StyleElementPanel(R.panel)R.window:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=R.panel})R.window:Create('UIPadding',{PaddingTop=
UDim.new(0,A),PaddingBottom=UDim.new(0,B),Parent=R.panel})R:_buildSearch()R:_buildActions()R.list=R.window:Create(
'ScrollingFrame',{Active=true,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),ScrollBarImageColor3=Color3.fromRGB(240,240,240),
ScrollBarThickness=3,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=3,ZIndex=1,
Parent=R.panel})R.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=R.list})R.window:ConnectFor(R,R.list:
GetPropertyChangedSignal'CanvasPosition',function()R:_syncScrollHint()end)R.window:ConnectFor(R,R.list:
GetPropertyChangedSignal'AbsoluteCanvasSize',function()R:_syncScrollHint()end)R.window:ConnectFor(R,R.list:
GetPropertyChangedSignal'AbsoluteWindowSize',function()R:_syncScrollHint()end)R.listLayout=R.window:Create(
'UIListLayout',{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.
Center,Parent=R.list})R.window:Create('UIPadding',{PaddingTop=UDim.new(0,x),PaddingBottom=UDim.new(0,x),Parent=R.list})R
.emptyLabel=R.window:Create('TextLabel',{Name='Empty',Size=UDim2.new(1,-12,0,v),BackgroundTransparency=1,Text=j.t
'No matches',TextSize=14,TextTransparency=0.55,Visible=false,LayoutOrder=1,Parent=R.list},{TextColor3='ContentColor',
FontFace='Font'})local function S(T)return table.find(R.value,T)~=nil end local function T(U,V)local W=S(U.name)local X,
Y,Z,_=if R._isOpen then(W and 0.9 or 0.95)else 1,if R._isOpen then(W and 0 or 0.3)else 1,if R._isOpen then(W and 0 or
0.7)else 1,if R._isOpen then(W and 0.85 or 0.93)else 1 h.assign(U.checkIcon,'Image',if W then o else p)if V then local
ac=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)f.tweenService:Create(U.frame,ac,{
BackgroundTransparency=X}):Play()f.tweenService:Create(U.title,ac,{TextTransparency=Y}):Play()f.tweenService:Create(U.
checkIcon,ac,{ImageTransparency=Z}):Play()f.tweenService:Create(U.stroke,ac,{Transparency=_}):Play()else U.frame.
BackgroundTransparency=X U.title.TextTransparency=Y U.checkIcon.ImageTransparency=Z U.stroke.Transparency=_ end end
local function ac()if R.multiSelect then local U=#R.value if U==0 then R.selectedLabel.Text=R.placeholderText elseif U==
1 then R.selectedLabel.Text=R.value[1]else R.selectedLabel.Text=j.resolve'Various'end else R.selectedLabel.Text=R.value[
1]or R.placeholderText end end R._renderOptionState=T R._updateSelectedLabel=ac local function U(V)local W=R.window:
Create('Frame',{Size=UDim2.new(1,-12,0,v),BorderSizePixel=0,LayoutOrder=#R._optionFrames+1,BackgroundTransparency=1,
Parent=R.list},{BackgroundColor3='DropdownHighlight'})local X,Y,Z,_=R.window:Create('UICorner',{CornerRadius=s,Parent=W}
),R.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=W}),R.window:Create('TextButton',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=50,Parent=W}),R.window:Create(
'Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,0.5,0),Size=UDim2.fromOffset(170,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,Parent=W})R.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=_})
local ad,ae=R.window:Create('ImageLabel',{Image='rbxassetid://'..tostring(o),Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=_},{ImageColor3='ContentColor'}),R.window
:Create('TextLabel',{Text=V,Size=UDim2.fromOffset(170,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,ZIndex=5,Parent=_},{TextColor3
='ContentColor',FontFace='Font'})local af={name=V,frame=W,interact=Z,title=ae,checkIcon=ad,container=_,stroke=Y,corner=X
,connections={}}table.insert(af.connections,R.window:ConnectFor(R,W.MouseEnter,function()if not R._isOpen or not R.
window:_interactive()then return end if S(af.name)then return end f.tweenService:Create(W,TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.9}):Play()f.tweenService:Create(ae,TweenInfo.new(
0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.15}):Play()end))table.insert(af.connections,R.
window:ConnectFor(R,W.MouseLeave,function()if not R._isOpen then return end if S(af.name)then return end f.tweenService:
Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.95}):Play()f.
tweenService:Create(ae,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.3}):Play()
end))table.insert(af.connections,R.window:ConnectFor(R,Z.MouseButton1Click,function()if not R._isOpen then return end k.
click()local ag=S(af.name)if not R.multiSelect then if ag then R:_close()return end table.clear(R.value)table.insert(R.
value,af.name)else if ag then local ah=table.find(R.value,af.name)if ah then table.remove(R.value,ah)end else table.
insert(R.value,af.name)end end R._desiredValue=table.clone(R.value)for ah,ai in R._optionFrames do T(ai,true)end ac()R.
window:_runGuarded(R,R.callback,R:_callbackValue())R.window:_persist(R)if not R.multiSelect then task.wait(0.1)R:_close(
)end end))return af end R._buildOption=U for ad,ae in R.options do local af=U(ae)table.insert(R._optionFrames,af)end ac(
)R:_updateCorners()R.window:ConnectFor(R,R.interact.MouseButton1Click,function()k.click()if R._isOpen then R:_close()
else R:_open()end end)R.window:ConnectFor(R,R.main.MouseEnter,function()if R._isOpen or not R.window:_interactive()then
return end f.tweenService:Create(R.title,G,{TextColor3=R.window.theme.ElementTextHoverColor}):Play()f.tweenService:
Create(R.hoverOverlay,G,{BackgroundTransparency=0.97}):Play()f.tweenService:Create(R.stroke,G,{Transparency=R.window.
theme.ElementStrokeHoverTransparency,Color=R.window.theme.ElementStrokeHover}):Play()end)R.window:ConnectFor(R,R.main.
MouseLeave,function()f.tweenService:Create(R.title,G,{TextColor3=R.window.theme.ContentColor}):Play()f.tweenService:
Create(R.hoverOverlay,G,{BackgroundTransparency=1}):Play()f.tweenService:Create(R.stroke,G,{Transparency=R.window.theme.
ElementStrokeTransparency,Color=R.window.theme.ElementStroke}):Play()end)if R.description then R.descriptor=b(ab.Parent.
descriptor).new(R.tab,{description=R.description})end return R end function d._callbackValue(ac)if ac.multiSelect then
return table.clone(ac.value)end return ac.value[1]end function d._buildSearch(ac)ac._searchOpen=false ac.searchbar=ac.
window:Create('Frame',{Name='Search',Size=UDim2.new(1,-12,0,t),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,LayoutOrder=1,ClipsDescendants=false,ZIndex=1,Parent=ac.panel})ac.window:Create(
'UICorner',{CornerRadius=UDim.new(0,12),Parent=ac.searchbar})ac.searchStroke=ac.window:Create('UIStroke',{Color=Color3.
fromRGB(255,255,255),Transparency=1,Parent=ac.searchbar})ac.searchShadow=ac.window:CreateGlow(ac.searchbar,Color3.
fromRGB(255,255,255),20,1)ac.searchToggle=ac.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1
,1),Text='',TextTransparency=1,ZIndex=51,Parent=ac.searchbar})ac.searchInput=ac.window:Create('TextBox',{Text='',
PlaceholderText=j.t'Search...',Size=UDim2.new(1,-58,0,16),Position=UDim2.new(0,44,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,TextEditable=false,
Interactable=false,ZIndex=52,TextTransparency=1,Parent=ac.searchbar},{TextColor3='ContentColor',FontFace='Font',
PlaceholderColor3='PlaceholderColor'})ac.searchIcon=ac.window:Create('ImageButton',{Image='rbxassetid://'..tostring(q),
Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,24,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,ZIndex=53,ImageTransparency=1,Parent=ac.searchbar},{ImageColor3=
'ContentColor'})ac.window:ConnectFor(ac,ac.searchToggle.MouseButton1Click,function()if not ac._searchOpen then ac:
_expandSearch()end end)ac.window:ConnectFor(ac,ac.searchIcon.MouseButton1Click,function()if ac._searchOpen then ac:
_collapseSearch()else ac:_expandSearch()end end)ac.window:ConnectFor(ac,ac.searchInput:GetPropertyChangedSignal'Text',
function()ac:_applyFilter(ac.searchInput.Text)end)ac.window:ConnectFor(ac,ac.searchInput.FocusLost,function()if ac.
searchInput.Text==''then ac:_collapseSearch()end end)end function d._expandSearch(ac)if ac._searchOpen then return end
ac._searchOpen=true ac.searchInput.TextEditable=true ac.searchInput.Interactable=true f.tweenService:Create(ac.searchbar
,I,{Size=UDim2.new(1,-12,0,u),BackgroundTransparency=0.92}):Play()f.tweenService:Create(ac.searchStroke,I,{Transparency=
0.86}):Play()f.tweenService:Create(ac.searchShadow,I,{Transparency=0.92}):Play()f.tweenService:Create(ac.searchInput,I,{
TextTransparency=0.3}):Play()ac:_resizeToOptions()ac.searchInput:CaptureFocus()end function d._collapseSearch(ac)if not
ac._searchOpen then return end ac._searchOpen=false ac.searchInput.TextEditable=false ac.searchInput.Interactable=false
ac.searchInput:ReleaseFocus()ac.searchInput.Text=''f.tweenService:Create(ac.searchbar,I,{Size=UDim2.new(1,-12,0,t),
BackgroundTransparency=1}):Play()f.tweenService:Create(ac.searchStroke,I,{Transparency=1}):Play()f.tweenService:Create(
ac.searchShadow,I,{Transparency=1}):Play()f.tweenService:Create(ac.searchInput,I,{TextTransparency=1}):Play()ac:
_resizeToOptions()end function d._applyFilter(ac,ad)ad=string.lower(ad or'')local ae=0 for af,ag in ac._optionFrames do
local ah=ad==''or string.find(string.lower(ag.name),ad,1,true)~=nil ag.frame.Visible=ah if ah then ae+=1 end end ac.
emptyLabel.Visible=ae==0 and ad~=''ac:_updateCorners()ac:_resizeToOptions()ac:_syncScrollHint()end function d.
_syncScrollHint(ac)local ad,ae,af=ac.list.AbsoluteCanvasSize,ac.list.AbsoluteWindowSize,ac.list.CanvasPosition if not ad
or not ae or not af then return end local ag=ac._isOpen and ae.Y>0 and ad.Y-(af.Y+ae.Y)>1 f.tweenService:Create(ac.list,
F,{ScrollBarImageTransparency=if ag then H else 1}):Play()end function d._visibleOptions(ac):{string}local ad={}for ae,
af in ac._optionFrames do if af.frame.Visible then table.insert(ad,af.name)end end return ad end function d.
_buildActions(ac)if not ac.multiSelect then return end ac.actions=ac.window:Create('Frame',{Name='Actions',Size=UDim2.
new(1,-12,0,E),BackgroundTransparency=1,LayoutOrder=2,Parent=ac.panel})ac.window:Create('UIListLayout',{Padding=UDim.
new(0,12),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=ac.actions})local function ad(ae:string,af:number,ag:()->())local ah=ac.window:Create(
'TextButton',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,E),BackgroundTransparency=1,Text=j.t(ae),
TextSize=13,TextTransparency=0.45,LayoutOrder=af,Parent=ac.actions},{TextColor3='ContentColor',FontFace='Font'})ac.
window:ConnectFor(ac,ah.MouseEnter,function()f.tweenService:Create(ah,F,{TextTransparency=0.15}):Play()end)ac.window:
ConnectFor(ac,ah.MouseLeave,function()f.tweenService:Create(ah,F,{TextTransparency=0.45}):Play()end)ac.window:
ConnectFor(ac,ah.MouseButton1Click,function()ag()ac:_afterBulkChange()end)return ah end ad('Select all',1,function()
local ae=ac:_visibleOptions()for af,ag in ae do if not table.find(ac.value,ag)then table.insert(ac.value,ag)end end end)
ad('Clear',2,function()local ae=ac:_visibleOptions()for af=#ac.value,1,-1 do if table.find(ae,ac.value[af])then table.
remove(ac.value,af)end end end)end function d._afterBulkChange(ac)ac._desiredValue=table.clone(ac.value)for ad,ae in ac.
_optionFrames do ac._renderOptionState(ae,true)end ac:_updateSelectedLabel()ac:_updateCorners()ac.window:_runGuarded(ac,
ac.callback,ac:_callbackValue())ac.window:_persist(ac)k.click()end function d._resizeToOptions(ac)if not ac._isOpen then
return end f.tweenService:Create(ac.main,I,{Size=UDim2.new(1,-20,0,ac:_openHeight())}):Play()end function d.
_updateCorners(ac)local ad={}for ae,af in ac._optionFrames do if af.frame.Visible then table.insert(ad,af)end end for ae
,af in ad do local ag,ah=if ae==1 then r else s,if ae==#ad then r else s af.corner.TopLeftRadius=ag af.corner.
TopRightRadius=ag af.corner.BottomLeftRadius=ah af.corner.BottomRightRadius=ah end end local function ac(ad:number):
number return ad*v+math.max(0,ad-1)*w+x*2 end local function ad(ae:number):number return math.max(math.floor((ae-x*2+w)/
(v+w)),1)end function d._pageHeight(ae):number local af=ae.window.size return l.pageHeight(af and af.Y.Offset,ae.window.
layout.mode)end function d._openHeight(ae)local af=0 for ag,ah in ae._optionFrames do if ah.frame.Visible then af+=1 end
end local ag=if ae._searchOpen then u else t local ah,ai=y+z+C+ag+w+(if ae.actions then E+w else 0),ae:_pageHeight()
local N=math.min(math.max(af,1),D,ad(ai-ah))return math.min(ah+ac(N),ai)end function d._open(ae)if ae._isOpen then
return end ae._isOpen=true if ae._outsideClickConn then ae.window:Disconnect(ae._outsideClickConn)end ae.
_outsideClickConn=ae.window:Connect(f.userInputService.InputBegan,function(af)if af.UserInputType~=Enum.UserInputType.
MouseButton1 and af.UserInputType~=Enum.UserInputType.Touch then return end local ag,ah,ai=af.Position,ae.main.
AbsolutePosition,ae.main.AbsoluteSize if ag.X<ah.X or ag.X>ah.X+ai.X or ag.Y<ah.Y or ag.Y>ah.Y+ai.Y then ae:_close()end
end)f.tweenService:Create(ae.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,ae:_openHeight())}):Play()f.tweenService:Create(ae.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Rotation=0}):Play()f.tweenService:Create(ae.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{BackgroundTransparency=ae.window.theme.ElementTransparency or 0}):Play()f.tweenService:
Create(ae.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=ae.window.theme.
ElementStrokeTransparency}):Play()f.tweenService:Create(ae.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.5}):Play()for af,ag in ae._optionFrames do ae._renderOptionState(ag,true)end
ae:_syncScrollHint()ae:_bringIntoView()end function d._bringIntoView(ae)local af=ae.tab local ag=af and(af.scrollPage or
af.tabPage)if not ag or not ag:IsA'ScrollingFrame'then return end local ah,ai,N,O=ag.AbsoluteWindowSize,ag.
CanvasPosition,ag.AbsolutePosition,ae.main.AbsolutePosition if not ah or not ai or not N or not O or ah.Y<=0 then return
end local P=O.Y-N.Y+ai.Y local Q=P+ae:_openHeight()local R=Q-(ai.Y+ah.Y)if R<=0 then return end local S=math.min(ai.Y+R+
8,P)f.tweenService:Create(ag,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{CanvasPosition=Vector2.
new(ai.X,S)}):Play()end function d._close(ae)if not ae._isOpen then return end ae._isOpen=false if ae._outsideClickConn
then ae.window:Disconnect(ae._outsideClickConn)ae._outsideClickConn=nil end ae:_collapseSearch()ae:_syncScrollHint()f.
tweenService:Create(ae.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Rotation=180}):
Play()f.tweenService:Create(ae.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
BackgroundTransparency=1}):Play()f.tweenService:Create(ae.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=1}):Play()f.tweenService:Create(ae.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),{ImageTransparency=1}):Play()for af,ag in ae._optionFrames do ae._renderOptionState(ag,
true)end f.tweenService:Create(ae.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=
UDim2.new(1,-20,0,41)}):Play()end function d._destroyOption(ae,af)if af.connections then for ag,ah in af.connections do
local ai=table.find(ae.connections,ah)if ai then table.remove(ae.connections,ai)end ae.window:Disconnect(ah)end af.
connections=nil end ae.window:DestroySubtree(af.frame)end function d._deriveSelection(ae)local af=ae.value ae.value=L(ae
._desiredValue or ae.value,ae.options)return not M(ae.value,af)end function d._reindexOptions(ae)for af,ag in ae.
_optionFrames do ag.frame.LayoutOrder=af end end function d._rebindOption(ae,af,ag,ah)af.name=ag af.title.Text=ag af.
frame.LayoutOrder=ah end function d._destroyOptionsFrom(ae,af)local ag,ah={},{}for ai=#ae._optionFrames,af,-1 do local N
=ae._optionFrames[ai]table.insert(ag,N.frame)if N.connections then table.move(N.connections,1,#N.connections,#ah+1,ah)N.
connections=nil end ae._optionFrames[ai]=nil end ae.window:DisconnectMany(ae,ah)ae.window:DestroySubtrees(ag)end
function d.Refresh(ae,af)ae.options=J(af or{})local ag,ah,ai=ae:_deriveSelection(),#ae._optionFrames,#ae.options for N=1
,math.min(ah,ai)do ae:_rebindOption(ae._optionFrames[N],ae.options[N],N)end for N=ah+1,ai do local O=ae._buildOption(ae.
options[N])O.frame.LayoutOrder=N table.insert(ae._optionFrames,O)end if ai<ah then ae:_destroyOptionsFrom(ai+1)end for N
,O in ae._optionFrames do ae._renderOptionState(O,false)end ae._updateSelectedLabel()ae:_applyFilter(if ae._searchOpen
then ae.searchInput.Text else'')if ag then ae.window:_runGuarded(ae,ae.callback,ae:_callbackValue())ae.window:_persist(
ae)end end function d.Add(ae,af)if typeof(af)~='string'or af==''then return end if table.find(ae.options,af)then return
end table.insert(ae.options,af)local ag=ae._buildOption(af)table.insert(ae._optionFrames,ag)local ah=ae:
_deriveSelection()if ae._isOpen then ae._renderOptionState(ag,true)end ae:_applyFilter(if ae._searchOpen then ae.
searchInput.Text else'')if ah then ae._updateSelectedLabel()ae.window:_runGuarded(ae,ae.callback,ae:_callbackValue())ae.
window:_persist(ae)end end function d.Remove(ae,af)local ag=table.find(ae.options,af)if not ag then return end table.
remove(ae.options,ag)for ah,ai in ae._optionFrames do if ai.name==af then ae:_destroyOption(ai)table.remove(ae.
_optionFrames,ah)ae:_reindexOptions()break end end if ae._desiredValue then local ah=table.find(ae._desiredValue,af)if
ah then table.remove(ae._desiredValue,ah)end end local ah=table.find(ae.value,af)if ah then table.remove(ae.value,ah)ae.
_updateSelectedLabel()ae.window:_runGuarded(ae,ae.callback,ae:_callbackValue())ae.window:_persist(ae)end ae:
_applyFilter(if ae._searchOpen then ae.searchInput.Text else'')end function d.Set(ae,af,ag)local ah=K(af,ae.multiSelect)
ae._desiredValue=ah ae.value=L(ah,ae.options)for ai,N in ae._optionFrames do ae._renderOptionState(N,true)end ae.
_updateSelectedLabel()if not ag then ae.window:_runGuarded(ae,ae.callback,ae:_callbackValue())ae.window:_persist(ae)end
end function d._setShown(ae,af,ag)local ah=ae.window ah:_reveal(ae.stroke,{Transparency=if af then ah.theme.
ElementStrokeTransparency else 1},ag)ah:_reveal(ae.title,{TextTransparency=if af then 0 else 1},ag)ah:_reveal(ae.top,{
BackgroundTransparency=if af then(ah.theme.ElementTransparency or 0)else 1},ag)if ae.iconLabel then ah:_reveal(ae.
iconLabel,{ImageTransparency=if af then 0 else 1},ag)end if ae.descriptor then ah:_reveal(ae.descriptor.titleLabel,{
TextTransparency=if af then 0.7 else 1},ag)end ah:_reveal(ae.selectedLabel,{TextTransparency=if af then 0.5 else 1},ag)
ah:_reveal(ae.chevron,{ImageTransparency=if af then 0.5 else 1},ag)if not af and ae._isOpen then ae:_close()end end
function d.MoveTo(ae,af)ae.tab:_moveElement(ae,af)end function d.MoveToTop(ae)ae.tab:_moveElement(ae,1)end function d.
MoveToBottom(ae)ae.tab:_moveElement(ae,#ae.tab.elements)end function d.MoveUp(ae)local af=table.find(ae.tab.elements,ae)
if af then ae.tab:_moveElement(ae,af-1)end end function d.MoveDown(ae)local af=table.find(ae.tab.elements,ae)if af then
ae.tab:_moveElement(ae,af+1)end end m(d)return d end)()end,[14]=function()local aa,ab,ac=a(14)local ad return(function(
...)local ae={}ae.__index=ae ae.__type='Group'local af,ag,ah,ai,b=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.
Parent.utility.log),ac(ab.Parent.Parent.utility.ordering),8,{button=true,toggle=true,stat=true,slider=true}function ae.
new(c,d)d=if typeof(d)=='table'then d else{}local e=string.lower(d.direction or d.Direction or'row')local f=e=='column'
or e=='vertical'local g=not f local h=if g then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical local i,j
=setmetatable({tab=assert(c,'Missing argument #1 (Tab expected)'),window=c.window,direction=h,compact=g,forgetState=c.
forgetState,elements={}},ae),c.direction==Enum.FillDirection.Horizontal i.main=i.window:Create('Frame',{Name='Group',
BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=if g then UDim2.new(1,-20,0,0)else
UDim2.new(1,0,0,0),Parent=i.tab.tabPage})if j then i.main.Size=UDim2.new(0,0,0,0)i.window:Create('UIFlexItem',{FlexMode=
Enum.UIFlexMode.Fill,Parent=i.main})end i.tabPage=i.main i.scrollPage=c.scrollPage or c.tabPage i.layout=i.window:
Create('UIListLayout',{FillDirection=h,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,ai),VerticalAlignment=if
g then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top,HorizontalAlignment=if g then Enum.
HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,Parent=i.main})return i end function ae._add(c,d,e)if c.
compact and not b[d]then ag.warn(`Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{d}'. Use a column for it.`
)return nil end local f=ac(ab.Parent[d]).new(c,e)table.insert(c.elements,f)ah(f,#c.elements*10)c.window:_restoreLate(f)
if c.compact then c:_wrapChild(f)end c:_reflowRow()if not c.window.hidden then f:_setShown(true,true)end return f end
function ae._reflowRow(c)if c.direction~=Enum.FillDirection.Horizontal then return end local d=#c.elements>0 for e,f in
c.elements do if f.__type~='Group'then d=false break end end c.layout.Padding=if d then UDim.new(0,-10)else UDim.new(0,
ai)end function ae._wrapChild(c,d)c.layout.Wraps=true c.layout.HorizontalFlex=Enum.UIFlexAlignment.Fill d._widthManaged=
true local e=if d._minWidth then d:_minWidth()else 0 if e>0 then d.main.AutomaticSize=Enum.AutomaticSize.None d.main.
Size=UDim2.new(0,e,d.main.Size.Y.Scale,d.main.Size.Y.Offset)end end function ae.CreateButton(c,d)return c:_add('button',
d)end function ae.CreateToggle(c,d)return c:_add('toggle',d)end function ae.CreateSwitch(c,d)return c:_add('toggle',d)
end function ae.CreateStat(c,d)return c:_add('stat',d)end function ae.CreateSlider(c,d)return c:_add('slider',d)end
function ae.CreateDropdown(c,d)return c:_add('dropdown',d)end function ae.CreateSection(c,d)return c:_add('section',d)
end function ae.CreateText(c,d)return c:_add('text',d)end function ae.CreateDivider(c,d)return c:_add('divider',d)end
function ae._addGroup(c,d)d=if typeof(d)=='table'then table.clone(d)else{}if c.direction==Enum.FillDirection.Horizontal
then c.layout.VerticalAlignment=Enum.VerticalAlignment.Top if c.tab.direction~=Enum.FillDirection.Horizontal then c.main
.Size=UDim2.new(1,0,0,0)end end local e=ae.new(c,d)table.insert(c.elements,e)e.main.LayoutOrder=#c.elements*10 c:
_reflowRow()return e end function ae.CreateGroup(c,d)return c:_addGroup(d)end function ae._moveElement(c,d,e)local f=
table.find(c.elements,d)if not f then return end table.remove(c.elements,f)e=math.clamp(e,1,#c.elements+1)table.insert(c
.elements,e,d)for g,h in c.elements do ah(h,g*10)end end function ae._setShown(c,d,e)for f,g in c.elements do g:
_setShown(d,e)end end function ae._refreshTheme(c)for d,e in c.elements do if e._refreshTheme then e:_refreshTheme()end
end end af(ae)return ae end)()end,[15]=function()local aa,ab,ac=a(15)local ad return(function(...)local ae={}ae.__index=
ae ae.__type='Input'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e=ac(af.variables),ac(af.functions),ac(af.
moveable),ac(af.lockable),ac(af.locale),ac(af.constants),ac(af.HapticEngine)local f,g,h,i,j=d.pillResizeInfo,TweenInfo.
new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),70,220,182 local function k(l)local m,n=l:match
'^([%d%.%-]+)%^([%d%.%-]+)$'if m and n then local o,p=tonumber(m),tonumber(n)if o and p then return o^p end end return
tonumber(l)end function ae.new(l,m)m=if typeof(m)=='table'then m else{}local n=setmetatable({tab=assert(l,
'Missing argument #1 (Tab expected)'),window=l.window,name=m.name or m.Name or'Input',icon=m.icon or m.Icon,description=
m.description or m.Description,forgetState=m.forgetState or m.ForgetState or l.forgetState,placeholder=m.placeholder or
m.Placeholder or'',numeric=m.numeric or m.Numeric or false,clearOnFocus=m.clearOnFocus or m.ClearOnFocus or false,
callback=m.callback or m.Callback or function()end},ae)n.value=tostring(m.value or m.Value or m.currentValue or m.
CurrentValue or'')n.flag=m.flag or m.Flag or(not n.forgetState and ah.deriveFlagFromName(n.name)or nil)n.window:
_registerControl(n)n.main=n.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=n.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=n.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})n.stroke=n.window:StyleElementBody(n.main)n.hoverOverlay=n.window:CreateHoverOverlay(n.main)n.
container=n.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=n.main})n.window:Create('UIListLayout',{Padding=UDim.
new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=n.container}
)if n.icon then n.iconLabel=n.window:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=n.container},{ImageColor3='ContentColor'})end n.title=n.
window:Create('TextLabel',{Text=c.t(n.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=n.container},{TextColor3='ContentColor',FontFace='Font'})n.box=n.window:Create('Frame',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.fromOffset(85,30),BorderSizePixel=0,
BackgroundTransparency=1,Parent=n.main},{BackgroundColor3='FieldBackground'})n.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=n.box})n.boxStroke=n.window:Create('UIStroke',{Transparency=1,Parent=n.box},{Color='SurfaceStroke'}
)n.glow=n.window:CreateGlow(n.box,'FieldGlow',20,1)n._glowIdle=1 n.input=n.window:Create('TextBox',{Text=n.value,
PlaceholderText=c.t(n.placeholder),Size=UDim2.new(1,-15,0,15),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(
0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=
Enum.TextTruncate.AtEnd,ClearTextOnFocus=n.clearOnFocus,TextTransparency=1,Parent=n.box},{TextColor3='ContentColor',
FontFace='Font',PlaceholderColor3='PlaceholderColor'})n.window:ConnectFor(n,n.input:GetPropertyChangedSignal'Text',
function()if n.numeric then local o=(n.input.Text:gsub('[^%d%.%-eE%^]',''))if o~=n.input.Text then n.input.Text=o return
end end n:_sizeBox(true)end)n.window:ConnectFor(n,n.input.Focused,function()ag.tweenService:Create(n.input,g,{
TextTransparency=0}):Play()end)n.window:ConnectFor(n,n.input.FocusLost,function()ag.tweenService:Create(n.input,g,{
TextTransparency=0.6}):Play()if n.clearOnFocus and n.input.Text==''and n.value~=''then n.input.Text=n.value return end
if n.input.Text==n.value then return end n:_commit(n.input.Text)end)n.window:_wireElementHover(n)if n.description then n
.descriptor=ac(ab.Parent.descriptor).new(n.tab,{description=n.description})end n:_sizeBox(false)n.window:ConnectFor(n,n.
main:GetPropertyChangedSignal'AbsoluteSize',function()if n.window.animating or(n.window.hidden and n.window.hasShownOnce
)then return end n:_sizeBox(false)end)return n end function ae._maxBoxWidth(l)local m=l.main.AbsoluteSize.X if m<=0 then
return i end return math.clamp(m-j,h,i)end function ae._sizeBox(l,m)local n=l.input.Text~=''and l.input.Text or l.
placeholder local o=math.clamp(ah.textWidth(l.window.theme.Font,15,n)+30,h,l:_maxBoxWidth())if m then ag.tweenService:
Create(l.box,f,{Size=UDim2.fromOffset(o,30)}):Play()else l.box.Size=UDim2.fromOffset(o,30)end end function ae._commit(l,
m,n)m=tostring(m)if l.numeric then local o=k(m)if not o or o~=o or o==math.huge or o==-math.huge then if l.input.Text~=l
.value then l.input.Text=l.value end return end m=tostring(o)end local o=m~=l.value l.value=m if l.input.Text~=m then l.
input.Text=m end if not n then l.window:_runGuarded(l,l.callback,m)l.window:_persist(l)if o and not l.window._loading
then e.click()l.window:_flashResult(l,true)end end end function ae.Set(l,m,n)l:_commit(m,n)end function ae._setShown(l,m
,n)local o=l.window if m then o:_revealCommon(l,n)o:_reveal(l.box,{BackgroundTransparency=o.theme.FieldTransparency},n)o
:_reveal(l.boxStroke,{Transparency=0.85},n)o:_reveal(l.input,{TextTransparency=0.6},n)else o:_hideCommon(l,n)o:_reveal(l
.box,{BackgroundTransparency=1},n)o:_reveal(l.boxStroke,{Transparency=1},n)o:_reveal(l.input,{TextTransparency=1},n)end
end function ae._refreshTheme(l)ag.tweenService:Create(l.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{BackgroundTransparency=l.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end
,[16]=function()local aa,ab,ac=a(16)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Keybind'local af=ab
.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(
af.locale),ac(af.constants),ac(af.HapticEngine),ac(af.enums),ac(af.log)local h,i,j=d.pillResizeInfo,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{[Enum.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.
MouseButton2]='MB2',[Enum.UserInputType.MouseButton3]='MB3'}local function k(l)if typeof(l)~='EnumItem'or l==Enum.
KeyCode.Unknown then return'None'end return j[l]or l.Name end local function l(m)if typeof(m)=='EnumItem'then return m
end if type(m)=='string'then local n,o=pcall(function()return Enum.KeyCode[m]end)if n and o then return o end local p,q=
pcall(function()return Enum.UserInputType[m]end)if p and q and j[q]then return q end end return Enum.KeyCode.Unknown end
function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({tab=assert(m,
'Missing argument #1 (Tab expected)'),window=m.window,name=n.name or n.Name or'Keybind',icon=n.icon or n.Icon,
description=n.description or n.Description,forgetState=n.forgetState or n.ForgetState or m.forgetState,isMenuToggle=n.
isMenuToggle or n.IsMenuToggle or false,callback=n.callback or n.Callback or function()end,onChanged=n.onChanged or n.
OnChanged or function()end,hold=n.hold or n.Hold or false,holdThreshold=n.holdThreshold or n.HoldThreshold or 0.2,
recording=false},ae)o.value=l(n.value or n.Value or n.default or n.Default)o.flag=n.flag or n.Flag or(not o.forgetState
and ah.deriveFlagFromName(o.name)or nil)o.window:_registerControl(o)o.main=o.window:Create('Frame',{Size=UDim2.new(1,-20
,0,41),BorderSizePixel=0,Name=o.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=o.tab.
tabPage},{BackgroundTransparency='ElementTransparency'})o.stroke=o.window:StyleElementBody(o.main)o.hoverOverlay=o.
window:CreateHoverOverlay(o.main)o.container=o.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20
,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=o.main})o.window:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,Parent=o.container})if o.icon then o.iconLabel=o.window:Create('ImageLabel',{Image=o.icon,Size=
UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=o.container},{
ImageColor3='ContentColor'})end o.title=o.window:Create('TextLabel',{Text=c.t(o.name),Size=UDim2.fromOffset(150,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace=
'Font'})o.box=o.window:Create('TextButton',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.
fromOffset(40,30),AutoButtonColor=false,Text='',BorderSizePixel=0,BackgroundTransparency=1,Parent=o.main},{
BackgroundColor3='FieldBackground'})o.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=o.box})o.boxStroke=o.
window:Create('UIStroke',{Transparency=1,Parent=o.box},{Color='SurfaceStroke'})o.glow=o.window:CreateGlow(o.box,
'FieldGlow',20,1)o._glowIdle=0.9 o.keyLabel=o.window:Create('TextLabel',{Text=k(o.value),Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,
TextTransparency=1,Parent=o.box},{TextColor3='ContentColor',FontFace='Font'})o.window:ConnectFor(o,o.box.
MouseButton1Click,function()e.click()if o.recording then o:_stopRecording()else o:_startRecording()end end)o.window:
ConnectFor(o,ag.userInputService.InputBegan,function(p,q)if q then return end if o.recording then o:_capture(p)return
end if o.window._recordingKeybind then return end if o:_matches(p)then if o.hold then o:_beginHold(p)else o.window:
_runGuarded(o,o.callback,o.value)end end end)o.window:_wireElementHover(o)if o.description then o.descriptor=ac(ab.
Parent.descriptor).new(o.tab,{description=o.description})end o:_sizeBox(false)return o end function ae._sizeBox(m,n)
local o=math.clamp(ah.textWidth(m.window.theme.Font,15,m.keyLabel.Text)+28,40,200)if n then ag.tweenService:Create(m.box
,h,{Size=UDim2.fromOffset(o,30)}):Play()else m.box.Size=UDim2.fromOffset(o,30)end end function ae._startRecording(m)
local n=m.window._recordingKeybind if n and n~=m then n:_stopRecording()end m.recording=true m.window._recordingKeybind=
m m.keyLabel.Text=c.resolve'Recording'm:_sizeBox(true)ag.tweenService:Create(m.glow,i,{Transparency=0.7}):Play()ag.
tweenService:Create(m.keyLabel,i,{TextTransparency=0}):Play()end function ae._stopRecording(m)m.recording=false if m.
window._recordingKeybind==m then local n=m.window task.defer(function()if n._recordingKeybind==m then n.
_recordingKeybind=nil end end)end m.keyLabel.Text=k(m.value)m:_sizeBox(true)ag.tweenService:Create(m.glow,i,{
Transparency=0.9}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0.6}):Play()end function ae._capture(m,n)
local o if n.UserInputType==Enum.UserInputType.Keyboard then if n.KeyCode==Enum.KeyCode.Escape then m:_stopRecording()
return end if n.KeyCode==Enum.KeyCode.Backspace then m:_bind(Enum.KeyCode.Unknown)return end o=n.KeyCode elseif n.
UserInputType==Enum.UserInputType.MouseButton2 or n.UserInputType==Enum.UserInputType.MouseButton3 then o=n.
UserInputType end if not o then return end if m.isMenuToggle then local p=m.window:_keybindUsing(o,m)if p then m.window:
Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is bound to %s. Kept %s.',k(o),p.name,k(m
.value))}m:_stopRecording()m.window:_flashResult(m,false)return end elseif o==m.window.settings.toggleKeybind then m.
window:Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is the menu toggle key. Kept %s.',
k(o),k(m.value))}m:_stopRecording()m.window:_flashResult(m,false)return end m:_bind(o)end function ae._bind(m,n)m.value=
n m:_stopRecording()m.window:_runGuarded(m,m.onChanged,n)m.window:_persist(m)m.window:_flashResult(m,true)end function
ae._matches(m,n)local o=m.value if typeof(o)~='EnumItem'or o==Enum.KeyCode.Unknown then return false end if o.EnumType==
Enum.KeyCode then return n.KeyCode==o elseif o.EnumType==Enum.UserInputType then return n.UserInputType==o end return
false end function ae._beginHold(m,n)if m._holding or m._holdPress then return end local o={}m._holdPress=o local p,q=n.
KeyCode,n.UserInputType task.delay(m.holdThreshold,function()if m._holdPress~=o then return end m._holding=true m.window
:_runGuarded(m,m.callback,true)end)local r r=m.window:ConnectFor(m,ag.userInputService.InputEnded,function(s)local t=if
p~=Enum.KeyCode.Unknown then s.KeyCode==p else s.UserInputType==q if not t then return end if m.connections then local u
=table.find(m.connections,r)if u then table.remove(m.connections,u)end end m.window:Disconnect(r)if m._holdPress==o then
m._holdPress=nil end if m._holding then m._holding=false m.window:_runGuarded(m,m.callback,false)end end)end function ae
.Set(m,n,o)local p=l(n)if p~=Enum.KeyCode.Unknown then if m.isMenuToggle then local q=m.window:_keybindUsing(p,m)if q
then g.warn('Rayfield: '..k(p).." is bound to '"..tostring(q.name).."'; kept "..k(m.value))return end elseif p==m.window
.settings.toggleKeybind then g.warn('Rayfield: '..k(p)..' is the menu toggle key; kept '..k(m.value))return end end m.
value=p if m.recording then m:_stopRecording()else m.keyLabel.Text=k(m.value)m:_sizeBox(true)end if not o then m.window:
_runGuarded(m,m.onChanged,m.value)m.window:_persist(m)end end function ae._serialize(m)return{tostring(m.value.EnumType)
,m.value.Value}end function ae._deserialize(m,n)local o=tostring(n[1]):gsub('^Enum%.','')local p,q=pcall(function()
return Enum[o]end)if not p or not q then return end local r=f.itemFromValue(q,n[2])if r then m:Set(r)end end function ae
._setShown(m,n,o)local p=m.window if n then p:_revealCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=p.theme.
FieldTransparency},o)p:_reveal(m.boxStroke,{Transparency=0.85},o)p:_reveal(m.keyLabel,{TextTransparency=0.6},o)p:
_reveal(m.glow,{Transparency=0.9},o)else p:_hideCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=1},o)p:_reveal(m.
boxStroke,{Transparency=1},o)p:_reveal(m.keyLabel,{TextTransparency=1},o)p:_reveal(m.glow,{Transparency=1},o)end end
function ae._refreshTheme(m)ag.tweenService:Create(m.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=m.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[17]=function()
local aa,ab,ac=a(17)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Nameplate'local af=ab.Parent.Parent
.utility local ag,ah,ai,b,c=ac(af.variables),ac(af.services),ac(af.relayClient),ac(af.imageCache),Color3.new(1,1,1)local
d={Omnity={size=Vector2.new(5.6,1.35),lift=2.5,maxDistance=100,cornerRadius=0.32,accent=Color3.fromRGB(125,180,255),
accentDeep=Color3.fromRGB(59,130,246),cardColor=Color3.fromRGB(5,7,14),cardTransparency=0.08,veilColor=Color3.fromRGB(3,
4,9),veilStrength=0.85,titleColor=Color3.fromRGB(250,251,255),subtitleColor=Color3.fromRGB(160,176,204),badgeTextColor=
Color3.fromRGB(235,244,255),logo='omnity-logo.png',logoTint=c,logoScale=0.84,backdrop='nameplate-galaxy.png',
backdropTint=c,backdropTransparency=0.05,glowImage='nameplate-glow.png',titleFont=nil,subtitleFont=nil,entrance='unfold'
,logoSway=6,logoSpin=0,halo=true,sparkles=7,sparkleColor=Color3.fromRGB(220,235,255),titleShine=true,sweep=true,
sweepEvery=7,border=true,borderThickness=1.6,borderSpeed=40,glow=true,bob=true,bobHeight=0.08,bobSpeed=1.6}}d.Midnight=
table.clone(d.Omnity)d.Midnight.backdrop='nameplate-mountains.png'd.Midnight.accent=Color3.fromRGB(96,165,250)d.Midnight
.accentDeep=Color3.fromRGB(37,99,235)d.Midnight.sparkles=4 d.Mono=table.clone(d.Omnity)d.Mono.backdrop=false d.Mono.
accent=Color3.fromRGB(220,224,232)d.Mono.accentDeep=Color3.fromRGB(120,126,140)d.Mono.sparkleColor=c d.Mono.sparkles=3 d
.Mono.cardColor=Color3.fromRGB(10,10,12)ae.presets=d local e,f,g,h=0.35,1.1,3,20 local function i(j)return math.clamp(j,
0,1)end local function j(k,l,m)return i((k-l)/m)end local function k(l)return 1-(1-l)^3 end local function l(m)return 1-
(1-m)^5 end local function m(n)local o,p=1.6,2.6 return 1+p*(n-1)^3+o*(n-1)^2 end local function n(o)return-(math.cos(
math.pi*o)-1)/2 end local function o(p:string):string return(p:gsub('&','&amp;'):gsub('<','&lt;'):gsub('>','&gt;'))end
local function p(q,r)local s=d[q]or d.Omnity local t=table.clone(s)if type(r)=='table'then for u,v in r do t[u]=v end
end return t end local function q(r)if r==false or r==nil then return nil elseif type(r)=='number'or(type(r)=='string'
and r:match'^%d+$')then return{uri='rbxassetid://'..tostring(r)}elseif type(r)=='string'and r:match'^[%w%-_]+%.png$'then
return{file=r}end return{uri=tostring(r)}end function ae.new(r,s)s=if typeof(s)=='table'then s else{}local t=table.
clone(s.style or s.Style or{})for u,v in{'accent','logo','backdrop','maxDistance','lift'}do local w=s[v]if w==nil then w
=s[v:sub(1,1):upper()..v:sub(2)]end if w~=nil and t[v]==nil then t[v]=w end end local u=setmetatable({window=r,title=s.
title or s.Title or string.upper(tostring(r.name or'Rayfield')),subtitle=s.subtitle or s.Subtitle,badge=s.badge or s.
Badge,preset=s.preset or s.Preset or'Omnity',overrides=t,endpoint=ai.base(s.endpoint or s.Endpoint),key=s.key or s.Key,
transport=s.transport or s.Transport,showSelf=s.showSelf~=false and s.ShowSelf~=false,hideDefaultName=s.hideDefaultName
~=false and s.HideDefaultName~=false,checkInInterval=math.max(tonumber(s.checkInInterval)or h,5),autoCheckIn=s.
autoCheckIn~=false,enabled=true,plates={},users={},images={},_dying={},_alive=true},ae)u.style=p(u.preset,t)u.players=ah
.getService'Players'u.folder=r:Create('Folder',{Name=ag.httpService:GenerateGUID(false),Parent=ag.guiContainer})u:
_loadImages()local v=ag.localPlayer if v and u.showSelf then u.users[v.UserId]={badge=u.badge}end if u.players and u.
players.PlayerAdded then r:Connect(u.players.PlayerAdded,function(w)u:_reconcile(w)end)r:Connect(u.players.
PlayerRemoving,function(w)u:_drop(w)end)end u.stepConnection=r:Connect(ag.runService.RenderStepped,function()u:_step(os.
clock())end)u:_reconcileAll()if(u.endpoint or u.transport)and u.autoCheckIn then u:_startCheckIns()end return u end
function ae._loadImages(r)table.clear(r.images)local s={}r._imageGeneration=s for t,u in{'logo','backdrop','glowImage'}
do local v=q(r.style[u])if v and v.uri then r.images[u]=v.uri elseif v and v.file then task.spawn(function()local w=b.
remote(v.file)if w and r._alive and r._imageGeneration==s then r.images[u]=w for x,y in r.plates do r:_applyImages(y)end
end end)end end end function ae._applyImages(r,s)local t=s.parts if not t then return end local u=r.images t.logo.Image=
u.logo or''t.logo.Visible=u.logo~=nil t.monogram.Visible=u.logo==nil t.backdrop.Image=u.backdrop or''t.backdrop.Visible=
u.backdrop~=nil t.halo.Image=u.glowImage or''t.halo.Visible=r.style.halo and u.glowImage~=nil end function ae.
_listPlayers(r)if r.players and r.players.GetPlayers then return r.players:GetPlayers()end return{ag.localPlayer}end
function ae._wants(r,s)return s~=nil and r.users[s.UserId]~=nil end function ae._reconcileAll(r)for s,t in r:
_listPlayers()do r:_reconcile(t)end for s in r.plates do if not r:_wants(s)then r:_drop(s)end end end function ae.
_reconcile(r,s)if not r:_wants(s)then r:_drop(s)return end local t=r.plates[s]if not t then t={player=s}r.plates[s]=t if
s.CharacterAdded then t.characterConnection=r.window:Connect(s.CharacterAdded,function(u)r:_attach(s,u)end)end if s.
Character then r:_attach(s,s.Character)end elseif t.parts then r:_writeText(t)end end function ae._drop(r,s)local t=r.
plates[s]if not t then return end r.plates[s]=nil if t.characterConnection then r.window:Disconnect(t.
characterConnection)end r:_vanish(t)end function ae._subtitleFor(r,s)if type(r.subtitle)=='function'then return
tostring(r.subtitle(s))elseif type(r.subtitle)=='string'then return r.subtitle end return'@'..s.Name end function ae.
_badgeFor(r,s)local t=r.users[s.UserId]local u=t and t.badge return if type(u)=='string'and u~=''then string.upper(u)
else nil end local function r(s)local t=s.size.X/s.size.Y local u=0.08/t local v=u+s.logoScale/2/t return{aspect=t,
logoCenter=v,textLeft=v+(s.logoScale/2+0.2)/t,margin=0.16/t}end function ae._writeText(s,t)local u,v=t.parts,s.style u.
title.Text=s.title u.subtitle.Text=o(s:_subtitleFor(t.player))local w=s:_badgeFor(t.player)u.badge.Visible=w~=nil local
x=t.layout local y=1-x.margin if w then u.badgeText.Text=w local z=0.3 local A=(#w*0.6*z*0.62+z*0.9)/x.aspect u.badge.
Size=UDim2.fromScale(A,z)y-=A+0.04/x.aspect end local z=math.max(y-x.textLeft,0.1)u.title.Size=UDim2.fromScale(z,0.4)u.
subtitle.Size=UDim2.fromScale(1-x.margin-x.textLeft,0.25)u.badgeStroke.Color=v.accent u.badge.BackgroundColor3=v.accent
end function ae._attach(s,t,u)local v=s.plates[t]if not v or not u then return end v.character=u if v.gui then s:
_vanish(table.clone(v))v.gui=nil v.parts=nil end local w=u:FindFirstChild'Head'if not w and u.WaitForChild then w=u:
WaitForChild('Head',5)end if not w or s.plates[t]~=v then return end local x,y=s.window,s.style local z,A,B,C,D,E=r(y),y
.accent:Lerp(c,0.55),UDim.new(y.cornerRadius,0),y.titleFont or ag.brandFont(Enum.FontWeight.Heavy),y.subtitleFont or ag.
brandFont(Enum.FontWeight.SemiBold),x:Create('BillboardGui',{Name='Nameplate',Adornee=w,Size=UDim2.fromScale(y.size.X,y.
size.Y),StudsOffset=Vector3.new(0,y.lift,0),MaxDistance=y.maxDistance,AlwaysOnTop=false,LightInfluence=0,ResetOnSpawn=
false,ClipsDescendants=false,Parent=s.folder})local F=x:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency
=1,Parent=E})local G,H=x:Create('UIScale',{Parent=F}),x:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency
=1,Parent=F})x:Create('UICorner',{CornerRadius=B,Parent=H})local I,J=x:Create('UIStroke',{Color=y.accentDeep,Thickness=4
,Transparency=1,Parent=H}),x:Create('CanvasGroup',{Size=UDim2.fromScale(1,1),BackgroundColor3=y.cardColor,
BackgroundTransparency=y.cardTransparency,GroupTransparency=1,BorderSizePixel=0,Parent=F})x:Create('UICorner',{
CornerRadius=B,Parent=J})local K,L,M,N=x:Create('UIGradient',{Enabled=false,Parent=J}),x:Create('ImageLabel',{Size=UDim2
.fromScale(1,1),BackgroundTransparency=1,ScaleType=Enum.ScaleType.Crop,ImageColor3=y.backdropTint,ImageTransparency=y.
backdropTransparency,Visible=false,ZIndex=1,Parent=J}),x:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=y.
veilColor,BorderSizePixel=0,ZIndex=2,Parent=J}),i(y.veilStrength)x:Create('UIGradient',{Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1-N),NumberSequenceKeypoint.new(0.55,1-N*0.55),NumberSequenceKeypoint.new(1,1-N*0.1)},
Parent=M})local O=x:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromScale(0.2,2.4),Position=UDim2.
fromScale(-0.4,0.5),Rotation=18,BackgroundColor3=c,BorderSizePixel=0,Visible=y.sweep,ZIndex=3,Parent=J})x:Create(
'UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0.87),
NumberSequenceKeypoint.new(1,1)},Parent=O})local P=x:Create('Frame',{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.
fromScale(0.5,0.035),Size=UDim2.new(0.8,0,0,1),BackgroundColor3=A,BorderSizePixel=0,ZIndex=4,Parent=J})x:Create(
'UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0.5),
NumberSequenceKeypoint.new(1,1)},Parent=P})local Q=x:Create('TextLabel',{Position=UDim2.fromScale(z.textLeft,0.16),
BackgroundTransparency=1,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=y.titleColor,
TextTransparency=1,FontFace=C,ZIndex=5,Parent=J})local R,S,T=x:Create('UIGradient',{Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,c),ColorSequenceKeypoint.new(0.5,A),ColorSequenceKeypoint.new(1,c)},Enabled=y.titleShine,
Parent=Q}),x:Create('TextLabel',{Position=UDim2.fromScale(z.textLeft,0.58),BackgroundTransparency=1,RichText=true,
TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=y.subtitleColor,TextTransparency=1,FontFace=D,ZIndex=
5,Parent=J}),x:Create('Frame',{AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1-z.margin,0.17),BackgroundColor3=y
.accent,BackgroundTransparency=0.82,BorderSizePixel=0,Visible=false,ZIndex=6,Parent=J})x:Create('UICorner',{CornerRadius
=UDim.new(1,0),Parent=T})local U,V,W,X=x:Create('UIScale',{Scale=0,Parent=T}),x:Create('UIStroke',{Color=y.accent,
Thickness=1,Transparency=0.35,Parent=T}),x:Create('TextLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.52),Size=UDim2.fromScale(0.78,0.62),BackgroundTransparency=1,TextScaled=true,TextColor3=y.badgeTextColor
,FontFace=C,ZIndex=7,Parent=T}),x:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Visible=y.border,
Parent=F})x:Create('UICorner',{CornerRadius=B,Parent=X})local Y=x:Create('UIStroke',{Color=c,Thickness=y.borderThickness
,Transparency=1,Parent=X})local Z,_,aj=x:Create('UIGradient',{Color=ColorSequence.new{ColorSequenceKeypoint.new(0,y.
accentDeep),ColorSequenceKeypoint.new(0.5,A),ColorSequenceKeypoint.new(1,y.accentDeep)},Parent=Y}),UDim2.fromScale(y.
logoScale,y.logoScale),UDim2.fromScale(z.logoCenter,0.5)local ak,al,am,an,ao=x:Create('ImageLabel',{AnchorPoint=Vector2.
new(0.5,0.5),Position=aj,Size=UDim2.fromScale(y.logoScale*1.7,y.logoScale*1.7),SizeConstraint=Enum.SizeConstraint.
RelativeYY,BackgroundTransparency=1,ImageColor3=y.accent,ImageTransparency=1,Visible=false,ZIndex=8,Parent=F}),x:Create(
'ImageLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=aj,Size=_,SizeConstraint=Enum.SizeConstraint.RelativeYY,
BackgroundTransparency=1,ImageColor3=y.logoTint,ImageTransparency=1,Visible=false,ZIndex=10,Parent=F}),x:Create(
'TextLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=aj,Size=_,SizeConstraint=Enum.SizeConstraint.RelativeYY,
BackgroundTransparency=1,Text=string.sub(s.title,1,1),TextScaled=true,TextColor3=A,TextTransparency=1,FontFace=C,ZIndex=
10,Parent=F}),{},math.max(math.floor(tonumber(y.sparkles)or 0),0)for ap=1,ao do local aq=x:Create('Frame',{AnchorPoint=
Vector2.new(0.5,0.5),Size=UDim2.fromScale(0.05,0.05),SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundColor3=y.
sparkleColor,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=11,Parent=F})x:Create('UICorner',{CornerRadius=UDim.new(1
,0),Parent=aq})table.insert(an,{frame=aq,offset=(ap-1)/ao*math.pi*2,speed=0.55+(ap%3)*0.12,size=0.035+(ap%4)*0.008})end
local ap,aq=(u:FindFirstChild'Humanoid')if ap and s.hideDefaultName then aq=ap.DisplayDistanceType or Enum.
HumanoidDisplayDistanceType.Viewer ap.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None end v.gui=E v.head=w v.
humanoid=ap v.nameType=aq v.layout=z v.born=os.clock()v.phase=(t.UserId%97)/97*10 v.parts={shell=F,scale=G,card=J,wipe=K
,glowStroke=I,borderStroke=Y,borderGradient=Z,sweep=O,title=Q,shine=R,subtitle=S,badge=T,badgeScale=U,badgeStroke=V,
badgeText=W,halo=ak,logo=al,monogram=am,backdrop=L,sparks=an}s:_writeText(v)s:_applyImages(v)s:_step(os.clock())end
function ae._vanish(aj,ak)if not ak.gui then return end if ak.humanoid and ak.nameType and ak.humanoid.Parent then ak.
humanoid.DisplayDistanceType=ak.nameType end ak.diedAt=os.clock()ak.humanoid=nil table.insert(aj._dying,ak)end
local function aj(ak,al)if ak=='none'then return{mark=1,card=1,edge=1,title=1,subtitle=1,badge=1,sparks=1}elseif ak==
'fade'then local am=j(al,0,0.5)return{mark=am,card=1,edge=am,title=am,subtitle=am,badge=am,sparks=am,fadeCard=am}end
return{mark=j(al,0,0.5),card=j(al,0.18,0.6),edge=j(al,0.5,0.4),title=j(al,0.42,0.45),subtitle=j(al,0.52,0.45),badge=j(al
,0.65,0.4),sparks=j(al,0.3,0.6)}end local function ak(al,am,an,ao)local ap=am.parts if not ap then return false end
local aq,s,t=al.style,am.layout,an-am.born local u,v,w=aj(aq.entrance,t),ao,1 if am.diedAt then local x=i((an-am.diedAt)
/e)if x>=1 then return true end v*=1-k(x)w=1-0.08*x end local x=ag.workspace.CurrentCamera if x and am.head and am.head.
Parent then local y=(x.CFrame.Position-am.head.Position).Magnitude local z,A=i((y-aq.maxDistance*0.6)/(aq.maxDistance*
0.4)),i((y-g)/2)v*=(1-z)*A end ap.scale.Scale=w local y,z=an+am.phase,u.mark local A,B,C=k(z)*v,aq.logoScale*(0.35+0.65*
m(z)),(1-k(z))*-90+math.sin(y*0.8)*(aq.logoSway or 0)+y*(aq.logoSpin or 0)for D,E in{ap.logo,ap.monogram}do E.Size=UDim2
.fromScale(B,B)E.Rotation=C%360 end ap.logo.ImageTransparency=1-A ap.monogram.TextTransparency=1-A local D=0.5+0.5*math.
sin(y*2.1)ap.halo.ImageTransparency=1-A*(0.38+0.2*D)local E=aq.logoScale*(1.55+0.15*D)*(0.5+0.5*k(z))ap.halo.Size=UDim2.
fromScale(E,E)local F,G=k(u.sparks)*v,math.rad(-25)for H,I in ap.sparks do local J=y*I.speed+I.offset local K,L=math.
cos(J)*0.62,math.sin(J)*0.2 local M,N,O=K*math.cos(G)-L*math.sin(G),K*math.sin(G)+L*math.cos(G),math.sin(J)>0 local P,Q=
if O then 1 else 0.7,0.75+0.25*math.sin(y*5+I.offset*3)I.frame.Position=UDim2.fromScale(s.logoCenter+M*aq.logoScale/s.
aspect,0.5+N*aq.logoScale)I.frame.Size=UDim2.fromScale(I.size*P,I.size*P)I.frame.ZIndex=if O then 11 else 9 I.frame.
BackgroundTransparency=1-F*Q*(if O then 0.95 else 0.35)end local H,I=l(u.card),v*(if u.fadeCard then u.fadeCard else 1)
ap.card.GroupTransparency=1-I if H<1 then local J,K=s.logoCenter+(1.08-s.logoCenter)*H,0.08 ap.wipe.Enabled=true ap.wipe
.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(math.clamp(J-K,0.001,0.997),
0),NumberSequenceKeypoint.new(math.clamp(J,0.002,0.998),1),NumberSequenceKeypoint.new(1,1)}elseif ap.wipe.Enabled then
ap.wipe.Enabled=false end local J=k(u.edge)*v ap.borderStroke.Transparency=1-J*0.85 ap.glowStroke.Transparency=if aq.
glow then 1-J*0.1 else 1 ap.borderGradient.Rotation=(y*aq.borderSpeed)%360 local K=k(u.title)ap.title.TextTransparency=1
-K ap.title.Position=UDim2.fromScale(s.textLeft+(1-K)*0.04,0.16)local L=k(u.subtitle)ap.subtitle.TextTransparency=1-L ap
.subtitle.Position=UDim2.fromScale(s.textLeft+(1-L)*0.03,0.58)ap.badgeScale.Scale=m(u.badge)if aq.titleShine then ap.
shine.Offset=Vector2.new(((y*0.35)%2)-1,0)end local M=if aq.bob then math.sin(y*aq.bobSpeed)*aq.bobHeight else 0 am.gui.
StudsOffset=Vector3.new(0,aq.lift+M,0)if aq.sweep then local N=(y%aq.sweepEvery)/f ap.sweep.Position=UDim2.fromScale(if
N<1 then-0.3+1.6*n(N)else-0.4,0.5)end return false end function ae._step(al,am)local an=if al.enabled then 1 else 0 for
ao,ap in al.plates do if ap.gui then ak(al,ap,am,an)end end local ao=al._dying for ap=#ao,1,-1 do local aq=ao[ap]if ak(
al,aq,am,an)then table.remove(ao,ap)al.window:DestroySubtree(aq.gui)end end end function ae._identity(al)local am=ag.
localPlayer return{user={id=if am then am.UserId else 0,name=if am then am.Name else'Player'},jobId=tostring(game.JobId
~=nil and game.JobId~=''and game.JobId or'studio')}end function ae.CheckIn(al):boolean if not al._alive then return
false end local am,an=ai.request(al,'POST','/v1/presence',al:_identity())if not am or type(an)~='table'or type(an.users)
~='table'then return false end local ao={}for ap,aq in an.users do local s=tonumber(type(aq)=='table'and aq.id)if s then
ao[s]={badge=if type(aq.badge)=='string'then aq.badge else nil}end end local ap=ag.localPlayer if ap then if al.showSelf
then ao[ap.UserId]=ao[ap.UserId]or{}ao[ap.UserId].badge=ao[ap.UserId].badge or al.badge else ao[ap.UserId]=nil end end
al.users=ao al:_reconcileAll()return true end function ae._startCheckIns(al)task.spawn(function()while al._alive and not
al.window.unloaded do al:CheckIn()task.wait(al.checkInInterval)end ai.request(al,'DELETE','/v1/presence',al:_identity())
end)end function ae.SetEnabled(al,am:boolean)al.enabled=am~=false end function ae.SetTitle(al,am:string)al.title=
tostring(am)for an,ao in al.plates do if ao.parts then al:_writeText(ao)end end end function ae.SetStyle(al,am,an:string
?)if type(am)=='string'then an,am=am,nil end if an then al.preset=an end if type(am)=='table'then for ao,ap in am do al.
overrides[ao]=ap end end al.style=p(al.preset,al.overrides)al:_loadImages()for ao,ap in al.plates do if ap.character
then al:_attach(ao,ap.character)end end end function ae.Add(al,am,an:string?)if typeof(am)~='Instance'and type(am)~=
'table'then return end al.users[am.UserId]={badge=an}al:_reconcile(am)end function ae.Remove(al,am)if am then al.users[
am.UserId]=nil al:_drop(am)end end function ae.Destroy(al)if not al._alive then return end al._alive=false for am in al.
plates do al:_drop(am)end task.delay(e+0.05,function()if al.stepConnection then al.window:Disconnect(al.stepConnection)
end if al.folder then al.window:DestroySubtree(al.folder)end end)end return ae end)()end,[18]=function()local aa,ab,ac=
a(18)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Notification'local af=ab.Parent.Parent.utility
local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,c=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.HapticEngine),
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8 local function d(e)return math.clamp(#e*0.06+3,
3,9)end function ae.new(e,f)f=if typeof(f)=='table'then f else{}local g=setmetatable({window=assert(e,
'Missing argument #1 (Window expected)'),title=f.title or f.Title or'Notification',content=f.content or f.Content or'',
icon=f.icon or f.Icon,_hovered=false,_dismissed=false},ae)g.duration=f.duration or f.Duration or d(g.content)local h=g.
icon~=nil and g.icon~=0 and g.icon~=''g.main=g.window:Create('Frame',{Name='Notification',BackgroundTransparency=1,Size=
UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.notification,Parent=g.window.notifications})g.window:Create(
'UIPadding',{PaddingTop=UDim.new(0,c),Parent=g.main})g.body=g.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255
,255,255),Size=UDim2.new(1,0,1,0),Position=ap,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.
zIndex.notification,BackgroundTransparency=1,Parent=g.main})g.window:Create('UIGradient',{Rotation=270,Offset=Vector2.
new(0,-0.1),Parent=g.body},{Color={'WindowColor',ah.toColorSequence}})g.window:Create('UICorner',{Parent=g.body},{
CornerRadius='CornerRoundness'})g.stroke=g.window:Create('UIStroke',{Transparency=1,Parent=g.body},{Color=
'SurfaceStroke'})g.shadow=g.window:CreateGlow(g.body,'ShadowColor',20,1)g.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,20),PaddingRight=UDim.new(0,20),Parent=g.body})g.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=g.body})if h then g.iconLabel=g.window:Create('ImageLabel',{
Image=g.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.
notification,ImageTransparency=1,Parent=g.body},{ImageColor3='ContentColor'})end g.container=g.window:Create('Frame',{
Size=UDim2.fromOffset(h and 222 or 260,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=2,ZIndex=ai.zIndex.notification,Parent=g.body})g.window:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=g.container})g.titleLabel=g.
window:Create('TextLabel',{Text=g.title,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.
zIndex.notification,TextTransparency=1,Parent=g.container},{TextColor3='ContentColor',FontFace='TitleFont'})if g.content
~=''then g.descriptionLabel=g.window:Create('TextLabel',{Text=g.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=g.container
},{TextColor3='ContentColor',FontFace='Font'})end g.window._notificationCount=(g.window._notificationCount or 0)+1 g.
main.LayoutOrder=g.window._notificationCount local i=g.window._liveNotifications if not i then i={}g.window.
_liveNotifications=i end table.insert(i,g)while#i>b do local j=table.remove(i,1)if j and j~=g then task.spawn(j._dismiss
,j)end end g._connections={g.window:Connect(g.body.MouseEnter,function()g._hovered=true end),g.window:Connect(g.body.
MouseLeave,function()g._hovered=false end),g.window:Connect(g.body.InputBegan,function(j)if j.UserInputType==Enum.
UserInputType.MouseButton1 or j.UserInputType==Enum.UserInputType.Touch then g:_dismiss()end end)}task.spawn(function()g
:_show()end)return g end function ae._measure(e)local f=e.iconLabel and 222 or 260 local g=ah.textHeight(e.window.theme.
TitleFont,16,e.title,f)if e.descriptionLabel then g=g+4+ah.textHeight(e.window.theme.Font,15,e.content,f)end return math
.max(g,e.iconLabel and 24 or 0)+28 end function ae._show(e)local f=e:_measure()+c if e._dismissed or not e.main.Parent
then return end aj.notify()ag.tweenService:Create(e.main,ak,{Size=UDim2.new(1,0,0,f)}):Play()ag.tweenService:Create(e.
body,an,{Position=aq}):Play()ag.tweenService:Create(e.body,al,{BackgroundTransparency=0}):Play()ag.tweenService:Create(e
.titleLabel,am,{TextTransparency=0}):Play()ag.tweenService:Create(e.stroke,al,{Transparency=0.95}):Play()ag.tweenService
:Create(e.shadow,am,{Transparency=0.6}):Play()task.wait(0.05)if e._dismissed or not e.main.Parent then return end if e.
iconLabel then ag.tweenService:Create(e.iconLabel,am,{ImageTransparency=0}):Play()end task.wait(0.05)if e._dismissed or
not e.main.Parent then return end if e.descriptionLabel then ag.tweenService:Create(e.descriptionLabel,am,{
TextTransparency=0.35}):Play()end local g=0 while g<e.duration and not e._dismissed and e.main.Parent do local h=task.
wait()if not e._hovered then g+=h end end e:_dismiss()end function ae._dismiss(e)if e._dismissed then return end e.
_dismissed=true local f=e.window._liveNotifications local g=f and table.find(f,e)if f and g then table.remove(f,g)end if
not e.main.Parent then return end ag.tweenService:Create(e.body,al,{BackgroundTransparency=1}):Play()ag.tweenService:
Create(e.stroke,al,{Transparency=1}):Play()ag.tweenService:Create(e.shadow,am,{Transparency=1}):Play()ag.tweenService:
Create(e.titleLabel,am,{TextTransparency=1}):Play()if e.descriptionLabel then ag.tweenService:Create(e.descriptionLabel,
am,{TextTransparency=1}):Play()end if e.iconLabel then ag.tweenService:Create(e.iconLabel,am,{ImageTransparency=1}):
Play()end ag.tweenService:Create(e.body,ao,{Size=UDim2.new(1,-90,1,0)}):Play()local h=ag.tweenService:Create(e.main,ao,{
Size=UDim2.new(1,0,0,0)})h:Play()h.Completed:Wait()if not e.main.Parent then return end for i,j in e._connections do e.
window:Disconnect(j)end e.window:DestroySubtree(e.main)end return ae end)()end,[19]=function()local aa,ab,ac=a(19)local
ad return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,
al,am,an,ao,ap,aq,b,c,d,e=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.locale),ac(af.log),ac(af.HapticEngine
),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo
.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),400,22,24,22,16 local f,g,h,i,j,k,l,m=aq-b*2,18,14,15,
16,12,300,4 local n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C=f-m*2,16,13,20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}
local function D()for E=#B,1,-1 do local F=B[E]if F._closed or not F.screenGui.Parent then table.remove(B,E)end end end
local function E(F)D()return B[#B]==F end function ae.new(F,G)G=if typeof(G)=='table'then G else{}local H=setmetatable({
window=assert(F,'Missing argument #1 (Window expected)'),title=G.title or G.Title or'Popup',subtitle=G.subtitle or G.
Subtitle,content=G.content or G.Content,icon=G.icon or G.Icon,boxes=G.boxes or G.Boxes,options=G.options or G.Options,
dismissable=if G.dismissable~=nil then G.dismissable elseif G.Dismissable~=nil then G.Dismissable else true,_reveal={},
_connections={},_closed=false},ae)if not H.options or#H.options==0 then H.options={{text='Okay'}}end H:_build()D()table.
insert(B,H)task.spawn(function()H:_show()end)return H end function ae._fade(F,G,H,I)table.insert(F._reveal,{instance=G,
prop=H,to=I})return G end function ae._build(F)local G,H=F.window,F.icon~=nil and F.icon~=0 and F.icon~=''F.screenGui=G:
Create('ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,
DisplayOrder=ai.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})F.backdrop=G:
Create('Frame',{Name='Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),
Active=true,BackgroundTransparency=1,Parent=F.screenGui})F:_fade(F.backdrop,'BackgroundTransparency',A)F.card=G:Create(
'Frame',{Name='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(
0.5,0,0.5,14),Size=UDim2.fromOffset(aq,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,BorderSizePixel=0,
BackgroundTransparency=1,Parent=F.screenGui})F:_fade(F.card,'BackgroundTransparency',0)G:_scaleSurface(F.card)G:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=F.card},{Color={'WindowColor',ah.toColorSequence}})G:
Create('UICorner',{Parent=F.card},{CornerRadius='CornerRoundness'})F.cardStroke=G:Create('UIStroke',{Transparency=1,
Parent=F.card},{Color='SurfaceStroke'})F:_fade(F.cardStroke,'Transparency',0.95)F.cardShadow=G:CreateGlow(F.card,
'ShadowColor',26,1)F:_fade(F.cardShadow,'Transparency',0.55)G:Create('UIPadding',{PaddingLeft=UDim.new(0,b),PaddingRight
=UDim.new(0,b),PaddingTop=UDim.new(0,c),PaddingBottom=UDim.new(0,d),Parent=F.card})G:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,e),Parent=F.card})local I=F:_measureHeader(H)F:_buildHeader(H,I)local J=F:_buildContent()
F:_buildFooter()local K=2+(J>0 and 1 or 0)local L=c+I+J+w+d+e*(K-1)F.card.Size=UDim2.fromOffset(aq,L)F.card.
AutomaticSize=Enum.AutomaticSize.None if F.dismissable then table.insert(F._connections,G:Connect(F.backdrop.InputBegan,
function(M)if M.UserInputType==Enum.UserInputType.MouseButton1 or M.UserInputType==Enum.UserInputType.Touch then F:
Close()end end))table.insert(F._connections,G:Connect(ag.userInputService.InputBegan,function(M,N)if not N and M.KeyCode
==Enum.KeyCode.Escape and E(F)then if M==C then return end C=M F:Close()end end))end end function ae._buildHeader(F,G,H)
local I=F.window local J=I:Create('Frame',{Name='Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,H),LayoutOrder=1,
Parent=F.card})I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=
UDim.new(0,k),Parent=J})if G then F:_fade(I:Create('ImageLabel',{Image=F.icon,Size=UDim2.fromOffset(j,j),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=J},{ImageColor3='TitlingColor'}),
'ImageTransparency',0)end local K=I:Create('Frame',{Name='Text',BackgroundTransparency=1,Size=UDim2.new(1,G and-(j+k)or
0,0,F._columnH),LayoutOrder=2,Parent=J})I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=K})F:_fade(I:Create('TextLabel',{Text=aj.t(F.title),Size=UDim2.
new(1,0,0,F._titleH),BackgroundTransparency=1,TextSize=g,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=K},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if F.
subtitle and F.subtitle~=''then F:_fade(I:Create('TextLabel',{Text=aj.t(F.subtitle),Size=UDim2.new(1,0,0,F._subH),
BackgroundTransparency=1,TextSize=h,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,
TextTransparency=1,Parent=K},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0.55)end end function ae.
_buildContent(F)if(not F.content or F.content=='')and(not F.boxes or#F.boxes==0)then return 0 end local G,H=F.window,if
F.boxes and#F.boxes>0 then F:_measureBoxes()else F:_measureText()local I=math.min(H,l)+m*2 local J=G:Create(
'ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,I),CanvasSize=UDim2.
new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(255,255,
255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,ScrollBarImageTransparency=1,Parent=F.card})F:_fade(J,
'ScrollBarImageTransparency',0.8)G:Create('UIPadding',{PaddingLeft=UDim.new(0,m),PaddingRight=UDim.new(0,m),PaddingTop=
UDim.new(0,m),PaddingBottom=UDim.new(0,m),Parent=J})if F.boxes and#F.boxes>0 then G:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,u),Parent=J})for K,L in F.boxes do F:_buildBox(J,L,K)end else F:_fade(G:Create('TextLabel',{Text=aj.
t(F.content),Size=UDim2.new(1,0,0,H),BackgroundTransparency=1,TextSize=i,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,TextTransparency=1,Parent=J},{TextColor3='ContentColor',FontFace
='Font'}),'TextTransparency',0.5)end return I end function ae._buildBox(F,G,H,I)local J=F.window H=if typeof(H)=='table'
then H else{title=tostring(H)}local K,L,M,N,O=H.icon~=nil and H.icon~=0 and H.icon~='',F:_measureBox(H)local P=J:Create(
'Frame',{Name='Box',BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-v,0,L),LayoutOrder=
I,BackgroundTransparency=1,Parent=G})F:_fade(P,'BackgroundTransparency',0)local Q=J:StyleElementPanel(P)F:_fade(Q,
'Transparency',J.theme.ElementStrokeTransparency)J:Create('UIPadding',{PaddingLeft=UDim.new(0,o),PaddingRight=UDim.new(0
,o),PaddingTop=UDim.new(0,p),PaddingBottom=UDim.new(0,p),Parent=P})J:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,r),Parent=P})if K then F:_fade(J:Create('ImageLabel',{Image
=H.icon,Size=UDim2.fromOffset(q,q),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=P
},{ImageColor3='ContentColor'}),'ImageTransparency',0)end local R=J:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
new(1,K and-(q+r)or 0,0,O),LayoutOrder=2,Parent=P})J:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=R})F:_fade(J:Create('TextLabel',{Text=aj.t(H.title or
H.Title or''),Size=UDim2.new(1,0,0,M),BackgroundTransparency=1,TextSize=s,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=R},{TextColor3='ContentColor',FontFace='TitleFont'}),
'TextTransparency',0)local S=H.description or H.Description if S and S~=''then F:_fade(J:Create('TextLabel',{Text=aj.t(S
),Size=UDim2.new(1,0,0,N),BackgroundTransparency=1,TextSize=t,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Top,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=R},{TextColor3='ContentColor',FontFace=
'Font'}),'TextTransparency',0.65)end end function ae._buildFooter(F)local G=F.window local H=G:Create('Frame',{Name=
'Footer',BackgroundTransparency=1,Size=UDim2.new(1,0,0,w),LayoutOrder=3,Parent=F.card})G:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,x),Parent=H})for I,J in F.options do F:_buildButton(H,J,I)end end function ae._buildButton(F,G,H,I)local J=F.
window H=if typeof(H)=='table'then H else{text=tostring(H)}local K,L,M,N,O,P,Q=H.style or H.Style or'neutral',H.text or
H.Text or H.name or H.Name or'Okay',H.callback or H.Callback if K=='primary'then N,O,P,Q=J.theme.AccentColor,J.theme.
AccentStroke,J.theme.AccentStroke,0.1 elseif K=='danger'then N,O,P,Q=J.theme.ErrorColor,J.theme.ErrorStrokeColor,J.theme
.ErrorStrokeColor,0 else N,O,P,Q=J.theme.NeutralButton,J.theme.NeutralButtonHover,J.theme.NeutralButtonStroke,0.85 end
local R=J:Create('Frame',{Name='Button',BackgroundColor3=N,BorderSizePixel=0,Size=UDim2.new(0,0,0,w),LayoutOrder=I,
BackgroundTransparency=1,Parent=G})F:_fade(R,'BackgroundTransparency',0)J:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=R})J:Create('UICorner',{CornerRadius=y,Parent=R})local S=J:Create('UIStroke',{Color=P,Transparency=1,Parent=
R})F:_fade(S,'Transparency',Q)F:_fade(J:Create('TextLabel',{Text=aj.t(L),Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,TextSize=z,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,
TextColor3=ah.contrastText(N),TextTransparency=1,Parent=R},{FontFace='Font'}),'TextTransparency',0)local T,U=J:Create(
'TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=R}),TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(F._connections,J:Connect(T.MouseEnter,function()
if F._closed then return end ag.tweenService:Create(R,U,{BackgroundColor3=O}):Play()end))table.insert(F._connections,J:
Connect(T.MouseLeave,function()ag.tweenService:Create(R,U,{BackgroundColor3=N}):Play()end))table.insert(F._connections,J
:Connect(T.MouseButton1Click,function()if F._closed then return end al.click()ag.tweenService:Create(S,U,{Transparency=1
}):Play()if M then task.spawn(function()local V,W=pcall(M)if not V then ak.warn("Rayfield: popup button '"..L..
"' callback errored:")ak.print(W)end end)end F:Close()end))end function ae._measureHeader(F,G)local H=f-(if G then j+k
else 0)F._titleH=ah.textHeight(F.window.theme.Font,g,aj.resolve(F.title),H)F._subH=if F.subtitle and F.subtitle~=''then
ah.textHeight(F.window.theme.Font,h,aj.resolve(F.subtitle),H)else 0 F._columnH=F._titleH+(if F._subH>0 then 3+F._subH
else 0)return math.max(F._columnH,if G then j else 0)end function ae._measureText(F)return ah.textHeight(F.window.theme.
Font,i,aj.resolve(F.content),n)end function ae._measureBox(F,G)G=if typeof(G)=='table'then G else{title=tostring(G)}
local H=G.icon~=nil and G.icon~=0 and G.icon~=''local I=n-v-o*2-(if H then q+r else 0)local J,K,L=ah.textHeight(F.window
.theme.TitleFont,s,aj.resolve(G.title or G.Title or''),I),0,G.description or G.Description if L and L~=''then K=ah.
textHeight(F.window.theme.Font,t,aj.resolve(L),I)end local M=J+(if K>0 then 3+K else 0)local N=math.max(M,if H then q
else 0)+p*2 return N,J,K,M end function ae._measureBoxes(F)local G=0 for H,I in F.boxes do G+=(F:_measureBox(I))if H<#F.
boxes then G+=u end end return G end function ae._show(F)if not F.screenGui.Parent then return end al.notify()ag.
tweenService:Create(F.card,am,{Position=UDim2.new(0.5,0,0.5,0)}):Play()for G,H in F._reveal do local I=if H.instance==F.
backdrop then ap else an ag.tweenService:Create(H.instance,I,{[H.prop]=H.to}):Play()end end function ae.Close(F)if F.
_closed then return end F._closed=true local G=table.find(B,F)if G then table.remove(B,G)end for H,I in F._connections
do F.window:Disconnect(I)end F._connections={}if not F.screenGui.Parent then return end ag.tweenService:Create(F.card,ao
,{Position=UDim2.new(0.5,0,0.5,10)}):Play()for H,I in F._reveal do ag.tweenService:Create(I.instance,ao,{[I.prop]=1}):
Play()end task.delay(ao.Time,function()F.window:DestroySubtree(F.screenGui)end)end return ae end)()end,[20]=function()
local aa,ab,ac=a(20)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,c,d,e=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.locale),
60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local f=TweenInfo.new(e,Enum.EasingStyle.Quint,
Enum.EasingDirection.InOut,-1,true)local function g(h:unknown):number?local i=tonumber(h)if i==nil or i~=i or math.abs(i
)==math.huge then return nil end return i end function ae.new(h,i)i=if typeof(i)=='table'then i else{}local j=g(i.steps
or i.Steps)j=if j and j>=2 then math.floor(j)else nil local k=i.range or i.Range local l,m=g(k and k[1])or 0,g(k and k[2
])or j or 1 if l>m then l,m=m,l end local n=setmetatable({tab=assert(h,'Missing argument #1 (Tab expected)'),window=h.
window,name=i.name or i.Name or'Progress',icon=i.icon or i.Icon,description=i.description or i.Description,min=l,max=m,
steps=j,value=0,text=i.text or i.Text,format=i.format or i.Format,showValue=if i.showValue==nil then true else i.
showValue==true,indeterminate=i.indeterminate or i.Indeterminate or false},ae)n.value=n:_clamp(g(i.value or i.Value)or l
)n:_build()if n.description then n.descriptor=ac(ab.Parent.descriptor).new(n.tab,{description=n.description})end return
n end function ae._clamp(h,i:number):number return math.clamp(g(i)or h.min,h.min,h.max)end function ae._ratio(h):number
local i=h.max-h.min if i<=0 then return 1 end return(h.value-h.min)/i end function ae._filledSteps(h):number local i=h.
steps::number return math.clamp(math.round(h:_ratio()*i),0,i)end function ae._readout(h):string if h.text then return aj
.resolve(h.text)end if h.format then local i,j=pcall(h.format,h.value,h.min,h.max)if i and type(j)=='string'then return
j end end if h.steps then return string.format('%d/%d',h:_filledSteps(),h.steps)end return string.format('%d%%',math.
round(h:_ratio()*100))end function ae._build(h)h.main=h.window:Create('Frame',{Size=UDim2.new(1,-20,0,ak),
BorderSizePixel=0,Name=h.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=h.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})h.stroke=h.window:StyleElementBody(h.main)h.container=h.window:Create(
'Frame',{Size=UDim2.new(0,170,0,ap),Position=UDim2.new(0,am,0,20),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=
1,BorderSizePixel=0,Parent=h.main})h.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=h.container})if h.icon then h.iconLabel=h.window:Create('ImageLabel',{
Image=h.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=h.
container},{ImageColor3='ContentColor'})end h.title=h.window:Create('TextLabel',{Text=aj.t(h.name),Size=UDim2.
fromOffset(250,ap),BorderSizePixel=0,BackgroundTransparency=1,TextSize=ap,AutomaticSize=Enum.AutomaticSize.X,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=h.container},{
TextColor3='ContentColor',FontFace='Font'})h.readout=h.window:Create('TextLabel',{Text=h:_readout(),AnchorPoint=Vector2.
new(1,0.5),Position=UDim2.new(1,-am,0,20),Size=UDim2.fromOffset(50,aq),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=aq,TextXAlignment=Enum.TextXAlignment.Right,Visible=h.showValue,
TextTransparency=1,Parent=h.main},{TextColor3='ContentColor',FontFace='Font'})if h.steps then h:_buildSteps()return end
h.track=h.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.new(1,-am*2,0
,al),BorderSizePixel=0,BackgroundTransparency=1,Parent=h.main},{BackgroundColor3='SliderBackground'})h.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=h.track})h.fill=h.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(if h.indeterminate then 0 else h:_ratio(),1),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=h.track})h.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=h.fill})h.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2
,Transparency=d,Parent=h.fill},{Color={'SliderProgress',ah.toColorSequence}})h.fillGlow=h.window:CreateGlow(h.fill,
'AccentColor',20,1)if h.indeterminate then h:_startSweep()end end function ae._buildSteps(h)local i=h.steps::number h.
track=h.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2.new(1,-am*2,0,
an),BackgroundTransparency=1,BorderSizePixel=0,Parent=h.main})h.window:Create('UIListLayout',{Padding=UDim.new(0,ao),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=h.track})h.stepFrames={}for j=1,i do local k=h.
window:Create('Frame',{Size=UDim2.new(1/i,-(ao*(i-1))/i,1,0),BorderSizePixel=0,LayoutOrder=j,BackgroundTransparency=1,
Parent=h.track},{BackgroundColor3='SliderBackground'})h.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k})
local l=h.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=
0,ZIndex=2,BackgroundTransparency=1,Parent=k})h.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=l})h.window:
Create('UIGradient',{Rotation=90,Parent=l},{Color={'SliderProgress',ah.toColorSequence}})table.insert(h.stepFrames,{
segment=k,fill=l})end end function ae._startSweep(h)if h._sweep or h.steps then return end h.fill.AnchorPoint=Vector2.
new(0,0.5)h.fill.Position=UDim2.fromScale(0,0.5)h.fill.Size=UDim2.fromScale(0,1)h._sweep=ag.tweenService:Create(h.fill,f
,{Size=UDim2.fromScale(1,1)})h._sweep:Play()end function ae._stopSweep(h)if not h._sweep then return end h._sweep:
Cancel()h._sweep=nil h.fill.AnchorPoint=Vector2.new(0,0.5)h.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(
h,i:boolean?)h.readout.Text=h:_readout()if h.steps then if not h._shown then return end local j=h:_filledSteps()for k,l
in h.stepFrames do local m=if k<=j then 0 else 1 if i==false then l.fill.BackgroundTransparency=m else ag.tweenService:
Create(l.fill,c,{BackgroundTransparency=m}):Play()end end return end local j=UDim2.fromScale(h:_ratio(),1)if i==false
then h.fill.Size=j else ag.tweenService:Create(h.fill,c,{Size=j}):Play()end end function ae.Set(h,i)h.value=h:_clamp(i)
if h.indeterminate then h.indeterminate=false h:_stopSweep()end h:_render()end function ae.Get(h):number return h.value
end function ae.GetPercentage(h):number return h:_ratio()end function ae.SetRange(h,i,j)i=g(i)or h.min j=g(j)or h.max if
i>j then i,j=j,i end h.min,h.max=i,j h.value=h:_clamp(h.value)h:_render()end function ae.SetText(h,i)h.text=i h.readout.
Text=h:_readout()end function ae.SetIndeterminate(h,i)i=i==true if i==h.indeterminate then return end h.indeterminate=i
if i then h:_startSweep()else h:_stopSweep()h:_render(false)end end function ae._setShown(h,i,j)local k=h.window h.
_shown=i k:_reveal(h.readout,{TextTransparency=if i then b else 1},j)if i then k:_revealCommon(h,j)else k:_hideCommon(h,
j)end if h.steps then local l=h:_filledSteps()for m,n in h.stepFrames do k:_reveal(n.segment,{BackgroundTransparency=if
i then 0 else 1},j)k:_reveal(n.fill,{BackgroundTransparency=if i and m<=l then 0 else 1},j)end return end k:_reveal(h.
track,{BackgroundTransparency=if i then 0 else 1},j)k:_reveal(h.fill,{BackgroundTransparency=if i then 0 else 1},j)k:
_reveal(h.fillGlow,{Transparency=if i then k.theme.AccentGlow else 1},j)end function ae.Remove(h)h:_stopSweep()if h.
descriptor then h.descriptor:Remove()end if h.tab._forget then h.tab:_forget(h)end h.window:DestroySubtree(h.main)end
ai(ae)return ae end)()end,[21]=function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent.
utility local af,ag,ah,ai,aj,ak,al,am=ac(ae.variables),ac(ae.constants),ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.
new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.6,0.2 local function an(ao)if ao.__type=='Group'then local
ap={}local function aq(b)for c,d in b.elements do if d.__type=='Group'then aq(d)elseif d.name then table.insert(ap,d.
name)end end end aq(ao)return table.concat(ap,'\n')end return ao.name or''end local function ao(ap)local aq={}for b,c in
ap.tabs do if c.neglectSelector then continue end for d,e in c.elements do if e.__type~='Section'then table.insert(aq,e)
end end end return aq end local function ap(aq,b,c)af.tweenService:Create(aq.searchPill,c,{BackgroundTransparency=if b
then 0.9 else 1}):Play()af.tweenService:Create(aq.searchStroke,c,{Transparency=if b then 0.85 else 1}):Play()af.
tweenService:Create(aq.searchShadow,c,{Transparency=if b then 0.92 else 1}):Play()af.tweenService:Create(aq.searchIcon,c
,{ImageTransparency=if b then 0.65 else 1}):Play()af.tweenService:Create(aq.searchInput,c,{TextTransparency=if b then
0.2 else 1}):Play()end local function aq(b,c,d)if b.layout.mode=='sidebar'then return end for e,f in b.tabs do if not f.
neglectSelector and f.topbarItem then f:_applyVisual(if c then(if b.selectedTab==f then'selected'else'unselected')else
'hidden',d)end end end local function b(c,d)d=string.lower(d or'')local e=false for f,g in c._searchUnits do local h=d==
''or string.find(g.text,d,1,true)~=nil g.unit.main.Visible=h if g.unit.descriptor then g.unit.descriptor.main.Visible=h
end e=e or h end c.searchEmpty.Visible=not e and d~=''end local function c(d)d._searchUnits={}local e=0 for f,g in ao(d)
do e+=1 local h=g.main table.insert(d._searchUnits,{unit=g,text=string.lower(an(g)),homeParent=h.Parent,homeOrder=h.
LayoutOrder,descOrder=g.descriptor and g.descriptor.main.LayoutOrder})h.LayoutOrder=e*10 h.Parent=d.searchPage h.Visible
=true if g.descriptor then g.descriptor.main.LayoutOrder=e*10+1 g.descriptor.main.Parent=d.searchPage g.descriptor.main.
Visible=true end end end local function d(e)for f,g in e._searchUnits do local h=g.unit if h.main and h.main.Parent then
h.main.LayoutOrder=g.homeOrder h.main.Parent=g.homeParent h.main.Visible=true end if h.descriptor and h.descriptor.main
and h.descriptor.main.Parent then h.descriptor.main.LayoutOrder=g.descOrder h.descriptor.main.Parent=g.homeParent h.
descriptor.main.Visible=true end end e._searchUnits={}end function aj.open(e)if e._searching or e.minimised or not e:
_interactive()then return end e._searching=true c(e)b(e,'')e:_jumpTo(e.searchPage)aq(e,false,ak)task.delay(ak.Time,
function()if e._searching and e.layout.mode~='sidebar'then e.tabList.Visible=false end end)e.searchPill.Visible=true ap(
e,true,ak)e.searchInput:CaptureFocus()af.tweenService:Create(e.searchAction.iconLabel,ak,{ImageTransparency=am}):Play()
end function aj.close(e,f)if not e._searching then return end f=f or{}e._searching=false e.searchInput.Text=''e.
searchInput:ReleaseFocus()e.searchEmpty.Visible=false d(e)local g=if f.jumpTo==nil then e.selectedTab and e.selectedTab.
tabPage else f.jumpTo if g then e:_jumpTo(g)end ap(e,false,ak)task.delay(ak.Time,function()if not e._searching then e.
searchPill.Visible=false end end)if f.showTabs then e.tabList.Visible=true aq(e,true,ak)end af.tweenService:Create(e.
searchAction.iconLabel,ak,{ImageTransparency=al}):Play()end function aj.toggle(e)if e._searching then aj.close(e,{
showTabs=true})else aj.open(e)end end function aj.railWidth(e,f)if e.searchPill then e.searchPill.Size=UDim2.new(1,-(f+
30),0,35)end end function aj.build(e)e._searching=false e.searchPage=e:Create('ScrollingFrame',{Name='Search',Size=UDim2
.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency
=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=ag.pageScrollbar.thickness,
ScrollBarImageTransparency=ag.pageScrollbar.transparency,VerticalScrollBarInset=Enum.ScrollBarInset.None,
ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2000,Parent=e.elements},{ScrollBarImageColor3='ContentColor'})e
:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.
searchPage})e:Create('UIPadding',{PaddingTop=UDim.new(0,if e.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.
new(0,33),Parent=e.searchPage})e.searchEmpty=e:Create('TextLabel',{Name='NoResults',Text=ah.t'No results',FontFace=af.
brandFont(Enum.FontWeight.Medium),TextSize=15,TextTransparency=0.6,BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.new(0.5,0,0.55,0),Size=UDim2.fromOffset(200,20),Visible=false,ZIndex=3,Parent=e.main},{TextColor3=
'ContentColor',FontFace='Font'})local f=e.layout.mode=='sidebar'local g=if f then e.layout.chromeHeight+8 else e.layout.
tabStripTop+1 e.searchPill=e:Create('Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if f then 1 else 0.5,0),Position=
UDim2.new(if f then 1 else 0.5,if f then-15 else 0,0,g),Size=UDim2.new(1,if f then-(e.layout.railWidth+30)else-35,0,35),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=e
.main})e:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=e.searchPill})e.searchStroke=e:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Thickness=1,Transparency=1,Parent=e.searchPill})e.searchShadow=e:Create('UIShadow',{
BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=e.searchPill})e.searchIcon=e
:Create('ImageLabel',{Image='rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,15,0.5,1),Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=e.searchPill}
,{ImageColor3='ContentColor'})e.searchInput=e:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,
TextTransparency=1,Parent=e.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'}
)e:Connect(e.searchInput:GetPropertyChangedSignal'Text',function()if e._searching then b(e,e.searchInput.Text)end end)e.
searchAction=ai.new(e,{name='Search',icon=ag.icons.search,order=4,callback=function()aj.toggle(e)end})e.searchAction.
isLit=function()return e._searching end end return aj end)()end,[22]=function()local aa,ab,ac=a(22)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.
Parent.utility.locale)function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{}local aj=setmetatable({tab=assert(ah,
'Missing argument #1 (Tab expected)'),window=ah.window,name=ai.name or ai.Name or'Section',icon=ai.icon or ai.Icon},ae)
local ak=if#aj.tab.elements==0 then 0 else 13 aj.main=aj.window:Create('Frame',{Size=UDim2.new(1,-40,0,20+ak),
BorderSizePixel=0,Name=aj.name,BackgroundTransparency=1,Parent=aj.tab.tabPage})if ak>0 then aj.window:Create('UIPadding'
,{PaddingTop=UDim.new(0,ak),Parent=aj.main})end aj.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,
Parent=aj.main})if aj.icon then aj.iconLabel=aj.window:Create('ImageLabel',{Image=aj.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=aj.main},{ImageColor3='ContentColor'})end aj.title
=aj.window:Create('TextLabel',{Text=ag.t(aj.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1
,TextSize=15,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=aj.main},{TextColor3='ContentColor',FontFace='Font'})return aj end function ae._setShown(ah,ai
,aj)local ak=ah.window ak:_reveal(ah.title,{TextTransparency=if ai then 0.6 else 1},aj)if ah.iconLabel then ak:_reveal(
ah.iconLabel,{ImageTransparency=if ai then 0.65 else 1},aj)end end af(ae)return ae end)()end,[23]=function()local aa,ab,
ac=a(23)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,an,ao=ac(ae.
variables),ac(ae.image),ac(ae.locale),ac(ab.Parent.tabSelector),ac(ab.Parent.search),{},0,0.7,0.95,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function ap(aq)return aq.layout.mode=='sidebar'and aq.profile~=nil
and aq.settings.showProfile and af.localPlayer~=nil end local function aq(b,c)local d=af.localPlayer if not d then
return end b.profile=b:Create('Frame',{Name='Profile',AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),
Size=UDim2.new(1,0,0,c.footerHeight),BackgroundTransparency=1,Parent=b.sidebar})b.profileContainer=b:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,c.rowInset,0.5,0),Size=UDim2.new(1,-c.rowInset,1,0),
BackgroundTransparency=1,Parent=b.profile})b.profileLayout=b:Create('UIListLayout',{Padding=UDim.new(0,10),FillDirection
=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.profileContainer})b.profileAvatar=b:Create(
'ImageLabel',{Name='Avatar',Image=ag.avatar(d.UserId,function(e)if b.profileAvatar and not b.unloaded then ag.assign(b.
profileAvatar,'Image',e)end end),Size=UDim2.fromOffset(c.avatarSize,c.avatarSize),BackgroundColor3=Color3.fromRGB(255,
255,255),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=b.profileContainer})b:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=b.profileAvatar})b.profileLabels=b:Create('Frame',{Size=UDim2.fromOffset(50,c.
avatarSize),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=b.profileContainer})b:
Create('UIListLayout',{Padding=UDim.new(0,2),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b
.profileLabels})b.profileName=b:Create('TextLabel',{Text=d.DisplayName,Size=UDim2.fromOffset(50,16),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=b
.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})b.profileSubtitle=b:Create('TextLabel',{Text='',Size=UDim2.
fromOffset(50,14),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,Visible=false,TextTransparency=1,Parent=b.profileLabels},{TextColor3='TitlingColor',
FontFace='Font'})end function ak.build(b,c)b.sidebar=b:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),
Position=UDim2.fromScale(0,1),Size=UDim2.new(0,c.railWidth,1,-c.chromeHeight),BackgroundTransparency=1,Visible=false,
Parent=b.main})b.tabList=b:Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,BorderSizePixel=0,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,
Parent=b.sidebar})b:Create('UIPadding',{PaddingTop=UDim.new(0,c.railPadding),PaddingBottom=UDim.new(0,c.railPadding),
Parent=b.tabList})b.tabListLayout=b:Create('UIListLayout',{Padding=UDim.new(0,c.rowSpacing),FillDirection=Enum.
FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.tabList})aq(b,c)ak.reflowProfile(b)end function ak.reflowProfile(b)local c
,d=b.layout,ap(b)if b.profile then b.profile.Visible=d end b.tabList.Size=UDim2.new(1,0,1,if d then-c.footerHeight else
0)end function ak.applyWidth(b,c)local d=b.layout b.sidebar.Size=UDim2.new(0,c,1,-d.chromeHeight)b.elements.Size=UDim2.
new(1,-c,1,-d.chromeHeight)b.bottomFade.Size=UDim2.new(1,-c,d.fadeSize.Y.Scale,d.fadeSize.Y.Offset)aj.railWidth(b,c)
local e=c<(d.railWidth::number)for f,g in b.tabs do if not g.neglectSelector then ai.setRowCollapsed(g,e,d)end end if b.
profileContainer then b.profileContainer.Position=UDim2.new(0,if e then 0 else d.rowInset,0.5,0)b.profileContainer.Size=
UDim2.new(1,if e then 0 else-d.rowInset,1,0)b.profileLayout.HorizontalAlignment=if e then Enum.HorizontalAlignment.
Center else Enum.HorizontalAlignment.Left b.profileLabels.Visible=not e end end function ak.setProfileShown(b,c,d)if not
b.profile or not b.profile.Visible then return end local e={[b.profileAvatar]={ImageTransparency=if c then 0 else 1,
BackgroundTransparency=if c then an else 1},[b.profileName]={TextTransparency=if c then al else 1},[b.profileSubtitle]={
TextTransparency=if c then am else 1}}for f,g in e do if d then af.tweenService:Create(f,d,g):Play()else for h,i in g do
f[h]=i end end end end function ak.setProfileEnabled(b,c)if not b.profile then b.settings.showProfile=c return end if c
then b.settings.showProfile=true ak.reflowProfile(b)ak.setProfileShown(b,true,ao)return end ak.setProfileShown(b,false,
ao)task.delay(ao.Time,function()if b.unloaded or b.settings.showProfile then return end ak.reflowProfile(b)end)b.
settings.showProfile=false end function ak.setSubtitle(b,c)if not b.profileSubtitle then return end local d=if type(c)==
'string'and c~=''then ah.resolve(c)else nil b.profileSubtitle.Text=d or''b.profileSubtitle.Visible=d~=nil end return ak
end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'
local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.
moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)local function an(ao)local ap=0 while ap<6 do local aq=ao*10^
ap if math.abs(aq-math.round(aq))<1e-9 then break end ap+=1 end return ap end local function ao(ap,aq,b)local c=ap[1]+
math.round((b-ap[1])/aq)*aq return math.clamp(c,ap[1],ap[2])end local ap,aq,b,c,d,e=TweenInfo.new(0.45,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo
.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),440,Vector2.new(35,20),Vector2.new(41,22)local f=math.ceil(d.X
/2)local function g(h:number):UDim2 return UDim2.new(h,math.round(f*(1-2*h)),1,0)end local function h():UDim2 return
UDim2.new(1,0,0.5,0)end local function i(j:number,k:number,l:number):number return math.clamp((j-k)/l,0,1)end function
ae.new(j,k)k=if typeof(k)=='table'then k else{}local l=setmetatable({tab=assert(j,'Missing argument #1 (Tab expected)'),
window=j.window,name=k.name or k.Name or'Slider',icon=k.icon or k.Icon,description=k.description or k.Description,
forgetState=k.forgetState or k.ForgetState or j.forgetState,range=k.range or k.Range or{0,100},increment=k.increment or
k.Increment or 1,suffix=k.suffix or k.Suffix or'',callback=k.callback or k.Callback or function()end,dragging=false,
minimal=k.minimal or k.Minimal or false,_handleWidth=d.X},ae)assert(typeof(l.range)=='table'and typeof(l.range[1])==
'number'and typeof(l.range[2])=='number','A slider range needs two numbers, like { 0, 100 }.')if l.range[1]>l.range[2]
then l.range={l.range[2],l.range[1]}end if l.increment<=0 then l.increment=1 end l.value=if(k.value or k.Value)~=nil
then(k.value or k.Value)elseif(k.currentValue or k.CurrentValue)~=nil then(k.currentValue or k.CurrentValue)else l.range
[1]l.value=ao(l.range,l.increment,l.value)l._decimals=an(l.increment)l.flag=k.flag or k.Flag or(not l.forgetState and ah
.deriveFlagFromName(l.name)or nil)l.window:_registerControl(l)l.main=l.window:Create('Frame',{Size=UDim2.new(1,-20,0,65)
,BorderSizePixel=0,Name=l.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=l.tab.
tabPage},{BackgroundTransparency='ElementTransparency'})l.stroke=l.window:StyleElementBody(l.main)l._lastValue=l.value
if not l.minimal then l:_buildLabel()end l.track=l.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
new(1,-15,0.5,0),Size=UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=l.main},{
BackgroundColor3='SliderBackground'})l.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=l.track})l.progress=
l.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=l.track})l.
window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=l.progress})l.window:Create('UIGradient',{Offset=Vector2.
new(0,0.5),Rotation=2,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)
},Parent=l.progress},{Color={'SliderProgress',ah.toColorSequence}})l.progressGlow=l.window:CreateGlow(l.progress,
'AccentColor',20,1)l.handle=l.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=h(),Size=UDim2.
fromOffset(d.X,d.Y),BorderSizePixel=0,ZIndex=50,BackgroundTransparency=1,Parent=l.progress},{BackgroundColor3=
'SliderHandle'})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=l.handle})l.handleGlow=l.window:
CreateGlow(l.handle,Color3.fromRGB(255,255,255),10,1)l.handleStroke=l.window:Create('UIStroke',{Transparency=1,Parent=l.
handle},{Color='SliderStroke'})l.interact=l.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,
1),Text='',TextTransparency=1,ZIndex=10,Parent=l.track})l.window:ConnectFor(l,l.main.MouseEnter,function()if not l.
window:_interactive()then return end ag.tweenService:Create(l.track,ap,{BackgroundColor3=l.window.theme.
SliderBackgroundHover}):Play()end)l.window:ConnectFor(l,l.main.MouseLeave,function()ag.tweenService:Create(l.track,ap,{
BackgroundColor3=l.window.theme.SliderBackground}):Play()end)l.window:ConnectFor(l,l.interact.InputBegan,function(m)if m
.UserInputType==Enum.UserInputType.MouseButton1 or m.UserInputType==Enum.UserInputType.Touch then am.click()l.dragging=
true l:_setHeld(true)l:_updateFromMouse()if l._dragConnection then l._dragConnection:Disconnect()l._dragConnection=nil
end l._dragConnection=ag.runService.RenderStepped:Connect(function()if l.window.unloaded or not l.dragging then if l.
_dragConnection then l._dragConnection:Disconnect()l._dragConnection=nil end return end l:_updateFromMouse()end)end end)
l.window:ConnectFor(l,ag.userInputService.InputEnded,function(m)if m.UserInputType==Enum.UserInputType.MouseButton1 or m
.UserInputType==Enum.UserInputType.Touch then l:_endDrag()end end)l.window:ConnectFor(l,ag.userInputService.
WindowFocusReleased,function()l:_endDrag()end)if l.description and not l.minimal then l.descriptor=ac(ab.Parent.
descriptor).new(l.tab,{description=l.description})end l.window:ConnectFor(l,l.main:GetPropertyChangedSignal
'AbsoluteSize',function()if l.window.animating or(l.window.hidden and l.window.hasShownOnce)then return end l:
_applyLayout()end)l:_applyLayout()if l.minimal then l.main.Size=UDim2.new(1,-20,0,41)l.track.AnchorPoint=Vector2.new(0.5
,0.5)l.track.Position=UDim2.new(0.5,0,0.5,0)l.track.Size=UDim2.new(1,-30,0,14)end l:_renderProgress()return l end
function ae._buildLabel(j)j.container=j.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,
0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=j.main})j.
containerLayout=j.window:Create('UIListLayout',{Padding=UDim.new(0,2),VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=j.container})j.titleContainer=j.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=j.container})j.window:Create('UIListLayout',{Padding=UDim
.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=j.titleContainer})j.titleFlex=j.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,
Parent=j.titleContainer})if j.icon then j.iconLabel=j.window:Create('ImageLabel',{Image=j.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=j.titleContainer},{ImageColor3=
'ContentColor'})end j.title=j.window:Create('TextLabel',{Text=al.t(j.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
RichText=true,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=j.titleContainer},{TextColor3='ContentColor',FontFace=
'Font'})j.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=j.title})j.valueHost=j.window:Create(
'Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=j.container})
j.valueOdo=ai.new(j.window,j.valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28
})j.valueOdo:snap(j:_format(j.value))end function ae._setMainHeight(j,k)if j._widthManaged then j.main.Size=UDim2.new(j.
main.Size.X.Scale,j.main.Size.X.Offset,0,k)else j.main.Size=UDim2.new(1,-20,0,k)end end function ae._applyLayout(j)if j.
minimal then return end local k=j.main.AbsoluteSize.X local l=if k>0 and k<c then'narrow'else'wide'if j._layoutMode==l
then return end j._layoutMode=l if l=='narrow'then j:_setMainHeight(70)j.container.AnchorPoint=Vector2.new(0,0)j.
container.Position=UDim2.new(0,20,0,14)j.container.Size=UDim2.new(1,-40,0,16)j.containerLayout.FillDirection=Enum.
FillDirection.Horizontal j.titleFlex.FlexMode=Enum.UIFlexMode.Fill j.valueHost.AutomaticSize=Enum.AutomaticSize.X j.
valueHost.Size=UDim2.new(0,0,0,16)j.track.AnchorPoint=Vector2.new(0.5,1)j.track.Position=UDim2.new(0.5,0,1,-14)j.track.
Size=UDim2.new(1,-30,0,14)else j:_setMainHeight(65)j.container.AnchorPoint=Vector2.new(0,0.5)j.container.Position=UDim2.
new(0,20,0.5,0)j.container.Size=UDim2.new(0,170,0,33)j.containerLayout.FillDirection=Enum.FillDirection.Vertical j.
titleFlex.FlexMode=Enum.UIFlexMode.None j.valueHost.AutomaticSize=Enum.AutomaticSize.None j.valueHost.Size=UDim2.new(1,0
,0,16)j.track.AnchorPoint=Vector2.new(1,0.5)j.track.Position=UDim2.new(1,-15,0.5,0)j.track.Size=UDim2.new(0,222,0,14)end
end function ae._format(j,k)local l=string.format('%.'..j._decimals..'f',k)if j.suffix~=''then return l..' '..j.suffix
end return l end function ae._pillTravel(j)return math.max(j.track.AbsoluteSize.X-f*2,0)end function ae._renderProgress(
j,k)local l=j.range[2]-j.range[1]local m=if l~=0 then math.clamp((j.value-j.range[1])/l,0,1)else 0 local n=g(m)if k then
ag.tweenService:Create(j.progress,k,{Size=n}):Play()else j.progress.Size=n end end function ae._updateFromMouse(j)local
k=j:_pillTravel()if k<=0 then return end local l=i(ag.userInputService:GetMouseLocation().X,j.track.AbsolutePosition.X+f
,k)local m=ao(j.range,j.increment,j.range[1]+l*(j.range[2]-j.range[1]))if m~=j.value then j.value=m if j.valueOdo then j
.valueOdo:snap(j:_format(m))end j._lastValue=m j:_renderProgress(b)j:_fireCallback(m)end end function ae._endDrag(j)if
not j.dragging then return end j.dragging=false j:_setHeld(false)if j._dragConnection then j._dragConnection:Disconnect(
)j._dragConnection=nil end j.window:_persist(j)end function ae._setHeld(j,k)if not k then j:_fireCallback(j.value)end
local l=if k then e else d j._handleWidth=l.X ag.tweenService:Create(j.handle,aq,{Size=UDim2.fromOffset(l.X,l.Y),
BackgroundTransparency=if k then 0.7 else 0}):Play()ag.tweenService:Create(j.handleStroke,aq,{Transparency=if k then 0.6
else 1}):Play()j:_renderProgress(aq)end function ae._fireCallback(j,k)j.window:_runGuarded(j,j.callback,k,j.dragging==
true)end function ae.Set(j,k,l)k=ao(j.range,j.increment,k)j.value=k if j.valueOdo then j.valueOdo:to(j:_format(k),k>=(j.
_lastValue or k))end j._lastValue=k j:_renderProgress(ap)if not l then j:_fireCallback(k)j.window:_persist(j)end end
local j=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(k,l,m
)local n=k.window if l then n:_revealCommon(k,m)n:_reveal(k.track,{BackgroundTransparency=0},m)n:_reveal(k.progress,{
BackgroundTransparency=0},m)n:_reveal(k.handle,{BackgroundTransparency=0},m)if k.valueOdo then k.valueOdo:reveal(0.3,m)
end n:_reveal(k.progressGlow,{Transparency=math.max(0.55,n.theme.AccentGlow)},m,j)n:_reveal(k.handleGlow,{Transparency=
0.8},m,j)else n:_hideCommon(k,m)n:_reveal(k.track,{BackgroundTransparency=1},m)n:_reveal(k.progress,{
BackgroundTransparency=1},m)n:_reveal(k.handle,{BackgroundTransparency=1},m)if k.valueOdo then k.valueOdo:reveal(1,m)end
n:_reveal(k.progressGlow,{Transparency=1},m,j)n:_reveal(k.handleGlow,{Transparency=1},m,j)end end function ae.
_refreshTheme(k)ag.tweenService:Create(k.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
,{Transparency=math.max(0.55,k.window.theme.AccentGlow)}):Play()end function ae._minWidth(k)if k.minimal then return 100
end local l=40 if k.icon then l+=22 end l+=ah.textWidth(k.window.theme.Font,16,al.resolve(k.name))l+=12 l+=ah.textWidth(
k.window.theme.Font,15,k:_format(k.value))return math.max(l,160)end aj(ae)ak(ae)return ae end)()end,[25]=function()local
aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.constants),
ac(af.locale),ac(af.log)local an,ao,ap,aq=ak.statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function b(c)return c.fill.
Keypoints[1].Value end local function c(d)if d>0 then return string.format('+%.1f%%',d)elseif d<0 then return string.
format('%.1f%%',d)else return'0%'end end local function d(e)if typeof(e)~='number'then return tostring(e)end local f=
math.round(math.abs(e))local g=string.format('%.0f',f)local h=g:reverse():gsub('%d%d%d','%0,'):reverse()if h:sub(1,1)==
','then h=h:sub(2)end return if e<0 and f~=0 then'-'..h else h end local function e(f)local g=math.round(f)if g>0 then
return'+'..d(g)elseif g<0 then return d(g)else return'0'end end function ae.new(f,g)g=if typeof(g)=='table'then g else{}
local h=setmetatable({tab=assert(f,'Missing argument #1 (Tab expected)'),window=f.window,name=g.name or g.Name or
'Statistic',icon=g.icon or g.Icon,description=g.description or g.Description,value=if(g.value or g.Value)~=nil then(g.
value or g.Value)else 0,_hasValue=(g.value or g.Value)~=nil,numberEasing=if(g.numberEasing~=nil)then g.numberEasing
elseif g.NumberEasing~=nil then g.NumberEasing else true,changeMode=g.changeMode or g.ChangeMode or'percentage',
changeBaseline=g.changeBaseline or g.ChangeBaseline or'previous',prefix=g.prefix or g.Prefix or'',suffix=g.suffix or g.
Suffix or'',compact=g.compact or g.Compact or f.compact or false,display=(g.display or g.Display or'value'),
_initialValue=if(g.value or g.Value)~=nil then(g.value or g.Value)else nil,_lastChange=0},ae)if h.compact then h:
_buildCompact()else h:_buildFull()end if h.description then if h.compact then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
h.name}'.`)else h.descriptor=ac(ab.Parent.descriptor).new(h.tab,{description=h.description})end end return h end
function ae._buildFull(f)local g=f.window f.main=g:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=f.
name,ZIndex=5,BackgroundTransparency=1,Parent=f.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})g:Create('UICorner',{Parent=f.main},{CornerRadius='ElementCornerRadius'})f.stroke=g:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=f.main},{Transparency='ElementStrokeTransparency'})f
.strokeGradient=g:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.stroke,Transparency=ao,
Parent=f.stroke})f.titleContainer=g:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=f.main})f.gradientContainer=g:Create('Frame',{
Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,BackgroundColor3=
Color3.fromRGB(255,255,255),ZIndex=5,Parent=f.main})f.glow=g:CreateGlow(f.main,b(an.neutral),13,1)f.title=g:Create(
'TextLabel',{Text=al.t(f.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=f.
titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})f.mainGradient=g:Create('UIGradient',{Rotation=2,Offset
=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=ao,Parent=f.gradientContainer})g:Create('UICorner',{Parent=f.
gradientContainer},{CornerRadius='ElementCornerRadius'})if f.icon then f.iconLabel=g:Create('ImageLabel',{Image=f.icon,
Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=f.
titleContainer},{ImageColor3='ContentColor'})end f.containerLayout=g:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f.titleContainer})f.valueHost=g:Create('Frame',{
AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=f.main})f.changeHost=g:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.
new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=f.main})f.
valueOdo=ai.new(g,f.valueHost,{textSize=20,alignment=Enum.HorizontalAlignment.Left,transparency=1})f.valueOdo:snap(f:
_formatValue(f.value))f.changeOdo=ai.new(g,f.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})f.changeOdo:snap(f:_formatChange(0))f._accentGradients={f.strokeGradient,f.mainGradient}end function ae.
_buildCompact(f)local g,h=f.window,f.tab.compact or false f.main=g:Create('Frame',{Name=f.name,Size=if h then UDim2.
fromOffset(0,ap)else UDim2.new(1,-20,0,ap),AutomaticSize=if h then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=f.tab.tabPage},{BackgroundColor3=
'StatBackground',BackgroundTransparency='ElementTransparency'})g:Create('UICorner',{Parent=f.main},{CornerRadius=
'ElementCornerRadius'})f.stroke=g:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=f.main},{
Transparency='ElementStrokeTransparency'})f.strokeGradient=g:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),
Color=an.neutral.stroke,Transparency=ao,Parent=f.stroke})if h then g:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=f.main})end g:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=f.main})f.card=g:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,ap),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5
,BackgroundTransparency=1,Parent=f.main})g:Create('UICorner',{Parent=f.card},{CornerRadius='ElementCornerRadius'})f.
mainGradient=g:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=ao,Parent=f.
card})g:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=f.card})g:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=f.card})f.titleContainer=g:Create('Frame'
,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=
0,ZIndex=6,Parent=f.card})g:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=f.titleContainer})g:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f
.titleContainer})if f.icon then f.iconLabel=g:Create('ImageLabel',{Image=f.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=f.titleContainer},{
ImageColor3='ContentColor'})end f.title=g:Create('TextLabel',{Text=al.t(f.name),Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=f.
titleContainer},{TextColor3='ContentColor',FontFace='Font'})g:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=f.title})f.readoutHost=g:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=f.card})f.readoutOdo=ai.new(g,f.readoutHost,{
textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})f.readoutOdo:snap(f.display=='change'and f:
_formatChange(0)or f:_formatValue(f.value))f._accentGradients={f.strokeGradient,f.mainGradient}end function ae.
_setAccent(f,g,h)local i=an[g]f.strokeGradient.Color=i.stroke f.mainGradient.Color=i.fill if f.glow then f.glow.Color=b(
i)end local j,k=if h==1 then 14 elseif h==-1 then-10 else 2,if h==1 then Vector2.new(0.04,0.5)elseif h==-1 then Vector2.
new(-4E-2,0.5)else Vector2.new(0,0.5)for l,m in f._accentGradients do ag.tweenService:Create(m,aq,{Rotation=j,Offset=k})
:Play()end end function ae._formatValue(f,g)return f.prefix..d(g)..f.suffix end function ae._formatChange(f,g)if f.
changeMode=='absolute'then return e(g)else return c(g)end end function ae._showValue(f,g,h,i,j)if f.numberEasing and not
j then g:to(f:_formatValue(h),h>=i)else g:snap(f:_formatValue(h))end end function ae._updateFullReadouts(f,g,h,i,j,k,l)f
:_showValue(f.valueOdo,g,h,l)if k then f.changeOdo:snap(k)f._lastChange=0 elseif f.numberEasing and not j then f.
changeOdo:to(f:_formatChange(i),i>=f._lastChange)f._lastChange=i else f.changeOdo:snap(f:_formatChange(i or 0))f.
_lastChange=i or 0 end end function ae._updateCompactReadout(f,g,h,i,j,k,l)if f.display=='change'then if k then f.
readoutOdo:snap(k)f._lastChange=0 elseif f.numberEasing and not j then f.readoutOdo:to(f:_formatChange(i),i>=f.
_lastChange)f._lastChange=i else f.readoutOdo:snap(f:_formatChange(i or 0))f._lastChange=i or 0 end else f:_showValue(f.
readoutOdo,g,h,l)end end function ae.Set(f,g)assert(typeof(g)=='number','Statistic:Set() - value must be a number, got '
..typeof(g))local h,i=f.value,not f._hasValue f.value=g f._hasValue=true if i then f._initialValue=g end local j=if f.
changeBaseline=='initial'then f._initialValue else h local k,l,m,n,o=i or j==g if k then l=0 n='neutral'o=0 elseif j==0
then local p,q=if g>0 then'+'else'-',if f.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'m=p..q n=if g>0 then
'positive'else'negative'o=if g>0 then 1 else-1 elseif f.changeMode=='percentage'then l=((g-j)/math.abs(j))*100 o=if l>0
then 1 elseif l<0 then-1 else 0 n=if o==1 then'positive'elseif o==-1 then'negative'else'neutral'else l=g-j o=if l>0 then
1 elseif l<0 then-1 else 0 n=if o==1 then'positive'elseif o==-1 then'negative'else'neutral'end f:_setAccent(n,o)if f.
compact then f:_updateCompactReadout(g,h,l,k,m,i)else f:_updateFullReadouts(g,h,l,k,m,i)end end function ae.
ResetBaseline(f,g)local h,i,j=f.value,not f._hasValue,if typeof(g)=='number'then g else f.value f._initialValue=j f.
value=j f._hasValue=true f._lastChange=0 if f.compact then if f.display=='change'then f.readoutOdo:snap(f:_formatChange(
0))else f:_showValue(f.readoutOdo,j,h,i)end else f.changeOdo:snap(f:_formatChange(0))f:_showValue(f.valueOdo,j,h,i)end f
:_setAccent('neutral',0)end function ae._setShown(f,g,h)local i=f.window if f.compact then i:_reveal(f.main,{
BackgroundTransparency=if g then(f.window.theme.ElementTransparency or 0)else 1},h)i:_reveal(f.stroke,{Transparency=if g
then f.window.theme.ElementStrokeTransparency else 1},h)i:_reveal(f.card,{BackgroundTransparency=if g then 0 else 1},h)i
:_reveal(f.title,{TextTransparency=if g then 0 else 1},h)if f.iconLabel then i:_reveal(f.iconLabel,{ImageTransparency=if
g then 0 else 1},h)end f.readoutOdo:reveal(if g then 0 else 1,h)return end if g then i:_revealCommon(f,h)i:_reveal(f.
gradientContainer,{BackgroundTransparency=0},h)i:_reveal(f.glow,{Transparency=0.82},h)f.valueOdo:reveal(0,h)f.changeOdo:
reveal(0,h)else i:_hideCommon(f,h)i:_reveal(f.gradientContainer,{BackgroundTransparency=1},h)i:_reveal(f.glow,{
Transparency=1},h)f.valueOdo:reveal(1,h)f.changeOdo:reveal(1,h)end end function ae._minWidth(f)local g=40 if f.icon then
g+=26 end g+=ah.textWidth(f.window.theme.Font,16,al.resolve(f.name))local h=if f.display=='change'then f:_formatChange(0
)else f:_formatValue(f.value)g+=ah.textWidth(f.window.theme.Font,17,h)return g end aj(ae)return ae end)()end,[26]=
function()local aa,ab,ac=a(26)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak,al,am,an=ac(af.variables),ac(af.constants),ac(af.HapticEngine),ac(af.log),ac(af.
columns),ac(ab.Parent.search),ac(ab.Parent.tabSelector),ac(ab.Parent.column)local function ao(ap,aq)for b,c in aq do if
c.__type=='Group'then ao(ap,c.elements)else ap:_unregisterControl(c)end if c.connections then for d,e in c.connections
do ap:Disconnect(e)end c.connections=nil end if c._dragConnection then c._dragConnection:Disconnect()c._dragConnection=
nil end if ap._recordingKeybind==c then ap._recordingKeybind=nil end if c._outsideClickConn then ap:Disconnect(c.
_outsideClickConn)c._outsideClickConn=nil end end end local ap,aq=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(b,c)c=if typeof(
c)=='table'then c else{}local d=setmetatable({window=assert(b,'Missing argument #1 (Window expected)'),name=c.name or c.
Name,icon=c.icon or c.Icon,neglectSelector=c.neglectSelector or c.NeglectSelector or false,customOrder=c.customOrder or
c.CustomOrder or 0,forgetState=c.forgetState or c.ForgetState or false,elements={},connections={}},ae)assert(d.name or d
.icon,'A tab needs a name or an icon.')if not d.neglectSelector then am.build(d,d.window.layout)end d.tabPage=d.window:
Create('ScrollingFrame',{Name=d.name,Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(
0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,
0),ScrollBarThickness=ah.pageScrollbar.thickness,ScrollBarImageTransparency=ah.pageScrollbar.transparency,
VerticalScrollBarInset=Enum.ScrollBarInset.None,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=d.customOrder
or 0,Parent=d.window.elements},{ScrollBarImageColor3='ContentColor'})d.tabPageLayout=d.window:Create('UIListLayout',{
Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=d.tabPage})d.window:
Create('UIPadding',{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=d.tabPage})d.columnsRow=d.window:
Create('Frame',{Name='Columns',BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.
fromScale(1,0),Parent=d.tabPage})d.columnsLayout=d.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum
.SortOrder.LayoutOrder,Parent=d.columnsRow})d.Left=an.new(d,'Left')d.Right=an.new(d,'Right')d.left=d.Left d.right=d.
Right d:_layoutColumns()if not d.neglectSelector then table.insert(d.connections,d.window:Connect(d.topbarItemInteract.
MouseButton1Click,function()ai.click()d:Select()end))table.insert(d.connections,d.window:Connect(d.topbarItemInteract.
MouseEnter,function()if not d.window:_interactive()then return end if d.window.selectedTab~=d then d:_applyVisual(
'hover',aq)d:_spinGradients()end end))table.insert(d.connections,d.window:Connect(d.topbarItemInteract.MouseLeave,
function()if d.window.selectedTab~=d then d:_applyVisual('unselected',aq)end end))end return d end function ae.
_applyVisual(b,c,d)if b.neglectSelector or not b.topbarItem then return end local e=am.states[b.window.layout.mode][c]if
not e then return end am.applyVisual(b,e,d)end function ae._spinGradients(b)if b.neglectSelector then return end local c
=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)for d,e in{b.topbarItemGradient,b.
topbarItemStrokeGradient}do e.Rotation=-270 ag.tweenService:Create(e,c,{Rotation=90}):Play()end end function ae.Select(b
,c)if b.window._searching then al.close(b.window,{showTabs=true,jumpTo=false})end b.window.selectedTab=b b.window:
_jumpTo(b.tabPage)local d=c or not b.window:_interactive()if not b.neglectSelector and not d then b:_applyVisual(
'selected',ap)end for e,f in b.window.tabs do if f~=b.window.selectedTab then f:Deselect(d)end end if b~=b.window.
rfSettings and b.window.settingsAction and not d then ag.tweenService:Create(b.window.settingsAction.iconLabel,TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end function ae.Deselect(b
,c)if not b.neglectSelector and not c then b:_applyVisual('unselected',ap)end end function ae.GetColumn(b,c)local d=ak.
resolveSide(c)if not d then aj.warn(`Rayfield: unknown column '{tostring(c)}', using the left one. Use "Left" or "Right".`
)d='Left'end return if d=='Right'then b.Right else b.Left end function ae._columnFor(b,c)if typeof(c)~='table'then
return b.Left end return b:GetColumn(c.side or c.Side or c.column or c.Column)end function ae._layoutColumns(b)local c,d
=b.Left,b.Right if not c or not d or not b.columnsRow then return end local e=b.window local f=if e.size then ak.
pageWidth(e.size.X.Offset,e.layout)else 0 local g,h,i=ak.shouldStack(f),#c.elements>0,#d.elements>0 c.main.Visible=h d.
main.Visible=i b.stacked=g if g or not(h and i)then b.columnsLayout.FillDirection=Enum.FillDirection.Vertical b.
columnsLayout.Padding=UDim.new(0,if h and i then 20 else 0)c.main.Size=UDim2.fromScale(1,0)d.main.Size=UDim2.fromScale(1
,0)else b.columnsLayout.FillDirection=Enum.FillDirection.Horizontal b.columnsLayout.Padding=UDim.new(0,-ak.overlap)c.
main.Size=UDim2.new(0.5,ak.overlap/2,0,0)d.main.Size=UDim2.new(0.5,ak.overlap/2,0,0)end end function ae.CreateButton(b,c
)return b:_columnFor(c):CreateButton(c)end function ae.CreateToggle(b,c)return b:_columnFor(c):CreateToggle(c)end
function ae.CreateSwitch(b,c)return b:CreateToggle(c)end function ae.CreateSection(b,c)return b:_columnFor(c):
CreateSection(c)end function ae.CreateText(b,c)return b:_columnFor(c):CreateText(c)end function ae.CreateDivider(b,c)
return b:_columnFor(c):CreateDivider(c)end function ae.CreateProgress(b,c)return b:_columnFor(c):CreateProgress(c)end
function ae.CreateConsole(b,c)return b:_columnFor(c):CreateConsole(c)end function ae.CreateChat(b,c)return b:_columnFor(
c):CreateChat(c)end function ae.CreateStat(b,c)return b:_columnFor(c):CreateStat(c)end function ae.CreateSlider(b,c)
return b:_columnFor(c):CreateSlider(c)end function ae.CreateDropdown(b,c)return b:_columnFor(c):CreateDropdown(c)end
function ae.CreateInput(b,c)return b:_columnFor(c):CreateInput(c)end function ae.CreateKeybind(b,c)return b:_columnFor(c
):CreateKeybind(c)end function ae.CreateColorPicker(b,c)return b:_columnFor(c):CreateColorPicker(c)end function ae.
CreateGroup(b,c)return b:_columnFor(c):CreateGroup(c)end function ae.Remove(b)local c=b.window if c._searching then al.
close(c,{showTabs=true,jumpTo=c.selectedTab and c.selectedTab.tabPage})end local d=table.find(c.tabs,b)if d then table.
remove(c.tabs,d)end if c.selectedTab==b then c.selectedTab=nil for e,f in ipairs(c.tabs)do if not f.neglectSelector then
f:Select()break end end end ao(c,b.elements)for e,f in b.connections do c:Disconnect(f)end b.connections={}if b.
topbarItem then c:DestroySubtree(b.topbarItem)end if b.tabPage then c:DestroySubtree(b.tabPage)end b.topbarItem=nil b.
tabPage=nil b.columnsRow=nil b.elements={}for e,f in{b.Left,b.Right}do f.elements={}end end return ae end)()end,[27]=
function()local aa,ab,ac=a(27)local ad return(function(...)local ae={}ae.__index=ae ae.__type='TabSection'local af,ag,ah
,ai,aj=ac(ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.utility.log),20,6,3 local function ak(al)for am,an in al.
tabs do if not an.neglectSelector then return true end end return#al.tabSections>0 end function ae.new(al,am)am=if
typeof(am)=='table'then am else{}local an=setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),name=
am.name or am.Name or'Section',icon=am.icon or am.Icon},ae)if al.layout.mode~='sidebar'then if not al._warnedTabSection
then al._warnedTabSection=true ag.warn
[[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]end an.inert=true return
an end an.main=al:Create('Frame',{Name=an.name,Size=UDim2.new(1,-ah*2,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=al.tabList})an.padding=al:Create('UIPadding',{PaddingTop
=UDim.new(0,if ak(al)then ai else 0),PaddingBottom=UDim.new(0,aj),Parent=an.main})al:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,
HorizontalAlignment=Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=an.main})if an.
icon then an.iconLabel=al:Create('ImageLabel',{Image=an.icon,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=0,ImageTransparency=1,Parent=an.main},{ImageColor3='ContentColor'})end an.title=al:Create(
'TextLabel',{Text=af.t(an.name),Size=UDim2.fromOffset(0,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Bottom,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=an.main},{TextColor3='ContentColor',FontFace='Font'})return an
end function ae._setShown(al,am,an)if not al.main then return end local ao=al.window ao:_reveal(al.title,{
TextTransparency=if am then 0.6 else 1},an)if al.iconLabel then ao:_reveal(al.iconLabel,{ImageTransparency=if am then
0.65 else 1},an)end end function ae._setVisible(al,am)if al.main then al.main.Visible=am end end function ae.Remove(al)
local am=table.find(al.window.tabSections,al)if am then table.remove(al.window.tabSections,am)end al.window:
DestroySubtree(al.main)al.main=nil end return ae end)()end,[28]=function()local aa,ab,ac=a(28)local ad return(function(
...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai=ac(ae.variables),ac(ae.functions),ac(ae.locale),{}local function
aj(ak:string?):string if type(ak)~='string'or ak==''then return'?'end local al=utf8.offset(ak,2)local am=if al then
string.sub(ak,1,al-1)else ak return string.upper(am)end ai.states={top={selected={background=0,stroke=0,content=0},hover
={background=0.4,stroke=0.3,content=0.3},unselected={background=0.8,stroke=0.65,content=0.5},hidden={background=1,stroke
=1,content=1}},sidebar={selected={background=0.4,stroke=0.5,content=0,shadow=0.8},hover={background=0.7,stroke=0.8,
content=0.3,shadow=1},unselected={background=1,stroke=1,content=0.5,shadow=1},hidden={background=1,stroke=1,content=1,
shadow=1}}}local function ak(al,am,an)al.topbarItemGradient=al.window:Create('UIGradient',{Rotation=90,Parent=am},{Color
={'TabBackground',ag.toColorSequence}})al.topbarItemStrokeGradient=al.window:Create('UIGradient',{Rotation=90,Parent=an}
,{Color={'TabStroke',ag.toColorSequence}})end local function al(am,an,ao)if ao and not am.icon then am.topbarItemInitial
=am.window:Create('TextLabel',{Text=aj(am.name),Size=UDim2.fromOffset(an,an),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=an-4,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Visible=false,
TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end if am.icon then am.
topbarItemIcon=am.window:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(an,an),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=am.topbarItemContainer},{ImageColor3='TabColor'})end if am.name then
am.topbarItemTitle=am.window:Create('TextLabel',{Text=ah.t(am.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.XY,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'}
)end end local function am(an)an.topbarItem=an.window:Create('Frame',{Name=an.name,Size=UDim2.fromOffset(0,34),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency
=1,Visible=false,LayoutOrder=an.customOrder or 0,Parent=an.window.tabList})an.topbarItemInteract=an.window:Create(
'TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency
=1,Parent=an.topbarItem})an.window:Create('UICorner',{Parent=an.topbarItem},{CornerRadius='PillCornerRadius'})an.
topbarItemStroke=an.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,
255),Transparency=1,Parent=an.topbarItem})ak(an,an.topbarItem,an.topbarItemStroke)an.topbarItemContainer=an.window:
Create('Frame',{Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=
0,Parent=an.topbarItem})an.window:Create('UIPadding',{PaddingLeft=UDim.new(0,13),PaddingRight=UDim.new(0,14),Parent=an.
topbarItemContainer})an.topbarItemLayout=an.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=an.topbarItemContainer})al(an,16,false)end local function an(ao,ap)ao
.topbarItem=ao.window:Create('Frame',{Name=ao.name,Size=UDim2.new(1,-ap.rowInset*2,0,ap.rowHeight),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=false,LayoutOrder=ao.customOrder or 0,
Parent=ao.window.tabList})ao.topbarItemInteract=ao.window:Create('TextButton',{Active=false,BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=ao.topbarItem})ao.window:Create('UICorner'
,{CornerRadius=UDim.new(0,ap.rowCornerRadius),Parent=ao.topbarItem})ao.topbarItemStroke=ao.window:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=ao.topbarItem})ak(ao
,ao.topbarItem,ao.topbarItemStroke)ao.topbarItemShadow=ao.window:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=
Color3.fromRGB(255,255,255),Offset=UDim2.new(0,0,0,-15),Spread=UDim2.new(0,10,0,-30),ZIndex=-1,Transparency=1,Parent=ao.
topbarItem})ao.topbarItemContainer=ao.window:Create('Frame',{Size=UDim2.new(1,-ap.rowPadding,0,24),Position=UDim2.new(0,
ap.rowPadding,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=ao.topbarItem})ao.
topbarItemLayout=ao.window:Create('UIListLayout',{Padding=UDim.new(0,ap.rowContentSpacing),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=ao.topbarItemContainer})al(ao,ap.rowIconSize,true)end function ai.build
(ao,ap)if ap.mode=='sidebar'then an(ao,ap)else am(ao)end end function ai.setRowCollapsed(ao,ap,aq)if aq.mode~='sidebar'
or not ao.topbarItem then return end if ao.topbarItemTitle then ao.topbarItemTitle.Visible=not ap end if ao.
topbarItemInitial then ao.topbarItemInitial.Visible=ap end local b=if ap then 0 else aq.rowPadding ao.
topbarItemContainer.Size=UDim2.new(1,-b,0,24)ao.topbarItemContainer.Position=UDim2.new(0,b,0.5,0)ao.topbarItemLayout.
HorizontalAlignment=if ap then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end function ai.
applyVisual(ao,ap,aq)local b={[ao.topbarItem]={BackgroundTransparency=ap.background},[ao.topbarItemStroke]={Transparency
=ap.stroke}}if ao.topbarItemIcon then b[ao.topbarItemIcon]={ImageTransparency=ap.content}end if ao.topbarItemTitle then
b[ao.topbarItemTitle]={TextTransparency=ap.content}end if ao.topbarItemInitial then b[ao.topbarItemInitial]={
TextTransparency=ap.content}end if ao.topbarItemShadow and ap.shadow then b[ao.topbarItemShadow]={Transparency=ap.shadow
}end for c,d in b do if aq then af.tweenService:Create(c,aq,d):Play()else for e,f in d do c[e]=f end end end end return
ai end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tag'
local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=ac(af.variables),ac(af.functions),ac(af.image),Color3.fromRGB(255
,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(al,am)am=if typeof(am)==
'table'then am else{}local an=setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),text=am.text or am
.Text or am.title or am.Title,icon=am.icon or am.Icon,color=am.color or am.Color or aj},ae)assert(an.icon or(an.text and
an.text~=''),'A Tag requires an icon, text, or both.')an.main=an.window:Create('Frame',{Name='Tag',Size=UDim2.
fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=an.color,BorderSizePixel=0,LayoutOrder=am.order or
am.Order or 0,BackgroundTransparency=1,Parent=an.window.tagContainer})an.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=an.main})an.window:Create('UIPadding',{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=an.
main})an.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=an.main})local ao=ah.
contrastColor(an.color)an.iconLabel=an.window:Create('ImageLabel',{Name='Icon',Image=an.icon or'',ImageColor3=ao,Size=
UDim2.fromOffset(16,16),BackgroundTransparency=1,Visible=an.icon~=nil,ZIndex=5,ImageTransparency=1,Parent=an.main})an.
title=an.window:Create('TextLabel',{Name='Title',AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10,15),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,Text=an.text or'',TextColor3=ao,TextSize=15,TextXAlignment=
Enum.TextXAlignment.Left,TextWrapped=true,RichText=true,Visible=an.text~=nil and an.text~='',LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=an.main},{FontFace='Font'})an.window.tagContainer.Visible=true if not an.window.hidden then an
:_setShown(true,ak)end return an end function ae._setShown(al,am,an)local ao,ap=if am then 0 else 1,if typeof(an)==
'TweenInfo'then an elseif an then ak else nil if ap then ag.tweenService:Create(al.main,ap,{BackgroundTransparency=ao}):
Play()ag.tweenService:Create(al.iconLabel,ap,{ImageTransparency=ao}):Play()ag.tweenService:Create(al.title,ap,{
TextTransparency=ao}):Play()else al.main.BackgroundTransparency=ao al.iconLabel.ImageTransparency=ao al.title.
TextTransparency=ao end end function ae.SetColor(al,am)al.color=am local an=ah.contrastColor(am)ag.tweenService:Create(
al.main,ak,{BackgroundColor3=am}):Play()ag.tweenService:Create(al.iconLabel,ak,{ImageColor3=an}):Play()ag.tweenService:
Create(al.title,ak,{TextColor3=an}):Play()end function ae.SetText(al,am)al.text=am al.title.Text=am or''al.title.Visible
=am~=nil and am~=''end function ae.SetIcon(al,am)al.icon=am ai.assign(al.iconLabel,'Image',am)al.iconLabel.Visible=am~=
nil end function ae.Set(al,am)if am.color or am.Color then al:SetColor(am.color or am.Color)end if am.text or am.Text or
am.title or am.Title then al:SetText(am.text or am.Text or am.title or am.Title)end if am.icon~=nil or am.Icon~=nil then
al:SetIcon(am.icon or am.Icon)end end function ae.Remove(al)al.window:DestroySubtree(al.main)local am=table.find(al.
window.tags,al)if am then table.remove(al.window.tags,am)end if#al.window.tags==0 then al.window.tagContainer.Visible=
false end end return ae end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(function(...)local ae={}ae.__index=
ae ae.__type='Text'local af,ag,ah,ai,aj=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale),16,14,
0.45 function ae.new(ak,al)al=if typeof(al)=='table'then al else{}local am=setmetatable({tab=assert(ak,
'Missing argument #1 (Tab expected)'),window=ak.window,name=tostring(al.name or al.Name or''),text=tostring(al.text or
al.Text or''),icon=al.icon or al.Icon},ae)am.main=am.window:Create('Frame',{Size=UDim2.new(1,-20,0,0),AutomaticSize=Enum
.AutomaticSize.Y,BorderSizePixel=0,Name=if am.name~=''then am.name else'Text',BackgroundColor3=Color3.fromRGB(255,255,
255),BackgroundTransparency=1,Parent=am.tab.tabPage},{BackgroundTransparency='ElementTransparency'})am.stroke=am.window:
StyleElementBody(am.main)am.window:Create('UIPadding',{PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),
PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=am.main})am.window:Create('UIListLayout',{Padding=UDim.
new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=am.main})am.titleRow=am.window:Create('Frame',{Name='Title',Size=
UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=1,Parent=am
.main})am.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum
.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=am.titleRow})if am.icon then am.iconLabel=am.
window:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,
ImageTransparency=1,Parent=am.titleRow},{ImageColor3='ContentColor'})end am.title=am.window:Create('TextLabel',{Text=ag.
t(am.name),Size=UDim2.new(1,if am.icon then-22 else 0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,RichText=true,TextSize=ah,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=
1,TextTransparency=1,Parent=am.titleRow},{TextColor3='TitlingColor',FontFace='Font'})am.body=am.window:Create(
'TextLabel',{Text=ag.t(am.text),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,RichText=true,TextSize=ai,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=
2,TextTransparency=1,Parent=am.main},{TextColor3='ContentColor',FontFace='Font'})am:_applyPresence()return am end
function ae._applyPresence(ak)ak.titleRow.Visible=ak.name~=''or ak.icon~=nil ak.body.Visible=ak.text~=''end function ae.
Set(ak,al)ak.text=tostring(al)ak.window:_bindLocale(ak.body,'Text',ak.text)ak:_applyPresence()end function ae.SetTitle(
ak,al)ak.name=tostring(al)ak.window:_bindLocale(ak.title,'Text',ak.name)ak:_applyPresence()end function ae._setShown(ak,
al,am)if al then ak.window:_revealCommon(ak,am)else ak.window:_hideCommon(ak,am)end ak.window:_reveal(ak.body,{
TextTransparency=if al then aj else 1},am)end af(ae)return ae end)()end,[31]=function()local aa,ab,ac=a(31)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,
am,an,ao,ap,aq,b,c,d,e,f,g,h,i,j,k,l,m,n=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.image),ac(af.
HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.new(0.5,0,0.5,-180),UDim2.new(0.5,0,0.5,180
),UDim2.new(0.5,0,0.5,0)local function o(p)return math.clamp(#p*0.06+3,3,9)end local function p(q)if type(q)=='number'
then return'rbxassetid://'..tostring(q)end return q end function ae.new(q,r,s)r=if typeof(r)=='table'then r else{}local
t=setmetatable({window=assert(q,'Missing argument #1 (Window expected)'),title=r.title or r.Title or'',subtitle=r.
subtitle or r.Subtitle,icon=r.icon or r.Icon,avatar=r.avatar or r.Avatar,minWidth=r.minWidth or r.MinWidth,subtitleAbove
=r.subtitleAbove or r.SubtitleAbove or false,position=r.position or'Top',_hovered=false,_dismissed=false},ae)t.duration=
r.duration or r.Duration or o(t.title..(t.subtitle or''))local u=t.avatar~=nil and t.avatar~=0 local v=u or(t.icon~=nil
and t.icon~=0 and t.icon~='')t._iconImage=if u then aj.avatar(t.avatar,function(w)if t.iconLabel and not t._dismissed
and t.main.Parent then aj.assign(t.iconLabel,'Image',w)end end)elseif v then p(t.icon)else nil t._iconSize=if u then b
else aq t._leftPad=if u then e else c t._rightPad=if u then f else d t._minWidth=math.clamp(t.minWidth or 0,i,j)local w=
t.subtitle~=nil and t.subtitle~=''t.main=t.window:Create('Frame',{Name='Toast',BackgroundTransparency=1,Size=UDim2.new(0
,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=s or t.window.toasts})t.window:Create('UIPadding',{PaddingTop=
UDim.new(0,h),Parent=t.main})t.body=t.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.
new(1,0,1,0),Position=if t.position=='Bottom'then m else l,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=
0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=t.main})t.window:Create('UIGradient',{Rotation=270,Offset=
Vector2.new(0,-0.1),Parent=t.body},{Color={'WindowColor',ah.toColorSequence}})t.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=t.body})t.stroke=t.window:Create('UIStroke',{Transparency=1,Parent=t.body},{Color='SurfaceStroke'})
t.shadow=t.window:CreateGlow(t.body,'ShadowColor',20,1)t.window:Create('UIPadding',{PaddingLeft=UDim.new(0,t._leftPad),
PaddingRight=UDim.new(0,t._rightPad),Parent=t.body})t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,g),Parent=t.body})if v then t.iconLabel=t.window:Create('ImageLabel',{
Image=t._iconImage,Size=UDim2.fromOffset(t._iconSize,t._iconSize),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,BackgroundTransparency=1,ImageTransparency=1,Parent=t.body
},if u then nil else{ImageColor3='ContentColor'})t.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=t.
iconLabel})end t.container=t.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,w and 32
or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.toastContent,Parent=t.body})t.window:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=t.container})t.titleLabel=t.window:Create('TextLabel',
{Text=t.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if t.subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,
TextTransparency=1,Parent=t.container},{TextColor3='ContentColor',FontFace='TitleFont'})if w then t.subtitleLabel=t.
window:Create('TextLabel',{Text=t.subtitle,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if t.subtitleAbove then 1 else
2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=t.container},{TextColor3='ContentColor',FontFace='Font'})end t
.window._toastCount=(t.window._toastCount or 0)+1 t.main.LayoutOrder=-t.window._toastCount local x=t.window._liveToasts
if not x then x={}t.window._liveToasts=x end local y=x[t.main.Parent]if not y then y={}x[t.main.Parent]=y end t._live=y
table.insert(y,t)while#y>k do local z=table.remove(y,1)if z and z~=t then task.spawn(z._dismiss,z)end end t._connections
={t.window:Connect(t.body.MouseEnter,function()t._hovered=true end),t.window:Connect(t.body.MouseLeave,function()t.
_hovered=false end),t.window:Connect(t.body.InputBegan,function(z)if z.UserInputType==Enum.UserInputType.MouseButton1 or
z.UserInputType==Enum.UserInputType.Touch then t:_dismiss()end end)}task.spawn(function()t:_show()end)return t end
function ae._measure(q)local r,s=ah.textWidth(q.window.theme.TitleFont,16,q.title),if q.subtitleLabel then ah.textWidth(
q.window.theme.Font,14,q.subtitle)else 0 local t,u=math.max(r,s),if q.iconLabel then q._leftPad+q._iconSize+g else q.
_leftPad local v=math.clamp(u+t+q._rightPad,q._minWidth,j)if u+t+q._rightPad>j then local w=j-u-q._rightPad for x,y in{q
.titleLabel,q.subtitleLabel}do if y then y.AutomaticSize=Enum.AutomaticSize.None y.TextTruncate=Enum.TextTruncate.AtEnd
y.Size=UDim2.fromOffset(w,y.Size.Y.Offset)end end end local w=if q.subtitleLabel then 31 else 16 local x=math.max(w,if q
.iconLabel then q._iconSize else 0)+18 return v,x end function ae._show(q)if not q.main.Parent then return end ak.
notify()local r,s=q:_measure()if q._dismissed or not q.main.Parent then return end q.main.Size=UDim2.new(0,r,0,0)ag.
tweenService:Create(q.main,am,{Size=UDim2.new(0,r,0,s+h)}):Play()ag.tweenService:Create(q.body,al,{Position=n}):Play()ag
.tweenService:Create(q.body,an,{BackgroundTransparency=0}):Play()ag.tweenService:Create(q.stroke,an,{Transparency=0.9}):
Play()ag.tweenService:Create(q.shadow,ao,{Transparency=0.6}):Play()ag.tweenService:Create(q.titleLabel,ao,{
TextTransparency=0}):Play()task.wait(0.05)if q._dismissed or not q.main.Parent then return end if q.iconLabel then ag.
tweenService:Create(q.iconLabel,ao,{BackgroundTransparency=0.95}):Play()ag.tweenService:Create(q.iconLabel,ao,{
ImageTransparency=0}):Play()end task.wait(0.05)if q._dismissed or not q.main.Parent then return end if q.subtitleLabel
then ag.tweenService:Create(q.subtitleLabel,ao,{TextTransparency=0.5}):Play()end local t=0 while t<q.duration and not q.
_dismissed and q.main.Parent do local u=task.wait()if not q._hovered then t+=u end end q:_dismiss()end function ae.
_dismiss(q)if q._dismissed then return end q._dismissed=true local r=q._live local s=r and table.find(r,q)if r and s
then table.remove(r,s)end if not q.main.Parent then return end ag.tweenService:Create(q.body,an,{BackgroundTransparency=
1}):Play()ag.tweenService:Create(q.stroke,an,{Transparency=1}):Play()ag.tweenService:Create(q.shadow,ao,{Transparency=1}
):Play()ag.tweenService:Create(q.titleLabel,ao,{TextTransparency=1}):Play()if q.subtitleLabel then ag.tweenService:
Create(q.subtitleLabel,ao,{TextTransparency=1}):Play()end if q.iconLabel then ag.tweenService:Create(q.iconLabel,ao,{
ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(q.body,ap,{Size=UDim2.new(1,-60,1,0)}):
Play()local t=ag.tweenService:Create(q.main,ap,{Size=UDim2.new(0,q.main.Size.X.Offset,0,0)})t:Play()t.Completed:Wait()if
not q.main.Parent then return end for u,v in q._connections do q.window:Disconnect(v)end q.window:DestroySubtree(q.main)
end return ae end)()end,[32]=function()local aa,ab,ac=a(32)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al=ac(af.variables),ac(af.functions),ac(af.
moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(am,an)an=if typeof(an)=='table'then an else{}
local ao=setmetatable({tab=assert(am,'Missing argument #1 (Tab expected)'),window=am.window,name=an.name or an.Name or
'Switch',icon=an.icon or an.Icon,description=an.description or an.Description,forgetState=an.forgetState or an.
ForgetState or am.forgetState,compact=am.compact or false,flag=an.flag or an.Flag or(not(an.forgetState or an.
ForgetState or am.forgetState)and ah.deriveFlagFromName(an.name or an.Name or'Switch')or nil),callback=an.callback or an
.Callback or function()end,value=if(an.value or an.Value)~=nil then(an.value or an.Value)else false},ae)ao.window:
_registerControl(ao)if ao.compact then ao:_buildCompact()else ao:_buildFull()end if ao.description and not ao.compact
then ao.descriptor=ac(ab.Parent.descriptor).new(ao.tab,{description=ao.description})end return ao end function ae.
_buildSwitch(am,an)local ao=am.window am.functionContainer=ao:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(50
,21),BackgroundTransparency=1,Parent=an},{BackgroundColor3='ToggleTrack'})ao:Create('UICorner',{CornerRadius=UDim.new(0,
15),Parent=am.functionContainer})am.containerStroke=ao:Create('UIStroke',{Transparency=1,Parent=am.functionContainer},{
Color='SurfaceStroke'})am.indicator=ao:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(25,17),Position=am.value
and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=am.value and am.
window.theme.AccentColor or am.window.theme.ToggleKnobOff,BackgroundTransparency=1,Parent=am.functionContainer})ao:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=am.indicator})am.indicatorStroke=ao:Create('UIStroke',{Color=am.
value and am.window.theme.AccentStroke or Color3.fromRGB(255,255,255),Transparency=1,Parent=am.indicator})am.
indicatorGlow=ao:CreateGlow(am.indicator,'AccentColor',20,1)am.overlay=ao:Create('Frame',{BorderSizePixel=0,Size=UDim2.
fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=am.functionContainer},{Visible='DarkToggleOverlay'})ao:Create('UICorner',{CornerRadius=
UDim.new(0,15),Parent=am.overlay})am.overlayGradient=ao:Create('UIGradient',{Rotation=90,Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0.35)},Parent=am.overlay})
return am.functionContainer end function ae._performToggle(am)al.click()am.value=not am.value am:_animateIndicator()am.
window:_runGuarded(am,am.callback,am.value)am.window:_persist(am)end function ae._buildFull(am)local an=am.window am.
main=an:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=am.name,BackgroundColor3=Color3.fromRGB(255,
255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{BackgroundTransparency='ElementTransparency'})am.stroke=an:
StyleElementBody(am.main)am.hoverOverlay=an:CreateHoverOverlay(am.main)am.container=an:Create('Frame',{BorderSizePixel=0
,Parent=am.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1})am.containerLayout=an:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,Parent=am.container})if am.icon then am.iconLabel=an:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16
),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=am.container},{ImageColor3='ContentColor'})end
am.title=an:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.container},{TextColor3='ContentColor',FontFace='Font'})am.
interact=an:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),BorderSizePixel=0,Position=UDim2.
fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,ZIndex=10,Parent=am.main})am:_buildSwitch(am.main)am.
functionContainer.Position=UDim2.new(1,-15,0,20)am.functionContainer.AnchorPoint=Vector2.new(1,0.5)am.window:
_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,function()ag.tweenService:Create(am.stroke,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()ag.tweenService:Create(am.
main,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,41)}):Play()am:
_performToggle()task.wait(0.11)ag.tweenService:Create(am.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=am.window.theme.ElementStrokeTransparency}):Play()end)end
function ae._buildCompact(am)local an=am.window am.main,am.stroke,am.interact=an:_buildCompactRow(am.tab,am.name,10)am.
hoverOverlay=am.interact an:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=am.
interact})an:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment
.Center,HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=am.interact})am.container=an:
Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=
0,LayoutOrder=0,Parent=am.interact})an:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.container})an:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=am.container})if am.icon then am.
iconLabel=an:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,
LayoutOrder=0,ImageTransparency=1,Parent=am.container},{ImageColor3='ContentColor'})end am.title=an:Create('TextLabel',{
Text=ak.t(am.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
LayoutOrder=1,TextTransparency=1,Parent=am.container},{TextColor3='ContentColor',FontFace='Font'})an:Create('UIFlexItem'
,{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.title})am:_buildSwitch(am.interact)am.functionContainer.LayoutOrder=1 am.
window:_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,function()ag.tweenService:Create(am.
stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()am:_performToggle()
task.wait(0.11)ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=am.window.theme.ElementStrokeTransparency}):Play()end)end function ae._animateIndicator(am)local an=
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if am.indicatorGlow then ag.tweenService:Create(
am.indicatorGlow,an,{Transparency=am.value and am.window.theme.AccentGlow or 1}):Play()end if am.value then ag.
tweenService:Create(am.indicator,an,{Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=am.window.theme.AccentColor,
BackgroundTransparency=0}):Play()ag.tweenService:Create(am.indicatorStroke,an,{Color=am.window.theme.AccentStroke,
Transparency=0}):Play()else ag.tweenService:Create(am.indicator,an,{Position=UDim2.new(1,-47,0.5,0),BackgroundColor3=am.
window.theme.ToggleKnobOff,BackgroundTransparency=am.window.theme.ToggleKnobOffTransparency}):Play()ag.tweenService:
Create(am.indicatorStroke,an,{Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local am,an=TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out,0,false,0.35)function ae._setShown(ao,ap,aq)local b=ao.window if ap then b:_revealCommon(ao,aq)b:
_reveal(ao.indicator,{BackgroundColor3=ao.value and b.theme.AccentColor or b.theme.ToggleKnobOff,BackgroundTransparency=
ao.value and 0 or b.theme.ToggleKnobOffTransparency},aq,am)b:_reveal(ao.indicatorStroke,{Color=ao.value and b.theme.
AccentStroke or Color3.fromRGB(255,255,255),Transparency=ao.value and 0 or 0.7},aq,am)b:_reveal(ao.indicatorGlow,{
Transparency=ao.value and b.theme.AccentGlow or 1},aq,an)b:_reveal(ao.overlay,{BackgroundTransparency=0},aq,am)b:
_reveal(ao.containerStroke,{Transparency=0.85},aq,am)b:_reveal(ao.functionContainer,{BackgroundTransparency=b.theme.
ToggleTrackTransparency},aq,am)else b:_hideCommon(ao,aq)b:_reveal(ao.indicator,{BackgroundTransparency=1},aq,am)b:
_reveal(ao.indicatorStroke,{Transparency=1},aq,am)b:_reveal(ao.indicatorGlow,{Transparency=1},aq,an)b:_reveal(ao.overlay
,{BackgroundTransparency=1},aq,am)b:_reveal(ao.containerStroke,{Transparency=1},aq,am)b:_reveal(ao.functionContainer,{
BackgroundTransparency=1},aq,am)end end function ae._refreshTheme(ao)local ap,aq,b=ao.window.theme,TweenInfo.new(0.5,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService b:Create(ao.functionContainer,aq,{
BackgroundTransparency=ap.ToggleTrackTransparency}):Play()b:Create(ao.indicator,aq,{BackgroundColor3=ao.value and ap.
AccentColor or ap.ToggleKnobOff,BackgroundTransparency=ao.value and 0 or ap.ToggleKnobOffTransparency}):Play()b:Create(
ao.indicatorStroke,aq,{Color=ao.value and ap.AccentStroke or Color3.fromRGB(255,255,255)}):Play()if ao.indicatorGlow
then b:Create(ao.indicatorGlow,aq,{Transparency=ao.value and ap.AccentGlow or 1}):Play()end end function ae._minWidth(ao
)local ap=90 if ao.icon then ap+=21 end ap+=ah.textWidth(ao.window.theme.Font,16,ak.resolve(ao.name))return ap end ai(ae
)aj(ae)function ae.Set(ao,ap,aq)local b=ao.value~=ap ao.value=ap if b then ao:_animateIndicator()end if not aq then ao.
window:_runGuarded(ao,ao.callback,ao.value)ao.window:_persist(ao)end end return ae end)()end,[33]=function()local aa,ab,
ac=a(33)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,c,d=
ac(ae.image),ac(ae.functions),ac(ae.persistence),ac(ae.constants),ac(ae.locale),ac(ae.log),ac(ae.HapticEngine),ac(ae.
windowSizing),ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.Parent.search),ac(ab.Parent.sidebar),ac(ae.variables),ab.Parent.
Parent.themes,{}d.__index=d local e,f,g,h,i=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.new(0.5,0,0,20),UDim2.new(0.5,0,0,12)local j,k,l,m,n,o,p,q,r=
UDim2.new(0.5,0,0,h.Y.Offset+f.Y.Offset+12),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),320,41,
0.55,0.55,0.04,8,2 local function s(t,u):(UDim2,number)local v=b.workspace.CurrentCamera local w=v and v.ViewportSize
local x=u or am.scaleFor(w,t)return am.fit(if w then w/x else nil,t),x end local t,u={'TopLeftRadius','TopRightRadius',
'BottomLeftRadius','BottomRightRadius'},(function()return(pcall(function()local t=Instance.new'UICorner't.TopLeftRadius=
UDim.new(0,1)t:Destroy()end))end)()local function v(w)return if w then an.sidebar else an.top end local w={WindowColor=
true,ElementGradient=true,ElementStrokeGradient=true,TabBackground=true,TabStroke=true,SliderProgress=true}
local function x(y,z)if w[y]and typeof(z)=='Color3'then return ColorSequence.new(z)end return z end local function y(z)
return if typeof(z)=='ColorSequence'then z.Keypoints[1].Value else z end local function z(A,B)local C=A._toastsTop if
not C then return end local D=if A._collapsedShown then j else i if not B or C.Position==D then C.Position=D return end
b.tweenService:Create(C,k,{Position=D}):Play()end local function A(B,C)local D=0.299*B.R+0.587*B.G+0.114*B.B local E=if
D>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return B:Lerp(E,C)end local function B(C,D)if D.ElementGradient then
local E=y(C.ElementGradient)if D.ElementStroke==nil then C.ElementStroke=A(E,0.28)end if D.ElementStrokeGradient==nil
then C.ElementStrokeGradient=ColorSequence.new(A(E,0.4))end if D.ElementStrokeHover==nil then C.ElementStrokeHover=A(E,
0.52)end end if D.TabBackground and D.TabStroke==nil then C.TabStroke=ColorSequence.new(A(y(C.TabBackground),0.4))end
end local function C(D)if typeof(D)~='string'then return nil end for E,F in ai.builtInThemes do if string.lower(F)==
string.lower(D)then return F end end return nil end local function D(E)if typeof(E)=='table'then return E elseif typeof(
E)=='string'then local F=c:FindFirstChild(string.lower(E))if F then return ac(F)end ak.warn("Rayfield: unknown theme '"
..E.."', using default")elseif E~=nil then ak.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(c.default)end
local function E(F)local G,H=table.clone(ac(c.default)),D(F)for I,J in H do G[I]=x(I,J)end if typeof(F)=='table'then B(G
,H)end local I=if typeof(F)=='table'then F else nil if not(I and(I.Font or I.font))then G.Font=b.brandFont(Enum.
FontWeight.Medium)end if not(I and(I.TitleFont or I.titleFont))then G.TitleFont=b.brandFont(Enum.FontWeight.SemiBold)end
return G end function d.new(F)F=if typeof(F)=='table'then F else{}if F.translations or F.Translations then aj.register(F
.translations or F.Translations)end if F.translator or F.Translator then aj.translator=F.translator or F.Translator end
aj.setActive(F.locale or F.Locale or aj.detect())local G=F.fallbackFont or F.FallbackFont if G then b.setFallbackFont(G)
end local H,I=v(F.sidebarLayout or F.SidebarLayout),F.scale or F.Scale if I~=nil and(typeof(I)~='number'or I<=0)then ak.
warn[[Rayfield: scale must be a number above 0, using automatic scaling]]I=nil end local J,K=s(H.mode,I)local L=
setmetatable({name=F.name or F.Name or'Rayfield Window',subheading=F.subtitle or F.Subtitle,layout=H,size=J,scale=K,
fixedScale=I,instances={},connections={},icon=F.icon or F.Icon,showName=F.showName or F.ShowName or'Rayfield',showIcon=F
.showIcon or F.ShowIcon or ai.icons.rayfield,showIconOnly=F.showIconOnly or F.ShowIconOnly or false,profileText=F.
profile or F.Profile,themeProperties={},_scaledSurfaces={},actions={},localeProperties={},tabs={},tabSections={},tags={}
,selectedTab=nil,theme=E(F.theme or F.Theme),themeName=C(F.theme or F.Theme)or'Default',controls={},configuration=(
function()local L=F.configuration or F.Configuration if not L then return{}end return{autoSave=L.autoSave or L.AutoSave,
autoLoad=L.autoLoad or L.AutoLoad,fileName=L.fileName or L.FileName,customFolder=L.customFolder or L.CustomFolder}end)()
},d)L.Flags=setmetatable({},{__index=function(M,N)local O=L.controls[N]return O and O.value end,__newindex=function(M,N,
O)local P=L.controls[N]if not P then ak.warn("Rayfield: no flag '"..tostring(N).."' to set")return end P:Set(O)end,
__iter=function()local M return function()local N M,N=next(L.controls,M)if M then return M,N.value end return nil end
end})L.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast=true,haptics=true,
showProfile=true,theme=nil}L.screenGui=L:Create('ScreenGui',{Name=b.httpService:GenerateGUID(false),IgnoreGuiInset=true,
ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=b.
guiContainer})L.main=L:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name=L.name,ZIndex=1,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((L.size.X.Offset-50),0),
BackgroundTransparency=1,Visible=false,Parent=L.screenGui})L.uiScale=L:Create('UIScale',{Scale=L.scale,Parent=L.main})L.
drag=ac(ab.Parent.drag).new(L)L.windowCorner=L:Create('UICorner',{Parent=L.main},{CornerRadius='CornerRoundness'})L.
windowStroke=L:Create('UIStroke',{Transparency=1,Parent=L.main},{Color='SurfaceStroke'})L.windowGradient=L:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=L.main},{Color={'WindowColor',ag.toColorSequence}})L.
bottomFade=L:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,AnchorPoint=Vector2.new(1,1)
,Position=UDim2.fromScale(1,1),Size=L.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,BackgroundTransparency=1,Parent=L.main
})L.bottomFadeCorner=L:_roundCorners(L.bottomFade,L.layout.fadeCorners)L.bottomFadeGradient=L:Create('UIGradient',{
Rotation=270,Offset=Vector2.new(0,0.2),Transparency=L.layout.fadeTransparency,Parent=L.bottomFade},{Color={'WindowColor'
,function(M)return ColorSequence.new(ag.toColorSequence(M).Keypoints[1].Value)end}})L.topbar=L:Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,L.layout.topbarHeight),Active=true,Parent=L.main})L.topContainer=L:Create(
'Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,Parent=L.topbar})L.topContainerLayout=L:Create('UIListLayout',{Padding=UDim.
new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment
=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.topContainer})L.titleContainer=L:Create(
'Frame',{Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=L.topContainer})L.titleContainerLayout=L:Create(
'UIListLayout',{Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.titleContainer})if L.name then L.title=L:Create('TextLabel',{Text=
aj.t(L.name),FontFace=b.brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.
X,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,
Parent=L.titleContainer},{FontFace='Font',TextColor3='TitlingColor'})end if L.icon then L.topbarIcon=L:Create(
'ImageLabel',{Image=L.icon,BackgroundTransparency=1,Size=UDim2.fromOffset(32,32),ImageTransparency=1,Parent=L.
topContainer},{ImageColor3='TitlingColor'})end if L.subheading then L.subtitle=L:Create('TextLabel',{Text=aj.t(L.
subheading),Size=UDim2.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=L.titleContainer},{TextColor3=
'TitlingColor',FontFace='Font'})end L.tagContainer=L:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0
,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,LayoutOrder=2,
Visible=false,Parent=L.topContainer})L.tagContainerLayout=L:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Parent=L.tagContainer})L.windowShadow=L:CreateGlow(L.main,'ShadowColor',20,1)L.elements=L:Create('Frame',{Size=UDim2.
new(1,0,1,-L.layout.chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,Parent=L.main})if L.layout.mode==
'sidebar'then L.elementsCorner=L:_roundCorners(L.elements,L.layout.cardCorners)L.elementsStroke=L:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=L.elements},{Color='SurfaceStroke'})L:Create(
'UIGradient',{Rotation=L.layout.cardStrokeRotation,Transparency=L.layout.cardStrokeTransparency,Parent=L.elementsStroke}
)end L.elementsLayout=L:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=L.layout.pageDirection,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.
EasingStyle.Exponential,TweenTime=0.4,Parent=L.elements})if L.layout.mode=='sidebar'then aq.build(L,L.layout)aq.
applyWidth(L,an.railWidthFor(L.layout,L.size.X.Offset))else L.tabList=L:Create('ScrollingFrame',{Name='Tabs',Active=true
,Size=UDim2.new(1,0,0,L.layout.tabStripHeight),Position=UDim2.new(0.5,0,0,L.layout.tabStripTop),AnchorPoint=Vector2.new(
0.5,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=L.main})L.
tabListLayout=L:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=L.tabList})L:Create('UIPadding',{PaddingLeft=UDim.new(0,22),PaddingRight=UDim.new(0,10),
Parent=L.tabList})end L.actionContainer=L:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,Parent=L.topbar})L.
actionsListLayout=L:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=L.actionContainer})L.rfSettings=L:CreateTab{name='Rayfield Settings',customOrder=1000,
neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(L,{name='Close',icon=ai.icons.close,order=1,callback=
function()L:ToggleHide()end})L.minimiseAction=ac(ab.Parent.action).new(L,{name='Minimise',icon=ai.icons.minimise,order=2
,callback=function()L:ToggleMinimise()end})L.settingsAction=ac(ab.Parent.action).new(L,{name='Settings',icon=ai.icons.
settings,order=3,linkedTab=L.rfSettings,callback=function()L.rfSettings:Select()end})ap.build(L)L:_applyRailWidth()L.
unloaded=false L.minimised=false L.hidden=true L.animating=false L._revealing=false L.hasShownOnce=false L.
_collapsedShown=false L:LoadSettings()if L.settings.theme then L:ChangeTheme(L.settings.theme)end if L.layout.mode==
'sidebar'then aq.reflowProfile(L)aq.setSubtitle(L,L.profileText)end al.setContainer(L.screenGui)al.setEnabled(L.settings
.haptics)ao.buildCollapsedFace(L)L:_bindKeybind()L:_bindMouseOverride()L:_bindTopbarDrag()L:_watchViewport()L:
_buildSettingsUI()L:_syncLiveAnimation()return L end function d._syncLiveAnimation(F)if not F.theme.LiveAnimation then F
._liveAnimating=false return end if F._liveAnimating then return end F._liveAnimating=true F._liveGeneration=(F.
_liveGeneration or 0)+1 local G=F._liveGeneration task.spawn(function()local H,I=true,TweenInfo.new(10,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)while F._liveGeneration==G and F._liveAnimating and not F.unloaded do local J=b.
tweenService:Create(F.windowGradient,I,{Offset=Vector2.new(if H then 0.4 else-0.2,0),Rotation=(if H then 220 else 280)})
F._liveTween=J J:Play()J.Completed:Wait()H=not H end if F._liveGeneration==G then F._liveAnimating=false F._liveTween=
nil end end)end function d._builtInThemeName(F)return F.themeName end function d.ChangeTheme(F,G)F.themeName=C(G)local H
=if typeof(G)=='table'then G else E(G)for I,J in H do F.theme[I]=x(I,J)end if typeof(G)=='table'then B(F.theme,H)end for
I,J in F.themeProperties do for K,L in J do local M=if typeof(L)=='table'then L[2](F.theme[L[1] ])else F.theme[L]if
typeof(M)=='Color3'or typeof(M)=='number'then b.tweenService:Create(I,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[K]=M}):Play()else I[K]=M end end end if F.hidden then F._themeRefreshPending=true else F:
_refreshElementThemes()end F:_syncLiveAnimation()end function d._refreshElementThemes(F)for G,H in F.tabs do for I,J in
H.elements do if J._refreshTheme then J:_refreshTheme()end end end end function d.CreateTab(F,G)assert(not F.unloaded,
'Cannot create a tab on an unloaded window.')local H=ac(ab.Parent.tab).new(F,G)table.insert(F.tabs,H)if not H.
neglectSelector then local I=true for J,K in F.tabs do if K~=H and not K.neglectSelector then I=false break end end if I
then H:Select(true)end if not F.hidden and not F.minimised then H.topbarItem.Visible=true H:_applyVisual(if F.
selectedTab==H then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end
return H end function d.CreateSection(F,G)assert(not F.unloaded,'Cannot create a section on an unloaded window.')local H
=ac(ab.Parent.tabSection).new(F,G)table.insert(F.tabSections,H)if not H.inert and not F.hidden and not F.minimised then
H:_setVisible(true)H:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return H end
function d._setTabSectionsShown(F,G,H)for I,J in F.tabSections do J:_setShown(G,H)end end function d.
_setTabSectionsVisible(F,G)for H,I in F.tabSections do I:_setVisible(G)end end function d.CreateTag(F,G)assert(not F.
unloaded,'Cannot create a tag on an unloaded window.')local H=ac(ab.Parent.tag).new(F,G)table.insert(F.tags,H)return H
end function d._registerControl(F,G)if not G.flag or G.flag==''or G.forgetState then return end local H=G.flag if F.
controls[H]then local I=2 while F.controls[H..I]do I+=1 end H=H..I ak.warn("Rayfield: duplicate config flag '"..G.flag..
"', saving this one as '"..H.."'. Set a unique flag to keep it stable across sessions.")end G.flag=H F.controls[H]=G
return H end function d._restoreLate(F,G)if not F._loadedConfig or not G.flag or G.forgetState then return end local H=F
._loading F._loading=true ah.applyTo(G,F._loadedConfig[G.flag])F._loading=H end function d._persist(F,G)if G.flag and
not G.forgetState and F.configuration.autoSave and not F._loading then task.spawn(F.Save,F)end end function d.
_unregisterControl(F,G)if G.flag and F.controls[G.flag]==G then F.controls[G.flag]=nil end end function d._keybindUsing(
F,G,H)if typeof(G)~='EnumItem'or G==Enum.KeyCode.Unknown then return nil end for I,J in F.tabs do for K,L in J.elements
do if L~=H and L.__type=='Keybind'and L.value==G then return L end end end return nil end function d.Notify(F,G)if F.
unloaded then return end if not F.notifications then F.notifications=F:Create('Frame',{Name='Notifications',Size=UDim2.
new(0,300,0,800),Position=UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=F.
screenGui})F:_scaleSurface(F.notifications)F:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=F.notifications})end return ac(ab.Parent.notification).new(F,G)end
function d.CreateNameplate(F,G)assert(not F.unloaded,'Cannot create nameplates on an unloaded window.')local H=ac(ab.
Parent.nameplate).new(F,G)F._nameplates=F._nameplates or{}table.insert(F._nameplates,H)return H end function d.Toast(F,G
)if F.unloaded then return end G=if typeof(G)=='table'then G else{}local H=G.position or G.Position or'Top'local I=
typeof(H)~='string'or H:lower()~='bottom'G.position=if I then'Top'else'Bottom'local J=if I then'_toastsTop'else
'_toastsBottom'local K=F[J]if not K then K=F:Create('Frame',{Name='Toasts',Size=UDim2.new(0,l,1,-24),Position=if I then
i else UDim2.new(0.5,0,1,-12),AnchorPoint=if I then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,
ZIndex=ai.zIndex.toast,Parent=F.screenGui})F:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=if I then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=K})F[J]=K F:_scaleSurface(K
)if I then z(F,false)end end return ac(ab.Parent.toast).new(F,G,K)end function d.Popup(F,G)if F.unloaded then return end
return ac(ab.Parent.popup).new(F,G)end function d.Hide(F)if F.animating or F.hidden then return end if F._searching then
ap.close(F,{showTabs=false,jumpTo=F.selectedTab and F.selectedTab.tabPage})end if F._recordingKeybind then F.
_recordingKeybind:_stopRecording()end F.animating=true F._revealing=true F.hidden=true F.collapsedInteract.Visible=false
if F.minimised then F.minimised=false F.minimiseAction:_setIcon(ai.icons.minimise)end F._restorePosition=F.main.Position
local G,H=F:_collapsedRect()local I,J,K,L=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.
new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)b.tweenService:Create(F.drag.
dragCosmetic,I,{Size=UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not F.hidden
then return end F.drag.drag.Visible=false end)F:_fadeSurfaces(false,I)if F.title then b.tweenService:Create(F.title,I,{
TextTransparency=1}):Play()end if F.subtitle then b.tweenService:Create(F.subtitle,I,{TextTransparency=1}):Play()end if
F.topbarIcon then b.tweenService:Create(F.topbarIcon,I,{ImageTransparency=1}):Play()end for M,N in ipairs(F.
actionContainer:GetChildren())do if N:IsA'Frame'then b.tweenService:Create(N.ImageLabel,I,{ImageTransparency=1}):Play()
end end for M,N in F.tags do N:_setShown(false,I)end for M,N in pairs(F.tabs)do if not N.neglectSelector and N.
topbarItem then N:_applyVisual('hidden',I)end end F:_setTabSectionsShown(false,I)F:_fadeSelectedElementsOut()local M=b.
tweenService:Create(F.main,J,{Size=H,Position=G})M.Completed:Connect(function()if F.unloaded or not F.hidden then return
end F._collapsedShown=true z(F,true)F.collapsedInteract.Visible=true F.animating=false F._revealing=false end)M:Play()b.
tweenService:Create(F.windowCorner,K,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()if not F.hidden then
return end F.topbar.Visible=false F:_setContentVisible(false)ao.setCollapsedShown(F,true,L)end)end function d.ToggleHide
(F)if F.animating then return end if F.hidden then F:Show()else F:Hide()end end function d.ToggleMinimise(F)if F.
animating or F.hidden then return end if F._searching then ap.close(F,{showTabs=true})end F.animating=true local G,H=
TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out)if F.minimised then F.minimised=false F.minimiseAction:_setIcon(ai.icons.minimise)b.
tweenService:Create(F.main,G,{Size=F.size}):Play()F:_fadeSurfaces(true,H)b.tweenService:Create(F.drag.drag,G,{Position=
UDim2.new(F.main.Position.X.Scale,F.main.Position.X.Offset,F.main.Position.Y.Scale,F.main.Position.Y.Offset+F:_hang(F.
size.Y.Offset))}):Play()task.delay(0.2,function()if F.minimised or F.hidden then return end F:_setContentVisible(true)
for I,J in pairs(F.tabs)do if not J.neglectSelector and J.topbarItem then J.topbarItem.Visible=true J:_applyVisual(if F.
selectedTab==J then'selected'else'unselected',H)end end F:_setTabSectionsVisible(true)F:_setTabSectionsShown(true,H)F:
_revealElements(0.035,0.4)end)task.delay(0.5,function()F.animating=false end)else F.minimised=true F.minimiseAction:
_setIcon(ai.icons.maximise)F:_fadeSelectedElementsOut()for I,J in pairs(F.tabs)do if not J.neglectSelector and J.
topbarItem then J:_applyVisual('hidden',H)end end F:_setTabSectionsShown(false,H)task.delay(0.3,function()if not F.
minimised then return end F:_setContentVisible(false)for I,J in pairs(F.tabs)do if not J.neglectSelector and J.
topbarItem then J.topbarItem.Visible=false end end F:_setTabSectionsVisible(false)end)F:_fadeSurfaces(false,H)b.
tweenService:Create(F.main,G,{Size=UDim2.fromOffset(F.size.X.Offset,F.layout.topbarHeight)}):Play()b.tweenService:
Create(F.drag.drag,G,{Position=UDim2.new(F.main.Position.X.Scale,F.main.Position.X.Offset,F.main.Position.Y.Scale,F.main
.Position.Y.Offset+F:_hang(F.layout.topbarHeight))}):Play()task.delay(0.5,function()F.animating=false end)end end
function d._syncDragBar(F)local G=F.drag and F.drag.drag if not G then return end local H,I=F.main.Position,F:_hang(F.
size.Y.Offset)G.Position=UDim2.new(H.X.Scale,H.X.Offset,H.Y.Scale,H.Y.Offset+I)end function d._clampedPosition(F,G:UDim2
):UDim2 if not F.settings or not F.settings.keepOnScreen then return G end if G.X.Scale~=0 or G.Y.Scale~=0 then return G
end local H,I,J,K=F.screenGui.AbsoluteSize,F.size.X.Offset*F.scale/2,F.size.Y.Offset*F.scale/2,8 local L,M=math.clamp(G.
X.Offset,I+K,math.max(I+K,H.X-I-K)),math.clamp(G.Y.Offset,J+K,math.max(J+K,H.Y-J-K))if L==G.X.Offset and M==G.Y.Offset
then return G end return UDim2.fromOffset(L,M)end function d._clampToScreen(F)F.main.Position=F:_clampedPosition(F.main.
Position)end function d._applyWindowSize(F)if F.unloaded then return end local G,H=s(F.layout.mode,F.fixedScale)local I=
G~=F.size or H~=F.scale F.size=G F.scale=H F.uiScale.Scale=H F:_rescaleSurfaces()for J,K in F.actions do K:_fit()end F:
_applyRailWidth()if I then F:_layoutColumns()end if F.hidden or F.minimised or F.animating or F._revealing then F.
_pendingResize=F._pendingResize or I return end if not I and not F._pendingResize then return end F._pendingResize=false
F.main.Size=G F:_clampToScreen()F:_syncDragBar()end function d._layoutColumns(F)for G,H in F.tabs do H:_layoutColumns()
end end function d._applyRailWidth(F)if F.layout.mode~='sidebar'then return end aq.applyWidth(F,an.railWidthFor(F.layout
,F.size.X.Offset))end function d._watchViewport(F)local G,H:RBXScriptConnection?=false local function I()if G then
return end G=true task.defer(function()G=false F:_applyWindowSize()end)end local function J()if H then F:Disconnect(H)H=
nil end local K=b.workspace.CurrentCamera if K then H=F:Connect(K:GetPropertyChangedSignal'ViewportSize',I)end I()end F:
Connect(b.workspace:GetPropertyChangedSignal'CurrentCamera',J)J()local K=0 F:Connect(b.runService.Heartbeat,function(L:
number)K+=L if K<r then return end K=0 F:_applyWindowSize()end)end function d._bindKeybind(F)F:Connect(b.
userInputService.InputBegan,function(G,H)if H or F._recordingKeybind then return end if G.KeyCode==F.settings.
toggleKeybind or G.UserInputType==F.settings.toggleKeybind then F:ToggleHide()end end)end function d._bindMouseOverride(
F)local G=b.userInputService local function H()return F.settings.mouseOverride and not F.hidden and not F.minimised end
local function I()if not H()then return end if G:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)then return end if
G.MouseBehavior~=Enum.MouseBehavior.Default then G.MouseBehavior=Enum.MouseBehavior.Default end if not G.
MouseIconEnabled then G.MouseIconEnabled=true end end F:Connect(G:GetPropertyChangedSignal'MouseBehavior',I)F:Connect(G:
GetPropertyChangedSignal'MouseIconEnabled',I)F:Connect(G.InputEnded,function(J)if J.UserInputType==Enum.UserInputType.
MouseButton2 then I()end end)F._freeMouse=I end function d._bindTopbarDrag(F)local G,H,I,J=b.userInputService,false,
Vector2.zero,Vector2.zero if F.screenGui and F.screenGui.IgnoreGuiInset then J=b.guiService:GetGuiInset()end
local function K()local L=G:GetMouseLocation()+I+J local M,N=L.X,L.Y if F.settings and F.settings.keepOnScreen then
local O,P,Q=F.main.AbsoluteSize,F.screenGui.AbsoluteSize,8 local R,S=O.X/2,O.Y/2 M=math.clamp(M,R+Q,math.max(R+Q,P.X-R-Q
))N=math.clamp(N,S+Q,math.max(S+Q,P.Y-S-Q))end return UDim2.fromOffset(M,N)end local function L(M,N)for O,P in{F.tabList
,F.actionContainer}do local Q,R=P.AbsolutePosition,P.AbsoluteSize if M>=Q.X and M<=Q.X+R.X and N>=Q.Y and N<=Q.Y+R.Y
then return true end end return false end F:Connect(F.topbar.InputBegan,function(M,N)if N then return end local O=M.
UserInputType.Name if O~='MouseButton1'and O~='Touch'then return end if L(M.Position.X,M.Position.Y)then return end if
not F:_interactive()then return end H=true if F.screenGui and F.screenGui.IgnoreGuiInset then J=b.guiService:
GetGuiInset()end I=F.main.AbsolutePosition+F.main.AbsoluteSize*F.main.AnchorPoint-G:GetMouseLocation()end)F:Connect(G.
InputEnded,function(M)local N=M.UserInputType.Name if N=='MouseButton1'or N=='Touch'then H=false end end)F:Connect(G.
WindowFocusReleased,function()H=false end)F:Connect(b.runService.RenderStepped,function()if not H then return end if not
F:_interactive()then H=false return end F.main.Position=K()if F.drag and F.drag.drag then local M=F.main.Position F.drag
.drag.Position=UDim2.new(M.X.Scale,M.X.Offset,M.Y.Scale,M.Y.Offset+F:_hang(F.main.Size.Y.Offset))end end)end function d.
_buildSettingsUI(F)F.rfSettings:CreateSection{name='General'}F.rfSettings:CreateKeybind{name='Toggle Keybind',icon=ai.
icons.search,value=F.settings.toggleKeybind,isMenuToggle=true,onChanged=function(G)F.settings.toggleKeybind=G F:
SaveSettings()end}F.rfSettings:CreateToggle{name='Unlock cursor while open',description=
[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=F.settings.
mouseOverride,callback=function(G)F.settings.mouseOverride=G F:SaveSettings()end}F.rfSettings:CreateToggle{name=
'Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=F.
settings.welcomeToast,callback=function(G)F.settings.welcomeToast=G F:SaveSettings()end}F.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=F.settings.haptics,
callback=function(G)F.settings.haptics=G al.setEnabled(G)F:SaveSettings()end}F.rfSettings:CreateSection{name='Window'}F.
rfSettings:CreateDropdown{name='Theme',description=
[[Changes the colours of this menu. Your choice is remembered next time.]],options=ai.builtInThemes,value=F.settings.
theme or F:_builtInThemeName()or ai.builtInThemes[1],callback=function(G)if typeof(G)~='string'or G==''then return end F
.settings.theme=G F:ChangeTheme(G)F:SaveSettings()end}if F.layout.mode=='sidebar'and F.profile then F.rfSettings:
CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=F.settings.showProfile,callback=function(G)aq.setProfileEnabled(F,G)F:SaveSettings()end}end F.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=F.settings.keepOnScreen,callback=function(
G)F.settings.keepOnScreen=G F:SaveSettings()end}F.rfSettings:CreateButton{name='Reset Window Position',callback=function
()b.tweenService:Create(F.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.
new(0.5,0,0.5,0)}):Play()b.tweenService:Create(F.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,F:_hang(F.size.Y.Offset))}):Play()end}if next(F.configuration)~=nil
then F.rfSettings:CreateSection{name='Configurations'}local G,H,I=(F:ListConfigs()[1])local function J()local K=F:
ListConfigs()H:Refresh(K)if G and not table.find(K,G)then G=K[1]end if G then H:Set(G,true)end end H=F.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=F:ListConfigs(),value=G,placeholder=
'No saved configurations',callback=function(K)G=K end}I=F.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local K=F.rfSettings:CreateGroup()K:CreateButton{name='Save',icon=ai.icons.config,callback=function()local L=I.
value if L==''then L=G end if not L or L==''then F:Toast{title=aj.resolve'Name your configuration first'}return end if F
:Save(L)then I:Set''G=L J()F:Toast{title=aj.resolve'Saved configuration',subtitle=L,icon=ai.icons.config}else F:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=L}end end}K:CreateButton{name='Load',callback=function()if not G
or G==''then F:Toast{title=aj.resolve'Pick a configuration to load'}return end if F:_applyNamedConfig(G)then F:Toast{
title=aj.resolve'Loaded configuration',subtitle=G}else F:Toast{title=aj.resolve"Couldn't load configuration",subtitle=G}
end end}K:CreateButton{name='Delete',callback=function()local L=G if not L or L==''then F:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if F:DeleteConfig(L)then J()F:Toast{title=aj.resolve'Deleted configuration',
subtitle=L}else F:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=L}end end}end end function d.SetProfile
(F,G)F.profileText=G aq.setSubtitle(F,G)end function d.SaveSettings(F)return ah.saveSettings(F)end function d.
LoadSettings(F)return ah.loadSettings(F)end function d._roundCorners(F,G,H)if not H or not u then return F:Create(
'UICorner',{Parent=G},{CornerRadius='CornerRoundness'})end local I,J={Parent=G},{}for K,L in t do I[L]=UDim.new(0,0)end
for K,L in H do I[L]=nil J[L]='CornerRoundness'end return F:Create('UICorner',I,J)end function d._setElementLocked(F,G,H
,I)H=H==true local J=G.locked==true if J==H and not(H and I)then return end G.locked=H if not G.lockScrim then F:
_buildLockScrim(G)end local K=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if H then G.lockScrim.
Visible=true end b.tweenService:Create(G.lockScrim,K,{BackgroundTransparency=if H then n else 1}):Play()if not H then
task.delay(K.Time,function()if not G.locked and G.lockScrim then G.lockScrim.Visible=false end end)end local L=G.
descriptor if not L then return end if H then G._descriptionBefore=G._descriptionBefore or L.titleLabel.Text L.
titleLabel.Text=aj.resolve(I or'This element is locked.')elseif G._descriptionBefore then L.titleLabel.Text=G.
_descriptionBefore G._descriptionBefore=nil end b.tweenService:Create(L.titleLabel,K,{TextTransparency=if H then o else
0.7}):Play()end function d._buildLockScrim(F,G)G.lockScrim=F:Create('TextButton',{Name='ElementLock',Active=true,
AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=G.main},{BackgroundColor3={'WindowColor',y}})F:Create(
'UICorner',{Parent=G.lockScrim},{CornerRadius='ElementCornerRadius'})end function d._setContentVisible(F,G)F.elements.
Visible=G F.tabList.Visible=G if F.sidebar then F.sidebar.Visible=G end end function d._fadeSurfaces(F,G,H)local I={[F.
windowShadow]={Transparency=if G then 0.6 else 1},[F.windowStroke]={Transparency=if G then 0.95 else 1},[F.bottomFade]={
BackgroundTransparency=if G then 0 else 1}}if F.elementsStroke then I[F.elements]={BackgroundTransparency=if G then F.
layout.cardTransparency else 1}I[F.elementsStroke]={Transparency=if G then 0 else 1}end for J,K in I do if H then b.
tweenService:Create(J,H,K):Play()else for L,M in K do J[L]=M end end end aq.setProfileShown(F,G,H)end function d.
_fadeSelectedElementsOut(F)if F.selectedTab then for G,H in ipairs(F.selectedTab.elements)do H:_setShown(false,true)end
end end function d._revealElements(F,G,H)for I,J in pairs(F.tabs)do if J~=F.selectedTab then for K,L in ipairs(J.
elements)do L:_setShown(true,false)end end end local I=F.selectedTab if not I then return end local J=I.tabPage local K=
J.AbsolutePosition.Y local L,M,N=K+J.AbsoluteWindowSize.Y,table.clone(I.elements),{}for O,P in M do N[P]=O end table.
sort(M,function(O,P)local Q,R=O.main.AbsolutePosition,P.main.AbsolutePosition if Q.Y~=R.Y then return Q.Y<R.Y end if Q.X
~=R.X then return Q.X<R.X end return N[O]<N[P]end)local O,P=math.floor(H/G),0 for Q,R in M do local S=R.main.
AbsolutePosition.Y local T=(S+R.main.AbsoluteSize.Y)>K and S<L if T then R:_setShown(true,true)P+=1 if P<=O then task.
wait(G)end else R:_setShown(true,false)end end end function d.Show(F)if F.animating or not F.hidden then return end F.
animating=true F._revealing=true if F.configuration.autoLoad and not F._autoLoaded then F._autoLoaded=true local G,H=
pcall(F.Load,F)if not G then ak.warn('Rayfield: Failed to load configuration - '..tostring(H))end end F.hidden=false F.
minimised=false if F._themeRefreshPending then F._themeRefreshPending=false F:_refreshElementThemes()end F.
collapsedInteract.Visible=false if F._freeMouse then F._freeMouse()end if F.hasShownOnce then F:_quickRestore()else F.
hasShownOnce=true F:_firstShow()end end function d._quickRestore(F)local G=F:_clampedPosition(F._restorePosition or
UDim2.new(0.5,0,0.5,0))F._restorePosition=G local H,I,J=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)ao.setCollapsedShown(F,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local K=b.tweenService:Create(F.main,H,{Size=F.size,Position=G})K.Completed:Connect(
function()if F.hidden or F.unloaded then return end F._collapsedShown=false z(F,true)end)K:Play()b.tweenService:Create(F
.windowCorner,I,{CornerRadius=F.theme.CornerRoundness}):Play()task.delay(0.22,function()F.topbar.Visible=true F:
_setContentVisible(true)F:_fadeSurfaces(true,J)if F.topbarIcon then b.tweenService:Create(F.topbarIcon,J,{
ImageTransparency=0}):Play()end if F.title then b.tweenService:Create(F.title,J,{TextTransparency=0}):Play()end if F.
subtitle then b.tweenService:Create(F.subtitle,J,{TextTransparency=0.7}):Play()end for L,M in ipairs(F.actionContainer:
GetChildren())do if M:IsA'Frame'then b.tweenService:Create(M.ImageLabel,J,{ImageTransparency=0.6}):Play()end end if F.
settingsAction and F.selectedTab==F.rfSettings then b.tweenService:Create(F.settingsAction.iconLabel,J,{
ImageTransparency=0.2}):Play()end for L,M in F.tags do M:_setShown(true,J)end for L,M in pairs(F.tabs)do if not M.
neglectSelector and M.topbarItem then M.topbarItem.Visible=true M:_applyVisual(if F.selectedTab==M then'selected'else
'unselected',J)end end F:_setTabSectionsVisible(true)F:_setTabSectionsShown(true,J)F:_revealElements(0.035,0.4)end)task.
delay(0.22,function()F.drag.drag.Position=UDim2.new(G.X.Scale,G.X.Offset,G.Y.Scale,G.Y.Offset+F:_hang(F.size.Y.Offset))F
.drag.dragCosmetic.Size=UDim2.fromOffset(0,4)F.drag.dragCosmetic.BackgroundTransparency=1 F.drag.drag.Visible=true b.
tweenService:Create(F.drag.dragCosmetic,H,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()F.animating=false F._revealing=false end)end function d._firstShow(F)F:_setContentVisible(true)F.
drag.drag.Visible=false F.main.Visible=true b.tweenService:Create(F.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=F.size}):Play()task.wait(0.85)F:_fadeSurfaces(true,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if F.icon then b.tweenService:Create(F.
topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if
F.title then b.tweenService:Create(F.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if F.subtitle then b.tweenService:Create(F.subtitle,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for G,H in ipairs(F.actionContainer:
GetChildren())do if H:IsA'Frame'then task.wait(0.02)b.tweenService:Create(H.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for G,H in F.tags do H:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()local G=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)F:_setTabSectionsVisible(true)F:
_setTabSectionsShown(true,G)local H=0 for I,J in pairs(F.tabs)do if not J.neglectSelector then J.topbarItem.Visible=true
J:_applyVisual(if F.selectedTab==J then'selected'else'unselected',G)J:_spinGradients()H+=1 if H<=q then task.wait(p)end
end end end)F:_revealElements(0.03,2)task.wait(1)F:_syncDragBar()F.drag.drag.Visible=true b.tweenService:Create(F.drag.
dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):
Play()b.tweenService:Create(F.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=UDim2.fromOffset(100,4)}):Play()F.animating=false F._revealing=false local G=b.localPlayer if G and F.settings.
welcomeToast and ao.isNewUser()then F:Toast{title=G.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,
avatar=G.UserId,minWidth=220}end end function d.GetPath(F)return ah.getPath(F)end function d.Save(F,G)if G~=nil and(
type(G)~='string'or G=='')then return false end return ah.save(F,G)end function d.Load(F,G)if G~=nil and(type(G)~=
'string'or G=='')then return false end return ah.load(F,G)end function d._applyNamedConfig(F,G)if not F:Load(G)then
return false end local H,I=ah.getPath(F)F._loadedConfigPath=I F:Save()return true end function d.ListConfigs(F)return ah
.list(F)end function d.DeleteConfig(F,G)return ah.delete(F,G)end function d.Get(F,G)local H=F.controls[G]return H and H.
value end function d.Set(F,G,H)local I=F.controls[G]if not I then return false end I:Set(H)return true end function d.
_jumpTo(F,G)if G then F.elementsLayout:JumpTo(G)end end function d.Navigate(F,G)if G==nil then return end local H for I,
J in F.tabs do if J==G or J.name==G or J.tabPage==G then H=J break end end if not H then return end H:Select()end
function d.Create(F,G,H,I)assert(typeof(G)=='string','Invalid argument #1 (string expected)')local J=Instance.new(G)if I
and F.theme then for K,L in I do J[K]=(if typeof(L)=='table'then L[2](F.theme[L[1] ])else F.theme[L])end F.
themeProperties[J]=I end if H then for K,L in H do if aj.isToken(L)then F:_bindLocale(J,K,aj.sourceOf(L))else af.assign(
J,K,L)end end end table.insert(F.instances,J)return J end function d._bindLocale(F,G,H,I)G[H]=aj.resolve(I)local J=F.
localeProperties[G]if not J then J={}F.localeProperties[G]=J end J[H]=I end function d.SetLocale(F,G)aj.setActive(G)for
H,I in F.localeProperties do for J,K in I do H[J]=aj.resolve(K)end end end function d.SetTranslator(F,G)aj.translator=G
end function d.RegisterTranslations(F,G)aj.register(G)F:SetLocale(aj.current)end function d.CreateGlow(F,G,H,I,J)local K
={BlurRadius=UDim.new(0,I),Transparency=J,ZIndex=-1,Parent=G}if typeof(H)=='string'then return F:Create('UIShadow',K,{
Color={H,function(L)return if typeof(L)=='ColorSequence'then L.Keypoints[1].Value else L end}})end K.Color=H return F:
Create('UIShadow',K)end function d._flashResult(F,G,H)local I=G.box if not I then return end local J,K,L,M,N,O=G.glow,G.
boxStroke,H and ai.accent.on or F.theme.ErrorColor,H and ai.accent.onStroke or F.theme.ErrorStrokeColor,TweenInfo.new(
0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
b.tweenService:Create(I,N,{BackgroundColor3=L}):Play()if K then b.tweenService:Create(K,N,{Color=M,Transparency=0.4}):
Play()end if J then b.tweenService:Create(J,N,{Color=M,Transparency=0.6}):Play()end G._flashToken=(G._flashToken or 0)+1
local P=G._flashToken task.delay(0.22,function()if G._flashToken~=P then return end b.tweenService:Create(I,O,{
BackgroundColor3=F.theme.FieldBackground}):Play()if K then b.tweenService:Create(K,O,{Color=F.theme.SurfaceStroke,
Transparency=0.85}):Play()end if J then b.tweenService:Create(J,O,{Color=F.theme.FieldGlow,Transparency=G._glowIdle or 1
}):Play()end end)end function d.CreateHoverOverlay(F,G)local H=F:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=1,Parent=G})F:Create('UICorner',{
Parent=H},{CornerRadius='ElementCornerRadius'})return H end function d._wireElementHover(F,G)local H,I=TweenInfo.new(
0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),F.theme F:ConnectFor(G,G.main.MouseEnter,function()if not F:
_interactive()then return end b.tweenService:Create(G.stroke,H,{Transparency=I.ElementStrokeHoverTransparency,Color=I.
ElementStrokeHover}):Play()b.tweenService:Create(G.title,H,{TextColor3=I.ElementTextHoverColor}):Play()if G.hoverOverlay
then b.tweenService:Create(G.hoverOverlay,H,{BackgroundTransparency=0.97}):Play()end end)F:ConnectFor(G,G.main.
MouseLeave,function()b.tweenService:Create(G.stroke,H,{Transparency=I.ElementStrokeTransparency,Color=I.ElementStroke}):
Play()b.tweenService:Create(G.title,H,{TextColor3=I.ContentColor}):Play()if G.hoverOverlay then b.tweenService:Create(G.
hoverOverlay,H,{BackgroundTransparency=1}):Play()end end)end function d._runGuarded(F,G,H,...)if G.locked then return
end local I=table.pack(...)task.spawn(function()local J,K=pcall(function()return H(table.unpack(I,1,I.n))end)if J or G.
_errored then return end G._errored=true local L,M=G.flashTarget or G.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out)b.tweenService:Create(L,M,{BackgroundColor3=F.theme.ErrorColor}):Play()b.tweenService:Create(G.
stroke,M,{Color=F.theme.ErrorStrokeColor}):Play()if G.title then G.title.Text=aj.resolve
'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {G.__type} component named '{
G.name}':`)ak.print(K)task.wait(1)if G.title then G.title.Text=aj.resolve(G.name)end b.tweenService:Create(L,TweenInfo.
new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()b.
tweenService:Create(G.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Color=F.theme.
ElementStroke}):Play()G._errored=false end)end function d.StyleElementBody(F,G)F:Create('UIGradient',{Rotation=270,
Parent=G},{Color='ElementGradient'})F:Create('UICorner',{Parent=G},{CornerRadius='ElementCornerRadius'})return F:Create(
'UIStroke',{Transparency=1,Parent=G},{Color='ElementStroke',Transparency='ElementStrokeTransparency'})end function d.
_buildCompactRow(F,G,H,I)local J=F:Create('Frame',{Name=H,Size=UDim2.fromOffset(0,m),AutomaticSize=Enum.AutomaticSize.X,
ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Parent=G.
tabPage},{BackgroundTransparency='ElementTransparency'})local K=F:StyleElementBody(J)F:Create('UIFlexItem',{FlexMode=
Enum.UIFlexMode.Fill,Parent=J})F:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=J})local L=F:Create('TextButton',{Text='',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,m),BorderSizePixel=0,TextTransparency=1,ZIndex=I or 1,Parent=J})F:Create('UICorner',{Parent=L},{
CornerRadius='ElementCornerRadius'})return J,K,L end function d.StyleElementPanel(F,G)F:Create('UIGradient',{Rotation=
270,Parent=G},{Color='ElementGradient'})F:Create('UICorner',{Parent=G},{CornerRadius='ElementCornerRadius'})local H=F:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=G})F:Create('UIGradient',{Rotation=270,Parent
=H},{Color='ElementStrokeGradient'})return H end function d._reveal(F,G,H,I,J)if not G then return end if I then b.
tweenService:Create(G,J or e,H):Play()else for K,L in H do G[K]=L end end end function d._revealCommon(F,G,H)F:_reveal(G
.stroke,{Transparency=F.theme.ElementStrokeTransparency},H)F:_reveal(G.title,{TextTransparency=0},H)F:_reveal(G.main,{
BackgroundTransparency=F.theme.ElementTransparency or 0},H)if G.iconLabel then F:_reveal(G.iconLabel,{ImageTransparency=
0},H)end if G.descriptor then F:_reveal(G.descriptor.titleLabel,{TextTransparency=0.7},H)end end function d._hideCommon(
F,G,H)F:_reveal(G.stroke,{Transparency=1},H)F:_reveal(G.title,{TextTransparency=1},H)F:_reveal(G.main,{
BackgroundTransparency=1},H)if G.iconLabel then F:_reveal(G.iconLabel,{ImageTransparency=1},H)end if G.descriptor then F
:_reveal(G.descriptor.titleLabel,{TextTransparency=1},H)end end function d._collapsedRect(F)local G=if F.showIconOnly
then g else f if F._collapsedPosition then return F._collapsedPosition,G end local H=UDim2.new(h.X.Scale,h.X.Offset,h.Y.
Scale,h.Y.Offset+G.Y.Offset*F.scale/2)return H,G end function d._scaleSurface(F,G)local H=F:Create('UIScale',{Scale=F.
scale,Parent=G})table.insert(F._scaledSurfaces,H)return H end function d._rescaleSurfaces(F)for G=#F._scaledSurfaces,1,-
1 do local H=F._scaledSurfaces[G]if H.Parent then H.Scale=F.scale else table.remove(F._scaledSurfaces,G)end end end
function d._hang(F,G:number):number return G*F.scale/2+15 end function d._interactive(F)return not F.animating and not F
.hidden end function d._settled(F)return not F.hidden and not F._revealing end function d.Connect(F,G,H)local I=G:
Connect(H)table.insert(F.connections,I)return I end function d.ConnectFor(F,G,H,I)local J=F:Connect(H,I)G.connections=G.
connections or{}table.insert(G.connections,J)return J end function d.Disconnect(F,G)if not G then return end local H=
table.find(F.connections,G)if H then table.remove(F.connections,H)end G:Disconnect()end function d.DestroySubtree(F,G)if
not G then return end local H={[G]=true}for I,J in G:GetDescendants()do H[J]=true end for I=#F.instances,1,-1 do local J
=F.instances[I]if H[J]then table.remove(F.instances,I)F.themeProperties[J]=nil F.localeProperties[J]=nil end end G:
Destroy()end function d.DisconnectMany(F,G,H)if not H or#H==0 then return end local I={}for J,K in H do I[K]=true K:
Disconnect()end local function J(K)if not K then return end local L=0 for M=1,#K do local N=K[M]if not I[N]then L+=1 K[L
]=N end end for M=#K,L+1,-1 do K[M]=nil end end J(F.connections)if G and G~=F then J(G.connections)end end function d.
DestroySubtrees(F,G)if not G or#G==0 then return end local H={}for I,J in G do H[J]=true for K,L in J:GetDescendants()do
H[L]=true end end local I=0 for J=1,#F.instances do local K=F.instances[J]if H[K]then F.themeProperties[K]=nil F.
localeProperties[K]=nil else I+=1 F.instances[I]=K end end for J=#F.instances,I+1,-1 do F.instances[J]=nil end for J,K
in G do K:Destroy()end end function d.Unload(F)F.unloaded=true for G,H in F._nameplates or{}do H._alive=false end al.
teardown()al.releaseContainer(F.screenGui)if F._liveTween then F._liveTween:Cancel()F._liveTween=nil end for G=#F.
connections,1,-1 do F.connections[G]:Disconnect()end for G=#F.instances,1,-1 do F.instances[G]:Destroy()end table.clear(
F.connections)table.clear(F.instances)table.clear(F.themeProperties)table.clear(F.localeProperties)table.clear(F.
controls)table.clear(F.tabs)table.clear(F._scaledSurfaces)end return d end)()end,[35]=function()local aa,ab,ac=a(35)
local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,16,32)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,22,46)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,28,56))},
ShadowColor=Color3.fromRGB(12,6,22),ElementStroke=Color3.fromRGB(54,42,74),ElementGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(32,24,48)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(36,28,54)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(36,28,54))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(72,58,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(88,72,124)),ColorSequenceKeypoint.new(1
,Color3.fromRGB(72,58,104))},ElementStrokeHover=Color3.fromRGB(84,68,118),TabBackground=ColorSequence.new(Color3.
fromRGB(54,42,80),Color3.fromRGB(34,26,52)),TabStroke=ColorSequence.new(Color3.fromRGB(88,70,128),Color3.fromRGB(54,42,
80)),SliderBackground=Color3.fromRGB(46,36,68),SliderBackgroundHover=Color3.fromRGB(60,48,90),SliderProgress=
ColorSequence.new(Color3.fromRGB(170,112,248),Color3.fromRGB(138,80,224)),AccentColor=Color3.fromRGB(168,110,246),
AccentStroke=Color3.fromRGB(200,154,255),ToggleKnobOff=Color3.fromRGB(224,214,236),StatBackground=Color3.fromRGB(24,18,
38),DropdownHighlight=Color3.fromRGB(168,110,246),NeutralButton=Color3.fromRGB(46,36,68),NeutralButtonHover=Color3.
fromRGB(60,48,90),NeutralButtonStroke=Color3.fromRGB(140,116,190)}end)()end,[36]=function()local aa,ab,ac=a(36)local ad
return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(12,16,34)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(20,26,50)),ColorSequenceKeypoint.new(1,Color3.fromRGB(28,36,66))},
ShadowColor=Color3.fromRGB(6,8,20),ElementStroke=Color3.fromRGB(44,52,82),ElementGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(26,32,58)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,38,66)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(30,38,66))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(56,66,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(70,82,124)),ColorSequenceKeypoint.new(1
,Color3.fromRGB(56,66,104))},ElementStrokeHover=Color3.fromRGB(64,76,116),TabBackground=ColorSequence.new(Color3.
fromRGB(48,58,92),Color3.fromRGB(30,38,64)),TabStroke=ColorSequence.new(Color3.fromRGB(78,92,140),Color3.fromRGB(48,58,
92)),SliderBackground=Color3.fromRGB(40,48,78),SliderBackgroundHover=Color3.fromRGB(54,64,100),SliderProgress=
ColorSequence.new(Color3.fromRGB(64,132,248),Color3.fromRGB(42,104,224)),AccentColor=Color3.fromRGB(48,120,240),
AccentStroke=Color3.fromRGB(96,164,255),ToggleKnobOff=Color3.fromRGB(196,206,232),StatBackground=Color3.fromRGB(20,26,48
),DropdownHighlight=Color3.fromRGB(48,120,240),NeutralButton=Color3.fromRGB(40,48,78),NeutralButtonHover=Color3.fromRGB(
54,64,100),NeutralButtonStroke=Color3.fromRGB(120,138,195)}end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(
function(...)local ae=ac(ab.Parent.Parent.utility.variables)return{CornerRoundness=UDim.new(0,20),WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
25,25,25)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ShadowColor=Color3.fromRGB(20,20,20),ElementStroke=
Color3.fromRGB(35,35,35),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,255,
255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50),Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(
Color3.fromRGB(95,95,95),Color3.fromRGB(50,50,50)),SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=
Color3.fromRGB(60,60,60),SliderProgress=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),
SliderStroke=Color3.fromRGB(255,255,255),ActionColor=Color3.fromRGB(255,255,255),TitleFont=ae.brandFont(Enum.FontWeight.
SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(255,255,255),LiveAnimation=false,
DarkToggleOverlay=true,ElementTransparency=0,ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,
ElementStrokeHover=Color3.fromRGB(50,50,50),ElementCornerRadius=UDim.new(0,12),ElementTextHoverColor=Color3.fromRGB(255,
255,255),TitlingColor=Color3.fromRGB(255,255,255),DropdownHighlight=Color3.fromRGB(255,255,255),AccentColor=Color3.
fromRGB(23,153,110),AccentStroke=Color3.fromRGB(32,201,144),AccentGlow=0.4,StatBackground=Color3.fromRGB(25,25,25),
SliderHandle=Color3.fromRGB(255,255,255),PillCornerRadius=UDim.new(1,0),ToggleTrack=Color3.fromRGB(0,0,0),
ToggleTrackTransparency=0.9,ToggleKnobOff=Color3.fromRGB(255,255,255),ToggleKnobOffTransparency=0.8,FieldBackground=
Color3.fromRGB(255,255,255),FieldTransparency=0.9,FieldGlow=Color3.fromRGB(255,255,255),PlaceholderColor=Color3.fromRGB(
178,178,178),SurfaceStroke=Color3.fromRGB(255,255,255),NeutralButton=Color3.fromRGB(38,38,38),NeutralButtonHover=Color3.
fromRGB(54,54,54),NeutralButtonStroke=Color3.fromRGB(255,255,255),ErrorColor=Color3.fromRGB(185,50,50),ErrorStrokeColor=
Color3.fromRGB(240,75,75)}end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)return{WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,18,16)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
32,27,23)),ColorSequenceKeypoint.new(1,Color3.fromRGB(40,33,28))},ShadowColor=Color3.fromRGB(16,12,8),ElementStroke=
Color3.fromRGB(54,46,40),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,27,23)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(38,32,27)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,32,27))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,62,52)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(88,76,64)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,62,52))},ElementStrokeHover=Color3.
fromRGB(84,72,60),TabBackground=ColorSequence.new(Color3.fromRGB(56,47,40),Color3.fromRGB(36,30,26)),TabStroke=
ColorSequence.new(Color3.fromRGB(92,78,66),Color3.fromRGB(56,47,40)),SliderBackground=Color3.fromRGB(48,40,34),
SliderBackgroundHover=Color3.fromRGB(62,52,44),SliderProgress=ColorSequence.new(Color3.fromRGB(244,152,44),Color3.
fromRGB(220,110,24)),AccentColor=Color3.fromRGB(240,142,40),AccentStroke=Color3.fromRGB(255,182,92),ToggleKnobOff=Color3
.fromRGB(232,224,214),StatBackground=Color3.fromRGB(26,21,18),DropdownHighlight=Color3.fromRGB(240,142,40),NeutralButton
=Color3.fromRGB(48,40,34),NeutralButtonHover=Color3.fromRGB(64,54,46),NeutralButtonStroke=Color3.fromRGB(150,128,104)}
end)()end,[39]=function()local aa,ab,ac=a(39)local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables
)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(246,249,251)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(236,241,245))},ShadowColor=Color3.fromRGB(116,124,132),LiveAnimation=false,ElementTransparency=0,
ElementStroke=Color3.fromRGB(218,224,228),ElementGradient=ColorSequence.new(Color3.fromRGB(255,255,255)),
ElementStrokeGradient=ColorSequence.new(Color3.fromRGB(224,230,234),Color3.fromRGB(232,238,242)),
ElementStrokeTransparency=0.1,ElementStrokeHoverTransparency=0,ElementStrokeHover=Color3.fromRGB(0,176,208),
DarkToggleOverlay=false,TabColor=Color3.fromRGB(38,42,46),TabBackground=ColorSequence.new(Color3.fromRGB(0,176,208),
Color3.fromRGB(0,150,184)),TabStroke=ColorSequence.new(Color3.fromRGB(80,206,230),Color3.fromRGB(0,160,196)),
SliderBackground=Color3.fromRGB(224,230,234),SliderBackgroundHover=Color3.fromRGB(212,220,224),SliderProgress=
ColorSequence.new(Color3.fromRGB(0,182,214),Color3.fromRGB(0,146,182)),SliderStroke=Color3.fromRGB(200,206,210),
AccentColor=Color3.fromRGB(0,176,208),AccentStroke=Color3.fromRGB(96,210,232),AccentGlow=0.85,StatBackground=Color3.
fromRGB(255,255,255),SliderHandle=Color3.fromRGB(60,66,72),ToggleTrack=Color3.fromRGB(198,204,210),
ToggleTrackTransparency=0,ToggleKnobOffTransparency=0.05,FieldBackground=Color3.fromRGB(224,230,234),FieldTransparency=0
,FieldGlow=Color3.fromRGB(148,154,160),PlaceholderColor=Color3.fromRGB(138,144,150),SurfaceStroke=Color3.fromRGB(204,210
,214),NeutralButton=Color3.fromRGB(224,230,234),NeutralButtonHover=Color3.fromRGB(212,220,224),NeutralButtonStroke=
Color3.fromRGB(242,246,248),ActionColor=Color3.fromRGB(68,74,80),TitlingColor=Color3.fromRGB(26,30,34),TitleFont=ae.
brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(42,46,52),
ElementTextHoverColor=Color3.fromRGB(18,22,26),DropdownHighlight=Color3.fromRGB(0,176,208),ErrorColor=Color3.fromRGB(200
,60,55),ErrorStrokeColor=Color3.fromRGB(240,80,70)}end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function
(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,18,22)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,26,31)),ColorSequenceKeypoint.new(1,Color3.fromRGB(44,32,38))},ShadowColor=Color3.fromRGB(
18,10,14),ElementStroke=Color3.fromRGB(58,44,50),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(34,25,29)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(40,30,34)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(40,30,34))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(76,58,66)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(92,70,80)),ColorSequenceKeypoint.new(1,Color3.fromRGB(76,58,66))},
ElementStrokeHover=Color3.fromRGB(88,66,74),TabBackground=ColorSequence.new(Color3.fromRGB(62,46,53),Color3.fromRGB(38,
29,33)),TabStroke=ColorSequence.new(Color3.fromRGB(102,78,88),Color3.fromRGB(62,46,53)),SliderBackground=Color3.fromRGB(
50,38,44),SliderBackgroundHover=Color3.fromRGB(64,50,56),SliderProgress=ColorSequence.new(Color3.fromRGB(244,88,140),
Color3.fromRGB(220,60,116)),AccentColor=Color3.fromRGB(240,82,138),AccentStroke=Color3.fromRGB(255,134,178),
ToggleKnobOff=Color3.fromRGB(236,220,226),StatBackground=Color3.fromRGB(28,20,24),DropdownHighlight=Color3.fromRGB(240,
82,138),NeutralButton=Color3.fromRGB(50,38,44),NeutralButtonHover=Color3.fromRGB(64,50,56),NeutralButtonStroke=Color3.
fromRGB(170,122,140)}end)()end,[41]=function()local aa,ab,ac=a(41)local ad return(function(...)export type Theme=string|
{[string]:any}export type Translator=(source:string,localeId:string)->string?export type Translations={[string]:{[string
]:string}}export type WindowConfiguration={autoSave:boolean?,autoLoad:boolean?,fileName:string?,customFolder:string?}
export type WindowProps={name:string?,subtitle:string?,theme:Theme?,icon:(string|number)?,showName:string?,showIcon:(
string|number)?,showIconOnly:boolean?,sidebarLayout:boolean?,scale:number?,profile:string?,configuration:
WindowConfiguration?,fallbackFont:(Font|Enum.Font)?,locale:string?,translations:Translations?,translator:Translator?}
export type ColumnSide=string|number export type TabProps={name:string?,icon:(string|number)?}export type TagProps={text
:string?,title:string?,icon:(string|number)?,color:Color3?,order:number?}export type SectionProps={side:ColumnSide?,name
:string?,icon:(string|number)?}export type TextProps={side:ColumnSide?,name:string?,text:string?,icon:(string|number)?}
export type DividerProps={side:ColumnSide?,text:string?,spacing:number?,line:boolean?}export type GroupProps={side:
ColumnSide?,direction:string?}export type ButtonProps={side:ColumnSide?,name:string?,description:string?,icon:(string|
number)?,callback:(()->())?}export type ToggleProps={side:ColumnSide?,name:string?,description:string?,icon:(string|
number)?,flag:string?,value:boolean?,forgetState:boolean?,callback:((value:boolean)->())?}export type SliderProps={side:
ColumnSide?,name:string?,description:string?,icon:(string|number)?,flag:string?,range:{number}?,increment:number?,value:
number?,suffix:string?,minimal:boolean?,forgetState:boolean?,callback:((value:number,dragging:boolean)->())?}export type
DropdownProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,flag:string?,options:{string}?,
value:(string|{string})?,multiSelect:boolean?,placeholder:string?,forgetState:boolean?,callback:((value:any)->())?}
export type InputProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,flag:string?,value:
string?,placeholder:string?,numeric:boolean?,clearOnFocus:boolean?,forgetState:boolean?,callback:((value:string)->())?}
export type KeybindProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,flag:string?,value:(
EnumItem|string)?,forgetState:boolean?,isMenuToggle:boolean?,hold:boolean?,holdThreshold:number?,callback:((value:
EnumItem|boolean)->())?,onChanged:((key:EnumItem)->())?}export type ColorPickerProps={side:ColumnSide?,name:string?,
description:string?,icon:(string|number)?,flag:string?,color:Color3?,alpha:number?,forgetState:boolean?,callback:((value
:Color3,alpha:number)->())?}export type StatProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number
)?,prefix:string?,suffix:string?,value:number?,display:string?,compact:boolean?,changeMode:string?,changeBaseline:string
?,numberEasing:boolean?}export type ProgressProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number
)?,range:{number}?,value:number?,steps:number?,text:string?,format:((value:number,min:number,max:number)->string)?,
showValue:boolean?,indeterminate:boolean?}export type ConsoleProps={side:ColumnSide?,name:string?,description:string?,
text:string?,height:number?,follow:boolean?,maxLines:number?}export type ChatMessage={id:string,content:string,time:
number?,author:{name:string,roblox:number?,discord:boolean?}}export type ChatTransport=(method:string,path:string,body:
any?)->(boolean,any)export type ChatProps={side:ColumnSide?,name:string?,description:string?,endpoint:string?,channel:
string?,key:string?,transport:ChatTransport?,height:number?,pollInterval:number?,poll:boolean?,maxMessages:number?,
placeholder:string?,emojis:{string}?,onMessage:((message:ChatMessage)->())?}export type NameplateStyle={size:Vector2?,
lift:number?,maxDistance:number?,cornerRadius:number?,accent:Color3?,accentDeep:Color3?,cardColor:Color3?,
cardTransparency:number?,veilColor:Color3?,veilStrength:number?,titleColor:Color3?,subtitleColor:Color3?,badgeTextColor:
Color3?,logo:(string|number|boolean)?,logoTint:Color3?,logoScale:number?,backdrop:(string|number|boolean)?,backdropTint:
Color3?,backdropTransparency:number?,glowImage:(string|number|boolean)?,titleFont:Font?,subtitleFont:Font?,entrance:(
'unfold'|'fade'|'none')?,logoSway:number?,logoSpin:number?,halo:boolean?,sparkles:number?,sparkleColor:Color3?,
titleShine:boolean?,sweep:boolean?,sweepEvery:number?,border:boolean?,borderThickness:number?,borderSpeed:number?,glow:
boolean?,bob:boolean?,bobHeight:number?,bobSpeed:number?}export type NameplateProps={title:string?,subtitle:(string|((
player:Player)->string))?,badge:string?,preset:('Omnity'|'Midnight'|'Mono')?,style:NameplateStyle?,endpoint:string?,key:
string?,transport:ChatTransport?,showSelf:boolean?,hideDefaultName:boolean?,checkInInterval:number?,autoCheckIn:boolean?
,accent:Color3?,logo:(string|number|boolean)?,backdrop:(string|number|boolean)?,maxDistance:number?,lift:number?}export
type Nameplate={SetEnabled:(self:Nameplate,enabled:boolean)->(),SetTitle:(self:Nameplate,title:string)->(),SetStyle:(
self:Nameplate,style:NameplateStyle|string,preset:string?)->(),Add:(self:Nameplate,player:Player,badge:string?)->(),
Remove:(self:Nameplate,player:Player)->(),CheckIn:(self:Nameplate)->boolean,Destroy:(self:Nameplate)->()}export type
NotifyProps={title:string?,content:string?,icon:(string|number)?,duration:number?}export type ToastProps={title:string?,
subtitle:string?,subtitleAbove:boolean?,icon:(string|number)?,avatar:number?,minWidth:number?,duration:number?,position:
'Top'|'Bottom'?}export type PopupBox={title:string?,description:string?,icon:(string|number)?}export type PopupOption={
text:string?,style:string?,callback:(()->())?}export type PopupProps={title:string?,subtitle:string?,icon:(string|number
)?,content:string?,boxes:{PopupBox}?,options:{PopupOption}?,dismissable:boolean?}export type Moveable={MoveTo:(self:any,
index:number)->(),MoveToTop:(self:any)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown:(self:any)->()}
export type Lockable={Lock:(self:any,reason:string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->boolean}export type
Button=Moveable&Lockable&{}export type Toggle=Moveable&Lockable&{value:boolean,Set:(self:Toggle,value:boolean,
skipCallback:boolean?)->()}export type Slider=Moveable&Lockable&{value:number,Set:(self:Slider,value:number,skipCallback
:boolean?)->()}export type Dropdown=Moveable&Lockable&{value:{string},Set:(self:Dropdown,value:string|{string},
skipCallback:boolean?)->(),Refresh:(self:Dropdown,options:{string})->(),Add:(self:Dropdown,option:string)->(),Remove:(
self:Dropdown,option:string)->()}export type Input=Moveable&Lockable&{value:string,Set:(self:Input,value:string,
skipCallback:boolean?)->()}export type Keybind=Moveable&Lockable&{value:EnumItem,Set:(self:Keybind,value:EnumItem|string
,skipChanged:boolean?)->()}export type ColorPicker=Moveable&Lockable&{value:Color3,alpha:number,Set:(self:ColorPicker,
value:Color3|string,skipCallback:boolean?)->(),SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?)->()}export
type Stat=Moveable&{value:number,Set:(self:Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->()}export
type Progress=Moveable&{value:number,Set:(self:Progress,value:number)->(),Get:(self:Progress)->number,GetPercentage:(
self:Progress)->number,SetRange:(self:Progress,min:number,max:number)->(),SetText:(self:Progress,text:string?)->(),
SetIndeterminate:(self:Progress,state:boolean)->(),Remove:(self:Progress)->()}export type Chat=Moveable&{Send:(self:Chat
,text:string)->(boolean,string?),Refresh:(self:Chat)->boolean,SetChannel:(self:Chat,channel:string,endpoint:string?)->()
,Clear:(self:Chat)->(),Remove:(self:Chat)->()}export type Console=Moveable&{Set:(self:Console,text:string)->(),Append:(
self:Console,line:string)->(),Clear:(self:Console)->(),Get:(self:Console)->string,Copy:(self:Console)->boolean,SetHeight
:(self:Console,height:number)->(),Remove:(self:Console)->()}export type Section=Moveable&{}export type TabSection={
Remove:(self:TabSection)->()}export type Text=Moveable&{name:string,text:string,Set:(self:Text,text:string)->(),SetTitle
:(self:Text,title:string)->()}export type Divider=Moveable&{text:string,Set:(self:Divider,text:string?)->()}export type
Tag={Set:(self:Tag,props:TagProps)->(),SetColor:(self:Tag,color:Color3)->(),SetText:(self:Tag,text:string?)->(),SetIcon:
(self:Tag,icon:(string|number)?)->(),Remove:(self:Tag)->()}export type Popup={Close:(self:Popup)->()}export type Group=
Moveable&{CreateButton:(self:Group,props:ButtonProps)->Button,CreateToggle:(self:Group,props:ToggleProps)->Toggle,
CreateSwitch:(self:Group,props:ToggleProps)->Toggle,CreateStat:(self:Group,props:StatProps)->Stat,CreateSlider:(self:
Group,props:SliderProps)->Slider,CreateDropdown:(self:Group,props:DropdownProps)->Dropdown?,CreateSection:(self:Group,
props:SectionProps)->Section?,CreateText:(self:Group,props:TextProps)->Text?,CreateDivider:(self:Group,props:
DividerProps?)->Divider?,CreateGroup:(self:Group,props:GroupProps?)->Group}export type Column={CreateButton:(self:Column
,props:ButtonProps)->Button,CreateToggle:(self:Column,props:ToggleProps)->Toggle,CreateSwitch:(self:Column,props:
ToggleProps)->Toggle,CreateSlider:(self:Column,props:SliderProps)->Slider,CreateDropdown:(self:Column,props:
DropdownProps)->Dropdown,CreateInput:(self:Column,props:InputProps)->Input,CreateKeybind:(self:Column,props:KeybindProps
)->Keybind,CreateColorPicker:(self:Column,props:ColorPickerProps)->ColorPicker,CreateStat:(self:Column,props:StatProps
)->Stat,CreateProgress:(self:Column,props:ProgressProps)->Progress,CreateConsole:(self:Column,props:ConsoleProps)->
Console,CreateChat:(self:Column,props:ChatProps)->Chat,CreateSection:(self:Column,props:SectionProps)->Section,
CreateText:(self:Column,props:TextProps)->Text,CreateDivider:(self:Column,props:DividerProps?)->Divider,CreateGroup:(
self:Column,props:GroupProps?)->Group}export type Tab={Left:Column,Right:Column,left:Column,right:Column,GetColumn:(self
:Tab,side:ColumnSide?)->Column,Select:(self:Tab,noAnimation:boolean?)->(),Deselect:(self:Tab,noAnimation:boolean?)->(),
Remove:(self:Tab)->(),CreateButton:(self:Tab,props:ButtonProps)->Button,CreateToggle:(self:Tab,props:ToggleProps)->
Toggle,CreateSwitch:(self:Tab,props:ToggleProps)->Toggle,CreateSlider:(self:Tab,props:SliderProps)->Slider,
CreateDropdown:(self:Tab,props:DropdownProps)->Dropdown,CreateInput:(self:Tab,props:InputProps)->Input,CreateKeybind:(
self:Tab,props:KeybindProps)->Keybind,CreateColorPicker:(self:Tab,props:ColorPickerProps)->ColorPicker,CreateStat:(self:
Tab,props:StatProps)->Stat,CreateProgress:(self:Tab,props:ProgressProps)->Progress,CreateConsole:(self:Tab,props:
ConsoleProps)->Console,CreateChat:(self:Tab,props:ChatProps)->Chat,CreateSection:(self:Tab,props:SectionProps)->Section,
CreateText:(self:Tab,props:TextProps)->Text,CreateDivider:(self:Tab,props:DividerProps?)->Divider,CreateGroup:(self:Tab,
props:GroupProps?)->Group}export type Window={unloaded:boolean,Flags:{[string]:any},CreateTab:(self:Window,props:
TabProps)->Tab,CreateSection:(self:Window,props:SectionProps)->TabSection,CreateTag:(self:Window,props:TagProps)->Tag,
Notify:(self:Window,props:NotifyProps)->(),Toast:(self:Window,props:ToastProps)->(),CreateNameplate:(self:Window,props:
NameplateProps?)->Nameplate,Popup:(self:Window,props:PopupProps)->Popup?,Show:(self:Window)->(),Hide:(self:Window)->(),
ToggleHide:(self:Window)->(),ToggleMinimise:(self:Window)->(),Navigate:(self:Window,tab:string|Tab)->(),ChangeTheme:(
self:Window,theme:Theme)->(),SetLocale:(self:Window,localeId:string)->(),SetTranslator:(self:Window,translator:
Translator?)->(),RegisterTranslations:(self:Window,translations:Translations)->(),Save:(self:Window,name:string?)->
boolean,Load:(self:Window,name:string?)->boolean,ListConfigs:(self:Window)->{string},DeleteConfig:(self:Window,name:
string)->boolean,GetPath:(self:Window)->(string,string),Get:(self:Window,flag:string)->any,Set:(self:Window,flag:string,
value:any)->boolean,Unload:(self:Window)->()}export type Rayfield={CreateWindow:(self:Rayfield,props:WindowProps)->
Window}return{}end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(function(...)local ae,af=ac(ab.Parent.
variables),{}af.enabled=false type HapticTypes={click:Enum.HapticEffectType?,notify:Enum.HapticEffectType?}local ag:
HapticTypes,ah,ai={},pcall(function()Instance.new'HapticEffect':Destroy()return{click=Enum.HapticEffectType.UIHover,
notify=Enum.HapticEffectType.UIClick}end)if ah then ag=ai end local aj:{[Enum.HapticEffectType]:Instance},ak:Instance?={
}function af.setContainer(al:Instance?)ak=al end function af.releaseContainer(al:Instance?)if al==nil or ak==al then ak=
nil end end local function al():Instance if ak and ak.Parent then return ak end return ae.guiContainer end
local function am(an:Enum.HapticEffectType):Instance?local ao=aj[an]if ao and ao.Parent then return ao end local ap,aq=
pcall(Instance.new,'HapticEffect')if not ap then return nil end local b=aq::any b.Type=an local c=pcall(function()aq.
Parent=al()end)if not c then aq:Destroy()return nil end aj[an]=aq return aq end local function an(ao:Enum.
HapticEffectType?)if not ao or not af.enabled then return end local ap=am(ao)if ap then local aq=ap::any pcall(aq.Play,
ap)end end function af.click()an(ag.click)end function af.notify()an(ag.notify)end function af.setEnabled(ao:boolean?)af
.enabled=ao and true or false if not af.enabled then af.teardown()end end function af.teardown()for ao,ap in aj do
pcall(ap.Destroy,ap)aj[ao]=nil end end return af end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(
...)local ae,af=ac(ab.Parent.network),ac(ab.Parent.log)export type AssetId=number|string export type AssetDownloadUrl=
string export type CacheKey=AssetId export type ResolvedAsset=AssetId export type AssetRequestPayload={Url:string,Method
:string}local ag={Enum={AssetDownloadUrl={RobloxDownloadUrl='https://assetdelivery.roblox.com/v1/asset/?id=%d'::
AssetDownloadUrl,RoProxyDownloadUrl='https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag
ag.__type='assetResolver'type AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,
contentDownloadUrl:AssetDownloadUrl,pendingRequests:{[CacheKey]:{thread}}}export type AssetResolver=AssetResolverState&{
resolve:(self:AssetResolver,value:unknown)->ResolvedAsset?,getAssetContentFromUrl:(self:AssetResolver,url:string,
cacheKey:CacheKey?,forced:boolean?)->string?,getAssetContentFromId:(self:AssetResolver,id:AssetId,forced:boolean?)->
string?}local ah=8 function ag.new(ai:boolean?,aj:AssetDownloadUrl?):AssetResolver local ak:{[CacheKey]:string}?=if ai
then{}else nil local al=setmetatable({contentCache=ak,contentCacheOrder=if ai then{}::{CacheKey}else nil,
contentDownloadUrl=aj or ag.Enum.AssetDownloadUrl.RobloxDownloadUrl,pendingRequests={}}::AssetResolverState,ag)::any
return al end function ag.resolve(ai:AssetResolver,aj:unknown):ResolvedAsset?if type(aj)=='number'then return aj end if
type(aj)~='string'then return nil end if string.sub(aj,1,11)=='rbxasset://'or string.sub(aj,1,11)=='rbxthumb://'then
return aj end local ak=tonumber(string.match(aj,'^rbxassetid://(%d+)$'))if ak then return ak end return nil end
local function ai(aj:unknown):boolean if type(aj)~='table'then return false end local ak=aj::{Body:unknown,StatusCode:
unknown,Success:unknown}local al=ak.Body if type(al)~='string'or#al==0 then return false end if type(ak.StatusCode)==
'number'then local am=ak.StatusCode::number return am>=200 and am<300 end if type(ak.Success)=='boolean'then return ak.
Success::boolean end return false end function ag.getAssetContentFromUrl(aj:AssetResolver,ak:string,al:CacheKey?,am:
boolean?):string?local an=aj.contentCache if al~=nil and an and not am then local ao=an[al]if ao then return ao end end
local ao=aj.pendingRequests if al~=nil then local ap=ao[al]if ap then table.insert(ap,coroutine.running())return
coroutine.yield()end ao[al]={}end local ap,aq:string?=(ae.getRequestFn())if not ap then af.warn
'No request function available to download asset content.'else local b,c=pcall(ap,{Url=ak,Method='GET'}::
AssetRequestPayload)if b and ai(c)then local d=(c::{Body:string}).Body aq=d if al~=nil and an then local e=aj.
contentCacheOrder if e and an[al]==nil then table.insert(e,al)local f=if#e>ah then table.remove(e,1)else nil if f~=nil
then an[f]=nil end end an[al]=d end elseif not am then af.warn('Failed to download asset content for url: '..tostring(ak
))end end if al~=nil then local b=ao[al]ao[al]=nil if b then for c,d in b do coroutine.resume(d,aq)end end end return aq
end function ag.getAssetContentFromId(aj:AssetResolver,ak:AssetId,al:boolean?):string?local am=aj:resolve(ak)if not am
or type(am)~='number'then af.warn('Invalid asset id: '..tostring(am))return nil end local an=string.format(aj.
contentDownloadUrl,am)return aj:getAssetContentFromUrl(an,am,al)end return ag end)()end,[45]=function()local aa,ab,ac=a(
45)local ad return(function(...)local ae={}function ae.contrastColor(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+
0.114*af.B return if ag>0.5 then Color3.fromRGB(0,0,0)else Color3.fromRGB(255,255,255)end function ae.toColorSequence(af
:Color3|ColorSequence):ColorSequence return if typeof(af)=='ColorSequence'then af else ColorSequence.new(af)end function
ae.contrastText(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.6 then Color3.fromRGB(20,20,
20)else Color3.fromRGB(255,255,255)end return ae end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(
...)local ae,af=ac(ab.Parent.layouts),{}export type Side='Left'|'Right'af.overlap=10 af.stackBelow=560 local ag=20
function af.pageWidth(ah:number,ai:ae.Layout):number return math.max(ah-ae.railWidthFor(ai,ah)-ag,0)end function af.
shouldStack(ah:number):boolean return ah>0 and ah<af.stackBelow end function af.resolveSide(ah:unknown):Side?if ah==nil
then return'Left'end if ah==1 then return'Left'elseif ah==2 then return'Right'end if type(ah)~='string'then return nil
end local ai=string.lower(ah)if ai=='left'or ai=='l'then return'Left'elseif ai=='right'or ai=='r'then return'Right'end
return nil end return af end)()end,[47]=function()local aa,ab,ac=a(47)local ad return(function(...)local ae={}ae.
fontAsset='rbxassetid://12187365364'ae.pillResizeInfo=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out)ae.icons={close=83277910885129,minimise=108115485663409,maximise=88738500661569,settings=
129180860773723,search=100604009889706,chevron=88479147175134,check=125626312718314,dot=91452555903853,colorpicker=
91452555903853,config=125823673784681,rayfield=80387863064905}ae.actionIconScale={[ae.icons.close]=1,[ae.icons.settings]
=0.95,[ae.icons.search]=1.05,[ae.icons.minimise]=1.2,[ae.icons.maximise]=1.15}ae.builtInThemes={'Default','Amethyst',
'Cobalt','Ember','Frost','Rose'}ae.pageScrollbar={thickness=3,transparency=0.6}ae.accent={on=Color3.fromRGB(23,153,110),
onStroke=Color3.fromRGB(32,201,144)}ae.statAccents={positive={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.
fromRGB(0,134,98)),stroke=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))},negative={fill=
ColorSequence.new(Color3.fromRGB(172,47,47),Color3.fromRGB(135,37,37)),stroke=ColorSequence.new(Color3.fromRGB(255,75,75
),Color3.fromRGB(244,67,67))},neutral={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke
=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))}}ae.zIndex={elementLock=60,elementLockContent=65
,bottomFade=100,notification=1500,drag=1000,toast=2000,toastContent=2001,restoreContent=100001,restoreInteract=100002}ae
.displayOrder={window=99999,popup=100001}return ae end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(function
(...)local ae={}function ae.itemFromValue(af,ag)local ah,ai=pcall(function()return af:FromValue(ag)end)if ah and ai then
return ai end local aj,ak=pcall(function()return af:GetEnumItems()end)if not aj then return nil end for al,am in ak do
if am.Value==ag then return am end end return nil end return ae end)()end,[49]=function()local aa,ab,ac=a(49)local ad
return(function(...)local ae,af=ac(ab.Parent.services),{}local ag=ae.getService'RunService':IsStudio()local ah=not ag
and typeof(writefile)=='function'and typeof(readfile)=='function'and typeof(isfile)=='function'and typeof(isfolder)==
'function'and typeof(makefolder)=='function'and typeof(listfiles)=='function'and typeof(delfile)=='function'and typeof(
delfolder)=='function'if ah then function af.writefile(ai:string,aj:string)writefile(ai,aj)end function af.readfile(ai:
string):string return readfile(ai)end if typeof(appendfile)=='function'then function af.appendfile(ai:string,aj:string)
appendfile(ai,aj)end end function af.isfile(ai:string):boolean return isfile(ai)end function af.delfile(ai:string)
delfile(ai)end function af.listfiles(ai:string):{string}return listfiles(ai)end function af.makefolder(ai:string)
makefolder(ai)end function af.isfolder(ai:string):boolean return isfolder(ai)end function af.delfolder(ai:string)
delfolder(ai)end elseif ag then local ai=Instance.new'Folder'ai.Name='Filesystem'ai.Parent=ae.getService
'ReplicatedStorage'local function aj(ak:string):{string}local al={}for am in string.gmatch(ak,'[^/]+')do table.insert(al
,am)end return al end local function ak(al:{string},am:boolean):Instance?local an:Instance=ai for ao=1,#al-1 do local ap
=an:FindFirstChild(al[ao])if not ap then if not am then return nil end local aq=Instance.new'Folder'aq.Name=al[ao]aq.
Parent=an ap=aq end an=ap::Instance end return an end local function al(am:Instance?):StringValue?if am and am:IsA
'StringValue'then return am end return nil end function af.writefile(am:string,an:string)local ao=aj(am)assert(#ao>0,
'Invalid path')local ap=ak(ao,true)assert(ap,'Invalid path')local aq=ao[#ao]local b=ap:FindFirstChild(aq)local c=al(b)if
c then c.Value=an else if b then b:Destroy()end local d=Instance.new'StringValue'd.Name=aq d.Value=an d.Parent=ap end
end function af.readfile(am:string):string local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false)assert(ao,
'File not found: '..am)local ap=ao:FindFirstChild(an[#an])local aq=al(ap)assert(aq,'File not found: '..am)return aq.
Value end function af.isfile(am:string):boolean local an=aj(am)if#an==0 then return false end local ao=ak(an,false)if
not ao then return false end return al(ao:FindFirstChild(an[#an]))~=nil end function af.listfiles(am:string):{string}
local an,ao:Instance=aj(am),ai for ap,aq in an do local b=ao:FindFirstChild(aq)if not b or not b:IsA'Folder'then error(
'Folder not found: '..am)end ao=b end local ap:{string}={}for aq,b in ao:GetChildren()do table.insert(ap,am..'/'..b.Name
)end return ap end function af.delfile(am:string)local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false)assert(
ao,'File not found: '..am)local ap=ao:FindFirstChild(an[#an])local aq=al(ap)assert(aq,'File not found: '..am)aq:Destroy(
)end function af.makefolder(am:string)local an=aj(am)if#an==0 then return end local ao:Instance=ai for ap,aq in an do
local b=ao:FindFirstChild(aq)if not b then local c=Instance.new'Folder'c.Name=aq c.Parent=ao b=c end ao=b::Instance end
end function af.isfolder(am:string):boolean local an=aj(am)if#an==0 then return false end local ao:Instance=ai for ap,aq
in an do local b=ao:FindFirstChild(aq)if not b or not b:IsA'Folder'then return false end ao=b end return true end
function af.delfolder(am:string)local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false)assert(ao,
'Folder not found: '..am)local ap=ao:FindFirstChild(an[#an])assert(ap and ap:IsA'Folder','Folder not found: '..am)ap:
Destroy()end end if af.writefile and not af.appendfile then function af.appendfile(ai:string,aj:string)local ak=if af.
isfile(ai)then af.readfile(ai)else nil af.writefile(ai,if ak then ak..aj else aj)end end function af.ensureFolder(ai:
string)if not af.isfolder(ai)then af.makefolder(ai)end end function af.ensureDir(ai:string)local aj=''for ak in string.
gmatch(ai,'[^/]+')do aj=if aj==''then ak else aj..'/'..ak if not af.isfolder(aj)then af.makefolder(aj)end end end return
af end)()end,[50]=function()local aa,ab,ac=a(50)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),
ac(ab.Parent.path),'RayfieldColumns',{}ah.__index=ah export type FileSystemManager={root:string,assets:string,getPath:(
self:FileSystemManager,subpath:string?)->string,getAssetsFolder:(self:FileSystemManager,subfolder:string?)->string,
getRootFolder:(self:FileSystemManager)->string}function ah.new(ai:string?):FileSystemManager local aj=ai or ag local ak=
setmetatable({root=aj,assets=aj..'/Assets'},ah)::any pcall(ae.ensureFolder,ak.root)pcall(ae.ensureFolder,ak.assets)
return ak end function ah.getPath(ai,aj:string?):string return af.join(ai.root,aj)end function ah.getAssetsFolder(ai,aj:
string?):string if aj then local ak=af.join(ai.assets,aj)pcall(ae.ensureFolder,ak)return ak end return ai.assets end
function ah.getRootFolder(ai):string return ai.root end return ah end)()end,[51]=function()local aa,ab,ac=a(51)local ad
return(function(...)local ae,af,ag={},2166136261,16777619 local function ah(ai:string):number local aj=af for ak=1,#ai
do aj=bit32.bxor(aj,string.byte(ai,ak))local al=aj%65536 local am=(aj-al)/65536 aj=(((am*ag)%65536)*65536+al*ag)%
4294967296 end return aj end function ae.deriveFlagFromName(ai:string):string local aj=ai:gsub('(%S+)',function(aj:
string):string return aj:sub(1,1):upper()..aj:sub(2,-1)end):gsub('[^%w]','')if aj==''and ai~=''then return string.
format('Flag%08x',ah(ai))end return aj end return ae end)()end,[52]=function()local aa,ab,ac=a(52)local ad return(
function(...)local ae=ac(ab.Parent.services)local af,ag,ah,ai,aj,ak=ae.getService'HttpService',ae.getService'RunService'
,ac(ab.Parent.filesystem),ac(ab.Parent.assetResolver),ac(ab.Parent.log),ac(ab.Parent.path)local function al(am:unknown):
string?local an,ao=pcall(function()return af:JSONEncode(am)end)if an and type(ao)=='string'then return ao else aj.warn(
'Failed to encode JSON:',ao)return nil end end local function am(an:string):unknown?local ao,ap=pcall(function()return
af:JSONDecode(an)end)if ao then return ap else aj.warn('Failed to decode JSON:',ap)return nil end end local an={}an.
__type='fontManager'export type FontFace={name:string,family:string,weight:number,style:string,assetId:string}export
type FontManifest={name:string,faces:{FontFace}}export type CachedFont={customId:number|string,manifest:FontManifest,
loadedFromDisk:boolean,variants:{[string]:Font}}export type FontCache={[number]:CachedFont}export type
FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,skipCache:boolean?}type FontManagerState={_debug:boolean,
_pendingLoads:{[string]:{thread}},rootFolder:string,assetResolver:ai.AssetResolver,defaultOptions:FontResolverOptions,
fontCache:FontCache?}export type FontManager=FontManagerState&{resolve:(self:FontManager,id:number|string)->Font?,
loadFont:(self:FontManager,id:(number|string)?,fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,saveToDisk:boolean?
,skipCache:boolean?)->Font?,getFontFromId:(self:FontManager,id:number|string)->Font?}export type fontManager=FontManager
local function ao(ap:unknown):FontManifest?local aq=ap::any if type(aq)~='table'or type(aq.name)~='string'or type(aq.
faces)~='table'then return nil end aq.name=ak.sanitizeFile(aq.name)if#aq.name==0 or#aq.faces==0 then return nil end for
b,c in aq.faces do if type(c)~='table'or type(c.name)~='string'or type(c.assetId)~='string'then return nil end c.name=ak
.sanitizeFile(c.name)if#c.name==0 then return nil end end return aq::FontManifest end local ap={'\0\1\0\0','OTTO','true'
,'ttcf','wOFF','wOF2'}local function aq(b:string):boolean for c,d in ap do if string.sub(b,1,#d)==d then return true end
end return false end local b=getfenv()local function c(d:Enum.FontWeight,e:Enum.FontStyle):string return tostring(d)..
'|'..tostring(e)end local function d(e:unknown):number?if type(e)=='number'then return e end if type(e)=='string'then
return tonumber(e)end return nil end function an.__index(e:FontManagerState,f:unknown):unknown local g=(an::any)[f]if g
~=nil then return g end local h=d(f)if not h then return nil end local i=e.fontCache if i then local j=i[h]if j then
local k=c(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local l=j.variants and j.variants[k]if l then return l end for m
,n in pairs(j.variants or{})do return n end end end return nil end function an.new(e:string,f:boolean?,g:boolean?,h:ai.
AssetDownloadUrl?,i:FontResolverOptions?):FontManager local j=i or{saveToDisk=true,skipCache=not g or false,fallbackFont
=Font.fromEnum(Enum.Font.SourceSans)}local k=setmetatable({rootFolder=e,fontCache=if g then{}::FontCache else nil,
assetResolver=ai.new(g,h),defaultOptions=j,_debug=f or ag:IsStudio()or false,_pendingLoads={}}::FontManagerState,an)::
any pcall(ah.ensureFolder,e)return k end local function e(f:FontManager,g:number,h:Enum.FontWeight,i:Enum.FontStyle,j:
string):Font?local k=f.rootFolder..'/'..g..'.json'if typeof(ah.isfile)~='function'then return f.defaultOptions.
fallbackFont end local l,m:string?=false if ag:IsStudio()and f._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]m=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(k)then local n,o=pcall(ah.readfile,k)m=n and o or nil else m=f.assetResolver:getAssetContentFromId(g,
false)l=m~=nil end local n:FontManifest?if m then local o,p=pcall(am,m)if o and p then n=ao(p)else if f._debug then aj.
warn('Failed to parse font manifest for font id: '..tostring(g)..'. Error: '..tostring(p))end end else return f.
defaultOptions.fallbackFont end if not n then if f._debug then aj.warn('Font manifest is nil for font id: '..tostring(g)
)end pcall(ah.delfile,k)return f.defaultOptions.fallbackFont end if l and m then pcall(ah.writefile,k,m)end local o,p=f.
rootFolder..'/'..n.name,true if not pcall(ah.ensureFolder,o)then return f.defaultOptions.fallbackFont end for q,r in
ipairs(n.faces)do local s=o..'/'..r.name:gsub(' ','-')..'.ttf'if ah.isfile(s)then local t,u=pcall(ah.readfile,s)if not t
or type(u)~='string'or not aq(u)then pcall(ah.delfile,s)end end if not ah.isfile(s)then local t=f.assetResolver:resolve(
r.assetId)local u=if t~=nil then f.assetResolver:getAssetContentFromId(t,false)else nil if not u or not aq(u)then p=
false if f._debug then aj.warn('Font face content is missing or not a font for font id: '..tostring(g)..', face: '..r.
name)end continue end pcall(ah.writefile,s,u)end local t,u=pcall(b.getcustomasset,s)if t and type(u)=='string'then n.
faces[q].assetId=u if f._debug then aj.print('Loaded font face for id: '..tostring(g)..', face: '..r.name)end else p=
false if f._debug then aj.warn('Failed to load font face for id: '..tostring(g)..', face: '..r.name)end end end if not p
then return f.defaultOptions.fallbackFont end local q=al(n)if not q or not pcall(ah.writefile,o..'/manifest.json',q)then
return f.defaultOptions.fallbackFont end local r,s=pcall(b.getcustomasset,o..'/manifest.json')if not r or not s then if
f._debug then aj.warn('Failed to load font manifest for id: '..tostring(g))end return f.defaultOptions.fallbackFont end
local t,u=pcall(Font.new,s::any,h,i)if not t or not u then if f._debug then aj.warn('Failed to load font for id: '..
tostring(g))end return f.defaultOptions.fallbackFont end local v=f.fontCache if v then v[g]={customId=s,manifest=n,
loadedFromDisk=true,variants={[j]=u}}if f._debug then aj.print('Cached font for id: '..tostring(g))end end return u end
function an.loadFont(f:FontManager,g:(number|string)?,h:Enum.FontWeight?,i:Enum.FontStyle?,j:boolean?,k:boolean?):Font?
if j==nil then j=f.defaultOptions.saveToDisk end if k==nil then k=f.defaultOptions.skipCache end local l,m=h or Enum.
FontWeight.Regular,i or Enum.FontStyle.Normal local n,o=c(l,m),f.assetResolver:resolve(g)local p=d(o)if not p then aj.
warn('Invalid font id: '..tostring(g))return f.defaultOptions.fallbackFont end local q=f.fontCache if q and not k then
local r=q[p]if r then local s=r.variants and r.variants[n]if s then if f._debug then aj.print(
'Loaded font from cache for id: '..tostring(p))end return s end local t,u=pcall(Font.new,r.customId::any,l,m)if t and u
then r.variants=r.variants or{}r.variants[n]=u if f._debug then aj.print('Loaded font variant from cache for id: '..
tostring(p))end return u else if f._debug then aj.warn('Failed to load font from cache for id: '..tostring(p))end q[p]=
nil return f.defaultOptions.fallbackFont end end end if not j then if f._debug then aj.warn
[[Font loading without saving to disk can be detected by Anti-cheats.]]end return f.defaultOptions.fallbackFont end
local r,s=f._pendingLoads,tostring(p)..'|'..n local t=r[s]if t then table.insert(t,coroutine.running())return coroutine.
yield()end r[s]={}local u,v=pcall(e,f,p,l,m,n)local w=if u then v else f.defaultOptions.fallbackFont t=r[s]r[s]=nil if t
then for x,y in t do coroutine.resume(y,w)end end return w end function an.resolve(f:FontManager,g:number|string):Font?
local h=d(g)if not h then return nil end local i=f.fontCache if i then local j=i[h]if j then if f._debug then aj.print(
'Resolved font for id: '..tostring(h))end for k,l in pairs(j.variants or{})do return l end end end return nil end
function an.getFontFromId(f:FontManager,g:number|string):Font?return f:resolve(g)end return an end)()end,[53]=function()
local aa,ab,ac=a(53)local ad return(function(...)local ae,af,ag,ah={},ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(
ab.Parent.flagNames)ae.textWidth=af.textWidth ae.textHeight=af.textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae
.contrastColor=ag.contrastColor ae.toColorSequence=ag.toColorSequence ae.contrastText=ag.contrastText return ae end)()
end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.
variables)type AvatarCallback=ae.AvatarCallback type PreloadCallback=ae.PreloadCallback local ag={}ag.rewrites=ae.
rewrites ag.onBlock=nil::((unknown)->())?type PendingProperties={[string]:boolean}ag.pending={}::{[number]:{[Instance]:
PendingProperties}}local ah,ai:{[string]:boolean}=false,{Image=true,HoverImage=true,PressedImage=true}local function aj(
ak:unknown):number?if type(ak)=='number'then return ak elseif type(ak)=='string'then return tonumber(string.match(ak,
'^rbxassetid://(%d+)$'))end return nil end local function ak(al:unknown):string if ag.onBlock then ag.onBlock(al)end
return''end function ag.preload(al:PreloadCallback?):(boolean,number)ah=false return ae.preload(function(am)ah=true
table.clear(ag.pending)if al then al(am)end end)end function ag.avatar(al:number,am:AvatarCallback?):string if not af.
secureMode then return`rbxthumb://type=AvatarHeadShot&id={al}&w=48&h=48`end return ae.avatar(al,am)end function ag.
assign(al:Instance,am:string,an:unknown)local ao=al::any if not ai[am]then ao[am]=an return end ao[am]=ag.resolve(an)if
af.secureMode and not ah then local ap=aj(an)if ap and not ag.rewrites[ap]then local aq=ag.pending[ap]if not aq then aq=
setmetatable({},{__mode='k'})::any ag.pending[ap]=aq end local b=aq[al]if not b then b={}aq[al]=b end b[am]=true end end
end ae.onCached=function(al:number)local am=ag.pending[al]if not am then return end local an=ag.rewrites[al]if an then
for ao,ap in am do if ao.Parent then local aq=ao::any for b in ap do aq[b]=an end end end end ag.pending[al]=nil end
function ag.resolve(al:unknown):string if al==nil or al==0 or al==''then return''end if type(al)=='string'then if string
.sub(al,1,11)=='rbxasset://'then return al end if string.sub(al,1,11)=='rbxthumb://'then return if af.secureMode then
ak(al)else al end end local am:number?if type(al)=='number'then am=al elseif type(al)=='string'then am=tonumber(string.
match(al,'^rbxassetid://(%d+)$'))end local an=if am then ag.rewrites[am]else nil if an then return an end if af.
secureMode then return ak(al)end if type(al)=='number'then return'rbxassetid://'..al end if type(al)=='string'then
return al end return ak(al)end return ag end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local
ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.constants)export type
RewriteMap={[number]:string}export type CacheSettledCallback=(failed:number)->()export type PreloadCallback=
CacheSettledCallback export type AvatarCallback=(uri:string)->()export type OnCachedCallback=(id:number)->()export type
ThumbnailEntry={state:string?,imageUrl:string?}export type ThumbnailResponse={data:{ThumbnailEntry}?}local ai,aj,ak,al,
am,an,ao,ap:{[number]:string}={},ag.fileSystemManager:getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.
assetResolver,[[https://raw.githubusercontent.com/aesthetic143147-arch/Rayfield-preview-Gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for aq,b
in ah.icons do local c=b::number ap[c]=am..tostring(c)..'.png'end local aq=0 for b in ap do aq+=1 end ai.rewrites={}::
RewriteMap ai.onCached=nil::OnCachedCallback?local b='\137PNG\r\n\26\n'local function c(d:string,e:string):string?if
type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(d)then
pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local f=al:getAssetContentFromUrl(e,d,false)if not f or string.sub(f,1
,8)~=b then return nil end if not pcall(ae.writefile,d,f)then return nil end end local f,g=pcall(getfenv().
getcustomasset,d)return if f and type(g)=='string'then g else nil end local function d(e:number):string return af.join(
ak,'avatar_'..tostring(e)..'.png')end local function e(f:string):string?local g,h=pcall(function()return ag.httpService:
JSONDecode(f)end)if not g or type(h)~='table'then return nil end local i=(h::ThumbnailResponse).data if type(i)~='table'
then return nil end local j=i[1]if type(j)~='table'then return nil end local k=j::ThumbnailEntry if k.state=='Completed'
and type(k.imageUrl)=='string'then return k.imageUrl end return nil end local function f(g:number):string?local h:string
?for i=1,4 do local j=al:getAssetContentFromUrl(string.format(ao,g,an,an),'avatar:'..tostring(g),i>1)if j then local k=
e(j)if k then h=k break end end if i<4 then task.wait(0.3)end end if not h then return nil end return c(d(g),h)end local
g:{[number]:{AvatarCallback}},h:{[number]:boolean}={},{}function ai.preload(i:PreloadCallback?):(boolean,number)local j=
getfenv()if type(j.getcustomasset)~='function'or typeof(ae.isfile)~='function'then if i then task.defer(i,aq)end return
false,aq end local k=ai.rewrites table.clear(k)local function l()if not i then return end local m=0 for n in ap do if
not k[n]then m+=1 end end i(m)end local m,n,o=0,0,true for p,q in ap do local r,s:string?=(af.join(ak,tostring(p)..
'.png'))if ae.isfile(r)then local t,u=pcall(j.getcustomasset,r)s=if t and type(u)=='string'then u else nil end if s then
k[p]=s else n+=1 m+=1 task.spawn(function()local t=c(r,q)if t then k[p]=t if ai.onCached then pcall(ai.onCached,p)end
end m-=1 if m==0 and not o then l()end end)end end o=false if m==0 then l()end return n==0,n end function ai.avatar(i:
unknown,j:AvatarCallback?):string if type(i)~='number'then return''end if typeof(ae.isfile)~='function'then return''end
local k=d(i)if ae.isfile(k)then local l,m=pcall(getfenv().getcustomasset,k)if l and type(m)=='string'then return m end
end if h[i]then return''end local l=g[i]if l then if j then table.insert(l,j)end return''end if j then g[i]={j}task.
spawn(function()local m,n=f(i),g[i]g[i]=nil if not m then h[i]=true return end if n then for o,p in n do pcall(p,m)end
end end)end return''end function ai.remote(i:string):string?if not string.match(i,'^[%w%-_]+%.png$')then return nil end
local j,k=pcall(c,af.join(ak,i),am..i)return if j then k else nil end return ai end)()end,[56]=function()local aa,ab,ac=
a(56)local ad return(function(...)local ae,af={},64 local ag,ah,ai=af+7,38,3 export type Mode='top'|'sidebar'export type
Layout={mode:Mode,topbarHeight:number,chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize:UDim2,
fadeTransparency:NumberSequence,fadeCorners:{string}?,tabStripTop:number?,tabStripHeight:number?,railWidth:number?,
railCollapsedWidth:number?,railCollapseBelow:number?,rowHeight:number?,rowCornerRadius:number?,rowSpacing:number?,
railPadding:number?,rowInset:number?,rowPadding:number?,rowContentSpacing:number?,rowIconSize:number?,footerHeight:
number?,avatarSize:number?,cardTransparency:number?,cardStrokeRotation:number?,cardStrokeTransparency:NumberSequence?,
cardCorners:{string}?}ae.top={mode='top'::Mode,topbarHeight=af,chromeHeight=ag+ah+ai,tabStripTop=ag,tabStripHeight=ah,
pageDirection=Enum.FillDirection.Horizontal,fadeSize=UDim2.new(1,0,-9.3E-2,100),fadeTransparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4414,0),NumberSequenceKeypoint.new(0.7007,0.631),
NumberSequenceKeypoint.new(1,1)}}::Layout ae.sidebar={mode='sidebar'::Mode,topbarHeight=af,chromeHeight=af,railWidth=219
,railCollapsedWidth=64,railCollapseBelow=589,rowHeight=38,rowCornerRadius=14,rowSpacing=4,railPadding=17,rowInset=15,
rowPadding=10,rowContentSpacing=6,rowIconSize=20,footerHeight=60,avatarSize=34,pageDirection=Enum.FillDirection.Vertical
,cardTransparency=0.98,cardStrokeRotation=55,cardCorners={'TopLeftRadius','BottomRightRadius'},cardStrokeTransparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.new(0.128,0.95),NumberSequenceKeypoint.new(
0.414,0.985),NumberSequenceKeypoint.new(1,1)},fadeSize=UDim2.new(1,0,0,55),fadeTransparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.377,0),NumberSequenceKeypoint.new(1,1)},fadeCorners={
'BottomRightRadius'}}::Layout function ae.get(aj:unknown):Layout?if aj=='sidebar'then return ae.sidebar elseif aj=='top'
then return ae.top end return nil end function ae.railWidthFor(aj:Layout,ak:number):number if aj.mode~='sidebar'then
return 0 end local al=aj.railWidth::number if ak<(aj.railCollapseBelow::number)then return aj.railCollapsedWidth::number
end return al end return ae end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(function(...)local ae,af,ag=ac(
ab.Parent.variables),ac(ab.Parent.log),{}export type LocaleToken={[any]:string}export type Translator=(source:string,
localeId:string)->string?export type TranslationTables={[string]:{[string]:string}}ag.strings={}::TranslationTables ag.
current='en'ag.translator=nil::Translator?local ah={}local function ai(aj:string):string return string.match(aj,'^(%a+)'
)or aj end function ag.t(aj:unknown):unknown if type(aj)~='string'or aj==''then return aj end return{[ah]=aj}end
function ag.isToken(aj:unknown):boolean return type(aj)=='table'and type((aj::{[any]:unknown})[ah])=='string'end
function ag.sourceOf(aj:LocaleToken):string return aj[ah]end function ag.resolve(aj:unknown):any if type(aj)~='string'
then return aj end if ag.translator then local ak,al=pcall(ag.translator,aj,ag.current)if ak and type(al)=='string'and
al~=''then return al end end local ak=ag.strings[ag.current]if ak and ak[aj]then return ak[aj]end local al=ag.strings[
ai(ag.current)]if al and al[aj]then return al[aj]end return aj end function ag.register(aj:TranslationTables?)if type(aj
)~='table'then return end for ak,al in aj do if type(ak)=='string'and type(al)=='table'then ak=string.lower(ak)local am=
ag.strings[ak]if not am then am={}ag.strings[ak]=am end for an,ao in al do if type(an)=='string'and type(ao)=='string'
then am[an]=ao else af.warn(`Rayfield: skipping a '{ak}' translation, entries must be string to string.`)end end end end
end function ag.setActive(aj:string?):string ag.current=if type(aj)=='string'and aj~=''then string.lower(aj)else'en'
return ag.current end function ag.detect():string local aj=ae.localizationService.RobloxLocaleId if type(aj)=='string'
and aj~=''then return string.lower(aj)end return'en'end return ag end)()end,[58]=function()local aa,ab,ac=a(58)local ad
return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.Lock(ah,ai:string?)ah.window:
_setElementLocked(ah,true,ai)end function ag.Unlock(ah)ah.window:_setElementLocked(ah,false)end function ag.IsLocked(ah)
:boolean return ah.locked==true end return af end return ae end)()end,[59]=function()local aa,ab,ac=a(59)local ad return
(function(...)local ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean local function ag():boolean return
ae.secureMode end local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.setSecureModeSource(aj:
SuppressPredicate?)ah=if type(aj)=='function'then aj else ag end function af.setSuppressPredicate(aj:SuppressPredicate?)
ai=if type(aj)=='function'then aj else nil end local function aj():boolean if ai and ai()then return true end return ah(
)end function af.warn(...)if aj()then return end warn(...)end function af.print(...)if aj()then return end print(...)end
return af end)()end,[60]=function()local aa,ab,ac=a(60)local ad return(function(...)local function ae<T>(af:T):T local
ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:_moveElement(ah,ai)end function ag.MoveToTop(ah)ah.tab:_moveElement(ah
,1)end function ag.MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab.elements)end function ag.MoveUp(ah)local ai=table.
find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai-1)end end function ag.MoveDown(ah)local ai=table.find(ah.
tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai+1)end end return af end return ae end)()end,[61]=function()local aa
,ab,ac=a(61)local ad return(function(...)local ae={}ae.__index=ae export type RequestFn=(...any)->any function ae.
getRequestFn(af:any?):RequestFn?af=af or getfenv()return af.request or af.http_request or(af.http and af.http.request)or
(af.syn and af.syn.request)or(af.fluxus and af.fluxus.request)end return ae end)()end,[62]=function()local aa,ab,ac=a(62
)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag=ae.textService,{}ag.__index=ag local ah=20
local function ai(aj,ak,al)local am=Instance.new'GetTextBoundsParams'am.Text=al am.Font=aj am.Size=ak am.Width=math.huge
local an,ao=pcall(af.GetTextBoundsAsync,af,am)return if an then ao else Vector2.new(ak*0.6,ak)end local aj={}
local function ak(al,am)local an=tostring(al.Family)..'|'..tostring(al.Weight)..'|'..tostring(al.Style)..'|'..tostring(
am)local ao=aj[an]if ao then return ao end local ap,aq={},0 for b=0,9 do local c=math.ceil(ai(al,am,tostring(b)).X)ap[b]
=c if c>aq then aq=c end end ao={advance=ap,maxWidth=aq}aj[an]=ao return ao end function ag.new(al,am,an)an=an or{}local
ao=setmetatable({window=al,container=am,textSize=an.textSize or 16,transparency=an.transparency or 1,duration=an.
duration or 0.55,slots={},length=0},ag)ao.roll=TweenInfo.new(ao.duration,Enum.EasingStyle.Quint,Enum.EasingDirection.Out
)ao.zIndex=math.max(am.ZIndex+1,6)ao.height=math.ceil(ao.textSize)local ap=ak(al.theme.Font,ao.textSize)ao.advance=ap.
advance ao.maxWidth=ap.maxWidth al:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,HorizontalAlignment=an.alignment or Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder
.LayoutOrder,Padding=UDim.new(0,0),Parent=am})return ao end function ag._reel(al,am)local an=al.slots[am]if an.reel then
return an.reel end local ao=al.window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(al.maxWidth,al.height),
BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=al.zIndex,Parent=al.container})local ap=al.
window:Create('Frame',{Size=UDim2.fromOffset(al.maxWidth,al.height),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(
0.5,0,0,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=al.zIndex,Parent=ao})for aq=0,ah-1 do al.window:Create(
'TextLabel',{Text=tostring(aq%10),Position=UDim2.fromOffset(0,aq*al.height),Size=UDim2.fromOffset(al.maxWidth,al.height)
,BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,
TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=ap},{TextColor3=
'ContentColor',FontFace='Font'})end local aq={cell=ao,strip=ap,digit=0,target=0,stripTween=nil,sizeTween=nil}an.reel=aq
return aq end function ag._static(al,am)local an=al.slots[am]if an.static then return an.static end local ao=al.window:
Create('TextLabel',{Name='Static',Size=UDim2.fromOffset(0,al.height),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment
=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=al.container},{TextColor3=
'ContentColor',FontFace='Font'})an.static=ao return ao end local function al(am)if am.stripTween then am.stripTween:
Cancel()am.stripTween=nil end if am.sizeTween then am.sizeTween:Cancel()am.sizeTween=nil end end function ag._reelSnap(
am,an,ao)al(an)an.cell.Size=UDim2.fromOffset(am.advance[ao],am.height)an.strip.Position=UDim2.new(0.5,0,0,-ao*am.height)
an.digit=ao an.target=ao end function ag._reelRoll(am,an,ao,ap)if an.stripTween or an.sizeTween then am:_reelSnap(an,an.
target)end local aq=an.digit if aq==ao then return end local b,c if ap then b=aq c=aq+(ao-aq)%10 else b=aq+10 c=b-(aq-ao
)%10 end an.strip.Position=UDim2.new(0.5,0,0,-b*am.height)an.target=ao local d,e=ae.tweenService:Create(an.strip,am.roll
,{Position=UDim2.new(0.5,0,0,-c*am.height)}),ae.tweenService:Create(an.cell,am.roll,{Size=UDim2.fromOffset(am.advance[ao
],am.height)})an.stripTween=d an.sizeTween=e d.Completed:Connect(function(f)if f==Enum.PlaybackState.Completed and an.
stripTween==d then am:_reelSnap(an,ao)end end)d:Play()e:Play()an.digit=ao end function ag._putDigit(am,an,ao,ap,aq)local
b=am:_reel(an)local c=not b.cell.Visible b.cell.Visible=true b.cell.LayoutOrder=-an if am.slots[an].static then am.slots
[an].static.Visible=false end if aq and not c then am:_reelRoll(b,ao,ap)else am:_reelSnap(b,ao)end end function ag.
_putStatic(am,an,ao)local ap=am:_static(an)if not ap.Visible then ap.TextTransparency=am.transparency end ap.Text=ao ap.
Visible=true ap.LayoutOrder=-an if am.slots[an].reel then am.slots[an].reel.cell.Visible=false end end function ag._hide
(am,an)local ao=am.slots[an]if not ao then return end if ao.reel then ao.reel.cell.Visible=false end if ao.static then
ao.static.Visible=false end end function ag._render(am,an,ao,ap)an=tostring(an)if an==am._lastText then return end am.
_lastText=an local aq={}for b,c in utf8.codes(an)do table.insert(aq,utf8.char(c))end local b=#aq for c=0,math.max(b,am.
length)-1 do am.slots[c]=am.slots[c]or{}if c<b then local d=aq[b-c]if d:match'%d'then am:_putDigit(c,tonumber(d),ap,ao)
else am:_putStatic(c,d)end else am:_hide(c)end end am.length=b end function ag.to(am,an,ao)am:_render(an,true,ao)end
function ag.snap(am,an)am:_render(an,false,true)end function ag.reveal(am,an,ao,ap)am.transparency=an for aq,b in am.
slots do if b.static and b.static.Visible then am.window:_reveal(b.static,{TextTransparency=an},ao,ap)end if b.reel then
for c,d in b.reel.strip:GetChildren()do if d:IsA'TextLabel'then am.window:_reveal(d,{TextTransparency=an},ao,ap)end end
end end end return ag end)()end,[63]=function()local aa,ab,ac=a(63)local ad return(function(...)type OrderedElement={
main:GuiObject,descriptor:{main:GuiObject}?}local function ae(af:OrderedElement,ag:number)af.main.LayoutOrder=ag if af.
descriptor then af.descriptor.main.LayoutOrder=ag+1 end end return ae end)()end,[64]=function()local aa,ab,ac=a(64)local
ad return(function(...)local ae={}function ae.join(af:string,ag:string?):string if not ag or ag==''then return af end
return af..'/'..ag end local function af(ag:string):string local ah repeat ah=ag ag=ag:gsub('%.%.','')until ag==ah
return ag end function ae.sanitizeFolder(ag:unknown):string local ah=tostring(ag):gsub('\\','/'):gsub('[:<>"|?*%c]','')
ah=af(ah):gsub('/+','/')return(ah:gsub('^/+',''))end function ae.sanitizeFile(ag:unknown):string local ah=tostring(ag):
gsub('[/\\]',''):gsub('[:<>"|?*%c]','')return af(ah)end function ae.basename(ag:unknown):string return tostring(ag):
match'[^/\\]+$'or tostring(ag)end function ae.stripExtension(ag:unknown,ah:string?):string if ah and ah~=''then local ai
=tostring(ag)if ai:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end return ai end local ai=tostring(ag):match'^(.+)%.%w+$'
return ai or tostring(ag)end return ae end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(function(...)local
ae,af,ag={},ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.getPath=af.getPath ae.save=af.save ae.
load=af.load ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.getSettingsPath=ag.getSettingsPath ae.
saveSettings=ag.saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[66]=function()local aa,ab,ac=a(66)
local ad return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.
log),ac(ab.Parent.path),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),{}type PersistedControl={value:
unknown,flag:string?,_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,_deserialize:((PersistedControl,
unknown)->())?,Set:(PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:PersistedControl},configuration:
{fileName:string?,customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[string]:unknown}?,
_loadedConfigPath:string?}function ak.getPath(al:ConfigWindow,am:unknown?):(string?,string?)return ai.getConfigPath(al,
am)end function ak.save(al:ConfigWindow,am:unknown?):boolean local an,ao=ak.getPath(al,am)if not an or not ao then ag.
warn("Rayfield: configuration name '"..tostring(am).."' has no usable characters")return false end if typeof(af.
writefile)~='function'then return false end local ap:{[string]:unknown}={}for aq,b in al.controls do local c,d=pcall(
function()local c=b._serialize if c then return c(b)end return b.value end)if c then ap[aq]=d else ag.warn(
"Rayfield: Failed to serialize flag '"..tostring(aq).."' - "..tostring(d))end end local aq=al._loadedConfig if aq and al
._loadedConfigPath==ao then for b,c in aq do if al.controls[b]==nil then ap[b]=c end end end local b,c=pcall(ae.
httpService.JSONEncode,ae.httpService,ap)if not b then ag.warn('Rayfield: Failed to encode configuration - '..tostring(c
))return false end local d,e=pcall(function()aj.write(an,ao,c)end)if not d then ag.warn(
'Rayfield: Failed to save configuration - '..tostring(e))return false end if al._loadedConfigPath==nil or al.
_loadedConfigPath==ao then al._loadedConfig=ap al._loadedConfigPath=ao end return true end local function al(am:string):
({[string]:unknown}?,string?)if not af.isfile(am)then return nil,nil end local an,ao=pcall(af.readfile,am)if not an or
type(ao)~='string'then ag.warn'Rayfield: Failed to read configuration file'return nil,nil end local ap,aq=pcall(ae.
httpService.JSONDecode,ae.httpService,ao)if not ap or type(aq)~='table'then return nil,ao end return aq::{[string]:
unknown},ao end local function am(an:string):string local ao=ah.stripExtension(an,'.rfld')local ap,aq=ao..
' (Incorrect Format).rfld',2 while aq<=100 and af.isfile(ap)do ap=ao..' (Incorrect Format '..aq..').rfld'aq+=1 end
return ap end function ak.load(an:ConfigWindow,ao:unknown?):boolean local ap,aq=ak.getPath(an,ao)if not ap or not aq
then ag.warn("Rayfield: configuration name '"..tostring(ao).."' has no usable characters")return false end if typeof(af.
isfile)~='function'then return false end local b,c=al(aq)if not b and af.isfile(aq)then local d,e=al(aj.tempPathFor(aq))
if d and e then b=d pcall(aj.write,ap,aq,e)end end if not b then if c then ag.warn
[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local d=am(aq)pcall(function()af.
ensureDir(ap)af.writefile(d,c)af.delfile(aq)end)end return false end local d,e=b::{[string]:unknown},an._loading an.
_loading=true local f,g=pcall(function()for f,g in an.controls do ak.applyTo(g,d[f])end end)an._loading=e if not f then
ag.warn('Rayfield: Failed to apply configuration - '..tostring(g))end an._loadedConfig=d an._loadedConfigPath=aq return
true end function ak.applyTo(an:PersistedControl,ao:unknown)if ao==nil and not an._canBeNil then return end local ap,aq=
pcall(function()local ap=an._deserialize if ap then ap(an,ao)else an:Set(ao)end end)if not ap then ag.warn(
"Rayfield: Failed to restore flag '"..tostring(an.flag).."' - "..tostring(aq))end end function ak.list(an:ConfigWindow):
{string}local ao,ap:{string}=ak.getPath(an),{}if not ao then return ap end local aq,b=pcall(af.listfiles,ao)if not aq or
type(b)~='table'then return ap end for c,d in b do local e=ah.basename(d)if e:sub(-5)=='.rfld'then local f=ah.
stripExtension(e,'.rfld')if f and f~=''and not f:find' %(Incorrect Format[^%)]*%)$'then table.insert(ap,f)end end end
table.sort(ap)return ap end function ak.delete(an:ConfigWindow,ao:unknown):boolean if type(ao)~='string'or ao==''then
return false end local ap,aq=ak.getPath(an,ao)if not aq then return false end if typeof(af.isfile)~='function'or not af.
isfile(aq)then return false end pcall(af.delfile,aj.tempPathFor(aq))return(pcall(af.delfile,aq))end return ak end)()end,
[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.Parent.path
),{}type ConfigWindow={configuration:{fileName:string?,customFolder:string?},name:string}function ag.getConfigPath(ah:
ConfigWindow,ai:unknown?):(string?,string?)local aj=ae.fileSystemManager:getPath'Configurations'if ah.configuration.
customFolder then aj=af.join(aj,af.sanitizeFolder(ah.configuration.customFolder))end if ai~=nil then local ak=af.
sanitizeFile(ai)if ak==''then return nil,nil end return aj,af.join(aj,ak..'.rfld')end local ak=af.sanitizeFile(ah.
configuration.fileName or ah.name)if ak==''then ak=af.sanitizeFile(ah.name)end if ak==''then ak='Configuration'end
return aj,af.join(aj,ak..'.rfld')end function ag.getSettingsPath():(string,string)local ah=ae.fileSystemManager:getPath
'Settings'return ah,af.join(ah,'rayfield.rfld')end return ag end)()end,[68]=function()local aa,ab,ac=a(68)local ad
return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.
persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),ac(ab.Parent.constants),{}type SettingsWindow={
settings:{toggleKeybind:EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean,
showProfile:boolean,theme:string?}}type DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,
keepOnScreen:unknown?,welcomeToast:unknown?,haptics:unknown?,showProfile:unknown?,theme:unknown?}function ak.
getSettingsPath():(string,string)return ag.getSettingsPath()end function ak.saveSettings(al:SettingsWindow):boolean
local am,an=ak.getSettingsPath()local ao:{[string]:unknown}={toggleKeybind={tostring(al.settings.toggleKeybind.EnumType)
,al.settings.toggleKeybind.Value}::{unknown},mouseOverride=al.settings.mouseOverride,keepOnScreen=al.settings.
keepOnScreen,welcomeToast=al.settings.welcomeToast,haptics=al.settings.haptics,showProfile=al.settings.showProfile,theme
=al.settings.theme}local ap,aq=pcall(ae.httpService.JSONEncode,ae.httpService,ao)if not ap then return false end local b
=pcall(ah.write,am,an,aq)if not b then return false end return true end local function al(am:string):(DecodedSettings?,
string?)local an=false pcall(function()an=af.isfile(am)end)if not an then return nil,nil end local ao,ap=pcall(af.
readfile,am)if not ao or type(ap)~='string'then return nil,nil end local aq,b=pcall(ae.httpService.JSONDecode,ae.
httpService,ap)if not aq or type(b)~='table'then return nil,ap end return b::DecodedSettings,ap end function ak.
loadSettings(am:SettingsWindow):boolean local an,ao=ak.getSettingsPath()local ap=al(ao)if not ap then local aq,b=al(ah.
tempPathFor(ao))if aq and b then ap=aq pcall(ah.write,an,ao,b)end end if not ap then return false end if ap.
toggleKeybind then pcall(function()local aq=tostring(ap.toggleKeybind[1]):gsub('^Enum%.','')local b=(Enum::any)[aq]if b
then local c=ai.itemFromValue(b,ap.toggleKeybind[2])if c then am.settings.toggleKeybind=c end end end)end if type(ap.
mouseOverride)=='boolean'then am.settings.mouseOverride=ap.mouseOverride end if type(ap.keepOnScreen)=='boolean'then am.
settings.keepOnScreen=ap.keepOnScreen end if type(ap.welcomeToast)=='boolean'then am.settings.welcomeToast=ap.
welcomeToast end if type(ap.haptics)=='boolean'then am.settings.haptics=ap.haptics end if type(ap.showProfile)==
'boolean'then am.settings.showProfile=ap.showProfile end if type(ap.theme)=='string'and table.find(aj.builtInThemes,ap.
theme)then am.settings.theme=ap.theme end return true end return ak end)()end,[69]=function()local aa,ab,ac=a(69)local
ad return(function(...)local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string
return ah..ag end function af.write(ah:string,ai:string,aj:string)local ak=af.tempPathFor(ai)ae.ensureDir(ah)ae.
writefile(ak,aj)if ae.readfile(ak)~=aj then error'parked copy did not write cleanly'end ae.writefile(ai,aj)pcall(ae.
delfile,ak)end return af end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae,af,ag=ac(ab.
Parent.variables),ac(ab.Parent.network),{}function ag.request(ah,ai:string,aj:string,ak:any?):(boolean,any)if ah.
transport then local al,am,an=pcall(ah.transport,ai,aj,ak)if not al then return false,{error=tostring(am)}end return am,
an end if type(ah.endpoint)~='string'then return false,{error='No relay address.'}end local al=af.getRequestFn()if not
al then return false,{error="This executor can't make web requests."}end local am={['Content-Type']='application/json'}
if ah.key then am['X-Chat-Key']=tostring(ah.key)end local an,ao=pcall(al,{Url=ah.endpoint..aj,Method=ai,Headers=am,Body=
if ak~=nil then ae.httpService:JSONEncode(ak)else nil})if not an or type(ao)~='table'then return false,{error=
'No response from the relay.'}end local ap if type(ao.Body)=='string'and ao.Body~=''then local aq,b=pcall(ae.httpService
.JSONDecode,ae.httpService,ao.Body)ap=if aq then b else nil end local aq=tonumber(ao.StatusCode)or 0 return aq>=200 and
aq<300,ap or{}end function ag.segment(ah):string local ai=tostring(ah):gsub('[^%w%-_%.~]',function(ai)return string.
format('%%%02X',string.byte(ai))end)return ai end function ag.base(ah):string?if type(ah)~='string'then return nil end
local ai=ah:gsub('/+$','')return ai end return ag end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(
...)local ae=ac(ab.Parent.services)export type RuntimeState={secureMode:boolean,coreGui:CoreGui,workspace:Workspace,
runService:RunService,userInputService:UserInputService,guiService:GuiService,localPlayer:Player?,tweenService:
TweenService,httpService:HttpService,textService:TextService,replicatedStorage:ReplicatedStorage,localizationService:
LocalizationService,guiContainer:Instance}local af={}::RuntimeState af.secureMode=(function()if typeof(getgenv)~=
'function'then return false end local ag,ah=pcall(function()return getgenv().RAYFIELD_SECURE end)return ag and ah==true
end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.workspace=ae.getService'Workspace'::Workspace af.runService=ae.
getService'RunService'::RunService af.userInputService=ae.getService'UserInputService'::UserInputService af.guiService=
ae.getService'GuiService'::GuiService af.localPlayer=(ae.getService'Players'::Players).LocalPlayer af.tweenService=ae.
getService'TweenService'::TweenService af.httpService=ae.getService'HttpService'::HttpService af.textService=ae.
getService'TextService'::TextService af.replicatedStorage=ae.getService'ReplicatedStorage'::ReplicatedStorage af.
localizationService=ae.getService'LocalizationService'::LocalizationService af.guiContainer=(function():Instance if af.
runService:IsStudio()then local ag=af.localPlayer if ag then return ag.PlayerGui end return af.coreGui end if typeof(
gethui)=='function'then local ag,ah=pcall(gethui)if ag and ah then return ah end end return af.coreGui end)()return af
end)()end,[72]=function()local aa,ab,ac=a(72)local ad return(function(...)local ae={}function ae.getService(af)local ag=
game:GetService(af)return if cloneref then cloneref(ag)else ag end return ae end)()end,[73]=function()local aa,ab,ac=a(
73)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{}
,{},0,1024 local function ak(al:GetTextBoundsParams):unknown local am,an=pcall(function()return af:GetTextBoundsAsync(al
)end)return if am then an else nil end local function al(am:unknown,an:'X'|'Y'):number?if typeof(am)=='Vector2'then
return if an=='X'then am.X else am.Y end if type(am)=='table'and type((am::any)[an])=='number'then return(am::any)[an]
end return nil end function ag.textWidth(am:Font,an:number,ao:any):number ao=tostring(ao)local ap=tostring(am.Family)..
'|'..tostring(am.Weight)..'|'..tostring(am.Style)..'|'..tostring(an)..'|'..ao local aq=ah[ap]if aq then return aq end
local b=Instance.new'GetTextBoundsParams'b.Text=ao b.Font=am b.Size=an b.Width=math.huge local c=al(ak(b),'X')if not c
then local d=utf8.len(ao)or#ao return math.ceil(an*0.55*d)end local d=math.ceil(c)if ai>=aj then ah={}ai=0 end ah[ap]=d
ai+=1 return d end function ag.textHeight(am:Font,an:number,ao:any,ap:number):number local aq=Instance.new
'GetTextBoundsParams'aq.Text=tostring(ao)aq.Font=am aq.Size=an aq.Width=ap local b=al(ak(aq),'Y')return if b then math.
ceil(b)else an end return ag end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(function(...)local ae,af,ag,ah
,ai,aj=ac(ab.Parent.runtime),ac(ab.Parent.constants),ac(ab.Parent.log),ac(ab.Parent.filesystemManager),ac(ab.Parent.
assetResolver),ac(ab.Parent.fontManager)type RuntimeState=ae.RuntimeState type FileSystemManager=ah.FileSystemManager
type AssetResolver=ai.AssetResolver type FontManager=aj.FontManager export type VariablesState=RuntimeState&{
fallbackFont:Font,fileSystemManager:FileSystemManager,assetResolver:AssetResolver,fontManager:FontManager,
setFallbackFont:(font:Enum.Font|Font)->(),brandFont:(weight:Enum.FontWeight?)->Font}local ak=table.clone(ae)::
VariablesState ag.setSecureModeSource(function()return ak.secureMode end)ak.fallbackFont=Font.fromEnum(Enum.Font.
BuilderSans)ak.fileSystemManager=ah.new()ak.assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl)::
AssetResolver ak.fontManager=aj.new(ak.fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.AssetDownloadUrl.
RoProxyDownloadUrl,{saveToDisk=true,skipCache=false,fallbackFont=ak.fallbackFont})::FontManager function ak.
setFallbackFont(al:Enum.Font|Font)if typeof(al)=='EnumItem'then al=Font.fromEnum(al)end if typeof(al)=='Font'then ak.
fallbackFont=al ak.fontManager.defaultOptions.fallbackFont=al end end function ak.brandFont(al:Enum.FontWeight?):Font if
ak.secureMode then return Font.new(ak.fallbackFont.Family,al)end return Font.new(af.fontAsset,al)end return ak end)()end
,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae,af=ac(ab.Parent.layouts),{}export type Profile
={defaultSize:Vector2,minSize:Vector2,maxOccupancyX:number,maxOccupancyY:number?,marginFloorX:number,marginFloorY:number
,topbarClearance:number?,maxAspectRatio:number,minAspectRatio:number?,widthCompensation:number?,chromeHeight:number}
local ag,ah=200,{top={defaultSize=Vector2.new(760,520),minSize=Vector2.new(320,285),maxOccupancyX=0.9,topbarClearance=36
,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.6,widthCompensation=0,chromeHeight=ae.top.chromeHeight}::Profile,
sidebar={defaultSize=Vector2.new(900,540),minSize=Vector2.new(560,350),maxOccupancyX=0.92,maxOccupancyY=0.8,marginFloorX
=24,marginFloorY=28,maxAspectRatio=2.6,minAspectRatio=1.2,chromeHeight=ae.sidebar.chromeHeight}::Profile}function af.
profile(ai:ae.Mode?):Profile if ai=='sidebar'then return ah.sidebar end return ah.top end function af.pageHeight(ai:
number?,aj:ae.Mode?):number local ak=af.profile(aj)local al=if ai and ai>0 then ai else ak.minSize.Y return math.max(al-
ak.chromeHeight,0)end local function ai(aj:Profile,ak:number):number local al=ak-aj.marginFloorY if aj.topbarClearance
then al=math.min(al,ak-aj.topbarClearance*2)end if aj.maxOccupancyY then al=math.min(al,ak*aj.maxOccupancyY)end return
al end local function aj(ak:number,al:number,am:number):number return math.clamp((al-ak)/(al-am),0,1)end local function
ak(al:Profile,am:number,an:number):UDim2 local ao=math.floor(math.min(math.clamp(an,al.minSize.Y,al.defaultSize.Y),an))
local ap=aj(ao,al.defaultSize.Y,al.minSize.Y)local aq=math.max(al.defaultSize.X+(al.widthCompensation::number)*ap,al.
minSize.X)return UDim2.fromOffset(math.floor(math.min(aq,am,ao*al.maxAspectRatio)),ao)end local function al(am:Profile,
an:number,ao:number):UDim2 local ap,aq=math.min(math.clamp(an,am.minSize.X,am.defaultSize.X),an),math.min(math.clamp(ao,
am.minSize.Y,am.defaultSize.Y),ao)aq=math.floor(math.min(aq,ap/(am.minAspectRatio::number)))ap=math.floor(math.min(ap,aq
*am.maxAspectRatio))return UDim2.fromOffset(ap,aq)end af.minScale=0.7 local am,an=0.9,0.88 function af.scaleFor(ao:
Vector2?,ap:ae.Mode?):number if not ao or ao.X<ag or ao.Y<ag then return 1 end local aq=af.profile(ap)local b=math.min(
ao.X*am/aq.defaultSize.X,ao.Y*an/aq.defaultSize.Y)return math.floor(math.clamp(b,af.minScale,1)*100)/100 end function af
.fit(ao:Vector2?,ap:ae.Mode?):UDim2 local aq=af.profile(ap)if not ao or ao.X<ag or ao.Y<ag then return UDim2.fromOffset(
aq.defaultSize.X,aq.defaultSize.Y)end local b,c=math.min(ao.X*aq.maxOccupancyX,ao.X-aq.marginFloorX),ai(aq,ao.Y)if aq.
minAspectRatio then return al(aq,b,c)end return ak(aq,b,c)end return af end)()end},{{1,2,{'Rayfield'},{{2,1,{
'components'},{{14,2,{'group'}},{5,2,{'chat'}},{28,2,{'tabSelector'}},{17,2,{'nameplate'}},{8,2,{'column'}},{33,2,{
'window'}},{32,2,{'toggle'}},{16,2,{'keybind'}},{26,2,{'tab'}},{22,2,{'section'}},{29,2,{'tag'}},{7,2,{'colorpicker'}},{
4,2,{'button'}},{10,2,{'descriptor'}},{19,2,{'popup'}},{27,2,{'tabSection'}},{21,2,{'search'}},{25,2,{'stat'}},{30,2,{
'text'}},{23,2,{'sidebar'}},{15,2,{'input'}},{24,2,{'slider'}},{18,2,{'notification'}},{9,2,{'console'}},{6,2,{'chrome'}
},{13,2,{'dropdown'}},{20,2,{'progress'}},{31,2,{'toast'}},{3,2,{'action'}},{12,2,{'drag'}},{11,2,{'divider'}}}},{41,2,{
'types'}},{42,1,{'utility'},{{53,2,{'functions'}},{46,2,{'columns'}},{43,2,{'HapticEngine'}},{72,2,{'services'}},{48,2,{
'enums'}},{66,2,{'persistenceConfig'}},{74,2,{'variables'}},{73,2,{'textMetrics'}},{70,2,{'relayClient'}},{58,2,{
'lockable'}},{67,2,{'persistencePaths'}},{69,2,{'persistenceWrite'}},{57,2,{'locale'}},{45,2,{'colors'}},{64,2,{'path'}}
,{50,2,{'filesystemManager'}},{75,2,{'windowSizing'}},{65,2,{'persistence'}},{59,2,{'log'}},{55,2,{'imageCache'}},{44,2,
{'assetResolver'}},{54,2,{'image'}},{63,2,{'ordering'}},{52,2,{'fontManager'}},{47,2,{'constants'}},{61,2,{'network'}},{
56,2,{'layouts'}},{60,2,{'moveable'}},{51,2,{'flagNames'}},{71,2,{'runtime'}},{62,2,{'odometer'}},{68,2,{
'persistenceSettings'}},{49,2,{'filesystem'}}}},{34,1,{'themes'},{{36,2,{'cobalt'}},{35,2,{'amethyst'}},{37,2,{'default'
}},{38,2,{'ember'}},{39,2,{'frost'}},{40,2,{'rose'}}}}}}},'0.4.1','Rayfield',string,task,setmetatable,error,next,table,
unpack,coroutine,script,type,require,pcall,xpcall,tostring,tonumber,_VERSION local f,g,h,i,j,k,l=aj.insert,aj.remove,aj.
freeze or function(f)return f end,al.wrap,ae.sub,ae.match,ae.gmatch if d and j(d,1,4)=='Lune'then local m,n=ap(ao,
'@lune/task')if m and n then af=n end end local m=af and af.defer local n,o,p,q,r,s,t,u,v=m or function(n,...)i(n)(...)
end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local w,x={
GetFullName={{},function(w)local x,y=w.Name,w.Parent while y do x=y.Name..'.'..x y=y.Parent end return x end},
GetChildren={{},function(w)local x={}for y in ai,v[w]do f(x,y)end return x end},GetDescendants={{},function(w)local x={}
for y in ai,v[w]do f(x,y)for z,A in ai,y:GetDescendants()do f(x,A)end end return x end},FindFirstChild={{'string',
'boolean?'},function(w,x,y)local z=v[w]for A in ai,z do if A.Name==x then return A end end if y then for A in ai,z do
return A:FindFirstChild(x,true)end end end},FindFirstAncestor={{'string'},function(w,x)local y=w.Parent while y do if y.
Name==x then return y end y=y.Parent end end},WaitForChild={{'string','number?'},function(w,x)return w:FindFirstChild(x)
end}},{}for y,z in ai,w do local A,B,C=z[1],z[2],{}for D,E in ai,A do local F,G=k(E,'^([^%?]+)(%??)')C[D]={F,G}end x[y]=
function(D,...)if not v[D]then ah("Expected ':' not '.' calling member function "..y,2)end local E={...}for F,G in ai,C
do local H=E[F]local I,J,K=an(H),G[1],G[2]if H==nil and not K then ah('Argument '..H..' missing or nil',3)end if J~=
'any'and I~=J and not(I=='nil'and K)then ah('Argument '..F..' expects type "'..J..'", got "'..I..'"',2)end end return B(
D,...)end end local function y(z,A,B)local C,D=(ag({},{__mode='k'}))local function E(F)ah(F..
' is not a valid (virtual) member of '..z..' "'..A..'"',3)end local function F(G)ah(
'Unable to assign (virtual) property '..G..'. Property is read only',3)end local G,H={},{}H.__metatable=false H.__index=
function(I,J)if J=='ClassName'then return z elseif J=='Name'then return A elseif J=='Parent'then return B elseif z==
'StringValue'and J=='Value'then return D else local K=x[J]if K then return K end end for K in ai,C do if K.Name==J then
return K end end E(J)end H.__newindex=function(I,J,K)if J=='ClassName'then F(J)elseif J=='Name'then A=K elseif J==
'Parent'then if K==G then return end if B~=nil then v[B][G]=nil end B=K if K~=nil then v[K][G]=true end elseif z==
'StringValue'and J=='Value'then D=K else E(J)end end H.__tostring=function()return A end ag(G,H)v[G]=C if B~=nil then v[
B][G]=true end return G end local function z(A,B)local C,D,E,F=A[1],A[2],A[3],A[4]local G=o[D]local H=E and g(E,1)or G
local I=y(G,H,B)p[C]=I if E then for J,K in ai,E do I[J]=K end end if F then for J,K in ai,F do z(K,I)end end return I
end local A=y('Folder','['..ad..']')for B,C in ai,ab do z(C,A)end for B,C in ai,aa do local D=p[B]q[D]=C r[D]=B local E=
D.ClassName if E=='LocalScript'or E=='Script'then f(t,D)end end local function B(C)local D,E=C.ClassName,s[C]if E and D
=='ModuleScript'then return ak(E)end local F=q[C]local function G(H)local I,J,K=nil,ap(function()return debug.traceback(
nil,2)end)if J then I=K end return{Message=H,Traceback=I}end local function H(I)local J,K=b(I.Message),C:GetFullName()
local L,M=k(J,'[^:]+:(%d+): (.+)')local N if not L or not e then N=K..':*: '..(M or J)else L=c(L)local O=r[C]local P=e[O
]local Q=L-P+1 if Q<0 then Q='?'end N=K..':'..Q..': '..M end local O=I.Traceback if O and O~=''then N=N..'\n'..O end
return N end if D=='LocalScript'or D=='Script'then local I,J=aq(F,G)if not I then ah(H(J),0)end else local I={aq(F,G)}
local J=g(I,1)if not J then local K=g(I,1)ah(H(K),0)end s[C]=I return ak(I)end end function a(C)local D=p[C]
local function E(F,...)local G={ap(F,...)}local H=g(G,1)if not H then ah(G[1],3)end return ak(G)end local F=h(ag({},{
__index=u,__newindex=function(F,G,H)u[G]=H end,__len=function()return#u end,__iter=function()return ai,u end}))local G,H
=h{version=ac,envname=ad,shared=F,script=am,require=ao},D local function I(J,...)local K,L,M=an(J),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if K=='table'and v[J]then if J.
ClassName~='ModuleScript'then ah(L,2)elseif J==D then ah(M,2)end return B(J)elseif K=='string'and j(J,1,1)~='@'then if#J
==0 then ah('Attempted to call require with empty string',2)end local N=D if j(J,1,1)=='/'then N=A elseif j(J,1,2)=='./'
then J=j(J,3)end local O for P in l(J,'([^/]*)/?')do local Q=P if P=='..'then Q='Parent'end if Q~=''then local R=N:
FindFirstChild(Q)if not R then local S=N.Parent if S then R=S:FindFirstChild(Q)end end if R then N=R elseif P~=O and P~=
'init'and P~='init.server'and P~='init.client'then ah('Virtual script path "'..J..'" not found',2)end end O=P end if N.
ClassName~='ModuleScript'then ah(L,2)elseif N==D then ah(M,2)end return B(N)end return E(ao,J,...)end return G,H,I end
for C,D in ai,t do n(B,D)end return B(A:GetChildren()[1])