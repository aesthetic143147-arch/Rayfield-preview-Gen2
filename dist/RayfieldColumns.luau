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
local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au={function()local b,c,d=a(1)local e return(
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
.utility local ag,ah,ai,b,c,d,e,f,g=ac(af.variables),ac(af.services),ac(af.relayClient),ac(af.imageCache),ac(af.
animatedImage),ac(af.mediaLoader),ac(af.filesystem),ac(af.path),Color3.new(1,1,1)local h={Omnity={sizeMode='screen',
screenSize=Vector2.new(210,50),size=Vector2.new(4.4,1.05),lift=2.4,maxDistance=1000,cornerRadius=0.26,accent=Color3.
fromRGB(125,180,255),accentDeep=Color3.fromRGB(59,130,246),cardColor=Color3.fromRGB(5,7,14),cardTransparency=0.14,
veilColor=Color3.fromRGB(3,4,9),veilStrength=0.8,titleColor=Color3.fromRGB(250,251,255),subtitleColor=Color3.fromRGB(150
,162,186),badgeTextColor=Color3.fromRGB(235,244,255),logo='omnity-logo.png',logoTint=g,logoScale=0.66,backdrop=
'nameplate-galaxy.png',backdropTint=g,backdropTransparency=0.25,glowImage='nameplate-glow.png',titleFont=nil,
subtitleFont=nil,titleTop=0.2,titleSize=0.3,subtitleSize=0.2,entrance='unfold',logoSway=6,logoSpin=0,halo=true,sparkles=
4,sparkleColor=Color3.fromRGB(220,235,255),titleShine=true,sweep=true,sweepEvery=7,border=true,borderThickness=1,
borderTransparency=0.45,borderSpeed=40,glow=false,bob=true,bobHeight=0.06,bobSpeed=1.6}}h.Midnight=table.clone(h.Omnity)
h.Midnight.backdrop='nameplate-mountains.png'h.Midnight.accent=Color3.fromRGB(96,165,250)h.Midnight.accentDeep=Color3.
fromRGB(37,99,235)h.Midnight.sparkles=3 h.Mono=table.clone(h.Omnity)h.Mono.backdrop=false h.Mono.accent=Color3.fromRGB(
220,224,232)h.Mono.accentDeep=Color3.fromRGB(120,126,140)h.Mono.sparkleColor=g h.Mono.sparkles=0 h.Mono.cardColor=Color3
.fromRGB(10,10,12)ae.presets=h local i,j,k,l=0.35,1.1,3,20 local function m(n)return math.clamp(n,0,1)end local function
n(o,p,q)return m((o-p)/q)end local function o(p)return 1-(1-p)^3 end local function p(q)return 1-(1-q)^5 end
local function q(r)local s,t=1.6,2.6 return 1+t*(r-1)^3+s*(r-1)^2 end local function r(s)return-(math.cos(math.pi*s)-1)/
2 end local function s(t:string):string return(t:gsub('&','&amp;'):gsub('<','&lt;'):gsub('>','&gt;'))end local function
t(u,v)local w=h[u]or h.Omnity local x=table.clone(w)if type(v)=='table'then for y,z in v do x[y]=z end end return x end
local u={logo='square',backdrop='banner',glowImage='square'}function ae.new(v,w)w=if typeof(w)=='table'then w else{}
local x=table.clone(w.style or w.Style or{})for y,z in{'accent','logo','backdrop','maxDistance','lift'}do local A=w[z]if
A==nil then A=w[z:sub(1,1):upper()..z:sub(2)]end if A~=nil and x[z]==nil then x[z]=A end end local y=setmetatable({
window=v,title=w.title or w.Title or string.upper(tostring(v.name or'Rayfield')),subtitle=w.subtitle or w.Subtitle,badge
=w.badge or w.Badge,preset=w.preset or w.Preset or'Omnity',overrides=x,endpoint=ai.base(w.endpoint or w.Endpoint),key=w.
key or w.Key,transport=w.transport or w.Transport,showSelf=w.showSelf~=false and w.ShowSelf~=false,hideDefaultName=w.
hideDefaultName~=false and w.HideDefaultName~=false,checkInInterval=math.max(tonumber(w.checkInInterval)or l,5),
autoCheckIn=w.autoCheckIn~=false,playerMedia=w.playerMedia~=false,settingsSection=w.settings~=false,enabled=true,plates=
{},users={},images={},_sheets={},_loaded={},_dying={},_alive=true},ae)y.style=t(y.preset,x)y.players=ah.getService
'Players'y.folder=v:Create('Folder',{Name=ag.httpService:GenerateGUID(false),Parent=ag.guiContainer})y:_loadImages()
local z=ag.localPlayer if z and y.showSelf then y.users[z.UserId]={badge=y.badge}end if y.players and y.players.
PlayerAdded then v:Connect(y.players.PlayerAdded,function(A)y:_reconcile(A)end)v:Connect(y.players.PlayerRemoving,
function(A)y:_drop(A)end)end y.stepConnection=v:Connect(ag.runService.RenderStepped,function()y:_step(os.clock())end)y:
_reconcileAll()if(y.endpoint or y.transport)and y.autoCheckIn then y:_startCheckIns()end if y.settingsSection then y:
_buildSettings()end y:_restoreOwnMedia()return y end function ae._download(v,w,x,y)if w=='remote'then return b.remote(x)
end return b.url(x,y)end function ae._sheetVisual(v,w)if type(w)~='table'or type(w.id)~='string'or not w.id:match'^%x+$'
then return nil end local x=v._sheets[w.id]if x then return x end if not v.endpoint then return nil end local y=v:
_download('url',`{v.endpoint}/v1/media/{w.id}.png`,`media_{w.id}.png`)if not y then return nil end local z={uri=y,sheet=
{frames=math.max(tonumber(w.frames)or 1,1),columns=math.max(tonumber(w.columns)or 1,1),frameWidth=tonumber(w.frameWidth)
or 0,frameHeight=tonumber(w.frameHeight)or 0,fps=tonumber(w.fps)or 0}}v._sheets[w.id]=z return z end function ae.
_resolveVisual(v,w,x)if w==nil or w==false then return nil elseif type(w)=='number'or(type(w)=='string'and w:match
'^%d+$')then return{uri='rbxassetid://'..tostring(w)}elseif type(w)=='string'then if w:match'^[%w%-_]+%.png$'then local
y=v:_download('remote',w)return if y then{uri=y}else nil elseif w:match'^https?://'then return v:_loadMedia(w,x)or v:
_relayVisual(w,x)end return{uri=w}elseif type(w)=='table'then if w.gif or w.url then local y=tostring(w.gif or w.url)
return v:_loadMedia(y,x)or v:_relayVisual(y,x)elseif w.sheet then local y=v:_resolveVisual(w.sheet,x)if not y or not y.
uri then return nil end local z,A=w.frameSize or Vector2.new(w.frameWidth or 0,w.frameHeight or 0),math.max(tonumber(w.
frames)or 1,1)return{uri=y.uri,sheet={frames=A,columns=math.max(tonumber(w.columns)or A,1),frameWidth=z.X,frameHeight=z.
Y,fps=tonumber(w.fps)or 10}}elseif type(w.images)=='table'then local y={}for z,A in w.images do local B=v:
_resolveVisual(A,x)if B and B.uri then table.insert(y,B.uri)end end return if#y>0 then{list=y,fps=tonumber(w.fps)or 8}
else nil end end return nil end function ae._loadMedia(v,w,x)local y=tostring(w)..'|'..tostring(x)if v._loaded[y]then
return v._loaded[y]end local z,A=d.load(w,x)if z then v._loaded[y]=z end return z,A end function ae._relayVisual(v,w,x)
if not v.endpoint and not v.transport then return nil end local y,z=ai.request(v,'POST','/v1/media',{url=w,fit=x})if not
y then return nil end return v:_sheetVisual(z)end function ae._loadImages(v)table.clear(v.images)local w={}v.
_imageGeneration=w for x,y in{'logo','backdrop','glowImage'}do task.spawn(function()local z=v:_resolveVisual(v.style[y],
u[y])if z and v._alive and v._imageGeneration==w then v.images[y]=z for A,B in v.plates do v:_applyImages(B)end end end)
end end function ae._applyImages(v,w)local x=w.parts if not x then return end local y=v.images local z,A,B=y.logo,y.
backdrop,v.playerMedia and w.media if B and B.visual then if B.slot=='logo'then z=B.visual else A=B.visual end end c.
apply(x.logo,z)x.logo.Visible=z~=nil x.monogram.Visible=z==nil x.logoCorner.CornerRadius=UDim.new(if B and B.slot==
'logo'then 0.22 else 0,0)c.apply(x.backdrop,A)x.backdrop.Visible=A~=nil local C=y.glowImage x.halo.Image=if C then C.uri
or''else''x.halo.Visible=v.style.halo and C~=nil w.visuals={{label=x.logo,visual=z,state={}},{label=x.backdrop,visual=A,
state={}}}end function ae._syncMedia(v,w)local x=v.users[w.player.UserId]local y=x and x.media local z=if type(y)==
'table'then(y.url or y.id)else nil if z==w.mediaId then return end w.mediaId=z if not z or not v.playerMedia then w.
media=nil v:_applyImages(w)return end task.spawn(function()local A if type(y.url)=='string'then A=v:_loadMedia(y.url,if
y.slot=='logo'then'square'else'banner')end if not A and y.id then A=v:_sheetVisual(y)end if w.mediaId~=z then return end
w.media=if A then{visual=A,slot=y.slot}else nil v:_applyImages(w)end)end function ae._listPlayers(v)if v.players and v.
players.GetPlayers then return v.players:GetPlayers()end return{ag.localPlayer}end function ae._wants(v,w)return w~=nil
and v.users[w.UserId]~=nil end function ae._reconcileAll(v)for w,x in v:_listPlayers()do v:_reconcile(x)end for w in v.
plates do if not v:_wants(w)then v:_drop(w)end end end function ae._reconcile(v,w)if not v:_wants(w)then v:_drop(w)
return end local x=v.plates[w]if not x then x={player=w}v.plates[w]=x if w.CharacterAdded then x.characterConnection=v.
window:Connect(w.CharacterAdded,function(y)v:_attach(w,y)end)end if w.Character then v:_attach(w,w.Character)end elseif
x.parts then v:_writeText(x)end v:_syncMedia(x)end function ae._drop(v,w)local x=v.plates[w]if not x then return end v.
plates[w]=nil if x.characterConnection then v.window:Disconnect(x.characterConnection)end v:_vanish(x)end function ae.
_subtitleFor(v,w)if type(v.subtitle)=='function'then return tostring(v.subtitle(w))elseif type(v.subtitle)=='string'then
return v.subtitle end return'@'..w.Name end function ae._badgeFor(v,w)local x=v.users[w.UserId]local y=x and x.badge
return if type(y)=='string'and y~=''then string.upper(y)else nil end local function v(w)return if w.sizeMode=='world'
then w.size else w.screenSize end local function w(x)local y=v(x)local z=y.X/y.Y local A=0.14/z local B=A+x.logoScale/2/
z return{aspect=z,logoCenter=B,closedWidth=math.min(B*2,1),textLeft=B+(x.logoScale/2+0.2)/z,margin=0.2/z}end function ae
._writeText(x,y)local z,A,B=y.parts,x.style,y.layout z.title.Text=x.title z.subtitle.Text=s(x:_subtitleFor(y.player))
local C=x:_badgeFor(y.player)z.badge.Visible=C~=nil local D=1-B.margin if C then z.badgeText.Text=C local E=0.22 local F
=(#C*0.62*E*0.6+E*1.1)/B.aspect z.badge.Size=UDim2.fromScale(F,E)D-=F+0.06/B.aspect end z.title.Size=UDim2.fromScale(
math.max(D-B.textLeft,0.1),A.titleSize)z.subtitle.Size=UDim2.fromScale(1-B.margin-B.textLeft,A.subtitleSize)z.
badgeStroke.Color=A.accent z.badge.BackgroundColor3=A.accent end function ae._attach(x,y,z)local A=x.plates[y]if not A
or not z then return end A.character=z if A.gui then x:_vanish(table.clone(A))A.gui=nil A.parts=nil end local B=z:
FindFirstChild'Head'if not B and z.WaitForChild then B=z:WaitForChild('Head',5)end if not B or x.plates[y]~=A then
return end local C,D=x.window,x.style local E,F,G,H,I=w(D),D.accent:Lerp(g,0.6),UDim.new(D.cornerRadius,0),D.titleFont
or ag.brandFont(Enum.FontWeight.Bold),D.subtitleFont or ag.brandFont(Enum.FontWeight.Medium)local J,K=function(J)C:
Create('UICorner',{CornerRadius=G,Parent=J})end,C:Create('BillboardGui',{Name='Nameplate',Adornee=B,Size=if D.sizeMode==
'world'then UDim2.fromScale(D.size.X,D.size.Y)else UDim2.fromOffset(math.round(D.screenSize.X*(x.window.scale or 1)),
math.round(D.screenSize.Y*(x.window.scale or 1))),StudsOffset=Vector3.new(0,D.lift,0),MaxDistance=D.maxDistance,
AlwaysOnTop=false,LightInfluence=0,ResetOnSpawn=false,ClipsDescendants=false,Parent=x.folder})local L=C:Create('Frame',{
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=K})local M,N=C:Create('UIScale',{Parent=L}),C:Create('Frame',{
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=L})J(N)local O,P=C:Create('UIStroke',{Color=D.accentDeep,
Thickness=3,Transparency=1,Parent=N}),C:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=D.cardColor,
BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,Parent=L})J(P)local Q=C:Create('Frame',{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,Parent=P})local R=C:Create('ImageLabel',{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,ScaleType=Enum.ScaleType.Crop,ImageColor3=D.backdropTint,ImageTransparency=1,Visible=false,
ZIndex=1,Parent=Q})J(R)local S=C:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=D.veilColor,
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=2,Parent=Q})J(S)local T=m(D.veilStrength)C:Create('UIGradient',{
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1-T),NumberSequenceKeypoint.new(0.55,1-T*0.55),
NumberSequenceKeypoint.new(1,1-T*0.12)},Parent=S})local U=C:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=g
,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,Visible=D.sweep,Parent=Q})J(U)local V,W=C:Create('UIGradient',{
Rotation=20,Offset=Vector2.new(-1,0),Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.42,1),NumberSequenceKeypoint.new(0.5,0.9),NumberSequenceKeypoint.new(0.58,1),
NumberSequenceKeypoint.new(1,1)},Parent=U}),C:Create('TextLabel',{Position=UDim2.fromScale(E.textLeft,D.titleTop),
BackgroundTransparency=1,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Bottom,TextColor3=D.titleColor,TextTransparency=1,FontFace=H,ZIndex=5,Parent=Q})local X,Y,Z=C:Create('UIGradient',{Color
=ColorSequence.new{ColorSequenceKeypoint.new(0,g),ColorSequenceKeypoint.new(0.5,F),ColorSequenceKeypoint.new(1,g)},
Enabled=D.titleShine,Parent=W}),C:Create('TextLabel',{Position=UDim2.fromScale(E.textLeft,D.titleTop+D.titleSize+0.05),
BackgroundTransparency=1,RichText=true,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextColor3=D.subtitleColor,TextTransparency=1,FontFace=I,ZIndex=5,Parent=Q}),C:Create('Frame',{
AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1-E.margin,D.titleTop+0.02),BackgroundColor3=D.accent,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=6,Parent=Q})C:Create('UICorner',{CornerRadius=UDim.new(1
,0),Parent=Z})local _,aj,ak,al=C:Create('UIScale',{Scale=0,Parent=Z}),C:Create('UIStroke',{Color=D.accent,Thickness=1,
Transparency=1,Parent=Z}),C:Create('TextLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.52),Size
=UDim2.fromScale(0.76,0.58),BackgroundTransparency=1,TextScaled=true,TextColor3=D.badgeTextColor,TextTransparency=1,
FontFace=H,ZIndex=7,Parent=Z}),C:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Visible=D.border,
Parent=L})J(al)local am=C:Create('UIStroke',{Color=g,Thickness=D.borderThickness,Transparency=1,Parent=al})local an,ao,
ap=C:Create('UIGradient',{Color=ColorSequence.new{ColorSequenceKeypoint.new(0,D.accentDeep),ColorSequenceKeypoint.new(
0.5,F),ColorSequenceKeypoint.new(1,D.accentDeep)},Parent=am}),UDim2.fromScale(D.logoScale,D.logoScale),UDim2.fromScale(E
.logoCenter,0.5)local aq,ar=C:Create('ImageLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=ap,Size=UDim2.fromScale(D.
logoScale*1.6,D.logoScale*1.6),SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundTransparency=1,ImageColor3=D.
accent,ImageTransparency=1,Visible=false,ZIndex=8,Parent=L}),C:Create('ImageLabel',{AnchorPoint=Vector2.new(0.5,0.5),
Position=ap,Size=ao,SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundTransparency=1,ImageColor3=D.logoTint,
ImageTransparency=1,Visible=false,ZIndex=10,Parent=L})local as,at,au,av=C:Create('UICorner',{CornerRadius=UDim.new(0,0),
Parent=ar}),C:Create('TextLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=ap,Size=ao,SizeConstraint=Enum.
SizeConstraint.RelativeYY,BackgroundTransparency=1,Text=string.sub(x.title,1,1),TextScaled=true,TextColor3=F,
TextTransparency=1,FontFace=H,ZIndex=10,Parent=L}),{},math.max(math.floor(tonumber(D.sparkles)or 0),0)for aw=1,av do
local ax=C:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromScale(0.04,0.04),SizeConstraint=Enum.
SizeConstraint.RelativeYY,BackgroundColor3=D.sparkleColor,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=11,Parent=L}
)C:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=ax})table.insert(au,{frame=ax,offset=(aw-1)/av*math.pi*2,speed=
0.5+(aw%3)*0.1,size=0.028+(aw%3)*0.006})end local aw,ax=(z:FindFirstChild'Humanoid')if aw and x.hideDefaultName then ax=
aw.DisplayDistanceType or Enum.HumanoidDisplayDistanceType.Viewer aw.DisplayDistanceType=Enum.
HumanoidDisplayDistanceType.None end A.gui=K A.head=B A.humanoid=aw A.nameType=ax A.layout=E A.born=os.clock()A.phase=(y
.UserId%97)/97*10 A.parts={shell=L,scale=M,glow=N,glowStroke=O,card=P,content=Q,backdrop=R,veil=S,shine=U,sweep=V,border
=al,borderStroke=am,borderGradient=an,title=W,titleShine=X,subtitle=Y,badge=Z,badgeScale=_,badgeStroke=aj,badgeText=ak,
halo=aq,logo=ar,logoCorner=as,monogram=at,sparks=au}x:_writeText(A)x:_applyImages(A)x:_step(os.clock())end function ae.
_vanish(aj,ak)if not ak.gui then return end if ak.humanoid and ak.nameType and ak.humanoid.Parent then ak.humanoid.
DisplayDistanceType=ak.nameType end ak.diedAt=os.clock()ak.humanoid=nil table.insert(aj._dying,ak)end local function aj(
ak,al)if ak=='none'then return{mark=1,card=1,edge=1,title=1,subtitle=1,badge=1,sparks=1,fade=1}elseif ak=='fade'then
local am=n(al,0,0.5)return{mark=am,card=1,edge=am,title=am,subtitle=am,badge=am,sparks=am,fade=am}end return{mark=n(al,0
,0.5),card=n(al,0.15,0.6),edge=n(al,0.45,0.4),title=n(al,0.42,0.45),subtitle=n(al,0.52,0.45),badge=n(al,0.65,0.4),sparks
=n(al,0.3,0.6),fade=n(al,0.1,0.35)}end local function ak(al,am)return 1-(1-al)*am end local function al(am,an,ao,ap)
local aq=an.parts if not aq then return false end local ar,as,at=am.style,an.layout,ao-an.born local au,av,aw=aj(ar.
entrance,at),ap,1 if an.diedAt then local ax=m((ao-an.diedAt)/i)if ax>=1 then return true end av*=1-o(ax)aw=1-0.08*ax
end local ax=ag.workspace.CurrentCamera if ax and an.head and an.head.Parent then local x=(ax.CFrame.Position-an.head.
Position).Magnitude local y,z=m((x-ar.maxDistance*0.6)/(ar.maxDistance*0.4)),m((x-k)/2)av*=(1-y)*z end aq.scale.Scale=aw
local x,y=ao+an.phase,au.mark local z,A,B=o(y)*av,ar.logoScale*(0.35+0.65*q(y)),(1-o(y))*-90+math.sin(x*0.8)*(ar.
logoSway or 0)+x*(ar.logoSpin or 0)for C,D in{aq.logo,aq.monogram}do D.Size=UDim2.fromScale(A,A)D.Rotation=B%360 end aq.
logo.ImageTransparency=1-z aq.monogram.TextTransparency=1-z local C=0.5+0.5*math.sin(x*2.1)aq.halo.ImageTransparency=1-z
*(0.18+0.12*C)local D=ar.logoScale*(1.45+0.12*C)*(0.5+0.5*o(y))aq.halo.Size=UDim2.fromScale(D,D)local E,F=o(au.sparks)*
av,math.rad(-25)for G,H in aq.sparks do local I=x*H.speed+H.offset local J,K=math.cos(I)*0.62,math.sin(I)*0.2 local L,M,
N=J*math.cos(F)-K*math.sin(F),J*math.sin(F)+K*math.cos(F),math.sin(I)>0 local O,P=if N then 1 else 0.7,0.75+0.25*math.
sin(x*5+H.offset*3)H.frame.Position=UDim2.fromScale(as.logoCenter+L*ar.logoScale/as.aspect,0.5+M*ar.logoScale)H.frame.
Size=UDim2.fromScale(H.size*O,H.size*O)H.frame.ZIndex=if N then 11 else 9 H.frame.BackgroundTransparency=1-E*P*(if N
then 0.8 else 0.3)end local G=p(au.card)local H=as.closedWidth+(1-as.closedWidth)*G local I=UDim2.fromScale(H,1)aq.card.
Size=I aq.border.Size=I aq.glow.Size=I aq.content.Size=UDim2.fromScale(1/H,1)local J=o(au.fade)*av aq.card.
BackgroundTransparency=ak(ar.cardTransparency,J)aq.backdrop.ImageTransparency=ak(ar.backdropTransparency,J*G)aq.veil.
BackgroundTransparency=ak(0,J)aq.shine.BackgroundTransparency=ak(0,J)local K=o(au.edge)*av aq.borderStroke.Transparency=
ak(ar.borderTransparency,math.max(K,J*0.6))aq.glowStroke.Transparency=if ar.glow then ak(0.85,K)else 1 aq.borderGradient
.Rotation=(x*ar.borderSpeed)%360 local L=o(au.title)aq.title.TextTransparency=1-L*av aq.title.Position=UDim2.fromScale(
as.textLeft+(1-L)*0.03,ar.titleTop)local M=o(au.subtitle)aq.subtitle.TextTransparency=1-M*av aq.subtitle.Position=UDim2.
fromScale(as.textLeft+(1-M)*0.02,ar.titleTop+ar.titleSize+0.05)aq.badgeScale.Scale=q(au.badge)local N=m(au.badge*1.5)*av
aq.badge.BackgroundTransparency=ak(0.86,N)aq.badgeStroke.Transparency=ak(0.55,N)aq.badgeText.TextTransparency=1-N if ar.
titleShine then aq.titleShine.Offset=Vector2.new(((x*0.3)%2)-1,0)end if an.visuals then for O,P in an.visuals do if P.
visual then c.step(P.label,P.visual,x,P.state)end end end local O=if ar.bob then math.sin(x*ar.bobSpeed)*ar.bobHeight
else 0 an.gui.StudsOffset=Vector3.new(0,ar.lift+O,0)if ar.sweep then local P=(x%ar.sweepEvery)/j aq.sweep.Offset=Vector2
.new(if P<1 then-1+2*r(P)else-1,0)end return false end function ae._step(am,an)local ao=if am.enabled then 1 else 0 for
ap,aq in am.plates do if aq.gui then al(am,aq,an,ao)end end local ap=am._dying for aq=#ap,1,-1 do local ar=ap[aq]if al(
am,ar,an,ao)then table.remove(ap,aq)am.window:DestroySubtree(ar.gui)end end end function ae._identity(am)local an=ag.
localPlayer return{user={id=if an then an.UserId else 0,name=if an then an.Name else'Player'},jobId=tostring(game.JobId
~=nil and game.JobId~=''and game.JobId or'studio')}end function ae.CheckIn(am):boolean if not am._alive then return
false end local an,ao=ai.request(am,'POST','/v1/presence',am:_identity())if not an or type(ao)~='table'or type(ao.users)
~='table'then return false end local ap={}for aq,ar in ao.users do local as=tonumber(type(ar)=='table'and ar.id)if as
then ap[as]={badge=if type(ar.badge)=='string'then ar.badge else nil,media=if type(ar.media)=='table'then ar.media else
nil}end end local aq=ag.localPlayer if aq then if am.showSelf then ap[aq.UserId]=ap[aq.UserId]or{}ap[aq.UserId].badge=ap
[aq.UserId].badge or am.badge else ap[aq.UserId]=nil end end am.users=ap am:_reconcileAll()return true end function ae.
_startCheckIns(am)task.spawn(function()while am._alive and not am.window.unloaded do am:CheckIn()task.wait(am.
checkInInterval)end ai.request(am,'DELETE','/v1/presence',am:_identity())end)end function ae.SetEnabled(am,an:boolean)am
.enabled=an~=false end function ae.SetTitle(am,an:string)am.title=tostring(an)for ao,ap in am.plates do if ap.parts then
am:_writeText(ap)end end end function ae.SetStyle(am,an,ao:string?)if type(an)=='string'then ao,an=an,nil end if ao then
am.preset=ao end if type(an)=='table'then for ap,aq in an do am.overrides[ap]=aq end end am.style=t(am.preset,am.
overrides)am:_loadImages()for ap,aq in am.plates do if aq.character then am:_attach(ap,aq.character)end end end
local function am()return f.join(ag.fileSystemManager:getRootFolder(),'nameplate-token.txt')end function ae._token(an)if
an._savedToken then return an._savedToken end local ao,ap=pcall(function()return if e.isfile(am())then e.readfile(am())
else nil end)an._savedToken=if ao and type(ap)=='string'and ap~=''then ap else nil return an._savedToken end function ae
._saveToken(an,ao)if type(ao)~='string'or ao==''then return end an._savedToken=ao pcall(function()e.ensureFolder(ag.
fileSystemManager:getRootFolder())e.writefile(am(),ao)end)end local function an()return f.join(ag.fileSystemManager:
getRootFolder(),'nameplate.json')end function ae._saveChoice(ao,ap)pcall(function()e.ensureFolder(ag.fileSystemManager:
getRootFolder())e.writefile(an(),ag.httpService:JSONEncode(ap or{}))end)end function ae._restoreOwnMedia(ao)local ap,aq=
pcall(function()return if e.isfile(an())then ag.httpService:JSONDecode(e.readfile(an()))else nil end)if ap and type(aq)
=='table'and type(aq.link)=='string'and aq.link~=''then task.spawn(function()ao:SetMedia(aq.link,aq.slot)end)end end
function ae.SetMedia(ao,ap:string,aq:string?):(boolean,string?)ap=tostring(ap or''):gsub('^%s+',''):gsub('%s+$','')aq=if
aq=='logo'then'logo'else'backdrop'if ap==''then return false,'Paste a link or a file name.'end local ar,as=ao:
_loadMedia(ap,if aq=='logo'then'square'else'banner')if not ar then return false,as or"Couldn't load that."end ao:
_saveChoice{link=ap,slot=aq}ao:_setOwnMedia{url=ap,slot=aq}if not ap:match'^https?://'then return true,
'Only you can see files from your workspace.'end if not ao.endpoint and not ao.transport then return true,
'Only you can see it: this hub has no relay to share it.'end local at=ao:_identity()at.token=ao:_token()at.media={url=ap
,slot=aq}local au,av=ai.request(ao,'PUT','/v1/profile',at)if not au or type(av)~='table'then local aw=if type(av)==
'table'and type(av.error)=='string'then av.error else'no answer'return true,"Set for you, but others can't see it yet ("
..aw..').'end ao:_saveToken(av.token)return true,'Everyone running the script can see it.'end function ae.ClearMedia(ao)
:boolean ao:_saveChoice{}ao:_setOwnMedia(nil)if not ao.endpoint and not ao.transport then return true end local ap=ao:
_identity()ap.token=ao:_token()local aq,ar=ai.request(ao,'DELETE','/v1/profile',ap)if aq and type(ar)=='table'then ao:
_saveToken(ar.token)end return true end function ae._setOwnMedia(ao,ap)local aq=ag.localPlayer if not aq then return end
ao.users[aq.UserId]=ao.users[aq.UserId]or{badge=ao.badge}ao.users[aq.UserId].media=ap if ao.plates[aq]then ao:
_syncMedia(ao.plates[aq])end end function ae._buildSettings(ao)local ap=ao.window.rfSettings if not ap or not ap.
CreateSection then return end local aq='backdrop'ap:CreateSection{name='Nameplate'}ap:CreateToggle{name=
'Show nameplates',value=true,callback=function(ar)ao:SetEnabled(ar)end}ap:CreateDropdown{name='Show my image on',options
={'Card','Logo'},value='Card',callback=function(ar)local as=if type(ar)=='table'then ar[1]else ar aq=if as=='Logo'then
'logo'else'backdrop'end}ap:CreateInput{name='My image or GIF',placeholder='Paste a Tenor, Giphy or Imgur link',callback=
function(ar)if ar==''then return end task.spawn(function()local as,at=ao:SetMedia(ar,aq)ao.window:Toast{title=if as then
'Nameplate updated'else"Couldn't use that",subtitle=at}end)end}ap:CreateButton{name='Remove my image',callback=function(
)ao:ClearMedia()ao.window:Toast{title='Nameplate image removed'}end}end function ae.Add(ao,ap,aq:string?)if typeof(ap)~=
'Instance'and type(ap)~='table'then return end ao.users[ap.UserId]={badge=aq}ao:_reconcile(ap)end function ae.Remove(ao,
ap)if ap then ao.users[ap.UserId]=nil ao:_drop(ap)end end function ae.Destroy(ao)if not ao._alive then return end ao.
_alive=false for ap in ao.plates do ao:_drop(ap)end task.delay(i+0.05,function()if ao.stepConnection then ao.window:
Disconnect(ao.stepConnection)end if ao.folder then ao.window:DestroySubtree(ao.folder)end end)end return ae end)()end,[
18]=function()local aa,ab,ac=a(18)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Notification'local af
=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as=ac(af.variables),ac(af.functions),ac(af.constants
),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8 local function at(au)return
math.clamp(#au*0.06+3,3,9)end function ae.new(au,av)av=if typeof(av)=='table'then av else{}local aw=setmetatable({window
=assert(au,'Missing argument #1 (Window expected)'),title=av.title or av.Title or'Notification',content=av.content or av
.Content or'',icon=av.icon or av.Icon,_hovered=false,_dismissed=false},ae)aw.duration=av.duration or av.Duration or at(
aw.content)local ax=aw.icon~=nil and aw.icon~=0 and aw.icon~=''aw.main=aw.window:Create('Frame',{Name='Notification',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.notification,Parent=aw.window.
notifications})aw.window:Create('UIPadding',{PaddingTop=UDim.new(0,as),Parent=aw.main})aw.body=aw.window:Create('Frame',
{BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=ap,AnchorPoint=Vector2.new(0.5,0.5),
Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.notification,BackgroundTransparency=1,Parent=aw.main})aw.window:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=aw.body},{Color={'WindowColor',ah.toColorSequence}})aw.
window:Create('UICorner',{Parent=aw.body},{CornerRadius='CornerRoundness'})aw.stroke=aw.window:Create('UIStroke',{
Transparency=1,Parent=aw.body},{Color='SurfaceStroke'})aw.shadow=aw.window:CreateGlow(aw.body,'ShadowColor',20,1)aw.
window:Create('UIPadding',{PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=aw.body})aw.window:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=aw.
body})if ax then aw.iconLabel=aw.window:Create('ImageLabel',{Image=aw.icon,Size=UDim2.fromOffset(24,24),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.notification,ImageTransparency=1,Parent=aw.
body},{ImageColor3='ContentColor'})end aw.container=aw.window:Create('Frame',{Size=UDim2.fromOffset(ax and 222 or 260,0)
,AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.
notification,Parent=aw.body})aw.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=aw.container})aw.titleLabel=aw.window:Create('TextLabel',{Text=aw.
title,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=16,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=aw.
container},{TextColor3='ContentColor',FontFace='TitleFont'})if aw.content~=''then aw.descriptionLabel=aw.window:Create(
'TextLabel',{Text=aw.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
TextSize=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=
2,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=aw.container},{TextColor3='ContentColor',FontFace='Font'})end
aw.window._notificationCount=(aw.window._notificationCount or 0)+1 aw.main.LayoutOrder=aw.window._notificationCount
local b=aw.window._liveNotifications if not b then b={}aw.window._liveNotifications=b end table.insert(b,aw)while#b>ar
do local c=table.remove(b,1)if c and c~=aw then task.spawn(c._dismiss,c)end end aw._connections={aw.window:Connect(aw.
body.MouseEnter,function()aw._hovered=true end),aw.window:Connect(aw.body.MouseLeave,function()aw._hovered=false end),aw
.window:Connect(aw.body.InputBegan,function(c)if c.UserInputType==Enum.UserInputType.MouseButton1 or c.UserInputType==
Enum.UserInputType.Touch then aw:_dismiss()end end)}task.spawn(function()aw:_show()end)return aw end function ae.
_measure(au)local av=au.iconLabel and 222 or 260 local aw=ah.textHeight(au.window.theme.TitleFont,16,au.title,av)if au.
descriptionLabel then aw=aw+4+ah.textHeight(au.window.theme.Font,15,au.content,av)end return math.max(aw,au.iconLabel
and 24 or 0)+28 end function ae._show(au)local av=au:_measure()+as if au._dismissed or not au.main.Parent then return
end aj.notify()ag.tweenService:Create(au.main,ak,{Size=UDim2.new(1,0,0,av)}):Play()ag.tweenService:Create(au.body,an,{
Position=aq}):Play()ag.tweenService:Create(au.body,al,{BackgroundTransparency=0}):Play()ag.tweenService:Create(au.
titleLabel,am,{TextTransparency=0}):Play()ag.tweenService:Create(au.stroke,al,{Transparency=0.95}):Play()ag.tweenService
:Create(au.shadow,am,{Transparency=0.6}):Play()task.wait(0.05)if au._dismissed or not au.main.Parent then return end if
au.iconLabel then ag.tweenService:Create(au.iconLabel,am,{ImageTransparency=0}):Play()end task.wait(0.05)if au.
_dismissed or not au.main.Parent then return end if au.descriptionLabel then ag.tweenService:Create(au.descriptionLabel,
am,{TextTransparency=0.35}):Play()end local aw=0 while aw<au.duration and not au._dismissed and au.main.Parent do local
ax=task.wait()if not au._hovered then aw+=ax end end au:_dismiss()end function ae._dismiss(au)if au._dismissed then
return end au._dismissed=true local av=au.window._liveNotifications local aw=av and table.find(av,au)if av and aw then
table.remove(av,aw)end if not au.main.Parent then return end ag.tweenService:Create(au.body,al,{BackgroundTransparency=1
}):Play()ag.tweenService:Create(au.stroke,al,{Transparency=1}):Play()ag.tweenService:Create(au.shadow,am,{Transparency=1
}):Play()ag.tweenService:Create(au.titleLabel,am,{TextTransparency=1}):Play()if au.descriptionLabel then ag.tweenService
:Create(au.descriptionLabel,am,{TextTransparency=1}):Play()end if au.iconLabel then ag.tweenService:Create(au.iconLabel,
am,{ImageTransparency=1}):Play()end ag.tweenService:Create(au.body,ao,{Size=UDim2.new(1,-90,1,0)}):Play()local ax=ag.
tweenService:Create(au.main,ao,{Size=UDim2.new(1,0,0,0)})ax:Play()ax.Completed:Wait()if not au.main.Parent then return
end for b,c in au._connections do au.window:Disconnect(c)end au.window:DestroySubtree(au.main)end return ae end)()end,[
19]=function()local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.
Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=ac(af.variables),ac(af.functions),ac(af.
constants),ac(af.locale),ac(af.log),ac(af.HapticEngine),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),400,22,24,22,16 local av,aw,ax,b,c,d,e,f=aq-ar*2,18,14,15,16,12,300,4 local g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v=av-f*2,
16,13,20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}local function w()for x=#u,1,-1 do local y=u[x]if y._closed or not y.
screenGui.Parent then table.remove(u,x)end end end local function x(y)w()return u[#u]==y end function ae.new(y,z)z=if
typeof(z)=='table'then z else{}local A=setmetatable({window=assert(y,'Missing argument #1 (Window expected)'),title=z.
title or z.Title or'Popup',subtitle=z.subtitle or z.Subtitle,content=z.content or z.Content,icon=z.icon or z.Icon,boxes=
z.boxes or z.Boxes,options=z.options or z.Options,dismissable=if z.dismissable~=nil then z.dismissable elseif z.
Dismissable~=nil then z.Dismissable else true,_reveal={},_connections={},_closed=false},ae)if not A.options or#A.options
==0 then A.options={{text='Okay'}}end A:_build()w()table.insert(u,A)task.spawn(function()A:_show()end)return A end
function ae._fade(y,z,A,B)table.insert(y._reveal,{instance=z,prop=A,to=B})return z end function ae._build(y)local z,A=y.
window,y.icon~=nil and y.icon~=0 and y.icon~=''y.screenGui=z:Create('ScreenGui',{Name=ag.httpService:GenerateGUID(false)
,IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.popup,ZIndexBehavior=Enum.
ZIndexBehavior.Global,Parent=ag.guiContainer})y.backdrop=z:Create('Frame',{Name='Backdrop',BackgroundColor3=Color3.
fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),Active=true,BackgroundTransparency=1,Parent=y.screenGui})y:
_fade(y.backdrop,'BackgroundTransparency',t)y.card=z:Create('Frame',{Name='Card',BackgroundColor3=Color3.fromRGB(255,255
,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,14),Size=UDim2.fromOffset(aq,0),AutomaticSize=Enum.
AutomaticSize.Y,Active=true,BorderSizePixel=0,BackgroundTransparency=1,Parent=y.screenGui})y:_fade(y.card,
'BackgroundTransparency',0)z:_scaleSurface(y.card)z:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=
y.card},{Color={'WindowColor',ah.toColorSequence}})z:Create('UICorner',{Parent=y.card},{CornerRadius='CornerRoundness'})
y.cardStroke=z:Create('UIStroke',{Transparency=1,Parent=y.card},{Color='SurfaceStroke'})y:_fade(y.cardStroke,
'Transparency',0.95)y.cardShadow=z:CreateGlow(y.card,'ShadowColor',26,1)y:_fade(y.cardShadow,'Transparency',0.55)z:
Create('UIPadding',{PaddingLeft=UDim.new(0,ar),PaddingRight=UDim.new(0,ar),PaddingTop=UDim.new(0,as),PaddingBottom=UDim.
new(0,at),Parent=y.card})z:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,au),Parent=y.card})local B=y:
_measureHeader(A)y:_buildHeader(A,B)local C=y:_buildContent()y:_buildFooter()local D=2+(C>0 and 1 or 0)local E=as+B+C+p+
at+au*(D-1)y.card.Size=UDim2.fromOffset(aq,E)y.card.AutomaticSize=Enum.AutomaticSize.None if y.dismissable then table.
insert(y._connections,z:Connect(y.backdrop.InputBegan,function(F)if F.UserInputType==Enum.UserInputType.MouseButton1 or
F.UserInputType==Enum.UserInputType.Touch then y:Close()end end))table.insert(y._connections,z:Connect(ag.
userInputService.InputBegan,function(F,G)if not G and F.KeyCode==Enum.KeyCode.Escape and x(y)then if F==v then return
end v=F y:Close()end end))end end function ae._buildHeader(y,z,A)local B=y.window local C=B:Create('Frame',{Name=
'Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,A),LayoutOrder=1,Parent=y.card})B:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,d),Parent=C})if z then y:_fade(B:
Create('ImageLabel',{Image=y.icon,Size=UDim2.fromOffset(c,c),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,
ImageTransparency=1,Parent=C},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end local D=B:Create('Frame',{Name=
'Text',BackgroundTransparency=1,Size=UDim2.new(1,z and-(c+d)or 0,0,y._columnH),LayoutOrder=2,Parent=C})B:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),
Parent=D})y:_fade(B:Create('TextLabel',{Text=aj.t(y.title),Size=UDim2.new(1,0,0,y._titleH),BackgroundTransparency=1,
TextSize=aw,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=D},{
TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if y.subtitle and y.subtitle~=''then y:_fade(B:Create(
'TextLabel',{Text=aj.t(y.subtitle),Size=UDim2.new(1,0,0,y._subH),BackgroundTransparency=1,TextSize=ax,TextXAlignment=
Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=D},{TextColor3='TitlingColor',FontFace
='Font'}),'TextTransparency',0.55)end end function ae._buildContent(y)if(not y.content or y.content=='')and(not y.boxes
or#y.boxes==0)then return 0 end local z,A=y.window,if y.boxes and#y.boxes>0 then y:_measureBoxes()else y:_measureText()
local B=math.min(A,e)+f*2 local C=z:Create('ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,
Size=UDim2.new(1,0,0,B),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,
ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,
ScrollBarImageTransparency=1,Parent=y.card})y:_fade(C,'ScrollBarImageTransparency',0.8)z:Create('UIPadding',{PaddingLeft
=UDim.new(0,f),PaddingRight=UDim.new(0,f),PaddingTop=UDim.new(0,f),PaddingBottom=UDim.new(0,f),Parent=C})if y.boxes and#
y.boxes>0 then z:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,n),Parent=C})for D,E in y.boxes do y:
_buildBox(C,E,D)end else y:_fade(z:Create('TextLabel',{Text=aj.t(y.content),Size=UDim2.new(1,0,0,A),
BackgroundTransparency=1,TextSize=b,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,TextTransparency=1,Parent=C},{TextColor3='ContentColor',FontFace='Font'}),'TextTransparency',0.5)end
return B end function ae._buildBox(y,z,A,B)local C=y.window A=if typeof(A)=='table'then A else{title=tostring(A)}local D
,E,F,G,H=A.icon~=nil and A.icon~=0 and A.icon~='',y:_measureBox(A)local I=C:Create('Frame',{Name='Box',BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-o,0,E),LayoutOrder=B,BackgroundTransparency=1,Parent=z})
y:_fade(I,'BackgroundTransparency',0)local J=C:StyleElementPanel(I)y:_fade(J,'Transparency',C.theme.
ElementStrokeTransparency)C:Create('UIPadding',{PaddingLeft=UDim.new(0,h),PaddingRight=UDim.new(0,h),PaddingTop=UDim.
new(0,i),PaddingBottom=UDim.new(0,i),Parent=I})C:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,k),Parent=I})if D then y:_fade(C:Create('ImageLabel',{Image=A.icon,Size=UDim2.
fromOffset(j,j),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=I},{ImageColor3=
'ContentColor'}),'ImageTransparency',0)end local K=C:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,D and-(j+
k)or 0,0,H),LayoutOrder=2,Parent=I})C:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=K})y:_fade(C:Create('TextLabel',{Text=aj.t(A.title or A.Title or''),
Size=UDim2.new(1,0,0,F),BackgroundTransparency=1,TextSize=l,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=K},{TextColor3='ContentColor',FontFace='TitleFont'}),'TextTransparency',0)local
L=A.description or A.Description if L and L~=''then y:_fade(C:Create('TextLabel',{Text=aj.t(L),Size=UDim2.new(1,0,0,G),
BackgroundTransparency=1,TextSize=m,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=K},{TextColor3='ContentColor',FontFace='Font'}),
'TextTransparency',0.65)end end function ae._buildFooter(y)local z=y.window local A=z:Create('Frame',{Name='Footer',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,p),LayoutOrder=3,Parent=y.card})z:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,q),Parent=A})for B,C in y.options do y:_buildButton(A,C,B)end end function ae._buildButton(y,z,A,B)local C=y.
window A=if typeof(A)=='table'then A else{text=tostring(A)}local D,E,F,G,H,I,J=A.style or A.Style or'neutral',A.text or
A.Text or A.name or A.Name or'Okay',A.callback or A.Callback if D=='primary'then G,H,I,J=C.theme.AccentColor,C.theme.
AccentStroke,C.theme.AccentStroke,0.1 elseif D=='danger'then G,H,I,J=C.theme.ErrorColor,C.theme.ErrorStrokeColor,C.theme
.ErrorStrokeColor,0 else G,H,I,J=C.theme.NeutralButton,C.theme.NeutralButtonHover,C.theme.NeutralButtonStroke,0.85 end
local K=C:Create('Frame',{Name='Button',BackgroundColor3=G,BorderSizePixel=0,Size=UDim2.new(0,0,0,p),LayoutOrder=B,
BackgroundTransparency=1,Parent=z})y:_fade(K,'BackgroundTransparency',0)C:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=K})C:Create('UICorner',{CornerRadius=r,Parent=K})local L=C:Create('UIStroke',{Color=I,Transparency=1,Parent=
K})y:_fade(L,'Transparency',J)y:_fade(C:Create('TextLabel',{Text=aj.t(E),Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,TextSize=s,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,
TextColor3=ah.contrastText(G),TextTransparency=1,Parent=K},{FontFace='Font'}),'TextTransparency',0)local M,N=C:Create(
'TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=K}),TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(y._connections,C:Connect(M.MouseEnter,function()
if y._closed then return end ag.tweenService:Create(K,N,{BackgroundColor3=H}):Play()end))table.insert(y._connections,C:
Connect(M.MouseLeave,function()ag.tweenService:Create(K,N,{BackgroundColor3=G}):Play()end))table.insert(y._connections,C
:Connect(M.MouseButton1Click,function()if y._closed then return end al.click()ag.tweenService:Create(L,N,{Transparency=1
}):Play()if F then task.spawn(function()local O,P=pcall(F)if not O then ak.warn("Rayfield: popup button '"..E..
"' callback errored:")ak.print(P)end end)end y:Close()end))end function ae._measureHeader(y,z)local A=av-(if z then c+d
else 0)y._titleH=ah.textHeight(y.window.theme.Font,aw,aj.resolve(y.title),A)y._subH=if y.subtitle and y.subtitle~=''then
ah.textHeight(y.window.theme.Font,ax,aj.resolve(y.subtitle),A)else 0 y._columnH=y._titleH+(if y._subH>0 then 3+y._subH
else 0)return math.max(y._columnH,if z then c else 0)end function ae._measureText(y)return ah.textHeight(y.window.theme.
Font,b,aj.resolve(y.content),g)end function ae._measureBox(y,z)z=if typeof(z)=='table'then z else{title=tostring(z)}
local A=z.icon~=nil and z.icon~=0 and z.icon~=''local B=g-o-h*2-(if A then j+k else 0)local C,D,E=ah.textHeight(y.window
.theme.TitleFont,l,aj.resolve(z.title or z.Title or''),B),0,z.description or z.Description if E and E~=''then D=ah.
textHeight(y.window.theme.Font,m,aj.resolve(E),B)end local F=C+(if D>0 then 3+D else 0)local G=math.max(F,if A then j
else 0)+i*2 return G,C,D,F end function ae._measureBoxes(y)local z=0 for A,B in y.boxes do z+=(y:_measureBox(B))if A<#y.
boxes then z+=n end end return z end function ae._show(y)if not y.screenGui.Parent then return end al.notify()ag.
tweenService:Create(y.card,am,{Position=UDim2.new(0.5,0,0.5,0)}):Play()for z,A in y._reveal do local B=if A.instance==y.
backdrop then ap else an ag.tweenService:Create(A.instance,B,{[A.prop]=A.to}):Play()end end function ae.Close(y)if y.
_closed then return end y._closed=true local z=table.find(u,y)if z then table.remove(u,z)end for A,B in y._connections
do y.window:Disconnect(B)end y._connections={}if not y.screenGui.Parent then return end ag.tweenService:Create(y.card,ao
,{Position=UDim2.new(0.5,0,0.5,10)}):Play()for A,B in y._reveal do ag.tweenService:Create(B.instance,ao,{[B.prop]=1}):
Play()end task.delay(ao.Time,function()y.window:DestroySubtree(y.screenGui)end)end return ae end)()end,[20]=function()
local aa,ab,ac=a(20)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.
locale),60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local av=TweenInfo.new(au,Enum.EasingStyle.Quint
,Enum.EasingDirection.InOut,-1,true)local function aw(ax:unknown):number?local b=tonumber(ax)if b==nil or b~=b or math.
abs(b)==math.huge then return nil end return b end function ae.new(ax,b)b=if typeof(b)=='table'then b else{}local c=aw(b
.steps or b.Steps)c=if c and c>=2 then math.floor(c)else nil local d=b.range or b.Range local e,f=aw(d and d[1])or 0,aw(
d and d[2])or c or 1 if e>f then e,f=f,e end local g=setmetatable({tab=assert(ax,'Missing argument #1 (Tab expected)'),
window=ax.window,name=b.name or b.Name or'Progress',icon=b.icon or b.Icon,description=b.description or b.Description,min
=e,max=f,steps=c,value=0,text=b.text or b.Text,format=b.format or b.Format,showValue=if b.showValue==nil then true else
b.showValue==true,indeterminate=b.indeterminate or b.Indeterminate or false},ae)g.value=g:_clamp(aw(b.value or b.Value)
or e)g:_build()if g.description then g.descriptor=ac(ab.Parent.descriptor).new(g.tab,{description=g.description})end
return g end function ae._clamp(ax,b:number):number return math.clamp(aw(b)or ax.min,ax.min,ax.max)end function ae.
_ratio(ax):number local b=ax.max-ax.min if b<=0 then return 1 end return(ax.value-ax.min)/b end function ae._filledSteps
(ax):number local b=ax.steps::number return math.clamp(math.round(ax:_ratio()*b),0,b)end function ae._readout(ax):string
if ax.text then return aj.resolve(ax.text)end if ax.format then local b,c=pcall(ax.format,ax.value,ax.min,ax.max)if b
and type(c)=='string'then return c end end if ax.steps then return string.format('%d/%d',ax:_filledSteps(),ax.steps)end
return string.format('%d%%',math.round(ax:_ratio()*100))end function ae._build(ax)ax.main=ax.window:Create('Frame',{Size
=UDim2.new(1,-20,0,ak),BorderSizePixel=0,Name=ax.name,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=ax.tab.tabPage},{BackgroundTransparency='ElementTransparency'})ax.stroke=ax.window:
StyleElementBody(ax.main)ax.container=ax.window:Create('Frame',{Size=UDim2.new(0,170,0,ap),Position=UDim2.new(0,am,0,20)
,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=ax.main})ax.window:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
ax.container})if ax.icon then ax.iconLabel=ax.window:Create('ImageLabel',{Image=ax.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=ax.container},{ImageColor3='ContentColor'})end ax.
title=ax.window:Create('TextLabel',{Text=aj.t(ax.name),Size=UDim2.fromOffset(250,ap),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=ap,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=ax.container},{TextColor3='ContentColor',FontFace='Font'})ax.
readout=ax.window:Create('TextLabel',{Text=ax:_readout(),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-am,0,20),
Size=UDim2.fromOffset(50,aq),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=aq,
TextXAlignment=Enum.TextXAlignment.Right,Visible=ax.showValue,TextTransparency=1,Parent=ax.main},{TextColor3=
'ContentColor',FontFace='Font'})if ax.steps then ax:_buildSteps()return end ax.track=ax.window:Create('Frame',{
AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.new(1,-am*2,0,al),BorderSizePixel=0,
BackgroundTransparency=1,Parent=ax.main},{BackgroundColor3='SliderBackground'})ax.window:Create('UICorner',{CornerRadius
=UDim.new(1,0),Parent=ax.track})ax.fill=ax.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
fromScale(0,0.5),Size=UDim2.fromScale(if ax.indeterminate then 0 else ax:_ratio(),1),BackgroundColor3=Color3.fromRGB(255
,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=ax.track})ax.window:Create('UICorner',{CornerRadius
=UDim.new(1,0),Parent=ax.fill})ax.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=at,
Parent=ax.fill},{Color={'SliderProgress',ah.toColorSequence}})ax.fillGlow=ax.window:CreateGlow(ax.fill,'AccentColor',20,
1)if ax.indeterminate then ax:_startSweep()end end function ae._buildSteps(ax)local b=ax.steps::number ax.track=ax.
window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2.new(1,-am*2,0,an),
BackgroundTransparency=1,BorderSizePixel=0,Parent=ax.main})ax.window:Create('UIListLayout',{Padding=UDim.new(0,ao),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=ax.track})ax.stepFrames={}for c=1,b do local d=ax.
window:Create('Frame',{Size=UDim2.new(1/b,-(ao*(b-1))/b,1,0),BorderSizePixel=0,LayoutOrder=c,BackgroundTransparency=1,
Parent=ax.track},{BackgroundColor3='SliderBackground'})ax.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=d}
)local e=ax.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=d})ax.window:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=e})ax.window:Create('UIGradient',{Rotation=90,Parent=e},{Color={'SliderProgress',ah.toColorSequence}})table.
insert(ax.stepFrames,{segment=d,fill=e})end end function ae._startSweep(ax)if ax._sweep or ax.steps then return end ax.
fill.AnchorPoint=Vector2.new(0,0.5)ax.fill.Position=UDim2.fromScale(0,0.5)ax.fill.Size=UDim2.fromScale(0,1)ax._sweep=ag.
tweenService:Create(ax.fill,av,{Size=UDim2.fromScale(1,1)})ax._sweep:Play()end function ae._stopSweep(ax)if not ax.
_sweep then return end ax._sweep:Cancel()ax._sweep=nil ax.fill.AnchorPoint=Vector2.new(0,0.5)ax.fill.Position=UDim2.
fromScale(0,0.5)end function ae._render(ax,b:boolean?)ax.readout.Text=ax:_readout()if ax.steps then if not ax._shown
then return end local c=ax:_filledSteps()for d,e in ax.stepFrames do local f=if d<=c then 0 else 1 if b==false then e.
fill.BackgroundTransparency=f else ag.tweenService:Create(e.fill,as,{BackgroundTransparency=f}):Play()end end return end
local c=UDim2.fromScale(ax:_ratio(),1)if b==false then ax.fill.Size=c else ag.tweenService:Create(ax.fill,as,{Size=c}):
Play()end end function ae.Set(ax,b)ax.value=ax:_clamp(b)if ax.indeterminate then ax.indeterminate=false ax:_stopSweep()
end ax:_render()end function ae.Get(ax):number return ax.value end function ae.GetPercentage(ax):number return ax:
_ratio()end function ae.SetRange(ax,b,c)b=aw(b)or ax.min c=aw(c)or ax.max if b>c then b,c=c,b end ax.min,ax.max=b,c ax.
value=ax:_clamp(ax.value)ax:_render()end function ae.SetText(ax,b)ax.text=b ax.readout.Text=ax:_readout()end function ae
.SetIndeterminate(ax,b)b=b==true if b==ax.indeterminate then return end ax.indeterminate=b if b then ax:_startSweep()
else ax:_stopSweep()ax:_render(false)end end function ae._setShown(ax,b,c)local d=ax.window ax._shown=b d:_reveal(ax.
readout,{TextTransparency=if b then ar else 1},c)if b then d:_revealCommon(ax,c)else d:_hideCommon(ax,c)end if ax.steps
then local e=ax:_filledSteps()for f,g in ax.stepFrames do d:_reveal(g.segment,{BackgroundTransparency=if b then 0 else 1
},c)d:_reveal(g.fill,{BackgroundTransparency=if b and f<=e then 0 else 1},c)end return end d:_reveal(ax.track,{
BackgroundTransparency=if b then 0 else 1},c)d:_reveal(ax.fill,{BackgroundTransparency=if b then 0 else 1},c)d:_reveal(
ax.fillGlow,{Transparency=if b then d.theme.AccentGlow else 1},c)end function ae.Remove(ax)ax:_stopSweep()if ax.
descriptor then ax.descriptor:Remove()end if ax.tab._forget then ax.tab:_forget(ax)end ax.window:DestroySubtree(ax.main)
end ai(ae)return ae end)()end,[21]=function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent.
utility local af,ag,ah,ai,aj,ak,al,am=ac(ae.variables),ac(ae.constants),ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.
new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.6,0.2 local function an(ao)if ao.__type=='Group'then local
ap={}local function aq(ar)for as,at in ar.elements do if at.__type=='Group'then aq(at)elseif at.name then table.insert(
ap,at.name)end end end aq(ao)return table.concat(ap,'\n')end return ao.name or''end local function ao(ap)local aq={}for
ar,as in ap.tabs do if as.neglectSelector then continue end for at,au in as.elements do if au.__type~='Section'then
table.insert(aq,au)end end end return aq end local function ap(aq,ar,as)af.tweenService:Create(aq.searchPill,as,{
BackgroundTransparency=if ar then 0.9 else 1}):Play()af.tweenService:Create(aq.searchStroke,as,{Transparency=if ar then
0.85 else 1}):Play()af.tweenService:Create(aq.searchShadow,as,{Transparency=if ar then 0.92 else 1}):Play()af.
tweenService:Create(aq.searchIcon,as,{ImageTransparency=if ar then 0.65 else 1}):Play()af.tweenService:Create(aq.
searchInput,as,{TextTransparency=if ar then 0.2 else 1}):Play()end local function aq(ar,as,at)if ar.layout.mode==
'sidebar'then return end for au,av in ar.tabs do if not av.neglectSelector and av.topbarItem then av:_applyVisual(if as
then(if ar.selectedTab==av then'selected'else'unselected')else'hidden',at)end end end local function ar(as,at)at=string.
lower(at or'')local au=false for av,aw in as._searchUnits do local ax=at==''or string.find(aw.text,at,1,true)~=nil aw.
unit.main.Visible=ax if aw.unit.descriptor then aw.unit.descriptor.main.Visible=ax end au=au or ax end as.searchEmpty.
Visible=not au and at~=''end local function as(at)at._searchUnits={}local au=0 for av,aw in ao(at)do au+=1 local ax=aw.
main table.insert(at._searchUnits,{unit=aw,text=string.lower(an(aw)),homeParent=ax.Parent,homeOrder=ax.LayoutOrder,
descOrder=aw.descriptor and aw.descriptor.main.LayoutOrder})ax.LayoutOrder=au*10 ax.Parent=at.searchPage ax.Visible=true
if aw.descriptor then aw.descriptor.main.LayoutOrder=au*10+1 aw.descriptor.main.Parent=at.searchPage aw.descriptor.main.
Visible=true end end end local function at(au)for av,aw in au._searchUnits do local ax=aw.unit if ax.main and ax.main.
Parent then ax.main.LayoutOrder=aw.homeOrder ax.main.Parent=aw.homeParent ax.main.Visible=true end if ax.descriptor and
ax.descriptor.main and ax.descriptor.main.Parent then ax.descriptor.main.LayoutOrder=aw.descOrder ax.descriptor.main.
Parent=aw.homeParent ax.descriptor.main.Visible=true end end au._searchUnits={}end function aj.open(au)if au._searching
or au.minimised or not au:_interactive()then return end au._searching=true as(au)ar(au,'')au:_jumpTo(au.searchPage)aq(au
,false,ak)task.delay(ak.Time,function()if au._searching and au.layout.mode~='sidebar'then au.tabList.Visible=false end
end)au.searchPill.Visible=true ap(au,true,ak)au.searchInput:CaptureFocus()af.tweenService:Create(au.searchAction.
iconLabel,ak,{ImageTransparency=am}):Play()end function aj.close(au,av)if not au._searching then return end av=av or{}au
._searching=false au.searchInput.Text=''au.searchInput:ReleaseFocus()au.searchEmpty.Visible=false at(au)local aw=if av.
jumpTo==nil then au.selectedTab and au.selectedTab.tabPage else av.jumpTo if aw then au:_jumpTo(aw)end ap(au,false,ak)
task.delay(ak.Time,function()if not au._searching then au.searchPill.Visible=false end end)if av.showTabs then au.
tabList.Visible=true aq(au,true,ak)end af.tweenService:Create(au.searchAction.iconLabel,ak,{ImageTransparency=al}):Play(
)end function aj.toggle(au)if au._searching then aj.close(au,{showTabs=true})else aj.open(au)end end function aj.
railWidth(au,av)if au.searchPill then au.searchPill.Size=UDim2.new(1,-(av+30),0,35)end end function aj.build(au)au.
_searching=false au.searchPage=au:Create('ScrollingFrame',{Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(
0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.
AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=ag.pageScrollbar.thickness,ScrollBarImageTransparency=
ag.pageScrollbar.transparency,VerticalScrollBarInset=Enum.ScrollBarInset.None,ScrollingDirection=Enum.ScrollingDirection
.Y,LayoutOrder=2000,Parent=au.elements},{ScrollBarImageColor3='ContentColor'})au:Create('UIListLayout',{Padding=UDim.
new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum
.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=au.searchPage})au:Create('UIPadding',{PaddingTop
=UDim.new(0,if au.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),Parent=au.searchPage})au.
searchEmpty=au:Create('TextLabel',{Name='NoResults',Text=ah.t'No results',FontFace=af.brandFont(Enum.FontWeight.Medium),
TextSize=15,TextTransparency=0.6,BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.55
,0),Size=UDim2.fromOffset(200,20),Visible=false,ZIndex=3,Parent=au.main},{TextColor3='ContentColor',FontFace='Font'})
local av=au.layout.mode=='sidebar'local aw=if av then au.layout.chromeHeight+8 else au.layout.tabStripTop+1 au.
searchPill=au:Create('Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if av then 1 else 0.5,0),Position=UDim2.new(if av
then 1 else 0.5,if av then-15 else 0,0,aw),Size=UDim2.new(1,if av then-(au.layout.railWidth+30)else-35,0,35),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=
au.main})au:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=au.searchPill})au.searchStroke=au:Create('UIStroke',{
Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=1,Parent=au.searchPill})au.searchShadow=au:Create('UIShadow',
{BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=au.searchPill})au.
searchIcon=au:Create('ImageLabel',{Image='rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,15,0.5,1),Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,
Parent=au.searchPill},{ImageColor3='ContentColor'})au.searchInput=au:Create('TextBox',{Text='',PlaceholderText=ah.t
'Search all pages',AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=
true,ZIndex=10,TextTransparency=1,Parent=au.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3=
'PlaceholderColor'})au:Connect(au.searchInput:GetPropertyChangedSignal'Text',function()if au._searching then ar(au,au.
searchInput.Text)end end)au.searchAction=ai.new(au,{name='Search',icon=ag.icons.search,order=4,callback=function()aj.
toggle(au)end})au.searchAction.isLit=function()return au._searching end end return aj end)()end,[22]=function()local aa,
ab,ac=a(22)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.Parent.
utility.moveable),ac(ab.Parent.Parent.utility.locale)function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{}local
aj=setmetatable({tab=assert(ah,'Missing argument #1 (Tab expected)'),window=ah.window,name=ai.name or ai.Name or
'Section',icon=ai.icon or ai.Icon},ae)local ak=if#aj.tab.elements==0 then 0 else 13 aj.main=aj.window:Create('Frame',{
Size=UDim2.new(1,-40,0,20+ak),BorderSizePixel=0,Name=aj.name,BackgroundTransparency=1,Parent=aj.tab.tabPage})if ak>0
then aj.window:Create('UIPadding',{PaddingTop=UDim.new(0,ak),Parent=aj.main})end aj.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment
=Enum.VerticalAlignment.Top,Parent=aj.main})if aj.icon then aj.iconLabel=aj.window:Create('ImageLabel',{Image=aj.icon,
Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=aj.main},{ImageColor3
='ContentColor'})end aj.title=aj.window:Create('TextLabel',{Text=ag.t(aj.name),Size=UDim2.fromOffset(0,16),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=aj.main},{TextColor3='ContentColor',
FontFace='Font'})return aj end function ae._setShown(ah,ai,aj)local ak=ah.window ak:_reveal(ah.title,{TextTransparency=
if ai then 0.6 else 1},aj)if ah.iconLabel then ak:_reveal(ah.iconLabel,{ImageTransparency=if ai then 0.65 else 1},aj)end
end af(ae)return ae end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(function(...)local ae=ab.Parent.Parent.
utility local af,ag,ah,ai,aj,ak,al,am,an,ao=ac(ae.variables),ac(ae.image),ac(ae.locale),ac(ab.Parent.tabSelector),ac(ab.
Parent.search),{},0,0.7,0.95,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function ap(aq)
return aq.layout.mode=='sidebar'and aq.profile~=nil and aq.settings.showProfile and af.localPlayer~=nil end
local function aq(ar,as)local at=af.localPlayer if not at then return end ar.profile=ar:Create('Frame',{Name='Profile',
AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1,0,0,as.footerHeight),
BackgroundTransparency=1,Parent=ar.sidebar})ar.profileContainer=ar:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,as.rowInset,0.5,0),Size=UDim2.new(1,-as.rowInset,1,0),BackgroundTransparency=1,Parent=ar.profile})
ar.profileLayout=ar:Create('UIListLayout',{Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=ar.profileContainer})ar.profileAvatar=ar:Create('ImageLabel',{Name='Avatar',Image=ag.
avatar(at.UserId,function(au)if ar.profileAvatar and not ar.unloaded then ag.assign(ar.profileAvatar,'Image',au)end end)
,Size=UDim2.fromOffset(as.avatarSize,as.avatarSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=ar.profileContainer})ar:Create('UICorner',{CornerRadius=UDim.new(1,0
),Parent=ar.profileAvatar})ar.profileLabels=ar:Create('Frame',{Size=UDim2.fromOffset(50,as.avatarSize),AutomaticSize=
Enum.AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=ar.profileContainer})ar:Create('UIListLayout',{
Padding=UDim.new(0,2),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=ar.profileLabels})ar.
profileName=ar:Create('TextLabel',{Text=at.DisplayName,Size=UDim2.fromOffset(50,16),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=ar.profileLabels}
,{TextColor3='TitlingColor',FontFace='Font'})ar.profileSubtitle=ar:Create('TextLabel',{Text='',Size=UDim2.fromOffset(50,
14),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,Visible=false,TextTransparency=1,Parent=ar.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})end
function ak.build(ar,as)ar.sidebar=ar:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),Position=UDim2.
fromScale(0,1),Size=UDim2.new(0,as.railWidth,1,-as.chromeHeight),BackgroundTransparency=1,Visible=false,Parent=ar.main})
ar.tabList=ar:Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,
BorderSizePixel=0,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,
ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,Parent=ar.sidebar})ar:
Create('UIPadding',{PaddingTop=UDim.new(0,as.railPadding),PaddingBottom=UDim.new(0,as.railPadding),Parent=ar.tabList})ar
.tabListLayout=ar:Create('UIListLayout',{Padding=UDim.new(0,as.rowSpacing),FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=ar.tabList})aq(ar,as)ak.reflowProfile(ar)end function ak.reflowProfile(ar)local as,at=ar.
layout,ap(ar)if ar.profile then ar.profile.Visible=at end ar.tabList.Size=UDim2.new(1,0,1,if at then-as.footerHeight
else 0)end function ak.applyWidth(ar,as)local at=ar.layout ar.sidebar.Size=UDim2.new(0,as,1,-at.chromeHeight)ar.elements
.Size=UDim2.new(1,-as,1,-at.chromeHeight)ar.bottomFade.Size=UDim2.new(1,-as,at.fadeSize.Y.Scale,at.fadeSize.Y.Offset)aj.
railWidth(ar,as)local au=as<(at.railWidth::number)for av,aw in ar.tabs do if not aw.neglectSelector then ai.
setRowCollapsed(aw,au,at)end end if ar.profileContainer then ar.profileContainer.Position=UDim2.new(0,if au then 0 else
at.rowInset,0.5,0)ar.profileContainer.Size=UDim2.new(1,if au then 0 else-at.rowInset,1,0)ar.profileLayout.
HorizontalAlignment=if au then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left ar.profileLabels.
Visible=not au end end function ak.setProfileShown(ar,as,at)if not ar.profile or not ar.profile.Visible then return end
local au={[ar.profileAvatar]={ImageTransparency=if as then 0 else 1,BackgroundTransparency=if as then an else 1},[ar.
profileName]={TextTransparency=if as then al else 1},[ar.profileSubtitle]={TextTransparency=if as then am else 1}}for av
,aw in au do if at then af.tweenService:Create(av,at,aw):Play()else for ax,b in aw do av[ax]=b end end end end function
ak.setProfileEnabled(ar,as)if not ar.profile then ar.settings.showProfile=as return end if as then ar.settings.
showProfile=true ak.reflowProfile(ar)ak.setProfileShown(ar,true,ao)return end ak.setProfileShown(ar,false,ao)task.delay(
ao.Time,function()if ar.unloaded or ar.settings.showProfile then return end ak.reflowProfile(ar)end)ar.settings.
showProfile=false end function ak.setSubtitle(ar,as)if not ar.profileSubtitle then return end local at=if type(as)==
'string'and as~=''then ah.resolve(as)else nil ar.profileSubtitle.Text=at or''ar.profileSubtitle.Visible=at~=nil end
return ak end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae={}ae.__index=ae ae.__type=
'Slider'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),
ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)local function an(ao)local ap=0 while ap<6 do local aq=
ao*10^ap if math.abs(aq-math.round(aq))<1e-9 then break end ap+=1 end return ap end local function ao(ap,aq,ar)local as=
ap[1]+math.round((ar-ap[1])/aq)*aq return math.clamp(as,ap[1],ap[2])end local ap,aq,ar,as,at,au=TweenInfo.new(0.45,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),440,Vector2.new(35,20),Vector2.new(41,22)local
av=math.ceil(at.X/2)local function aw(ax:number):UDim2 return UDim2.new(ax,math.round(av*(1-2*ax)),1,0)end
local function ax():UDim2 return UDim2.new(1,0,0.5,0)end local function b(c:number,d:number,e:number):number return math
.clamp((c-d)/e,0,1)end function ae.new(c,d)d=if typeof(d)=='table'then d else{}local e=setmetatable({tab=assert(c,
'Missing argument #1 (Tab expected)'),window=c.window,name=d.name or d.Name or'Slider',icon=d.icon or d.Icon,description
=d.description or d.Description,forgetState=d.forgetState or d.ForgetState or c.forgetState,range=d.range or d.Range or{
0,100},increment=d.increment or d.Increment or 1,suffix=d.suffix or d.Suffix or'',callback=d.callback or d.Callback or
function()end,dragging=false,minimal=d.minimal or d.Minimal or false,_handleWidth=at.X},ae)assert(typeof(e.range)==
'table'and typeof(e.range[1])=='number'and typeof(e.range[2])=='number',
'A slider range needs two numbers, like { 0, 100 }.')if e.range[1]>e.range[2]then e.range={e.range[2],e.range[1]}end if
e.increment<=0 then e.increment=1 end e.value=if(d.value or d.Value)~=nil then(d.value or d.Value)elseif(d.currentValue
or d.CurrentValue)~=nil then(d.currentValue or d.CurrentValue)else e.range[1]e.value=ao(e.range,e.increment,e.value)e.
_decimals=an(e.increment)e.flag=d.flag or d.Flag or(not e.forgetState and ah.deriveFlagFromName(e.name)or nil)e.window:
_registerControl(e)e.main=e.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=e.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=e.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})e.stroke=e.window:StyleElementBody(e.main)e._lastValue=e.value if not e.minimal then e:
_buildLabel()end e.track=e.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=e.main},{BackgroundColor3='SliderBackground'}
)e.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=e.track})e.progress=e.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=e.track})e.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=e.progress})e.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=e.progress},{Color={
'SliderProgress',ah.toColorSequence}})e.progressGlow=e.window:CreateGlow(e.progress,'AccentColor',20,1)e.handle=e.window
:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=ax(),Size=UDim2.fromOffset(at.X,at.Y),BorderSizePixel=0,
ZIndex=50,BackgroundTransparency=1,Parent=e.progress},{BackgroundColor3='SliderHandle'})e.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=e.handle})e.handleGlow=e.window:CreateGlow(e.handle,Color3.fromRGB(255,255,255),10,1)e
.handleStroke=e.window:Create('UIStroke',{Transparency=1,Parent=e.handle},{Color='SliderStroke'})e.interact=e.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=e.
track})e.window:ConnectFor(e,e.main.MouseEnter,function()if not e.window:_interactive()then return end ag.tweenService:
Create(e.track,ap,{BackgroundColor3=e.window.theme.SliderBackgroundHover}):Play()end)e.window:ConnectFor(e,e.main.
MouseLeave,function()ag.tweenService:Create(e.track,ap,{BackgroundColor3=e.window.theme.SliderBackground}):Play()end)e.
window:ConnectFor(e,e.interact.InputBegan,function(f)if f.UserInputType==Enum.UserInputType.MouseButton1 or f.
UserInputType==Enum.UserInputType.Touch then am.click()e.dragging=true e:_setHeld(true)e:_updateFromMouse()if e.
_dragConnection then e._dragConnection:Disconnect()e._dragConnection=nil end e._dragConnection=ag.runService.
RenderStepped:Connect(function()if e.window.unloaded or not e.dragging then if e._dragConnection then e._dragConnection:
Disconnect()e._dragConnection=nil end return end e:_updateFromMouse()end)end end)e.window:ConnectFor(e,ag.
userInputService.InputEnded,function(f)if f.UserInputType==Enum.UserInputType.MouseButton1 or f.UserInputType==Enum.
UserInputType.Touch then e:_endDrag()end end)e.window:ConnectFor(e,ag.userInputService.WindowFocusReleased,function()e:
_endDrag()end)if e.description and not e.minimal then e.descriptor=ac(ab.Parent.descriptor).new(e.tab,{description=e.
description})end e.window:ConnectFor(e,e.main:GetPropertyChangedSignal'AbsoluteSize',function()if e.window.animating or(
e.window.hidden and e.window.hasShownOnce)then return end e:_applyLayout()end)e:_applyLayout()if e.minimal then e.main.
Size=UDim2.new(1,-20,0,41)e.track.AnchorPoint=Vector2.new(0.5,0.5)e.track.Position=UDim2.new(0.5,0,0.5,0)e.track.Size=
UDim2.new(1,-30,0,14)end e:_renderProgress()return e end function ae._buildLabel(c)c.container=c.window:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=c.main})c.containerLayout=c.window:Create('UIListLayout',{Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=c.container})c.
titleContainer=c.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,
Parent=c.container})c.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=c.titleContainer})c.
titleFlex=c.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=c.titleContainer})if c.icon then c.
iconLabel=c.window:Create('ImageLabel',{Image=c.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=c.titleContainer},{ImageColor3='ContentColor'})end c.title=
c.window:Create('TextLabel',{Text=al.t(c.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=c.titleContainer},{TextColor3='ContentColor',FontFace='Font'})c.window:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=c.title})c.valueHost=c.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=c.container})c.valueOdo=ai.new(c.window,c.
valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})c.valueOdo:snap(c:_format(c
.value))end function ae._setMainHeight(c,d)if c._widthManaged then c.main.Size=UDim2.new(c.main.Size.X.Scale,c.main.Size
.X.Offset,0,d)else c.main.Size=UDim2.new(1,-20,0,d)end end function ae._applyLayout(c)if c.minimal then return end local
d=c.main.AbsoluteSize.X local e=if d>0 and d<as then'narrow'else'wide'if c._layoutMode==e then return end c._layoutMode=
e if e=='narrow'then c:_setMainHeight(70)c.container.AnchorPoint=Vector2.new(0,0)c.container.Position=UDim2.new(0,20,0,
14)c.container.Size=UDim2.new(1,-40,0,16)c.containerLayout.FillDirection=Enum.FillDirection.Horizontal c.titleFlex.
FlexMode=Enum.UIFlexMode.Fill c.valueHost.AutomaticSize=Enum.AutomaticSize.X c.valueHost.Size=UDim2.new(0,0,0,16)c.track
.AnchorPoint=Vector2.new(0.5,1)c.track.Position=UDim2.new(0.5,0,1,-14)c.track.Size=UDim2.new(1,-30,0,14)else c:
_setMainHeight(65)c.container.AnchorPoint=Vector2.new(0,0.5)c.container.Position=UDim2.new(0,20,0.5,0)c.container.Size=
UDim2.new(0,170,0,33)c.containerLayout.FillDirection=Enum.FillDirection.Vertical c.titleFlex.FlexMode=Enum.UIFlexMode.
None c.valueHost.AutomaticSize=Enum.AutomaticSize.None c.valueHost.Size=UDim2.new(1,0,0,16)c.track.AnchorPoint=Vector2.
new(1,0.5)c.track.Position=UDim2.new(1,-15,0.5,0)c.track.Size=UDim2.new(0,222,0,14)end end function ae._format(c,d)local
e=string.format('%.'..c._decimals..'f',d)if c.suffix~=''then return e..' '..c.suffix end return e end function ae.
_pillTravel(c)return math.max(c.track.AbsoluteSize.X-av*2,0)end function ae._renderProgress(c,d)local e=c.range[2]-c.
range[1]local f=if e~=0 then math.clamp((c.value-c.range[1])/e,0,1)else 0 local g=aw(f)if d then ag.tweenService:Create(
c.progress,d,{Size=g}):Play()else c.progress.Size=g end end function ae._updateFromMouse(c)local d=c:_pillTravel()if d<=
0 then return end local e=b(ag.userInputService:GetMouseLocation().X,c.track.AbsolutePosition.X+av,d)local f=ao(c.range,
c.increment,c.range[1]+e*(c.range[2]-c.range[1]))if f~=c.value then c.value=f if c.valueOdo then c.valueOdo:snap(c:
_format(f))end c._lastValue=f c:_renderProgress(ar)c:_fireCallback(f)end end function ae._endDrag(c)if not c.dragging
then return end c.dragging=false c:_setHeld(false)if c._dragConnection then c._dragConnection:Disconnect()c.
_dragConnection=nil end c.window:_persist(c)end function ae._setHeld(c,d)if not d then c:_fireCallback(c.value)end local
e=if d then au else at c._handleWidth=e.X ag.tweenService:Create(c.handle,aq,{Size=UDim2.fromOffset(e.X,e.Y),
BackgroundTransparency=if d then 0.7 else 0}):Play()ag.tweenService:Create(c.handleStroke,aq,{Transparency=if d then 0.6
else 1}):Play()c:_renderProgress(aq)end function ae._fireCallback(c,d)c.window:_runGuarded(c,c.callback,d,c.dragging==
true)end function ae.Set(c,d,e)d=ao(c.range,c.increment,d)c.value=d if c.valueOdo then c.valueOdo:to(c:_format(d),d>=(c.
_lastValue or d))end c._lastValue=d c:_renderProgress(ap)if not e then c:_fireCallback(d)c.window:_persist(c)end end
local c=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(d,e,f
)local g=d.window if e then g:_revealCommon(d,f)g:_reveal(d.track,{BackgroundTransparency=0},f)g:_reveal(d.progress,{
BackgroundTransparency=0},f)g:_reveal(d.handle,{BackgroundTransparency=0},f)if d.valueOdo then d.valueOdo:reveal(0.3,f)
end g:_reveal(d.progressGlow,{Transparency=math.max(0.55,g.theme.AccentGlow)},f,c)g:_reveal(d.handleGlow,{Transparency=
0.8},f,c)else g:_hideCommon(d,f)g:_reveal(d.track,{BackgroundTransparency=1},f)g:_reveal(d.progress,{
BackgroundTransparency=1},f)g:_reveal(d.handle,{BackgroundTransparency=1},f)if d.valueOdo then d.valueOdo:reveal(1,f)end
g:_reveal(d.progressGlow,{Transparency=1},f,c)g:_reveal(d.handleGlow,{Transparency=1},f,c)end end function ae.
_refreshTheme(d)ag.tweenService:Create(d.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
,{Transparency=math.max(0.55,d.window.theme.AccentGlow)}):Play()end function ae._minWidth(d)if d.minimal then return 100
end local e=40 if d.icon then e+=22 end e+=ah.textWidth(d.window.theme.Font,16,al.resolve(d.name))e+=12 e+=ah.textWidth(
d.window.theme.Font,15,d:_format(d.value))return math.max(e,160)end aj(ae)ak(ae)return ae end)()end,[25]=function()local
aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.constants),
ac(af.locale),ac(af.log)local an,ao,ap,aq=ak.statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function ar(as)return as.fill.
Keypoints[1].Value end local function as(at)if at>0 then return string.format('+%.1f%%',at)elseif at<0 then return
string.format('%.1f%%',at)else return'0%'end end local function at(au)if typeof(au)~='number'then return tostring(au)end
local av=math.round(math.abs(au))local aw=string.format('%.0f',av)local ax=aw:reverse():gsub('%d%d%d','%0,'):reverse()if
ax:sub(1,1)==','then ax=ax:sub(2)end return if au<0 and av~=0 then'-'..ax else ax end local function au(av)local aw=math
.round(av)if aw>0 then return'+'..at(aw)elseif aw<0 then return at(aw)else return'0'end end function ae.new(av,aw)aw=if
typeof(aw)=='table'then aw else{}local ax=setmetatable({tab=assert(av,'Missing argument #1 (Tab expected)'),window=av.
window,name=aw.name or aw.Name or'Statistic',icon=aw.icon or aw.Icon,description=aw.description or aw.Description,value=
if(aw.value or aw.Value)~=nil then(aw.value or aw.Value)else 0,_hasValue=(aw.value or aw.Value)~=nil,numberEasing=if(aw.
numberEasing~=nil)then aw.numberEasing elseif aw.NumberEasing~=nil then aw.NumberEasing else true,changeMode=aw.
changeMode or aw.ChangeMode or'percentage',changeBaseline=aw.changeBaseline or aw.ChangeBaseline or'previous',prefix=aw.
prefix or aw.Prefix or'',suffix=aw.suffix or aw.Suffix or'',compact=aw.compact or aw.Compact or av.compact or false,
display=(aw.display or aw.Display or'value'),_initialValue=if(aw.value or aw.Value)~=nil then(aw.value or aw.Value)else
nil,_lastChange=0},ae)if ax.compact then ax:_buildCompact()else ax:_buildFull()end if ax.description then if ax.compact
then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{ax.name}'.`)else ax.descriptor=
ac(ab.Parent.descriptor).new(ax.tab,{description=ax.description})end end return ax end function ae._buildFull(av)local
aw=av.window av.main=aw:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=av.name,ZIndex=5,
BackgroundTransparency=1,Parent=av.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})aw:Create('UICorner',{Parent=av.main},{CornerRadius='ElementCornerRadius'})av.stroke=aw:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=av.main},{Transparency='ElementStrokeTransparency'})
av.strokeGradient=aw:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.stroke,Transparency=ao,
Parent=av.stroke})av.titleContainer=aw:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=av.main})av.gradientContainer=aw:Create(
'Frame',{Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=5,Parent=av.main})av.glow=aw:CreateGlow(av.main,ar(an.neutral),13,1)
av.title=aw:Create('TextLabel',{Text=al.t(av.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=19,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,
TextTransparency=1,Parent=av.titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})av.mainGradient=aw:Create(
'UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=ao,Parent=av.gradientContainer})aw
:Create('UICorner',{Parent=av.gradientContainer},{CornerRadius='ElementCornerRadius'})if av.icon then av.iconLabel=aw:
Create('ImageLabel',{Image=av.icon,Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,
ImageTransparency=1,Parent=av.titleContainer},{ImageColor3='ContentColor'})end av.containerLayout=aw:Create(
'UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
av.titleContainer})av.valueHost=aw:Create('Frame',{AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=
UDim2.fromOffset(200,20),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=av.main})av.changeHost=aw:Create(
'Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=av.main})av.valueOdo=ai.new(aw,av.valueHost,{textSize=20,
alignment=Enum.HorizontalAlignment.Left,transparency=1})av.valueOdo:snap(av:_formatValue(av.value))av.changeOdo=ai.new(
aw,av.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,transparency=1})av.changeOdo:snap(av:
_formatChange(0))av._accentGradients={av.strokeGradient,av.mainGradient}end function ae._buildCompact(av)local aw,ax=av.
window,av.tab.compact or false av.main=aw:Create('Frame',{Name=av.name,Size=if ax then UDim2.fromOffset(0,ap)else UDim2.
new(1,-20,0,ap),AutomaticSize=if ax then Enum.AutomaticSize.X else Enum.AutomaticSize.None,ClipsDescendants=true,
BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=av.tab.tabPage},{BackgroundColor3='StatBackground',
BackgroundTransparency='ElementTransparency'})aw:Create('UICorner',{Parent=av.main},{CornerRadius='ElementCornerRadius'}
)av.stroke=aw:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=av.main},{Transparency=
'ElementStrokeTransparency'})av.strokeGradient=aw:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.
neutral.stroke,Transparency=ao,Parent=av.stroke})if ax then aw:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent
=av.main})end aw:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=av.main})av.card=aw:Create('Frame',{
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,ap),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=av.main})aw:Create('UICorner',{Parent=av.card},{CornerRadius=
'ElementCornerRadius'})av.mainGradient=aw:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.
fill,Transparency=ao,Parent=av.card})aw:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),
Parent=av.card})aw:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=av.card})av.
titleContainer=aw:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=
1,BorderSizePixel=0,LayoutOrder=0,ZIndex=6,Parent=av.card})aw:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=av.titleContainer})aw:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=av.titleContainer})if av.icon then av.iconLabel=aw:Create('ImageLabel',{Image=av.icon,Size=
UDim2.fromOffset(20,20),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=av.
titleContainer},{ImageColor3='ContentColor'})end av.title=aw:Create('TextLabel',{Text=al.t(av.name),Size=UDim2.
fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,
Parent=av.titleContainer},{TextColor3='ContentColor',FontFace='Font'})aw:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Shrink,Parent=av.title})av.readoutHost=aw:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18)
,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=av.card})av.readoutOdo=ai.new(aw,av.
readoutHost,{textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})av.readoutOdo:snap(av.display==
'change'and av:_formatChange(0)or av:_formatValue(av.value))av._accentGradients={av.strokeGradient,av.mainGradient}end
function ae._setAccent(av,aw,ax)local b=an[aw]av.strokeGradient.Color=b.stroke av.mainGradient.Color=b.fill if av.glow
then av.glow.Color=ar(b)end local c,d=if ax==1 then 14 elseif ax==-1 then-10 else 2,if ax==1 then Vector2.new(0.04,0.5)
elseif ax==-1 then Vector2.new(-4E-2,0.5)else Vector2.new(0,0.5)for e,f in av._accentGradients do ag.tweenService:
Create(f,aq,{Rotation=c,Offset=d}):Play()end end function ae._formatValue(av,aw)return av.prefix..at(aw)..av.suffix end
function ae._formatChange(av,aw)if av.changeMode=='absolute'then return au(aw)else return as(aw)end end function ae.
_showValue(av,aw,ax,b,c)if av.numberEasing and not c then aw:to(av:_formatValue(ax),ax>=b)else aw:snap(av:_formatValue(
ax))end end function ae._updateFullReadouts(av,aw,ax,b,c,d,e)av:_showValue(av.valueOdo,aw,ax,e)if d then av.changeOdo:
snap(d)av._lastChange=0 elseif av.numberEasing and not c then av.changeOdo:to(av:_formatChange(b),b>=av._lastChange)av.
_lastChange=b else av.changeOdo:snap(av:_formatChange(b or 0))av._lastChange=b or 0 end end function ae.
_updateCompactReadout(av,aw,ax,b,c,d,e)if av.display=='change'then if d then av.readoutOdo:snap(d)av._lastChange=0
elseif av.numberEasing and not c then av.readoutOdo:to(av:_formatChange(b),b>=av._lastChange)av._lastChange=b else av.
readoutOdo:snap(av:_formatChange(b or 0))av._lastChange=b or 0 end else av:_showValue(av.readoutOdo,aw,ax,e)end end
function ae.Set(av,aw)assert(typeof(aw)=='number','Statistic:Set() - value must be a number, got '..typeof(aw))local ax,
b=av.value,not av._hasValue av.value=aw av._hasValue=true if b then av._initialValue=aw end local c=if av.changeBaseline
=='initial'then av._initialValue else ax local d,e,f,g,h=b or c==aw if d then e=0 g='neutral'h=0 elseif c==0 then local
i,j=if aw>0 then'+'else'-',if av.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'f=i..j g=if aw>0 then'positive'
else'negative'h=if aw>0 then 1 else-1 elseif av.changeMode=='percentage'then e=((aw-c)/math.abs(c))*100 h=if e>0 then 1
elseif e<0 then-1 else 0 g=if h==1 then'positive'elseif h==-1 then'negative'else'neutral'else e=aw-c h=if e>0 then 1
elseif e<0 then-1 else 0 g=if h==1 then'positive'elseif h==-1 then'negative'else'neutral'end av:_setAccent(g,h)if av.
compact then av:_updateCompactReadout(aw,ax,e,d,f,b)else av:_updateFullReadouts(aw,ax,e,d,f,b)end end function ae.
ResetBaseline(av,aw)local ax,b,c=av.value,not av._hasValue,if typeof(aw)=='number'then aw else av.value av._initialValue
=c av.value=c av._hasValue=true av._lastChange=0 if av.compact then if av.display=='change'then av.readoutOdo:snap(av:
_formatChange(0))else av:_showValue(av.readoutOdo,c,ax,b)end else av.changeOdo:snap(av:_formatChange(0))av:_showValue(av
.valueOdo,c,ax,b)end av:_setAccent('neutral',0)end function ae._setShown(av,aw,ax)local b=av.window if av.compact then b
:_reveal(av.main,{BackgroundTransparency=if aw then(av.window.theme.ElementTransparency or 0)else 1},ax)b:_reveal(av.
stroke,{Transparency=if aw then av.window.theme.ElementStrokeTransparency else 1},ax)b:_reveal(av.card,{
BackgroundTransparency=if aw then 0 else 1},ax)b:_reveal(av.title,{TextTransparency=if aw then 0 else 1},ax)if av.
iconLabel then b:_reveal(av.iconLabel,{ImageTransparency=if aw then 0 else 1},ax)end av.readoutOdo:reveal(if aw then 0
else 1,ax)return end if aw then b:_revealCommon(av,ax)b:_reveal(av.gradientContainer,{BackgroundTransparency=0},ax)b:
_reveal(av.glow,{Transparency=0.82},ax)av.valueOdo:reveal(0,ax)av.changeOdo:reveal(0,ax)else b:_hideCommon(av,ax)b:
_reveal(av.gradientContainer,{BackgroundTransparency=1},ax)b:_reveal(av.glow,{Transparency=1},ax)av.valueOdo:reveal(1,ax
)av.changeOdo:reveal(1,ax)end end function ae._minWidth(av)local aw=40 if av.icon then aw+=26 end aw+=ah.textWidth(av.
window.theme.Font,16,al.resolve(av.name))local ax=if av.display=='change'then av:_formatChange(0)else av:_formatValue(av
.value)aw+=ah.textWidth(av.window.theme.Font,17,ax)return aw end aj(ae)return ae end)()end,[26]=function()local aa,ab,ac
=a(26)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.Parent.utility local ag,ah
,ai,aj,ak,al,am,an=ac(af.variables),ac(af.constants),ac(af.HapticEngine),ac(af.log),ac(af.columns),ac(ab.Parent.search),
ac(ab.Parent.tabSelector),ac(ab.Parent.column)local function ao(ap,aq)for ar,as in aq do if as.__type=='Group'then ao(ap
,as.elements)else ap:_unregisterControl(as)end if as.connections then for at,au in as.connections do ap:Disconnect(au)
end as.connections=nil end if as._dragConnection then as._dragConnection:Disconnect()as._dragConnection=nil end if ap.
_recordingKeybind==as then ap._recordingKeybind=nil end if as._outsideClickConn then ap:Disconnect(as._outsideClickConn)
as._outsideClickConn=nil end end end local ap,aq=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(ar,as)as=if typeof(as)=='table'then
as else{}local at=setmetatable({window=assert(ar,'Missing argument #1 (Window expected)'),name=as.name or as.Name,icon=
as.icon or as.Icon,neglectSelector=as.neglectSelector or as.NeglectSelector or false,customOrder=as.customOrder or as.
CustomOrder or 0,forgetState=as.forgetState or as.ForgetState or false,elements={},connections={}},ae)assert(at.name or
at.icon,'A tab needs a name or an icon.')if not at.neglectSelector then am.build(at,at.window.layout)end at.tabPage=at.
window:Create('ScrollingFrame',{Name=at.name,Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=
Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=
UDim2.new(0,0,0,0),ScrollBarThickness=ah.pageScrollbar.thickness,ScrollBarImageTransparency=ah.pageScrollbar.
transparency,VerticalScrollBarInset=Enum.ScrollBarInset.None,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=at
.customOrder or 0,Parent=at.window.elements},{ScrollBarImageColor3='ContentColor'})at.tabPageLayout=at.window:Create(
'UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=at.tabPage})at.
window:Create('UIPadding',{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=at.tabPage})at.columnsRow=at.
window:Create('Frame',{Name='Columns',BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size
=UDim2.fromScale(1,0),Parent=at.tabPage})at.columnsLayout=at.window:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Left,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=at.columnsRow})at.Left=an.new(at,'Left')at.Right=an.new(at,'Right')at.left=
at.Left at.right=at.Right at:_layoutColumns()if not at.neglectSelector then table.insert(at.connections,at.window:
Connect(at.topbarItemInteract.MouseButton1Click,function()ai.click()at:Select()end))table.insert(at.connections,at.
window:Connect(at.topbarItemInteract.MouseEnter,function()if not at.window:_interactive()then return end if at.window.
selectedTab~=at then at:_applyVisual('hover',aq)at:_spinGradients()end end))table.insert(at.connections,at.window:
Connect(at.topbarItemInteract.MouseLeave,function()if at.window.selectedTab~=at then at:_applyVisual('unselected',aq)end
end))end return at end function ae._applyVisual(ar,as,at)if ar.neglectSelector or not ar.topbarItem then return end
local au=am.states[ar.window.layout.mode][as]if not au then return end am.applyVisual(ar,au,at)end function ae.
_spinGradients(ar)if ar.neglectSelector then return end local as=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)for at,au in{ar.topbarItemGradient,ar.topbarItemStrokeGradient}do au.Rotation=-270 ag.tweenService:
Create(au,as,{Rotation=90}):Play()end end function ae.Select(ar,as)if ar.window._searching then al.close(ar.window,{
showTabs=true,jumpTo=false})end ar.window.selectedTab=ar ar.window:_jumpTo(ar.tabPage)local at=as or not ar.window:
_interactive()if not ar.neglectSelector and not at then ar:_applyVisual('selected',ap)end for au,av in ar.window.tabs do
if av~=ar.window.selectedTab then av:Deselect(at)end end if ar~=ar.window.rfSettings and ar.window.settingsAction and
not at then ag.tweenService:Create(ar.window.settingsAction.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.6}):Play()end end function ae.Deselect(ar,as)if not ar.neglectSelector and not
as then ar:_applyVisual('unselected',ap)end end function ae.GetColumn(ar,as)local at=ak.resolveSide(as)if not at then aj
.warn(`Rayfield: unknown column '{tostring(as)}', using the left one. Use "Left" or "Right".`)at='Left'end return if at
=='Right'then ar.Right else ar.Left end function ae._columnFor(ar,as)if typeof(as)~='table'then return ar.Left end
return ar:GetColumn(as.side or as.Side or as.column or as.Column)end function ae._layoutColumns(ar)local as,at=ar.Left,
ar.Right if not as or not at or not ar.columnsRow then return end local au=ar.window local av=if au.size then ak.
pageWidth(au.size.X.Offset,au.layout)else 0 local aw,ax,b=ak.shouldStack(av),#as.elements>0,#at.elements>0 as.main.
Visible=ax at.main.Visible=b ar.stacked=aw if aw or not(ax and b)then ar.columnsLayout.FillDirection=Enum.FillDirection.
Vertical ar.columnsLayout.Padding=UDim.new(0,if ax and b then 20 else 0)as.main.Size=UDim2.fromScale(1,0)at.main.Size=
UDim2.fromScale(1,0)else ar.columnsLayout.FillDirection=Enum.FillDirection.Horizontal ar.columnsLayout.Padding=UDim.new(
0,-ak.overlap)as.main.Size=UDim2.new(0.5,ak.overlap/2,0,0)at.main.Size=UDim2.new(0.5,ak.overlap/2,0,0)end end function
ae.CreateButton(ar,as)return ar:_columnFor(as):CreateButton(as)end function ae.CreateToggle(ar,as)return ar:_columnFor(
as):CreateToggle(as)end function ae.CreateSwitch(ar,as)return ar:CreateToggle(as)end function ae.CreateSection(ar,as)
return ar:_columnFor(as):CreateSection(as)end function ae.CreateText(ar,as)return ar:_columnFor(as):CreateText(as)end
function ae.CreateDivider(ar,as)return ar:_columnFor(as):CreateDivider(as)end function ae.CreateProgress(ar,as)return ar
:_columnFor(as):CreateProgress(as)end function ae.CreateConsole(ar,as)return ar:_columnFor(as):CreateConsole(as)end
function ae.CreateChat(ar,as)return ar:_columnFor(as):CreateChat(as)end function ae.CreateStat(ar,as)return ar:
_columnFor(as):CreateStat(as)end function ae.CreateSlider(ar,as)return ar:_columnFor(as):CreateSlider(as)end function ae
.CreateDropdown(ar,as)return ar:_columnFor(as):CreateDropdown(as)end function ae.CreateInput(ar,as)return ar:_columnFor(
as):CreateInput(as)end function ae.CreateKeybind(ar,as)return ar:_columnFor(as):CreateKeybind(as)end function ae.
CreateColorPicker(ar,as)return ar:_columnFor(as):CreateColorPicker(as)end function ae.CreateGroup(ar,as)return ar:
_columnFor(as):CreateGroup(as)end function ae.Remove(ar)local as=ar.window if as._searching then al.close(as,{showTabs=
true,jumpTo=as.selectedTab and as.selectedTab.tabPage})end local at=table.find(as.tabs,ar)if at then table.remove(as.
tabs,at)end if as.selectedTab==ar then as.selectedTab=nil for au,av in ipairs(as.tabs)do if not av.neglectSelector then
av:Select()break end end end ao(as,ar.elements)for au,av in ar.connections do as:Disconnect(av)end ar.connections={}if
ar.topbarItem then as:DestroySubtree(ar.topbarItem)end if ar.tabPage then as:DestroySubtree(ar.tabPage)end ar.topbarItem
=nil ar.tabPage=nil ar.columnsRow=nil ar.elements={}for au,av in{ar.Left,ar.Right}do av.elements={}end end return ae end
)()end,[27]=function()local aa,ab,ac=a(27)local ad return(function(...)local ae={}ae.__index=ae ae.__type='TabSection'
local af,ag,ah,ai,aj=ac(ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.utility.log),20,6,3 local function ak(al)
for am,an in al.tabs do if not an.neglectSelector then return true end end return#al.tabSections>0 end function ae.new(
al,am)am=if typeof(am)=='table'then am else{}local an=setmetatable({window=assert(al,
'Missing argument #1 (Window expected)'),name=am.name or am.Name or'Section',icon=am.icon or am.Icon},ae)if al.layout.
mode~='sidebar'then if not al._warnedTabSection then al._warnedTabSection=true ag.warn
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
topbarItemInitial then ao.topbarItemInitial.Visible=ap end local ar=if ap then 0 else aq.rowPadding ao.
topbarItemContainer.Size=UDim2.new(1,-ar,0,24)ao.topbarItemContainer.Position=UDim2.new(0,ar,0.5,0)ao.topbarItemLayout.
HorizontalAlignment=if ap then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end function ai.
applyVisual(ao,ap,aq)local ar={[ao.topbarItem]={BackgroundTransparency=ap.background},[ao.topbarItemStroke]={
Transparency=ap.stroke}}if ao.topbarItemIcon then ar[ao.topbarItemIcon]={ImageTransparency=ap.content}end if ao.
topbarItemTitle then ar[ao.topbarItemTitle]={TextTransparency=ap.content}end if ao.topbarItemInitial then ar[ao.
topbarItemInitial]={TextTransparency=ap.content}end if ao.topbarItemShadow and ap.shadow then ar[ao.topbarItemShadow]={
Transparency=ap.shadow}end for as,at in ar do if aq then af.tweenService:Create(as,aq,at):Play()else for au,av in at do
as[au]=av end end end end return ai end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae={
}ae.__index=ae ae.__type='Tag'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=ac(af.variables),ac(af.functions),
ac(af.image),Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.
new(al,am)am=if typeof(am)=='table'then am else{}local an=setmetatable({window=assert(al,
'Missing argument #1 (Window expected)'),text=am.text or am.Text or am.title or am.Title,icon=am.icon or am.Icon,color=
am.color or am.Color or aj},ae)assert(an.icon or(an.text and an.text~=''),'A Tag requires an icon, text, or both.')an.
main=an.window:Create('Frame',{Name='Tag',Size=UDim2.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,
BackgroundColor3=an.color,BorderSizePixel=0,LayoutOrder=am.order or am.Order or 0,BackgroundTransparency=1,Parent=an.
window.tagContainer})an.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=an.main})an.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=an.main})an.window:Create('UIListLayout',{
Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=an.main})local ao=ah.contrastColor(an.color)an.iconLabel=an.window:Create(
'ImageLabel',{Name='Icon',Image=an.icon or'',ImageColor3=ao,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,
Visible=an.icon~=nil,ZIndex=5,ImageTransparency=1,Parent=an.main})an.title=an.window:Create('TextLabel',{Name='Title',
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,
Text=an.text or'',TextColor3=ao,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,RichText=true,
Visible=an.text~=nil and an.text~='',LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=an.main},{FontFace='Font'})an.
window.tagContainer.Visible=true if not an.window.hidden then an:_setShown(true,ak)end return an end function ae.
_setShown(al,am,an)local ao,ap=if am then 0 else 1,if typeof(an)=='TweenInfo'then an elseif an then ak else nil if ap
then ag.tweenService:Create(al.main,ap,{BackgroundTransparency=ao}):Play()ag.tweenService:Create(al.iconLabel,ap,{
ImageTransparency=ao}):Play()ag.tweenService:Create(al.title,ap,{TextTransparency=ao}):Play()else al.main.
BackgroundTransparency=ao al.iconLabel.ImageTransparency=ao al.title.TextTransparency=ao end end function ae.SetColor(al
,am)al.color=am local an=ah.contrastColor(am)ag.tweenService:Create(al.main,ak,{BackgroundColor3=am}):Play()ag.
tweenService:Create(al.iconLabel,ak,{ImageColor3=an}):Play()ag.tweenService:Create(al.title,ak,{TextColor3=an}):Play()
end function ae.SetText(al,am)al.text=am al.title.Text=am or''al.title.Visible=am~=nil and am~=''end function ae.SetIcon
(al,am)al.icon=am ai.assign(al.iconLabel,'Image',am)al.iconLabel.Visible=am~=nil end function ae.Set(al,am)if am.color
or am.Color then al:SetColor(am.color or am.Color)end if am.text or am.Text or am.title or am.Title then al:SetText(am.
text or am.Text or am.title or am.Title)end if am.icon~=nil or am.Icon~=nil then al:SetIcon(am.icon or am.Icon)end end
function ae.Remove(al)al.window:DestroySubtree(al.main)local am=table.find(al.window.tags,al)if am then table.remove(al.
window.tags,am)end if#al.window.tags==0 then al.window.tagContainer.Visible=false end end return ae end)()end,[30]=
function()local aa,ab,ac=a(30)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Text'local af,ag,ah,ai,aj
=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale),16,14,0.45 function ae.new(ak,al)al=if
typeof(al)=='table'then al else{}local am=setmetatable({tab=assert(ak,'Missing argument #1 (Tab expected)'),window=ak.
window,name=tostring(al.name or al.Name or''),text=tostring(al.text or al.Text or''),icon=al.icon or al.Icon},ae)am.main
=am.window:Create('Frame',{Size=UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name=if am.
name~=''then am.name else'Text',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.
tabPage},{BackgroundTransparency='ElementTransparency'})am.stroke=am.window:StyleElementBody(am.main)am.window:Create(
'UIPadding',{PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,
20),Parent=am.main})am.window:Create('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=
am.main})am.titleRow=am.window:Create('Frame',{Name='Title',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=1,Parent=am.main})am.window:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.
VerticalAlignment.Top,Parent=am.titleRow})if am.icon then am.iconLabel=am.window:Create('ImageLabel',{Image=am.icon,Size
=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=am.titleRow},{ImageColor3
='ContentColor'})end am.title=am.window:Create('TextLabel',{Text=ag.t(am.name),Size=UDim2.new(1,if am.icon then-22 else
0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ah,
TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,TextTransparency=1,Parent=am.titleRow},{
TextColor3='TitlingColor',FontFace='Font'})am.body=am.window:Create('TextLabel',{Text=ag.t(am.text),Size=UDim2.new(1,0,0
,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ai,TextWrapped=
true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=am.main},{TextColor3='ContentColor'
,FontFace='Font'})am:_applyPresence()return am end function ae._applyPresence(ak)ak.titleRow.Visible=ak.name~=''or ak.
icon~=nil ak.body.Visible=ak.text~=''end function ae.Set(ak,al)ak.text=tostring(al)ak.window:_bindLocale(ak.body,'Text',
ak.text)ak:_applyPresence()end function ae.SetTitle(ak,al)ak.name=tostring(al)ak.window:_bindLocale(ak.title,'Text',ak.
name)ak:_applyPresence()end function ae._setShown(ak,al,am)if al then ak.window:_revealCommon(ak,am)else ak.window:
_hideCommon(ak,am)end ak.window:_reveal(ak.body,{TextTransparency=if al then aj else 1},am)end af(ae)return ae end)()end
,[31]=function()local aa,ab,ac=a(31)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.
Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,b,c,d,e,f,g=ac(af.variables),ac(af.
functions),ac(af.constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.
new(0.5,0,0.5,-180),UDim2.new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function h(i)return math.clamp(#i*0.06+3,3,9)
end local function i(j)if type(j)=='number'then return'rbxassetid://'..tostring(j)end return j end function ae.new(j,k,l
)k=if typeof(k)=='table'then k else{}local m=setmetatable({window=assert(j,'Missing argument #1 (Window expected)'),
title=k.title or k.Title or'',subtitle=k.subtitle or k.Subtitle,icon=k.icon or k.Icon,avatar=k.avatar or k.Avatar,
minWidth=k.minWidth or k.MinWidth,subtitleAbove=k.subtitleAbove or k.SubtitleAbove or false,position=k.position or'Top',
_hovered=false,_dismissed=false},ae)m.duration=k.duration or k.Duration or h(m.title..(m.subtitle or''))local n=m.avatar
~=nil and m.avatar~=0 local o=n or(m.icon~=nil and m.icon~=0 and m.icon~='')m._iconImage=if n then aj.avatar(m.avatar,
function(p)if m.iconLabel and not m._dismissed and m.main.Parent then aj.assign(m.iconLabel,'Image',p)end end)elseif o
then i(m.icon)else nil m._iconSize=if n then ar else aq m._leftPad=if n then au else as m._rightPad=if n then av else at
m._minWidth=math.clamp(m.minWidth or 0,b,c)local p=m.subtitle~=nil and m.subtitle~=''m.main=m.window:Create('Frame',{
Name='Toast',BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=l or m.
window.toasts})m.window:Create('UIPadding',{PaddingTop=UDim.new(0,ax),Parent=m.main})m.body=m.window:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=if m.position=='Bottom'then f else e,
AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=m.
main})m.window:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=m.body},{Color={'WindowColor',ah.
toColorSequence}})m.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=m.body})m.stroke=m.window:Create(
'UIStroke',{Transparency=1,Parent=m.body},{Color='SurfaceStroke'})m.shadow=m.window:CreateGlow(m.body,'ShadowColor',20,1
)m.window:Create('UIPadding',{PaddingLeft=UDim.new(0,m._leftPad),PaddingRight=UDim.new(0,m._rightPad),Parent=m.body})m.
window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.
Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,aw),
Parent=m.body})if o then m.iconLabel=m.window:Create('ImageLabel',{Image=m._iconImage,Size=UDim2.fromOffset(m._iconSize,
m._iconSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,
BackgroundTransparency=1,ImageTransparency=1,Parent=m.body},if n then nil else{ImageColor3='ContentColor'})m.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=m.iconLabel})end m.container=m.window:Create('Frame',{AutomaticSize
=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,p and 32 or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,
ZIndex=ai.zIndex.toastContent,Parent=m.body})m.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=m.
container})m.titleLabel=m.window:Create('TextLabel',{Text=m.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,16),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if m.
subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=m.container},{TextColor3=
'ContentColor',FontFace='TitleFont'})if p then m.subtitleLabel=m.window:Create('TextLabel',{Text=m.subtitle,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=if m.subtitleAbove then 1 else 2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent
=m.container},{TextColor3='ContentColor',FontFace='Font'})end m.window._toastCount=(m.window._toastCount or 0)+1 m.main.
LayoutOrder=-m.window._toastCount local q=m.window._liveToasts if not q then q={}m.window._liveToasts=q end local r=q[m.
main.Parent]if not r then r={}q[m.main.Parent]=r end m._live=r table.insert(r,m)while#r>d do local s=table.remove(r,1)if
s and s~=m then task.spawn(s._dismiss,s)end end m._connections={m.window:Connect(m.body.MouseEnter,function()m._hovered=
true end),m.window:Connect(m.body.MouseLeave,function()m._hovered=false end),m.window:Connect(m.body.InputBegan,function
(s)if s.UserInputType==Enum.UserInputType.MouseButton1 or s.UserInputType==Enum.UserInputType.Touch then m:_dismiss()end
end)}task.spawn(function()m:_show()end)return m end function ae._measure(j)local k,l=ah.textWidth(j.window.theme.
TitleFont,16,j.title),if j.subtitleLabel then ah.textWidth(j.window.theme.Font,14,j.subtitle)else 0 local m,n=math.max(k
,l),if j.iconLabel then j._leftPad+j._iconSize+aw else j._leftPad local o=math.clamp(n+m+j._rightPad,j._minWidth,c)if n+
m+j._rightPad>c then local p=c-n-j._rightPad for q,r in{j.titleLabel,j.subtitleLabel}do if r then r.AutomaticSize=Enum.
AutomaticSize.None r.TextTruncate=Enum.TextTruncate.AtEnd r.Size=UDim2.fromOffset(p,r.Size.Y.Offset)end end end local p=
if j.subtitleLabel then 31 else 16 local q=math.max(p,if j.iconLabel then j._iconSize else 0)+18 return o,q end function
ae._show(j)if not j.main.Parent then return end ak.notify()local k,l=j:_measure()if j._dismissed or not j.main.Parent
then return end j.main.Size=UDim2.new(0,k,0,0)ag.tweenService:Create(j.main,am,{Size=UDim2.new(0,k,0,l+ax)}):Play()ag.
tweenService:Create(j.body,al,{Position=g}):Play()ag.tweenService:Create(j.body,an,{BackgroundTransparency=0}):Play()ag.
tweenService:Create(j.stroke,an,{Transparency=0.9}):Play()ag.tweenService:Create(j.shadow,ao,{Transparency=0.6}):Play()
ag.tweenService:Create(j.titleLabel,ao,{TextTransparency=0}):Play()task.wait(0.05)if j._dismissed or not j.main.Parent
then return end if j.iconLabel then ag.tweenService:Create(j.iconLabel,ao,{BackgroundTransparency=0.95}):Play()ag.
tweenService:Create(j.iconLabel,ao,{ImageTransparency=0}):Play()end task.wait(0.05)if j._dismissed or not j.main.Parent
then return end if j.subtitleLabel then ag.tweenService:Create(j.subtitleLabel,ao,{TextTransparency=0.5}):Play()end
local m=0 while m<j.duration and not j._dismissed and j.main.Parent do local n=task.wait()if not j._hovered then m+=n
end end j:_dismiss()end function ae._dismiss(j)if j._dismissed then return end j._dismissed=true local k=j._live local l
=k and table.find(k,j)if k and l then table.remove(k,l)end if not j.main.Parent then return end ag.tweenService:Create(j
.body,an,{BackgroundTransparency=1}):Play()ag.tweenService:Create(j.stroke,an,{Transparency=1}):Play()ag.tweenService:
Create(j.shadow,ao,{Transparency=1}):Play()ag.tweenService:Create(j.titleLabel,ao,{TextTransparency=1}):Play()if j.
subtitleLabel then ag.tweenService:Create(j.subtitleLabel,ao,{TextTransparency=1}):Play()end if j.iconLabel then ag.
tweenService:Create(j.iconLabel,ao,{ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(j.
body,ap,{Size=UDim2.new(1,-60,1,0)}):Play()local m=ag.tweenService:Create(j.main,ap,{Size=UDim2.new(0,j.main.Size.X.
Offset,0,0)})m:Play()m.Completed:Wait()if not j.main.Parent then return end for n,o in j._connections do j.window:
Disconnect(o)end j.window:DestroySubtree(j.main)end return ae end)()end,[32]=function()local aa,ab,ac=a(32)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al
=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(am,
an)an=if typeof(an)=='table'then an else{}local ao=setmetatable({tab=assert(am,'Missing argument #1 (Tab expected)'),
window=am.window,name=an.name or an.Name or'Switch',icon=an.icon or an.Icon,description=an.description or an.Description
,forgetState=an.forgetState or an.ForgetState or am.forgetState,compact=am.compact or false,flag=an.flag or an.Flag or(
not(an.forgetState or an.ForgetState or am.forgetState)and ah.deriveFlagFromName(an.name or an.Name or'Switch')or nil),
callback=an.callback or an.Callback or function()end,value=if(an.value or an.Value)~=nil then(an.value or an.Value)else
false},ae)ao.window:_registerControl(ao)if ao.compact then ao:_buildCompact()else ao:_buildFull()end if ao.description
and not ao.compact then ao.descriptor=ac(ab.Parent.descriptor).new(ao.tab,{description=ao.description})end return ao end
function ae._buildSwitch(am,an)local ao=am.window am.functionContainer=ao:Create('Frame',{BorderSizePixel=0,Size=UDim2.
fromOffset(50,21),BackgroundTransparency=1,Parent=an},{BackgroundColor3='ToggleTrack'})ao:Create('UICorner',{
CornerRadius=UDim.new(0,15),Parent=am.functionContainer})am.containerStroke=ao:Create('UIStroke',{Transparency=1,Parent=
am.functionContainer},{Color='SurfaceStroke'})am.indicator=ao:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(25
,17),Position=am.value and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=am.value and am.window.theme.AccentColor or am.window.theme.ToggleKnobOff,BackgroundTransparency=1,
Parent=am.functionContainer})ao:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=am.indicator})am.indicatorStroke=ao
:Create('UIStroke',{Color=am.value and am.window.theme.AccentStroke or Color3.fromRGB(255,255,255),Transparency=1,Parent
=am.indicator})am.indicatorGlow=ao:CreateGlow(am.indicator,'AccentColor',20,1)am.overlay=ao:Create('Frame',{
BorderSizePixel=0,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=Vector2.new(0,0),BackgroundColor3=
Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.functionContainer},{Visible='DarkToggleOverlay'})ao:
Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=am.overlay})am.overlayGradient=ao:Create('UIGradient',{Rotation=90
,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(30,30,30))},Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0.35)},
Parent=am.overlay})return am.functionContainer end function ae._performToggle(am)al.click()am.value=not am.value am:
_animateIndicator()am.window:_runGuarded(am,am.callback,am.value)am.window:_persist(am)end function ae._buildFull(am)
local an=am.window am.main=an:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=am.name,BackgroundColor3
=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})am.stroke=an:StyleElementBody(am.main)am.hoverOverlay=an:CreateHoverOverlay(am.main)am.container=
an:Create('Frame',{BorderSizePixel=0,Parent=am.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),
AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})am.containerLayout=an:Create('UIListLayout',{Padding=UDim.new(0
,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum
.HorizontalAlignment.Left,Parent=am.container})if am.icon then am.iconLabel=an:Create('ImageLabel',{Image=am.icon,Size=
UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=am.container},{ImageColor3
='ContentColor'})end am.title=an:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
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
EasingDirection.Out,0,false,0.35)function ae._setShown(ao,ap,aq)local ar=ao.window if ap then ar:_revealCommon(ao,aq)ar:
_reveal(ao.indicator,{BackgroundColor3=ao.value and ar.theme.AccentColor or ar.theme.ToggleKnobOff,
BackgroundTransparency=ao.value and 0 or ar.theme.ToggleKnobOffTransparency},aq,am)ar:_reveal(ao.indicatorStroke,{Color=
ao.value and ar.theme.AccentStroke or Color3.fromRGB(255,255,255),Transparency=ao.value and 0 or 0.7},aq,am)ar:_reveal(
ao.indicatorGlow,{Transparency=ao.value and ar.theme.AccentGlow or 1},aq,an)ar:_reveal(ao.overlay,{
BackgroundTransparency=0},aq,am)ar:_reveal(ao.containerStroke,{Transparency=0.85},aq,am)ar:_reveal(ao.functionContainer,
{BackgroundTransparency=ar.theme.ToggleTrackTransparency},aq,am)else ar:_hideCommon(ao,aq)ar:_reveal(ao.indicator,{
BackgroundTransparency=1},aq,am)ar:_reveal(ao.indicatorStroke,{Transparency=1},aq,am)ar:_reveal(ao.indicatorGlow,{
Transparency=1},aq,an)ar:_reveal(ao.overlay,{BackgroundTransparency=1},aq,am)ar:_reveal(ao.containerStroke,{Transparency
=1},aq,am)ar:_reveal(ao.functionContainer,{BackgroundTransparency=1},aq,am)end end function ae._refreshTheme(ao)local ap
,aq,ar=ao.window.theme,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService ar:Create(ao.
functionContainer,aq,{BackgroundTransparency=ap.ToggleTrackTransparency}):Play()ar:Create(ao.indicator,aq,{
BackgroundColor3=ao.value and ap.AccentColor or ap.ToggleKnobOff,BackgroundTransparency=ao.value and 0 or ap.
ToggleKnobOffTransparency}):Play()ar:Create(ao.indicatorStroke,aq,{Color=ao.value and ap.AccentStroke or Color3.fromRGB(
255,255,255)}):Play()if ao.indicatorGlow then ar:Create(ao.indicatorGlow,aq,{Transparency=ao.value and ap.AccentGlow or
1}):Play()end end function ae._minWidth(ao)local ap=90 if ao.icon then ap+=21 end ap+=ah.textWidth(ao.window.theme.Font,
16,ak.resolve(ao.name))return ap end ai(ae)aj(ae)function ae.Set(ao,ap,aq)local ar=ao.value~=ap ao.value=ap if ar then
ao:_animateIndicator()end if not aq then ao.window:_runGuarded(ao,ao.callback,ao.value)ao.window:_persist(ao)end end
return ae end)()end,[33]=function()local aa,ab,ac=a(33)local ad return(function(...)local ae=ab.Parent.Parent.utility
local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at=ac(ae.image),ac(ae.functions),ac(ae.persistence),ac(ae.constants),ac(
ae.locale),ac(ae.log),ac(ae.HapticEngine),ac(ae.windowSizing),ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.Parent.search),
ac(ab.Parent.sidebar),ac(ae.variables),ab.Parent.Parent.themes,{}at.__index=at local au,av,aw,ax,b=TweenInfo.new(0.4,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.new(0.5,0,
0,20),UDim2.new(0.5,0,0,12)local c,d,e,f,g,h,i,j,k=UDim2.new(0.5,0,0,ax.Y.Offset+av.Y.Offset+12),TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2 local function l(m,n):(UDim2,number)local o=ar.
workspace.CurrentCamera local p=o and o.ViewportSize local q=n or am.scaleFor(p,m)return am.fit(if p then p/q else nil,m
),q end local m,n={'TopLeftRadius','TopRightRadius','BottomLeftRadius','BottomRightRadius'},(function()return(pcall(
function()local m=Instance.new'UICorner'm.TopLeftRadius=UDim.new(0,1)m:Destroy()end))end)()local function o(p)return if
p then an.sidebar else an.top end local p={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,
TabBackground=true,TabStroke=true,SliderProgress=true}local function q(r,s)if p[r]and typeof(s)=='Color3'then return
ColorSequence.new(s)end return s end local function r(s)return if typeof(s)=='ColorSequence'then s.Keypoints[1].Value
else s end local function s(t,u)local v=t._toastsTop if not v then return end local w=if t._collapsedShown then c else b
if not u or v.Position==w then v.Position=w return end ar.tweenService:Create(v,d,{Position=w}):Play()end local function
t(u,v)local w=0.299*u.R+0.587*u.G+0.114*u.B local x=if w>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return u:Lerp(x
,v)end local function u(v,w)if w.ElementGradient then local x=r(v.ElementGradient)if w.ElementStroke==nil then v.
ElementStroke=t(x,0.28)end if w.ElementStrokeGradient==nil then v.ElementStrokeGradient=ColorSequence.new(t(x,0.4))end
if w.ElementStrokeHover==nil then v.ElementStrokeHover=t(x,0.52)end end if w.TabBackground and w.TabStroke==nil then v.
TabStroke=ColorSequence.new(t(r(v.TabBackground),0.4))end end local function v(w)if typeof(w)~='string'then return nil
end for x,y in ai.builtInThemes do if string.lower(y)==string.lower(w)then return y end end return nil end
local function w(x)if typeof(x)=='table'then return x elseif typeof(x)=='string'then local y=as:FindFirstChild(string.
lower(x))if y then return ac(y)end ak.warn("Rayfield: unknown theme '"..x.."', using default")elseif x~=nil then ak.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(as.default)end
local function x(y)local z,A=table.clone(ac(as.default)),w(y)for B,C in A do z[B]=q(B,C)end if typeof(y)=='table'then u(
z,A)end local B=if typeof(y)=='table'then y else nil if not(B and(B.Font or B.font))then z.Font=ar.brandFont(Enum.
FontWeight.Medium)end if not(B and(B.TitleFont or B.titleFont))then z.TitleFont=ar.brandFont(Enum.FontWeight.SemiBold)
end return z end function at.new(y)y=if typeof(y)=='table'then y else{}if y.translations or y.Translations then aj.
register(y.translations or y.Translations)end if y.translator or y.Translator then aj.translator=y.translator or y.
Translator end aj.setActive(y.locale or y.Locale or aj.detect())local z=y.fallbackFont or y.FallbackFont if z then ar.
setFallbackFont(z)end local A,B=o(y.sidebarLayout or y.SidebarLayout),y.scale or y.Scale if B~=nil and(typeof(B)~=
'number'or B<=0)then ak.warn[[Rayfield: scale must be a number above 0, using automatic scaling]]B=nil end local C,D=l(A
.mode,B)local E=setmetatable({name=y.name or y.Name or'Rayfield Window',subheading=y.subtitle or y.Subtitle,layout=A,
size=C,scale=D,fixedScale=B,instances={},connections={},icon=y.icon or y.Icon,showName=y.showName or y.ShowName or
'Rayfield',showIcon=y.showIcon or y.ShowIcon or ai.icons.rayfield,showIconOnly=y.showIconOnly or y.ShowIconOnly or false
,profileText=y.profile or y.Profile,themeProperties={},_scaledSurfaces={},actions={},localeProperties={},tabs={},
tabSections={},tags={},selectedTab=nil,theme=x(y.theme or y.Theme),themeName=v(y.theme or y.Theme)or'Default',controls={
},configuration=(function()local E=y.configuration or y.Configuration if not E then return{}end return{autoSave=E.
autoSave or E.AutoSave,autoLoad=E.autoLoad or E.AutoLoad,fileName=E.fileName or E.FileName,customFolder=E.customFolder
or E.CustomFolder}end)()},at)E.Flags=setmetatable({},{__index=function(F,G)local H=E.controls[G]return H and H.value end
,__newindex=function(F,G,H)local I=E.controls[G]if not I then ak.warn("Rayfield: no flag '"..tostring(G).."' to set")
return end I:Set(H)end,__iter=function()local F return function()local G F,G=next(E.controls,F)if F then return F,G.
value end return nil end end})E.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast
=true,haptics=true,showProfile=true,theme=nil}E.screenGui=E:Create('ScreenGui',{Name=ar.httpService:GenerateGUID(false),
IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.
ZIndexBehavior.Global,Parent=ar.guiContainer})E.main=E:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name
=E.name,ZIndex=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((E.size.X.Offset
-50),0),BackgroundTransparency=1,Visible=false,Parent=E.screenGui})E.uiScale=E:Create('UIScale',{Scale=E.scale,Parent=E.
main})E.drag=ac(ab.Parent.drag).new(E)E.windowCorner=E:Create('UICorner',{Parent=E.main},{CornerRadius='CornerRoundness'
})E.windowStroke=E:Create('UIStroke',{Transparency=1,Parent=E.main},{Color='SurfaceStroke'})E.windowGradient=E:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=E.main},{Color={'WindowColor',ag.toColorSequence}})E.
bottomFade=E:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,AnchorPoint=Vector2.new(1,1)
,Position=UDim2.fromScale(1,1),Size=E.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,BackgroundTransparency=1,Parent=E.main
})E.bottomFadeCorner=E:_roundCorners(E.bottomFade,E.layout.fadeCorners)E.bottomFadeGradient=E:Create('UIGradient',{
Rotation=270,Offset=Vector2.new(0,0.2),Transparency=E.layout.fadeTransparency,Parent=E.bottomFade},{Color={'WindowColor'
,function(F)return ColorSequence.new(ag.toColorSequence(F).Keypoints[1].Value)end}})E.topbar=E:Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,E.layout.topbarHeight),Active=true,Parent=E.main})E.topContainer=E:Create(
'Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,Parent=E.topbar})E.topContainerLayout=E:Create('UIListLayout',{Padding=UDim.
new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment
=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=E.topContainer})E.titleContainer=E:Create(
'Frame',{Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=E.topContainer})E.titleContainerLayout=E:Create(
'UIListLayout',{Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=E.titleContainer})if E.name then E.title=E:Create('TextLabel',{Text=
aj.t(E.name),FontFace=ar.brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize
.X,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,
Parent=E.titleContainer},{FontFace='Font',TextColor3='TitlingColor'})end if E.icon then E.topbarIcon=E:Create(
'ImageLabel',{Image=E.icon,BackgroundTransparency=1,Size=UDim2.fromOffset(32,32),ImageTransparency=1,Parent=E.
topContainer},{ImageColor3='TitlingColor'})end if E.subheading then E.subtitle=E:Create('TextLabel',{Text=aj.t(E.
subheading),Size=UDim2.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=E.titleContainer},{TextColor3=
'TitlingColor',FontFace='Font'})end E.tagContainer=E:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0
,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,LayoutOrder=2,
Visible=false,Parent=E.topContainer})E.tagContainerLayout=E:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Parent=E.tagContainer})E.windowShadow=E:CreateGlow(E.main,'ShadowColor',20,1)E.elements=E:Create('Frame',{Size=UDim2.
new(1,0,1,-E.layout.chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,Parent=E.main})if E.layout.mode==
'sidebar'then E.elementsCorner=E:_roundCorners(E.elements,E.layout.cardCorners)E.elementsStroke=E:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=E.elements},{Color='SurfaceStroke'})E:Create(
'UIGradient',{Rotation=E.layout.cardStrokeRotation,Transparency=E.layout.cardStrokeTransparency,Parent=E.elementsStroke}
)end E.elementsLayout=E:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=E.layout.pageDirection,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.
EasingStyle.Exponential,TweenTime=0.4,Parent=E.elements})if E.layout.mode=='sidebar'then aq.build(E,E.layout)aq.
applyWidth(E,an.railWidthFor(E.layout,E.size.X.Offset))else E.tabList=E:Create('ScrollingFrame',{Name='Tabs',Active=true
,Size=UDim2.new(1,0,0,E.layout.tabStripHeight),Position=UDim2.new(0.5,0,0,E.layout.tabStripTop),AnchorPoint=Vector2.new(
0.5,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=E.main})E.
tabListLayout=E:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=E.tabList})E:Create('UIPadding',{PaddingLeft=UDim.new(0,22),PaddingRight=UDim.new(0,10),
Parent=E.tabList})end E.actionContainer=E:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,Parent=E.topbar})E.
actionsListLayout=E:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=E.actionContainer})E.rfSettings=E:CreateTab{name='Rayfield Settings',customOrder=1000,
neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(E,{name='Close',icon=ai.icons.close,order=1,callback=
function()E:ToggleHide()end})E.minimiseAction=ac(ab.Parent.action).new(E,{name='Minimise',icon=ai.icons.minimise,order=2
,callback=function()E:ToggleMinimise()end})E.settingsAction=ac(ab.Parent.action).new(E,{name='Settings',icon=ai.icons.
settings,order=3,linkedTab=E.rfSettings,callback=function()E.rfSettings:Select()end})ap.build(E)E:_applyRailWidth()E.
unloaded=false E.minimised=false E.hidden=true E.animating=false E._revealing=false E.hasShownOnce=false E.
_collapsedShown=false E:LoadSettings()if E.settings.theme then E:ChangeTheme(E.settings.theme)end if E.layout.mode==
'sidebar'then aq.reflowProfile(E)aq.setSubtitle(E,E.profileText)end al.setContainer(E.screenGui)al.setEnabled(E.settings
.haptics)ao.buildCollapsedFace(E)E:_bindKeybind()E:_bindMouseOverride()E:_bindTopbarDrag()E:_watchViewport()E:
_buildSettingsUI()E:_syncLiveAnimation()return E end function at._syncLiveAnimation(y)if not y.theme.LiveAnimation then
y._liveAnimating=false return end if y._liveAnimating then return end y._liveAnimating=true y._liveGeneration=(y.
_liveGeneration or 0)+1 local z=y._liveGeneration task.spawn(function()local A,B=true,TweenInfo.new(10,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)while y._liveGeneration==z and y._liveAnimating and not y.unloaded do local C=ar.
tweenService:Create(y.windowGradient,B,{Offset=Vector2.new(if A then 0.4 else-0.2,0),Rotation=(if A then 220 else 280)})
y._liveTween=C C:Play()C.Completed:Wait()A=not A end if y._liveGeneration==z then y._liveAnimating=false y._liveTween=
nil end end)end function at._builtInThemeName(y)return y.themeName end function at.ChangeTheme(y,z)y.themeName=v(z)local
A=if typeof(z)=='table'then z else x(z)for B,C in A do y.theme[B]=q(B,C)end if typeof(z)=='table'then u(y.theme,A)end
for B,C in y.themeProperties do for D,E in C do local F=if typeof(E)=='table'then E[2](y.theme[E[1] ])else y.theme[E]if
typeof(F)=='Color3'or typeof(F)=='number'then ar.tweenService:Create(B,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[D]=F}):Play()else B[D]=F end end end if y.hidden then y._themeRefreshPending=true else y:
_refreshElementThemes()end y:_syncLiveAnimation()end function at._refreshElementThemes(y)for z,A in y.tabs do for B,C in
A.elements do if C._refreshTheme then C:_refreshTheme()end end end end function at.CreateTab(y,z)assert(not y.unloaded,
'Cannot create a tab on an unloaded window.')local A=ac(ab.Parent.tab).new(y,z)table.insert(y.tabs,A)if not A.
neglectSelector then local B=true for C,D in y.tabs do if D~=A and not D.neglectSelector then B=false break end end if B
then A:Select(true)end if not y.hidden and not y.minimised then A.topbarItem.Visible=true A:_applyVisual(if y.
selectedTab==A then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end
return A end function at.CreateSection(y,z)assert(not y.unloaded,'Cannot create a section on an unloaded window.')local
A=ac(ab.Parent.tabSection).new(y,z)table.insert(y.tabSections,A)if not A.inert and not y.hidden and not y.minimised then
A:_setVisible(true)A:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return A end
function at._setTabSectionsShown(y,z,A)for B,C in y.tabSections do C:_setShown(z,A)end end function at.
_setTabSectionsVisible(y,z)for A,B in y.tabSections do B:_setVisible(z)end end function at.CreateTag(y,z)assert(not y.
unloaded,'Cannot create a tag on an unloaded window.')local A=ac(ab.Parent.tag).new(y,z)table.insert(y.tags,A)return A
end function at._registerControl(y,z)if not z.flag or z.flag==''or z.forgetState then return end local A=z.flag if y.
controls[A]then local B=2 while y.controls[A..B]do B+=1 end A=A..B ak.warn("Rayfield: duplicate config flag '"..z.flag..
"', saving this one as '"..A.."'. Set a unique flag to keep it stable across sessions.")end z.flag=A y.controls[A]=z
return A end function at._restoreLate(y,z)if not y._loadedConfig or not z.flag or z.forgetState then return end local A=
y._loading y._loading=true ah.applyTo(z,y._loadedConfig[z.flag])y._loading=A end function at._persist(y,z)if z.flag and
not z.forgetState and y.configuration.autoSave and not y._loading then task.spawn(y.Save,y)end end function at.
_unregisterControl(y,z)if z.flag and y.controls[z.flag]==z then y.controls[z.flag]=nil end end function at._keybindUsing
(y,z,A)if typeof(z)~='EnumItem'or z==Enum.KeyCode.Unknown then return nil end for B,C in y.tabs do for D,E in C.elements
do if E~=A and E.__type=='Keybind'and E.value==z then return E end end end return nil end function at.Notify(y,z)if y.
unloaded then return end if not y.notifications then y.notifications=y:Create('Frame',{Name='Notifications',Size=UDim2.
new(0,300,0,800),Position=UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=y.
screenGui})y:_scaleSurface(y.notifications)y:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=y.notifications})end return ac(ab.Parent.notification).new(y,z)end
function at.CreateNameplate(y,z)assert(not y.unloaded,'Cannot create nameplates on an unloaded window.')local A=ac(ab.
Parent.nameplate).new(y,z)y._nameplates=y._nameplates or{}table.insert(y._nameplates,A)return A end function at.Toast(y,
z)if y.unloaded then return end z=if typeof(z)=='table'then z else{}local A=z.position or z.Position or'Top'local B=
typeof(A)~='string'or A:lower()~='bottom'z.position=if B then'Top'else'Bottom'local C=if B then'_toastsTop'else
'_toastsBottom'local D=y[C]if not D then D=y:Create('Frame',{Name='Toasts',Size=UDim2.new(0,e,1,-24),Position=if B then
b else UDim2.new(0.5,0,1,-12),AnchorPoint=if B then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,
ZIndex=ai.zIndex.toast,Parent=y.screenGui})y:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=if B then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=D})y[C]=D y:_scaleSurface(D
)if B then s(y,false)end end return ac(ab.Parent.toast).new(y,z,D)end function at.Popup(y,z)if y.unloaded then return
end return ac(ab.Parent.popup).new(y,z)end function at.Hide(y)if y.animating or y.hidden then return end if y._searching
then ap.close(y,{showTabs=false,jumpTo=y.selectedTab and y.selectedTab.tabPage})end if y._recordingKeybind then y.
_recordingKeybind:_stopRecording()end y.animating=true y._revealing=true y.hidden=true y.collapsedInteract.Visible=false
if y.minimised then y.minimised=false y.minimiseAction:_setIcon(ai.icons.minimise)end y._restorePosition=y.main.Position
local z,A=y:_collapsedRect()local B,C,D,E=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.
new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ar.tweenService:Create(y.drag.
dragCosmetic,B,{Size=UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not y.hidden
then return end y.drag.drag.Visible=false end)y:_fadeSurfaces(false,B)if y.title then ar.tweenService:Create(y.title,B,{
TextTransparency=1}):Play()end if y.subtitle then ar.tweenService:Create(y.subtitle,B,{TextTransparency=1}):Play()end if
y.topbarIcon then ar.tweenService:Create(y.topbarIcon,B,{ImageTransparency=1}):Play()end for F,G in ipairs(y.
actionContainer:GetChildren())do if G:IsA'Frame'then ar.tweenService:Create(G.ImageLabel,B,{ImageTransparency=1}):Play()
end end for F,G in y.tags do G:_setShown(false,B)end for F,G in pairs(y.tabs)do if not G.neglectSelector and G.
topbarItem then G:_applyVisual('hidden',B)end end y:_setTabSectionsShown(false,B)y:_fadeSelectedElementsOut()local F=ar.
tweenService:Create(y.main,C,{Size=A,Position=z})F.Completed:Connect(function()if y.unloaded or not y.hidden then return
end y._collapsedShown=true s(y,true)y.collapsedInteract.Visible=true y.animating=false y._revealing=false end)F:Play()ar
.tweenService:Create(y.windowCorner,D,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()if not y.hidden then
return end y.topbar.Visible=false y:_setContentVisible(false)ao.setCollapsedShown(y,true,E)end)end function at.
ToggleHide(y)if y.animating then return end if y.hidden then y:Show()else y:Hide()end end function at.ToggleMinimise(y)
if y.animating or y.hidden then return end if y._searching then ap.close(y,{showTabs=true})end y.animating=true local z,
A=TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out)if y.minimised then y.minimised=false y.minimiseAction:_setIcon(ai.icons.minimise)
ar.tweenService:Create(y.main,z,{Size=y.size}):Play()y:_fadeSurfaces(true,A)ar.tweenService:Create(y.drag.drag,z,{
Position=UDim2.new(y.main.Position.X.Scale,y.main.Position.X.Offset,y.main.Position.Y.Scale,y.main.Position.Y.Offset+y:
_hang(y.size.Y.Offset))}):Play()task.delay(0.2,function()if y.minimised or y.hidden then return end y:
_setContentVisible(true)for B,C in pairs(y.tabs)do if not C.neglectSelector and C.topbarItem then C.topbarItem.Visible=
true C:_applyVisual(if y.selectedTab==C then'selected'else'unselected',A)end end y:_setTabSectionsVisible(true)y:
_setTabSectionsShown(true,A)y:_revealElements(0.035,0.4)end)task.delay(0.5,function()y.animating=false end)else y.
minimised=true y.minimiseAction:_setIcon(ai.icons.maximise)y:_fadeSelectedElementsOut()for B,C in pairs(y.tabs)do if not
C.neglectSelector and C.topbarItem then C:_applyVisual('hidden',A)end end y:_setTabSectionsShown(false,A)task.delay(0.3,
function()if not y.minimised then return end y:_setContentVisible(false)for B,C in pairs(y.tabs)do if not C.
neglectSelector and C.topbarItem then C.topbarItem.Visible=false end end y:_setTabSectionsVisible(false)end)y:
_fadeSurfaces(false,A)ar.tweenService:Create(y.main,z,{Size=UDim2.fromOffset(y.size.X.Offset,y.layout.topbarHeight)}):
Play()ar.tweenService:Create(y.drag.drag,z,{Position=UDim2.new(y.main.Position.X.Scale,y.main.Position.X.Offset,y.main.
Position.Y.Scale,y.main.Position.Y.Offset+y:_hang(y.layout.topbarHeight))}):Play()task.delay(0.5,function()y.animating=
false end)end end function at._syncDragBar(y)local z=y.drag and y.drag.drag if not z then return end local A,B=y.main.
Position,y:_hang(y.size.Y.Offset)z.Position=UDim2.new(A.X.Scale,A.X.Offset,A.Y.Scale,A.Y.Offset+B)end function at.
_clampedPosition(y,z:UDim2):UDim2 if not y.settings or not y.settings.keepOnScreen then return z end if z.X.Scale~=0 or
z.Y.Scale~=0 then return z end local A,B,C,D=y.screenGui.AbsoluteSize,y.size.X.Offset*y.scale/2,y.size.Y.Offset*y.scale/
2,8 local E,F=math.clamp(z.X.Offset,B+D,math.max(B+D,A.X-B-D)),math.clamp(z.Y.Offset,C+D,math.max(C+D,A.Y-C-D))if E==z.X
.Offset and F==z.Y.Offset then return z end return UDim2.fromOffset(E,F)end function at._clampToScreen(y)y.main.Position
=y:_clampedPosition(y.main.Position)end function at._applyWindowSize(y)if y.unloaded then return end local z,A=l(y.
layout.mode,y.fixedScale)local B=z~=y.size or A~=y.scale y.size=z y.scale=A y.uiScale.Scale=A y:_rescaleSurfaces()for C,
D in y.actions do D:_fit()end y:_applyRailWidth()if B then y:_layoutColumns()end if y.hidden or y.minimised or y.
animating or y._revealing then y._pendingResize=y._pendingResize or B return end if not B and not y._pendingResize then
return end y._pendingResize=false y.main.Size=z y:_clampToScreen()y:_syncDragBar()end function at._layoutColumns(y)for z
,A in y.tabs do A:_layoutColumns()end end function at._applyRailWidth(y)if y.layout.mode~='sidebar'then return end aq.
applyWidth(y,an.railWidthFor(y.layout,y.size.X.Offset))end function at._watchViewport(y)local z,A:RBXScriptConnection?=
false local function B()if z then return end z=true task.defer(function()z=false y:_applyWindowSize()end)end
local function C()if A then y:Disconnect(A)A=nil end local D=ar.workspace.CurrentCamera if D then A=y:Connect(D:
GetPropertyChangedSignal'ViewportSize',B)end B()end y:Connect(ar.workspace:GetPropertyChangedSignal'CurrentCamera',C)C()
local D=0 y:Connect(ar.runService.Heartbeat,function(E:number)D+=E if D<k then return end D=0 y:_applyWindowSize()end)
end function at._bindKeybind(y)y:Connect(ar.userInputService.InputBegan,function(z,A)if A or y._recordingKeybind then
return end if z.KeyCode==y.settings.toggleKeybind or z.UserInputType==y.settings.toggleKeybind then y:ToggleHide()end
end)end function at._bindMouseOverride(y)local z=ar.userInputService local function A()return y.settings.mouseOverride
and not y.hidden and not y.minimised end local function B()if not A()then return end if z:IsMouseButtonPressed(Enum.
UserInputType.MouseButton2)then return end if z.MouseBehavior~=Enum.MouseBehavior.Default then z.MouseBehavior=Enum.
MouseBehavior.Default end if not z.MouseIconEnabled then z.MouseIconEnabled=true end end y:Connect(z:
GetPropertyChangedSignal'MouseBehavior',B)y:Connect(z:GetPropertyChangedSignal'MouseIconEnabled',B)y:Connect(z.
InputEnded,function(C)if C.UserInputType==Enum.UserInputType.MouseButton2 then B()end end)y._freeMouse=B end function at
._bindTopbarDrag(y)local z,A,B,C=ar.userInputService,false,Vector2.zero,Vector2.zero if y.screenGui and y.screenGui.
IgnoreGuiInset then C=ar.guiService:GetGuiInset()end local function D()local E=z:GetMouseLocation()+B+C local F,G=E.X,E.
Y if y.settings and y.settings.keepOnScreen then local H,I,J=y.main.AbsoluteSize,y.screenGui.AbsoluteSize,8 local K,L=H.
X/2,H.Y/2 F=math.clamp(F,K+J,math.max(K+J,I.X-K-J))G=math.clamp(G,L+J,math.max(L+J,I.Y-L-J))end return UDim2.fromOffset(
F,G)end local function E(F,G)for H,I in{y.tabList,y.actionContainer}do local J,K=I.AbsolutePosition,I.AbsoluteSize if F
>=J.X and F<=J.X+K.X and G>=J.Y and G<=J.Y+K.Y then return true end end return false end y:Connect(y.topbar.InputBegan,
function(F,G)if G then return end local H=F.UserInputType.Name if H~='MouseButton1'and H~='Touch'then return end if E(F.
Position.X,F.Position.Y)then return end if not y:_interactive()then return end A=true if y.screenGui and y.screenGui.
IgnoreGuiInset then C=ar.guiService:GetGuiInset()end B=y.main.AbsolutePosition+y.main.AbsoluteSize*y.main.AnchorPoint-z:
GetMouseLocation()end)y:Connect(z.InputEnded,function(F)local G=F.UserInputType.Name if G=='MouseButton1'or G=='Touch'
then A=false end end)y:Connect(z.WindowFocusReleased,function()A=false end)y:Connect(ar.runService.RenderStepped,
function()if not A then return end if not y:_interactive()then A=false return end y.main.Position=D()if y.drag and y.
drag.drag then local F=y.main.Position y.drag.drag.Position=UDim2.new(F.X.Scale,F.X.Offset,F.Y.Scale,F.Y.Offset+y:_hang(
y.main.Size.Y.Offset))end end)end function at._buildSettingsUI(y)y.rfSettings:CreateSection{name='General'}y.rfSettings:
CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=y.settings.toggleKeybind,isMenuToggle=true,onChanged=
function(z)y.settings.toggleKeybind=z y:SaveSettings()end}y.rfSettings:CreateToggle{name='Unlock cursor while open',
description=[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=y.
settings.mouseOverride,callback=function(z)y.settings.mouseOverride=z y:SaveSettings()end}y.rfSettings:CreateToggle{name
='Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=y
.settings.welcomeToast,callback=function(z)y.settings.welcomeToast=z y:SaveSettings()end}y.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=y.settings.haptics,
callback=function(z)y.settings.haptics=z al.setEnabled(z)y:SaveSettings()end}y.rfSettings:CreateSection{name='Window'}y.
rfSettings:CreateDropdown{name='Theme',description=
[[Changes the colours of this menu. Your choice is remembered next time.]],options=ai.builtInThemes,value=y.settings.
theme or y:_builtInThemeName()or ai.builtInThemes[1],callback=function(z)if typeof(z)~='string'or z==''then return end y
.settings.theme=z y:ChangeTheme(z)y:SaveSettings()end}if y.layout.mode=='sidebar'and y.profile then y.rfSettings:
CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=y.settings.showProfile,callback=function(z)aq.setProfileEnabled(y,z)y:SaveSettings()end}end y.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=y.settings.keepOnScreen,callback=function(
z)y.settings.keepOnScreen=z y:SaveSettings()end}y.rfSettings:CreateButton{name='Reset Window Position',callback=function
()ar.tweenService:Create(y.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2
.new(0.5,0,0.5,0)}):Play()ar.tweenService:Create(y.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,y:_hang(y.size.Y.Offset))}):Play()end}if next(y.configuration)~=nil
then y.rfSettings:CreateSection{name='Configurations'}local z,A,B=(y:ListConfigs()[1])local function C()local D=y:
ListConfigs()A:Refresh(D)if z and not table.find(D,z)then z=D[1]end if z then A:Set(z,true)end end A=y.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=y:ListConfigs(),value=z,placeholder=
'No saved configurations',callback=function(D)z=D end}B=y.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local D=y.rfSettings:CreateGroup()D:CreateButton{name='Save',icon=ai.icons.config,callback=function()local E=B.
value if E==''then E=z end if not E or E==''then y:Toast{title=aj.resolve'Name your configuration first'}return end if y
:Save(E)then B:Set''z=E C()y:Toast{title=aj.resolve'Saved configuration',subtitle=E,icon=ai.icons.config}else y:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=E}end end}D:CreateButton{name='Load',callback=function()if not z
or z==''then y:Toast{title=aj.resolve'Pick a configuration to load'}return end if y:_applyNamedConfig(z)then y:Toast{
title=aj.resolve'Loaded configuration',subtitle=z}else y:Toast{title=aj.resolve"Couldn't load configuration",subtitle=z}
end end}D:CreateButton{name='Delete',callback=function()local E=z if not E or E==''then y:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if y:DeleteConfig(E)then C()y:Toast{title=aj.resolve'Deleted configuration',
subtitle=E}else y:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=E}end end}end end function at.
SetProfile(y,z)y.profileText=z aq.setSubtitle(y,z)end function at.SaveSettings(y)return ah.saveSettings(y)end function
at.LoadSettings(y)return ah.loadSettings(y)end function at._roundCorners(y,z,A)if not A or not n then return y:Create(
'UICorner',{Parent=z},{CornerRadius='CornerRoundness'})end local B,C={Parent=z},{}for D,E in m do B[E]=UDim.new(0,0)end
for D,E in A do B[E]=nil C[E]='CornerRoundness'end return y:Create('UICorner',B,C)end function at._setElementLocked(y,z,
A,B)A=A==true local C=z.locked==true if C==A and not(A and B)then return end z.locked=A if not z.lockScrim then y:
_buildLockScrim(z)end local D=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if A then z.lockScrim.
Visible=true end ar.tweenService:Create(z.lockScrim,D,{BackgroundTransparency=if A then g else 1}):Play()if not A then
task.delay(D.Time,function()if not z.locked and z.lockScrim then z.lockScrim.Visible=false end end)end local E=z.
descriptor if not E then return end if A then z._descriptionBefore=z._descriptionBefore or E.titleLabel.Text E.
titleLabel.Text=aj.resolve(B or'This element is locked.')elseif z._descriptionBefore then E.titleLabel.Text=z.
_descriptionBefore z._descriptionBefore=nil end ar.tweenService:Create(E.titleLabel,D,{TextTransparency=if A then h else
0.7}):Play()end function at._buildLockScrim(y,z)z.lockScrim=y:Create('TextButton',{Name='ElementLock',Active=true,
AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=z.main},{BackgroundColor3={'WindowColor',r}})y:Create(
'UICorner',{Parent=z.lockScrim},{CornerRadius='ElementCornerRadius'})end function at._setContentVisible(y,z)y.elements.
Visible=z y.tabList.Visible=z if y.sidebar then y.sidebar.Visible=z end end function at._fadeSurfaces(y,z,A)local B={[y.
windowShadow]={Transparency=if z then 0.6 else 1},[y.windowStroke]={Transparency=if z then 0.95 else 1},[y.bottomFade]={
BackgroundTransparency=if z then 0 else 1}}if y.elementsStroke then B[y.elements]={BackgroundTransparency=if z then y.
layout.cardTransparency else 1}B[y.elementsStroke]={Transparency=if z then 0 else 1}end for C,D in B do if A then ar.
tweenService:Create(C,A,D):Play()else for E,F in D do C[E]=F end end end aq.setProfileShown(y,z,A)end function at.
_fadeSelectedElementsOut(y)if y.selectedTab then for z,A in ipairs(y.selectedTab.elements)do A:_setShown(false,true)end
end end function at._revealElements(y,z,A)for B,C in pairs(y.tabs)do if C~=y.selectedTab then for D,E in ipairs(C.
elements)do E:_setShown(true,false)end end end local B=y.selectedTab if not B then return end local C=B.tabPage local D=
C.AbsolutePosition.Y local E,F,G=D+C.AbsoluteWindowSize.Y,table.clone(B.elements),{}for H,I in F do G[I]=H end table.
sort(F,function(H,I)local J,K=H.main.AbsolutePosition,I.main.AbsolutePosition if J.Y~=K.Y then return J.Y<K.Y end if J.X
~=K.X then return J.X<K.X end return G[H]<G[I]end)local H,I=math.floor(A/z),0 for J,K in F do local L=K.main.
AbsolutePosition.Y local M=(L+K.main.AbsoluteSize.Y)>D and L<E if M then K:_setShown(true,true)I+=1 if I<=H then task.
wait(z)end else K:_setShown(true,false)end end end function at.Show(y)if y.animating or not y.hidden then return end y.
animating=true y._revealing=true if y.configuration.autoLoad and not y._autoLoaded then y._autoLoaded=true local z,A=
pcall(y.Load,y)if not z then ak.warn('Rayfield: Failed to load configuration - '..tostring(A))end end y.hidden=false y.
minimised=false if y._themeRefreshPending then y._themeRefreshPending=false y:_refreshElementThemes()end y.
collapsedInteract.Visible=false if y._freeMouse then y._freeMouse()end if y.hasShownOnce then y:_quickRestore()else y.
hasShownOnce=true y:_firstShow()end end function at._quickRestore(y)local z=y:_clampedPosition(y._restorePosition or
UDim2.new(0.5,0,0.5,0))y._restorePosition=z local A,B,C=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)ao.setCollapsedShown(y,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local D=ar.tweenService:Create(y.main,A,{Size=y.size,Position=z})D.Completed:Connect(
function()if y.hidden or y.unloaded then return end y._collapsedShown=false s(y,true)end)D:Play()ar.tweenService:Create(
y.windowCorner,B,{CornerRadius=y.theme.CornerRoundness}):Play()task.delay(0.22,function()y.topbar.Visible=true y:
_setContentVisible(true)y:_fadeSurfaces(true,C)if y.topbarIcon then ar.tweenService:Create(y.topbarIcon,C,{
ImageTransparency=0}):Play()end if y.title then ar.tweenService:Create(y.title,C,{TextTransparency=0}):Play()end if y.
subtitle then ar.tweenService:Create(y.subtitle,C,{TextTransparency=0.7}):Play()end for E,F in ipairs(y.actionContainer:
GetChildren())do if F:IsA'Frame'then ar.tweenService:Create(F.ImageLabel,C,{ImageTransparency=0.6}):Play()end end if y.
settingsAction and y.selectedTab==y.rfSettings then ar.tweenService:Create(y.settingsAction.iconLabel,C,{
ImageTransparency=0.2}):Play()end for E,F in y.tags do F:_setShown(true,C)end for E,F in pairs(y.tabs)do if not F.
neglectSelector and F.topbarItem then F.topbarItem.Visible=true F:_applyVisual(if y.selectedTab==F then'selected'else
'unselected',C)end end y:_setTabSectionsVisible(true)y:_setTabSectionsShown(true,C)y:_revealElements(0.035,0.4)end)task.
delay(0.22,function()y.drag.drag.Position=UDim2.new(z.X.Scale,z.X.Offset,z.Y.Scale,z.Y.Offset+y:_hang(y.size.Y.Offset))y
.drag.dragCosmetic.Size=UDim2.fromOffset(0,4)y.drag.dragCosmetic.BackgroundTransparency=1 y.drag.drag.Visible=true ar.
tweenService:Create(y.drag.dragCosmetic,A,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()y.animating=false y._revealing=false end)end function at._firstShow(y)y:_setContentVisible(true)y.
drag.drag.Visible=false y.main.Visible=true ar.tweenService:Create(y.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=y.size}):Play()task.wait(0.85)y:_fadeSurfaces(true,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if y.icon then ar.tweenService:Create(y.
topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if
y.title then ar.tweenService:Create(y.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if y.subtitle then ar.tweenService:Create(y.subtitle,TweenInfo.new(0.4,Enum
.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for z,A in ipairs(y.actionContainer
:GetChildren())do if A:IsA'Frame'then task.wait(0.02)ar.tweenService:Create(A.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for z,A in y.tags do A:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()local z=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)y:_setTabSectionsVisible(true)y:
_setTabSectionsShown(true,z)local A=0 for B,C in pairs(y.tabs)do if not C.neglectSelector then C.topbarItem.Visible=true
C:_applyVisual(if y.selectedTab==C then'selected'else'unselected',z)C:_spinGradients()A+=1 if A<=j then task.wait(i)end
end end end)y:_revealElements(0.03,2)task.wait(1)y:_syncDragBar()y.drag.drag.Visible=true ar.tweenService:Create(y.drag.
dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):
Play()ar.tweenService:Create(y.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
{Size=UDim2.fromOffset(100,4)}):Play()y.animating=false y._revealing=false local z=ar.localPlayer if z and y.settings.
welcomeToast and ao.isNewUser()then y:Toast{title=z.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,
avatar=z.UserId,minWidth=220}end end function at.GetPath(y)return ah.getPath(y)end function at.Save(y,z)if z~=nil and(
type(z)~='string'or z=='')then return false end return ah.save(y,z)end function at.Load(y,z)if z~=nil and(type(z)~=
'string'or z=='')then return false end return ah.load(y,z)end function at._applyNamedConfig(y,z)if not y:Load(z)then
return false end local A,B=ah.getPath(y)y._loadedConfigPath=B y:Save()return true end function at.ListConfigs(y)return
ah.list(y)end function at.DeleteConfig(y,z)return ah.delete(y,z)end function at.Get(y,z)local A=y.controls[z]return A
and A.value end function at.Set(y,z,A)local B=y.controls[z]if not B then return false end B:Set(A)return true end
function at._jumpTo(y,z)if z then y.elementsLayout:JumpTo(z)end end function at.Navigate(y,z)if z==nil then return end
local A for B,C in y.tabs do if C==z or C.name==z or C.tabPage==z then A=C break end end if not A then return end A:
Select()end function at.Create(y,z,A,B)assert(typeof(z)=='string','Invalid argument #1 (string expected)')local C=
Instance.new(z)if B and y.theme then for D,E in B do C[D]=(if typeof(E)=='table'then E[2](y.theme[E[1] ])else y.theme[E]
)end y.themeProperties[C]=B end if A then for D,E in A do if aj.isToken(E)then y:_bindLocale(C,D,aj.sourceOf(E))else af.
assign(C,D,E)end end end table.insert(y.instances,C)return C end function at._bindLocale(y,z,A,B)z[A]=aj.resolve(B)local
C=y.localeProperties[z]if not C then C={}y.localeProperties[z]=C end C[A]=B end function at.SetLocale(y,z)aj.setActive(z
)for A,B in y.localeProperties do for C,D in B do A[C]=aj.resolve(D)end end end function at.SetTranslator(y,z)aj.
translator=z end function at.RegisterTranslations(y,z)aj.register(z)y:SetLocale(aj.current)end function at.CreateGlow(y,
z,A,B,C)local D={BlurRadius=UDim.new(0,B),Transparency=C,ZIndex=-1,Parent=z}if typeof(A)=='string'then return y:Create(
'UIShadow',D,{Color={A,function(E)return if typeof(E)=='ColorSequence'then E.Keypoints[1].Value else E end}})end D.Color
=A return y:Create('UIShadow',D)end function at._flashResult(y,z,A)local B=z.box if not B then return end local C,D,E,F,
G,H=z.glow,z.boxStroke,A and ai.accent.on or y.theme.ErrorColor,A and ai.accent.onStroke or y.theme.ErrorStrokeColor,
TweenInfo.new(0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)ar.tweenService:Create(B,G,{BackgroundColor3=E}):Play()if D then ar.tweenService:Create(D,G,{Color=F
,Transparency=0.4}):Play()end if C then ar.tweenService:Create(C,G,{Color=F,Transparency=0.6}):Play()end z._flashToken=(
z._flashToken or 0)+1 local I=z._flashToken task.delay(0.22,function()if z._flashToken~=I then return end ar.
tweenService:Create(B,H,{BackgroundColor3=y.theme.FieldBackground}):Play()if D then ar.tweenService:Create(D,H,{Color=y.
theme.SurfaceStroke,Transparency=0.85}):Play()end if C then ar.tweenService:Create(C,H,{Color=y.theme.FieldGlow,
Transparency=z._glowIdle or 1}):Play()end end)end function at.CreateHoverOverlay(y,z)local A=y:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex
=1,Parent=z})y:Create('UICorner',{Parent=A},{CornerRadius='ElementCornerRadius'})return A end function at.
_wireElementHover(y,z)local A,B=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),y.theme y:
ConnectFor(z,z.main.MouseEnter,function()if not y:_interactive()then return end ar.tweenService:Create(z.stroke,A,{
Transparency=B.ElementStrokeHoverTransparency,Color=B.ElementStrokeHover}):Play()ar.tweenService:Create(z.title,A,{
TextColor3=B.ElementTextHoverColor}):Play()if z.hoverOverlay then ar.tweenService:Create(z.hoverOverlay,A,{
BackgroundTransparency=0.97}):Play()end end)y:ConnectFor(z,z.main.MouseLeave,function()ar.tweenService:Create(z.stroke,A
,{Transparency=B.ElementStrokeTransparency,Color=B.ElementStroke}):Play()ar.tweenService:Create(z.title,A,{TextColor3=B.
ContentColor}):Play()if z.hoverOverlay then ar.tweenService:Create(z.hoverOverlay,A,{BackgroundTransparency=1}):Play()
end end)end function at._runGuarded(y,z,A,...)if z.locked then return end local B=table.pack(...)task.spawn(function()
local C,D=pcall(function()return A(table.unpack(B,1,B.n))end)if C or z._errored then return end z._errored=true local E,
F=z.flashTarget or z.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ar.tweenService:Create(E,F,
{BackgroundColor3=y.theme.ErrorColor}):Play()ar.tweenService:Create(z.stroke,F,{Color=y.theme.ErrorStrokeColor}):Play()
if z.title then z.title.Text=aj.resolve'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {
z.__type} component named '{z.name}':`)ak.print(D)task.wait(1)if z.title then z.title.Text=aj.resolve(z.name)end ar.
tweenService:Create(E,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.
fromRGB(255,255,255)}):Play()ar.tweenService:Create(z.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Color=y.theme.ElementStroke}):Play()z._errored=false end)end function at.StyleElementBody(y,z)y:
Create('UIGradient',{Rotation=270,Parent=z},{Color='ElementGradient'})y:Create('UICorner',{Parent=z},{CornerRadius=
'ElementCornerRadius'})return y:Create('UIStroke',{Transparency=1,Parent=z},{Color='ElementStroke',Transparency=
'ElementStrokeTransparency'})end function at._buildCompactRow(y,z,A,B)local C=y:Create('Frame',{Name=A,Size=UDim2.
fromOffset(0,f),AutomaticSize=Enum.AutomaticSize.X,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Parent=z.tabPage},{BackgroundTransparency='ElementTransparency'})local D=y:
StyleElementBody(C)y:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=C})y:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,
Parent=C})local E=y:Create('TextButton',{Text='',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,f),BorderSizePixel=0,TextTransparency=1,ZIndex=B or 1,Parent=
C})y:Create('UICorner',{Parent=E},{CornerRadius='ElementCornerRadius'})return C,D,E end function at.StyleElementPanel(y,
z)y:Create('UIGradient',{Rotation=270,Parent=z},{Color='ElementGradient'})y:Create('UICorner',{Parent=z},{CornerRadius=
'ElementCornerRadius'})local A=y:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=z})y:Create(
'UIGradient',{Rotation=270,Parent=A},{Color='ElementStrokeGradient'})return A end function at._reveal(y,z,A,B,C)if not z
then return end if B then ar.tweenService:Create(z,C or au,A):Play()else for D,E in A do z[D]=E end end end function at.
_revealCommon(y,z,A)y:_reveal(z.stroke,{Transparency=y.theme.ElementStrokeTransparency},A)y:_reveal(z.title,{
TextTransparency=0},A)y:_reveal(z.main,{BackgroundTransparency=y.theme.ElementTransparency or 0},A)if z.iconLabel then y
:_reveal(z.iconLabel,{ImageTransparency=0},A)end if z.descriptor then y:_reveal(z.descriptor.titleLabel,{
TextTransparency=0.7},A)end end function at._hideCommon(y,z,A)y:_reveal(z.stroke,{Transparency=1},A)y:_reveal(z.title,{
TextTransparency=1},A)y:_reveal(z.main,{BackgroundTransparency=1},A)if z.iconLabel then y:_reveal(z.iconLabel,{
ImageTransparency=1},A)end if z.descriptor then y:_reveal(z.descriptor.titleLabel,{TextTransparency=1},A)end end
function at._collapsedRect(y)local z=if y.showIconOnly then aw else av if y._collapsedPosition then return y.
_collapsedPosition,z end local A=UDim2.new(ax.X.Scale,ax.X.Offset,ax.Y.Scale,ax.Y.Offset+z.Y.Offset*y.scale/2)return A,z
end function at._scaleSurface(y,z)local A=y:Create('UIScale',{Scale=y.scale,Parent=z})table.insert(y._scaledSurfaces,A)
return A end function at._rescaleSurfaces(y)for z=#y._scaledSurfaces,1,-1 do local A=y._scaledSurfaces[z]if A.Parent
then A.Scale=y.scale else table.remove(y._scaledSurfaces,z)end end end function at._hang(y,z:number):number return z*y.
scale/2+15 end function at._interactive(y)return not y.animating and not y.hidden end function at._settled(y)return not
y.hidden and not y._revealing end function at.Connect(y,z,A)local B=z:Connect(A)table.insert(y.connections,B)return B
end function at.ConnectFor(y,z,A,B)local C=y:Connect(A,B)z.connections=z.connections or{}table.insert(z.connections,C)
return C end function at.Disconnect(y,z)if not z then return end local A=table.find(y.connections,z)if A then table.
remove(y.connections,A)end z:Disconnect()end function at.DestroySubtree(y,z)if not z then return end local A={[z]=true}
for B,C in z:GetDescendants()do A[C]=true end for B=#y.instances,1,-1 do local C=y.instances[B]if A[C]then table.remove(
y.instances,B)y.themeProperties[C]=nil y.localeProperties[C]=nil end end z:Destroy()end function at.DisconnectMany(y,z,A
)if not A or#A==0 then return end local B={}for C,D in A do B[D]=true D:Disconnect()end local function C(D)if not D then
return end local E=0 for F=1,#D do local G=D[F]if not B[G]then E+=1 D[E]=G end end for F=#D,E+1,-1 do D[F]=nil end end
C(y.connections)if z and z~=y then C(z.connections)end end function at.DestroySubtrees(y,z)if not z or#z==0 then return
end local A={}for B,C in z do A[C]=true for D,E in C:GetDescendants()do A[E]=true end end local B=0 for C=1,#y.instances
do local D=y.instances[C]if A[D]then y.themeProperties[D]=nil y.localeProperties[D]=nil else B+=1 y.instances[B]=D end
end for C=#y.instances,B+1,-1 do y.instances[C]=nil end for C,D in z do D:Destroy()end end function at.Unload(y)y.
unloaded=true for z,A in y._nameplates or{}do A._alive=false end al.teardown()al.releaseContainer(y.screenGui)if y.
_liveTween then y._liveTween:Cancel()y._liveTween=nil end for z=#y.connections,1,-1 do y.connections[z]:Disconnect()end
for z=#y.instances,1,-1 do y.instances[z]:Destroy()end table.clear(y.connections)table.clear(y.instances)table.clear(y.
themeProperties)table.clear(y.localeProperties)table.clear(y.controls)table.clear(y.tabs)table.clear(y._scaledSurfaces)
end return at end)()end,[35]=function()local aa,ab,ac=a(35)local ad return(function(...)return{WindowColor=ColorSequence
.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,16,32)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,22,46)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(38,28,56))},ShadowColor=Color3.fromRGB(12,6,22),ElementStroke=Color3.fromRGB(
54,42,74),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,24,48)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,28,54)),ColorSequenceKeypoint.new(1,Color3.fromRGB(36,28,54))},ElementStrokeGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,58,104)),ColorSequenceKeypoint.new(0.9999,Color3.
fromRGB(88,72,124)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,58,104))},ElementStrokeHover=Color3.fromRGB(84,68,118)
,TabBackground=ColorSequence.new(Color3.fromRGB(54,42,80),Color3.fromRGB(34,26,52)),TabStroke=ColorSequence.new(Color3.
fromRGB(88,70,128),Color3.fromRGB(54,42,80)),SliderBackground=Color3.fromRGB(46,36,68),SliderBackgroundHover=Color3.
fromRGB(60,48,90),SliderProgress=ColorSequence.new(Color3.fromRGB(170,112,248),Color3.fromRGB(138,80,224)),AccentColor=
Color3.fromRGB(168,110,246),AccentStroke=Color3.fromRGB(200,154,255),ToggleKnobOff=Color3.fromRGB(224,214,236),
StatBackground=Color3.fromRGB(24,18,38),DropdownHighlight=Color3.fromRGB(168,110,246),NeutralButton=Color3.fromRGB(46,36
,68),NeutralButtonHover=Color3.fromRGB(60,48,90),NeutralButtonStroke=Color3.fromRGB(140,116,190)}end)()end,[36]=function
()local aa,ab,ac=a(36)local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(12,16,34)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(20,26,50)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(28,36,66))},ShadowColor=Color3.fromRGB(6,8,20),ElementStroke=Color3.fromRGB(44,52,82),ElementGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,32,58)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
30,38,66)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,38,66))},ElementStrokeGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(56,66,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(70,82,124)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(56,66,104))},ElementStrokeHover=Color3.fromRGB(64,76,116),TabBackground=
ColorSequence.new(Color3.fromRGB(48,58,92),Color3.fromRGB(30,38,64)),TabStroke=ColorSequence.new(Color3.fromRGB(78,92,
140),Color3.fromRGB(48,58,92)),SliderBackground=Color3.fromRGB(40,48,78),SliderBackgroundHover=Color3.fromRGB(54,64,100)
,SliderProgress=ColorSequence.new(Color3.fromRGB(64,132,248),Color3.fromRGB(42,104,224)),AccentColor=Color3.fromRGB(48,
120,240),AccentStroke=Color3.fromRGB(96,164,255),ToggleKnobOff=Color3.fromRGB(196,206,232),StatBackground=Color3.
fromRGB(20,26,48),DropdownHighlight=Color3.fromRGB(48,120,240),NeutralButton=Color3.fromRGB(40,48,78),NeutralButtonHover
=Color3.fromRGB(54,64,100),NeutralButtonStroke=Color3.fromRGB(120,138,195)}end)()end,[37]=function()local aa,ab,ac=a(37)
local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables)return{CornerRoundness=UDim.new(0,20),
WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10)),ColorSequenceKeypoint.new(0.9999,
Color3.fromRGB(25,25,25)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ShadowColor=Color3.fromRGB(20,20,20),
ElementStroke=Color3.fromRGB(35,35,35),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,
30,30)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))
},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,
255,255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50),Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(
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
placeholder:string?,emojis:{string}?,onMessage:((message:ChatMessage)->())?}export type NameplateStyle={sizeMode:(
'screen'|'world')?,screenSize:Vector2?,size:Vector2?,lift:number?,maxDistance:number?,cornerRadius:number?,accent:Color3
?,accentDeep:Color3?,cardColor:Color3?,cardTransparency:number?,veilColor:Color3?,veilStrength:number?,titleColor:Color3
?,subtitleColor:Color3?,badgeTextColor:Color3?,logo:any?,logoTint:Color3?,logoScale:number?,backdrop:any?,backdropTint:
Color3?,backdropTransparency:number?,glowImage:(string|number|boolean)?,titleFont:Font?,subtitleFont:Font?,titleTop:
number?,titleSize:number?,subtitleSize:number?,entrance:('unfold'|'fade'|'none')?,logoSway:number?,logoSpin:number?,halo
:boolean?,sparkles:number?,sparkleColor:Color3?,titleShine:boolean?,sweep:boolean?,sweepEvery:number?,border:boolean?,
borderThickness:number?,borderTransparency:number?,borderSpeed:number?,glow:boolean?,bob:boolean?,bobHeight:number?,
bobSpeed:number?}export type NameplateProps={title:string?,subtitle:(string|((player:Player)->string))?,badge:string?,
preset:('Omnity'|'Midnight'|'Mono')?,style:NameplateStyle?,endpoint:string?,key:string?,transport:ChatTransport?,
showSelf:boolean?,hideDefaultName:boolean?,checkInInterval:number?,autoCheckIn:boolean?,playerMedia:boolean?,settings:
boolean?,accent:Color3?,logo:(string|number|boolean)?,backdrop:(string|number|boolean)?,maxDistance:number?,lift:number?
}export type Nameplate={SetEnabled:(self:Nameplate,enabled:boolean)->(),SetTitle:(self:Nameplate,title:string)->(),
SetStyle:(self:Nameplate,style:NameplateStyle|string,preset:string?)->(),SetMedia:(self:Nameplate,link:string,slot:(
'backdrop'|'logo')?)->(boolean,string?),ClearMedia:(self:Nameplate)->boolean,Add:(self:Nameplate,player:Player,badge:
string?)->(),Remove:(self:Nameplate,player:Player)->(),CheckIn:(self:Nameplate)->boolean,Destroy:(self:Nameplate)->()}
export type NotifyProps={title:string?,content:string?,icon:(string|number)?,duration:number?}export type ToastProps={
title:string?,subtitle:string?,subtitleAbove:boolean?,icon:(string|number)?,avatar:number?,minWidth:number?,duration:
number?,position:'Top'|'Bottom'?}export type PopupBox={title:string?,description:string?,icon:(string|number)?}export
type PopupOption={text:string?,style:string?,callback:(()->())?}export type PopupProps={title:string?,subtitle:string?,
icon:(string|number)?,content:string?,boxes:{PopupBox}?,options:{PopupOption}?,dismissable:boolean?}export type Moveable
={MoveTo:(self:any,index:number)->(),MoveToTop:(self:any)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown
:(self:any)->()}export type Lockable={Lock:(self:any,reason:string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->
boolean}export type Button=Moveable&Lockable&{}export type Toggle=Moveable&Lockable&{value:boolean,Set:(self:Toggle,
value:boolean,skipCallback:boolean?)->()}export type Slider=Moveable&Lockable&{value:number,Set:(self:Slider,value:
number,skipCallback:boolean?)->()}export type Dropdown=Moveable&Lockable&{value:{string},Set:(self:Dropdown,value:string
|{string},skipCallback:boolean?)->(),Refresh:(self:Dropdown,options:{string})->(),Add:(self:Dropdown,option:string)->(),
Remove:(self:Dropdown,option:string)->()}export type Input=Moveable&Lockable&{value:string,Set:(self:Input,value:string,
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
pcall(Instance.new,'HapticEffect')if not ap then return nil end local ar=aq::any ar.Type=an local as=pcall(function()aq.
Parent=al()end)if not as then aq:Destroy()return nil end aj[an]=aq return aq end local function an(ao:Enum.
HapticEffectType?)if not ao or not af.enabled then return end local ap=am(ao)if ap then local aq=ap::any pcall(aq.Play,
ap)end end function af.click()an(ag.click)end function af.notify()an(ag.notify)end function af.setEnabled(ao:boolean?)af
.enabled=ao and true or false if not af.enabled then af.teardown()end end function af.teardown()for ao,ap in aj do
pcall(ap.Destroy,ap)aj[ao]=nil end end return af end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(
...)local ae={}function ae.isAnimated(af):boolean if not af then return false end if af.sheet then return(af.sheet.
frames or 1)>1 and(af.sheet.fps or 0)>0 end return af.list~=nil and#af.list>1 and(af.fps or 0)>0 end function ae.apply(
af,ag)if not ag then af.Image=''af.ImageRectSize=Vector2.zero af.ImageRectOffset=Vector2.zero return end if ag.list then
af.Image=ag.list[1]or''af.ImageRectSize=Vector2.zero af.ImageRectOffset=Vector2.zero return end af.Image=ag.uri or''
local ah=ag.sheet if ah then af.ImageRectSize=Vector2.new(ah.frameWidth,ah.frameHeight)af.ImageRectOffset=Vector2.zero
else af.ImageRectSize=Vector2.zero af.ImageRectOffset=Vector2.zero end end function ae.frameAt(af,ag:number):number if
not ae.isAnimated(af)then return 0 end local ah,ai=if af.sheet then af.sheet.frames else#af.list,if af.sheet then af.
sheet.fps else af.fps return math.floor(ag*ai)%ah end function ae.step(af,ag,ah:number,ai)if not ae.isAnimated(ag)then
return end local aj=ae.frameAt(ag,ah)if ai and ai.frame==aj then return end if ai then ai.frame=aj end if ag.sheet then
local ak=ag.sheet local al,am=aj%ak.columns,aj//ak.columns af.ImageRectOffset=Vector2.new(al*ak.frameWidth,am*ak.
frameHeight)else af.Image=ag.list[aj+1]end end return ae end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(
function(...)local ae,af=ac(ab.Parent.network),ac(ab.Parent.log)export type AssetId=number|string export type
AssetDownloadUrl=string export type CacheKey=AssetId export type ResolvedAsset=AssetId export type AssetRequestPayload={
Url:string,Method:string}local ag={Enum={AssetDownloadUrl={RobloxDownloadUrl=
'https://assetdelivery.roblox.com/v1/asset/?id=%d'::AssetDownloadUrl,RoProxyDownloadUrl=
'https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag ag.__type='assetResolver'type
AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,contentDownloadUrl:AssetDownloadUrl,
pendingRequests:{[CacheKey]:{thread}}}export type AssetResolver=AssetResolverState&{resolve:(self:AssetResolver,value:
unknown)->ResolvedAsset?,getAssetContentFromUrl:(self:AssetResolver,url:string,cacheKey:CacheKey?,forced:boolean?)->
string?,getAssetContentFromId:(self:AssetResolver,id:AssetId,forced:boolean?)->string?}local ah=8 function ag.new(ai:
boolean?,aj:AssetDownloadUrl?):AssetResolver local ak:{[CacheKey]:string}?=if ai then{}else nil local al=setmetatable({
contentCache=ak,contentCacheOrder=if ai then{}::{CacheKey}else nil,contentDownloadUrl=aj or ag.Enum.AssetDownloadUrl.
RobloxDownloadUrl,pendingRequests={}}::AssetResolverState,ag)::any return al end function ag.resolve(ai:AssetResolver,aj
:unknown):ResolvedAsset?if type(aj)=='number'then return aj end if type(aj)~='string'then return nil end if string.sub(
aj,1,11)=='rbxasset://'or string.sub(aj,1,11)=='rbxthumb://'then return aj end local ak=tonumber(string.match(aj,
'^rbxassetid://(%d+)$'))if ak then return ak end return nil end local function ai(aj:unknown):boolean if type(aj)~=
'table'then return false end local ak=aj::{Body:unknown,StatusCode:unknown,Success:unknown}local al=ak.Body if type(al)
~='string'or#al==0 then return false end if type(ak.StatusCode)=='number'then local am=ak.StatusCode::number return am>=
200 and am<300 end if type(ak.Success)=='boolean'then return ak.Success::boolean end return false end function ag.
getAssetContentFromUrl(aj:AssetResolver,ak:string,al:CacheKey?,am:boolean?):string?local an=aj.contentCache if al~=nil
and an and not am then local ao=an[al]if ao then return ao end end local ao=aj.pendingRequests if al~=nil then local ap=
ao[al]if ap then table.insert(ap,coroutine.running())return coroutine.yield()end ao[al]={}end local ap,aq:string?=(ae.
getRequestFn())if not ap then af.warn'No request function available to download asset content.'else local ar,as=pcall(ap
,{Url=ak,Method='GET'}::AssetRequestPayload)if ar and ai(as)then local at=(as::{Body:string}).Body aq=at if al~=nil and
an then local au=aj.contentCacheOrder if au and an[al]==nil then table.insert(au,al)local av=if#au>ah then table.remove(
au,1)else nil if av~=nil then an[av]=nil end end an[al]=at end elseif not am then af.warn(
'Failed to download asset content for url: '..tostring(ak))end end if al~=nil then local ar=ao[al]ao[al]=nil if ar then
for as,at in ar do coroutine.resume(at,aq)end end end return aq end function ag.getAssetContentFromId(aj:AssetResolver,
ak:AssetId,al:boolean?):string?local am=aj:resolve(ak)if not am or type(am)~='number'then af.warn('Invalid asset id: '..
tostring(am))return nil end local an=string.format(aj.contentDownloadUrl,am)return aj:getAssetContentFromUrl(an,am,al)
end return ag end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae={}function ae.
contrastColor(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.5 then Color3.fromRGB(0,0,0)
else Color3.fromRGB(255,255,255)end function ae.toColorSequence(af:Color3|ColorSequence):ColorSequence return if typeof(
af)=='ColorSequence'then af else ColorSequence.new(af)end function ae.contrastText(af:Color3):Color3 local ag=0.299*af.R
+0.587*af.G+0.114*af.B return if ag>0.6 then Color3.fromRGB(20,20,20)else Color3.fromRGB(255,255,255)end return ae end)(
)end,[47]=function()local aa,ab,ac=a(47)local ad return(function(...)local ae,af=ac(ab.Parent.layouts),{}export type
Side='Left'|'Right'af.overlap=10 af.stackBelow=560 local ag=20 function af.pageWidth(ah:number,ai:ae.Layout):number
return math.max(ah-ae.railWidthFor(ai,ah)-ag,0)end function af.shouldStack(ah:number):boolean return ah>0 and ah<af.
stackBelow end function af.resolveSide(ah:unknown):Side?if ah==nil then return'Left'end if ah==1 then return'Left'elseif
ah==2 then return'Right'end if type(ah)~='string'then return nil end local ai=string.lower(ah)if ai=='left'or ai=='l'
then return'Left'elseif ai=='right'or ai=='r'then return'Right'end return nil end return af end)()end,[48]=function()
local aa,ab,ac=a(48)local ad return(function(...)local ae={}ae.fontAsset='rbxassetid://12187365364'ae.pillResizeInfo=
TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)ae.icons={close=83277910885129,minimise=
108115485663409,maximise=88738500661569,settings=129180860773723,search=100604009889706,chevron=88479147175134,check=
125626312718314,dot=91452555903853,colorpicker=91452555903853,config=125823673784681,rayfield=80387863064905}ae.
actionIconScale={[ae.icons.close]=1,[ae.icons.settings]=0.95,[ae.icons.search]=1.05,[ae.icons.minimise]=1.2,[ae.icons.
maximise]=1.15}ae.builtInThemes={'Default','Amethyst','Cobalt','Ember','Frost','Rose'}ae.pageScrollbar={thickness=3,
transparency=0.6}ae.accent={on=Color3.fromRGB(23,153,110),onStroke=Color3.fromRGB(32,201,144)}ae.statAccents={positive={
fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(Color3.fromRGB(0,213
,156),Color3.fromRGB(0,189,135))},negative={fill=ColorSequence.new(Color3.fromRGB(172,47,47),Color3.fromRGB(135,37,37)),
stroke=ColorSequence.new(Color3.fromRGB(255,75,75),Color3.fromRGB(244,67,67))},neutral={fill=ColorSequence.new(Color3.
fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135
))}}ae.zIndex={elementLock=60,elementLockContent=65,bottomFade=100,notification=1500,drag=1000,toast=2000,toastContent=
2001,restoreContent=100001,restoreInteract=100002}ae.displayOrder={window=99999,popup=100001}return ae end)()end,[49]=
function()local aa,ab,ac=a(49)local ad return(function(...)local ae={}function ae.itemFromValue(af,ag)local ah,ai=pcall(
function()return af:FromValue(ag)end)if ah and ai then return ai end local aj,ak=pcall(function()return af:GetEnumItems(
)end)if not aj then return nil end for al,am in ak do if am.Value==ag then return am end end return nil end return ae
end)()end,[50]=function()local aa,ab,ac=a(50)local ad return(function(...)local ae,af=ac(ab.Parent.services),{}local ag=
ae.getService'RunService':IsStudio()local ah=not ag and typeof(writefile)=='function'and typeof(readfile)=='function'and
typeof(isfile)=='function'and typeof(isfolder)=='function'and typeof(makefolder)=='function'and typeof(listfiles)==
'function'and typeof(delfile)=='function'and typeof(delfolder)=='function'if ah then function af.writefile(ai:string,aj:
string)writefile(ai,aj)end function af.readfile(ai:string):string return readfile(ai)end if typeof(appendfile)==
'function'then function af.appendfile(ai:string,aj:string)appendfile(ai,aj)end end function af.isfile(ai:string):boolean
return isfile(ai)end function af.delfile(ai:string)delfile(ai)end function af.listfiles(ai:string):{string}return
listfiles(ai)end function af.makefolder(ai:string)makefolder(ai)end function af.isfolder(ai:string):boolean return
isfolder(ai)end function af.delfolder(ai:string)delfolder(ai)end elseif ag then local ai=Instance.new'Folder'ai.Name=
'Filesystem'ai.Parent=ae.getService'ReplicatedStorage'local function aj(ak:string):{string}local al={}for am in string.
gmatch(ak,'[^/]+')do table.insert(al,am)end return al end local function ak(al:{string},am:boolean):Instance?local an:
Instance=ai for ao=1,#al-1 do local ap=an:FindFirstChild(al[ao])if not ap then if not am then return nil end local aq=
Instance.new'Folder'aq.Name=al[ao]aq.Parent=an ap=aq end an=ap::Instance end return an end local function al(am:Instance
?):StringValue?if am and am:IsA'StringValue'then return am end return nil end function af.writefile(am:string,an:string)
local ao=aj(am)assert(#ao>0,'Invalid path')local ap=ak(ao,true)assert(ap,'Invalid path')local aq=ao[#ao]local ar=ap:
FindFirstChild(aq)local as=al(ar)if as then as.Value=an else if ar then ar:Destroy()end local at=Instance.new
'StringValue'at.Name=aq at.Value=an at.Parent=ap end end function af.readfile(am:string):string local an=aj(am)assert(#
an>0,'Invalid path')local ao=ak(an,false)assert(ao,'File not found: '..am)local ap=ao:FindFirstChild(an[#an])local aq=
al(ap)assert(aq,'File not found: '..am)return aq.Value end function af.isfile(am:string):boolean local an=aj(am)if#an==0
then return false end local ao=ak(an,false)if not ao then return false end return al(ao:FindFirstChild(an[#an]))~=nil
end function af.listfiles(am:string):{string}local an,ao:Instance=aj(am),ai for ap,aq in an do local ar=ao:
FindFirstChild(aq)if not ar or not ar:IsA'Folder'then error('Folder not found: '..am)end ao=ar end local ap:{string}={}
for aq,ar in ao:GetChildren()do table.insert(ap,am..'/'..ar.Name)end return ap end function af.delfile(am:string)local
an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false)assert(ao,'File not found: '..am)local ap=ao:FindFirstChild(an
[#an])local aq=al(ap)assert(aq,'File not found: '..am)aq:Destroy()end function af.makefolder(am:string)local an=aj(am)if
#an==0 then return end local ao:Instance=ai for ap,aq in an do local ar=ao:FindFirstChild(aq)if not ar then local as=
Instance.new'Folder'as.Name=aq as.Parent=ao ar=as end ao=ar::Instance end end function af.isfolder(am:string):boolean
local an=aj(am)if#an==0 then return false end local ao:Instance=ai for ap,aq in an do local ar=ao:FindFirstChild(aq)if
not ar or not ar:IsA'Folder'then return false end ao=ar end return true end function af.delfolder(am:string)local an=aj(
am)assert(#an>0,'Invalid path')local ao=ak(an,false)assert(ao,'Folder not found: '..am)local ap=ao:FindFirstChild(an[#an
])assert(ap and ap:IsA'Folder','Folder not found: '..am)ap:Destroy()end end if af.writefile and not af.appendfile then
function af.appendfile(ai:string,aj:string)local ak=if af.isfile(ai)then af.readfile(ai)else nil af.writefile(ai,if ak
then ak..aj else aj)end end function af.ensureFolder(ai:string)if not af.isfolder(ai)then af.makefolder(ai)end end
function af.ensureDir(ai:string)local aj=''for ak in string.gmatch(ai,'[^/]+')do aj=if aj==''then ak else aj..'/'..ak if
not af.isfolder(aj)then af.makefolder(aj)end end end return af end)()end,[51]=function()local aa,ab,ac=a(51)local ad
return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),'RayfieldColumns',{}ah.__index=ah
export type FileSystemManager={root:string,assets:string,getPath:(self:FileSystemManager,subpath:string?)->string,
getAssetsFolder:(self:FileSystemManager,subfolder:string?)->string,getRootFolder:(self:FileSystemManager)->string}
function ah.new(ai:string?):FileSystemManager local aj=ai or ag local ak=setmetatable({root=aj,assets=aj..'/Assets'},ah)
::any pcall(ae.ensureFolder,ak.root)pcall(ae.ensureFolder,ak.assets)return ak end function ah.getPath(ai,aj:string?):
string return af.join(ai.root,aj)end function ah.getAssetsFolder(ai,aj:string?):string if aj then local ak=af.join(ai.
assets,aj)pcall(ae.ensureFolder,ak)return ak end return ai.assets end function ah.getRootFolder(ai):string return ai.
root end return ah end)()end,[52]=function()local aa,ab,ac=a(52)local ad return(function(...)local ae,af,ag={},
2166136261,16777619 local function ah(ai:string):number local aj=af for ak=1,#ai do aj=bit32.bxor(aj,string.byte(ai,ak))
local al=aj%65536 local am=(aj-al)/65536 aj=(((am*ag)%65536)*65536+al*ag)%4294967296 end return aj end function ae.
deriveFlagFromName(ai:string):string local aj=ai:gsub('(%S+)',function(aj:string):string return aj:sub(1,1):upper()..aj:
sub(2,-1)end):gsub('[^%w]','')if aj==''and ai~=''then return string.format('Flag%08x',ah(ai))end return aj end return ae
end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(function(...)local ae=ac(ab.Parent.services)local af,ag,ah,
ai,aj,ak=ae.getService'HttpService',ae.getService'RunService',ac(ab.Parent.filesystem),ac(ab.Parent.assetResolver),ac(ab
.Parent.log),ac(ab.Parent.path)local function al(am:unknown):string?local an,ao=pcall(function()return af:JSONEncode(am)
end)if an and type(ao)=='string'then return ao else aj.warn('Failed to encode JSON:',ao)return nil end end
local function am(an:string):unknown?local ao,ap=pcall(function()return af:JSONDecode(an)end)if ao then return ap else
aj.warn('Failed to decode JSON:',ap)return nil end end local an={}an.__type='fontManager'export type FontFace={name:
string,family:string,weight:number,style:string,assetId:string}export type FontManifest={name:string,faces:{FontFace}}
export type CachedFont={customId:number|string,manifest:FontManifest,loadedFromDisk:boolean,variants:{[string]:Font}}
export type FontCache={[number]:CachedFont}export type FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,
skipCache:boolean?}type FontManagerState={_debug:boolean,_pendingLoads:{[string]:{thread}},rootFolder:string,
assetResolver:ai.AssetResolver,defaultOptions:FontResolverOptions,fontCache:FontCache?}export type FontManager=
FontManagerState&{resolve:(self:FontManager,id:number|string)->Font?,loadFont:(self:FontManager,id:(number|string)?,
fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,saveToDisk:boolean?,skipCache:boolean?)->Font?,getFontFromId:(self
:FontManager,id:number|string)->Font?}export type fontManager=FontManager local function ao(ap:unknown):FontManifest?
local aq=ap::any if type(aq)~='table'or type(aq.name)~='string'or type(aq.faces)~='table'then return nil end aq.name=ak.
sanitizeFile(aq.name)if#aq.name==0 or#aq.faces==0 then return nil end for ar,as in aq.faces do if type(as)~='table'or
type(as.name)~='string'or type(as.assetId)~='string'then return nil end as.name=ak.sanitizeFile(as.name)if#as.name==0
then return nil end end return aq::FontManifest end local ap={'\0\1\0\0','OTTO','true','ttcf','wOFF','wOF2'}
local function aq(ar:string):boolean for as,at in ap do if string.sub(ar,1,#at)==at then return true end end return
false end local ar=getfenv()local function as(at:Enum.FontWeight,au:Enum.FontStyle):string return tostring(at)..'|'..
tostring(au)end local function at(au:unknown):number?if type(au)=='number'then return au end if type(au)=='string'then
return tonumber(au)end return nil end function an.__index(au:FontManagerState,av:unknown):unknown local aw=(an::any)[av]
if aw~=nil then return aw end local ax=at(av)if not ax then return nil end local b=au.fontCache if b then local c=b[ax]
if c then local d=as(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local e=c.variants and c.variants[d]if e then return
e end for f,g in pairs(c.variants or{})do return g end end end return nil end function an.new(au:string,av:boolean?,aw:
boolean?,ax:ai.AssetDownloadUrl?,b:FontResolverOptions?):FontManager local c=b or{saveToDisk=true,skipCache=not aw or
false,fallbackFont=Font.fromEnum(Enum.Font.SourceSans)}local d=setmetatable({rootFolder=au,fontCache=if aw then{}::
FontCache else nil,assetResolver=ai.new(aw,ax),defaultOptions=c,_debug=av or ag:IsStudio()or false,_pendingLoads={}}::
FontManagerState,an)::any pcall(ah.ensureFolder,au)return d end local function au(av:FontManager,aw:number,ax:Enum.
FontWeight,b:Enum.FontStyle,c:string):Font?local d=av.rootFolder..'/'..aw..'.json'if typeof(ah.isfile)~='function'then
return av.defaultOptions.fallbackFont end local e,f:string?=false if ag:IsStudio()and av._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]f=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(d)then local g,h=pcall(ah.readfile,d)f=g and h or nil else f=av.assetResolver:getAssetContentFromId(aw,
false)e=f~=nil end local g:FontManifest?if f then local h,i=pcall(am,f)if h and i then g=ao(i)else if av._debug then aj.
warn('Failed to parse font manifest for font id: '..tostring(aw)..'. Error: '..tostring(i))end end else return av.
defaultOptions.fallbackFont end if not g then if av._debug then aj.warn('Font manifest is nil for font id: '..tostring(
aw))end pcall(ah.delfile,d)return av.defaultOptions.fallbackFont end if e and f then pcall(ah.writefile,d,f)end local h,
i=av.rootFolder..'/'..g.name,true if not pcall(ah.ensureFolder,h)then return av.defaultOptions.fallbackFont end for j,k
in ipairs(g.faces)do local l=h..'/'..k.name:gsub(' ','-')..'.ttf'if ah.isfile(l)then local m,n=pcall(ah.readfile,l)if
not m or type(n)~='string'or not aq(n)then pcall(ah.delfile,l)end end if not ah.isfile(l)then local m=av.assetResolver:
resolve(k.assetId)local n=if m~=nil then av.assetResolver:getAssetContentFromId(m,false)else nil if not n or not aq(n)
then i=false if av._debug then aj.warn('Font face content is missing or not a font for font id: '..tostring(aw)..
', face: '..k.name)end continue end pcall(ah.writefile,l,n)end local m,n=pcall(ar.getcustomasset,l)if m and type(n)==
'string'then g.faces[j].assetId=n if av._debug then aj.print('Loaded font face for id: '..tostring(aw)..', face: '..k.
name)end else i=false if av._debug then aj.warn('Failed to load font face for id: '..tostring(aw)..', face: '..k.name)
end end end if not i then return av.defaultOptions.fallbackFont end local j=al(g)if not j or not pcall(ah.writefile,h..
'/manifest.json',j)then return av.defaultOptions.fallbackFont end local k,l=pcall(ar.getcustomasset,h..'/manifest.json')
if not k or not l then if av._debug then aj.warn('Failed to load font manifest for id: '..tostring(aw))end return av.
defaultOptions.fallbackFont end local m,n=pcall(Font.new,l::any,ax,b)if not m or not n then if av._debug then aj.warn(
'Failed to load font for id: '..tostring(aw))end return av.defaultOptions.fallbackFont end local o=av.fontCache if o
then o[aw]={customId=l,manifest=g,loadedFromDisk=true,variants={[c]=n}}if av._debug then aj.print('Cached font for id: '
..tostring(aw))end end return n end function an.loadFont(av:FontManager,aw:(number|string)?,ax:Enum.FontWeight?,b:Enum.
FontStyle?,c:boolean?,d:boolean?):Font?if c==nil then c=av.defaultOptions.saveToDisk end if d==nil then d=av.
defaultOptions.skipCache end local e,f=ax or Enum.FontWeight.Regular,b or Enum.FontStyle.Normal local g,h=as(e,f),av.
assetResolver:resolve(aw)local i=at(h)if not i then aj.warn('Invalid font id: '..tostring(aw))return av.defaultOptions.
fallbackFont end local j=av.fontCache if j and not d then local k=j[i]if k then local l=k.variants and k.variants[g]if l
then if av._debug then aj.print('Loaded font from cache for id: '..tostring(i))end return l end local m,n=pcall(Font.new
,k.customId::any,e,f)if m and n then k.variants=k.variants or{}k.variants[g]=n if av._debug then aj.print(
'Loaded font variant from cache for id: '..tostring(i))end return n else if av._debug then aj.warn(
'Failed to load font from cache for id: '..tostring(i))end j[i]=nil return av.defaultOptions.fallbackFont end end end if
not c then if av._debug then aj.warn[[Font loading without saving to disk can be detected by Anti-cheats.]]end return av
.defaultOptions.fallbackFont end local k,l=av._pendingLoads,tostring(i)..'|'..g local m=k[l]if m then table.insert(m,
coroutine.running())return coroutine.yield()end k[l]={}local n,o=pcall(au,av,i,e,f,g)local p=if n then o else av.
defaultOptions.fallbackFont m=k[l]k[l]=nil if m then for q,r in m do coroutine.resume(r,p)end end return p end function
an.resolve(av:FontManager,aw:number|string):Font?local ax=at(aw)if not ax then return nil end local b=av.fontCache if b
then local c=b[ax]if c then if av._debug then aj.print('Resolved font for id: '..tostring(ax))end for d,e in pairs(c.
variants or{})do return e end end end return nil end function an.getFontFromId(av:FontManager,aw:number|string):Font?
return av:resolve(aw)end return an end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local ae,af
,ag,ah={},ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.flagNames)ae.textWidth=af.textWidth ae.textHeight=
af.textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae.contrastColor=ag.contrastColor ae.toColorSequence=ag.
toColorSequence ae.contrastText=ag.contrastText return ae end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(
function(...)local ae,af,ag,ah,ai,aj,ak,al,am={},1024,48,bit32.band,bit32.bor,bit32.bxor,bit32.lshift,bit32.rshift,bit32
.bnot local function an(ao)if ao%2==0 and task and task.wait then task.wait()end end local function ao(ap,aq)local ar={}
while true do local as=buffer.readu8(ap,aq)aq+=1 if as==0 then break end table.insert(ar,buffer.readstring(ap,aq,as))aq
+=as end return table.concat(ar),aq end local function ap(aq,ar,as)local at=table.create(as)for au=0,as-1 do local av=ar
+au*3 at[au]={buffer.readu8(aq,av),buffer.readu8(aq,av+1),buffer.readu8(aq,av+2)}end return at,ar+as*3 end
local function aq(ar:string,as:number,at:number)local au,av=buffer.create(at),ak(1,as)local aw,ax,b,c=av+1,table.create(
4096,0),table.create(4096,0),table.create(4097,0)for d=0,av-1 do b[d]=d end local d=as+1 local e,f,g,h,i,j,k,l,m=ak(1,d)
-1,av+2,-1,0,0,0,0,#ar,1 while i<at do while j<d do if m>l then return au end k=ai(k,ak(string.byte(ar,m),j))m+=1 j+=8
end local n=ah(k,e)k=al(k,d)j-=d if n==av then d=as+1 e=ak(1,d)-1 f=av+2 g=-1 elseif n==aw then break else local o,p=n,0
if g==-1 then buffer.writeu8(au,i,b[n])i+=1 g=n h=b[n]continue end if n>=f then p+=1 c[p]=h n=g end while n>=av do p+=1
c[p]=b[n]n=ax[n]end h=b[n]p+=1 c[p]=h while p>0 and i<at do buffer.writeu8(au,i,c[p])i+=1 p-=1 end if f<4096 then ax[f]=
g b[f]=h f+=1 if f>e and d<12 then d+=1 e=ak(1,d)-1 end end g=o end end return au end function ae.decode(ar:string)local
as=buffer.fromstring(ar)local at=buffer.readstring(as,0,6)if at~='GIF87a'and at~='GIF89a'then error'not a GIF'end local
au,av,aw,ax,b=buffer.readu16(as,6),buffer.readu16(as,8),buffer.readu8(as,10),13 if ah(aw,0x80)~=0 then b,ax=ap(as,ax,ak(
1,ah(aw,7)+1))end local c,d,e,f,g,h,i=buffer.create(au*av*4),{},0.1,0,(buffer.len(as))while ax<g and#d<400 do local j=
buffer.readu8(as,ax)ax+=1 if j==0x3b then break elseif j==0x21 then local k=buffer.readu8(as,ax)ax+=1 if k==0xf9 then
local l=buffer.readu8(as,ax+1)f=ah(al(l,2),7)local m=buffer.readu16(as,ax+2)e=if m>1 then m/100 else 0.1 h=if ah(l,1)~=0
then buffer.readu8(as,ax+4)else nil end local l,m=ao(as,ax+(if k==0xf9 then 0 else 0))ax=m elseif j==0x2c then local k,l
,m,n,o=buffer.readu16(as,ax),buffer.readu16(as,ax+2),buffer.readu16(as,ax+4),buffer.readu16(as,ax+6),buffer.readu8(as,ax
+8)ax+=9 local p=b if ah(o,0x80)~=0 then p,ax=ap(as,ax,ak(1,ah(o,7)+1))end local q,r=(buffer.readu8(as,ax))r,ax=ao(as,ax
+1)local s=aq(r,q,m*n)if f==3 then i=buffer.create(buffer.len(c))buffer.copy(i,0,c)end local t=table.create(n)if ah(o,
0x40)~=0 then local u=0 for v,w in{{0,8},{4,8},{2,4},{1,2}}do for x=w[1],n-1,w[2]do t[u]=x u+=1 end end else for u=0,n-1
do t[u]=u end end for u=0,n-1 do local v=l+t[u]if v<av then for w=0,m-1 do local x=k+w if x<au then local y=buffer.
readu8(s,u*m+w)if y~=h and p and p[y]then local z,A=p[y],(v*au+x)*4 buffer.writeu8(c,A,z[1])buffer.writeu8(c,A+1,z[2])
buffer.writeu8(c,A+2,z[3])buffer.writeu8(c,A+3,255)end end end end end local u=buffer.create(buffer.len(c))buffer.copy(u
,0,c)table.insert(d,{pixels=u,delay=e})if f==2 then for v=l,math.min(l+n,av)-1 do buffer.fill(c,(v*au+k)*4,0,math.min(m,
au-k)*4)end elseif f==3 and i then buffer.copy(c,0,i)end e,f,h=0.1,0,nil an(#d)else break end end if#d==0 then error
'the GIF has no frames'end return{width=au,height=av,frames=d}end local function ar(as,at,au,av,aw,ax,b,c,d)local e=math
.max(c/at,d/au)local f,g=(at*e-c)/2,(au*e-d)/2 for h=0,d-1 do local i=math.clamp((h+g+0.5)/e-0.5,0,au-1)local j=math.
floor(i)local k,l=math.min(j+1,au-1),i-j for m=0,c-1 do local n=math.clamp((m+f+0.5)/e-0.5,0,at-1)local o=math.floor(n)
local p,q,r=math.min(o+1,at-1),n-o,(j*at+o)*4 local s,t,u,v=(j*at+p)*4,(k*at+o)*4,(k*at+p)*4,((b+h)*aw+ax+m)*4 for w=0,3
do local x,y=buffer.readu8(as,r+w)*(1-q)+buffer.readu8(as,s+w)*q,buffer.readu8(as,t+w)*(1-q)+buffer.readu8(as,u+w)*q
buffer.writeu8(av,v+w,math.floor(x*(1-l)+y*l+0.5))end end end end function ae.pack(as,at:number,au:number)local av=math.
max(math.floor(af/at),1)local aw,ax=math.min(av*math.max(math.floor(af/au),1),ag),#as.frames local b=math.min(ax,aw)av=
math.min(av,b)local c=math.ceil(b/av)local d,e=av*at,c*au local f,g=buffer.create(d*e*4),0 for h,i in as.frames do g+=i.
delay end for h=0,b-1 do local i=as.frames[math.floor(h*ax/b)+1]ar(i.pixels,as.width,as.height,f,d,(h%av)*at,(h//av)*au,
at,au)an(h)end return{png=ae.encodePng(d,e,f),frames=b,columns=av,frameWidth=at,frameHeight=au,fps=if b>1 and g>0 then
math.clamp(b/g,1,30)else 0}end local as local function at(au,av,aw)if not as then as=table.create(256)for ax=0,255 do
local b=ax for c=1,8 do b=if ah(b,1)~=0 then aj(0xedb88320,al(b,1))else al(b,1)end as[ax]=b end end local ax=0xffffffff
for b=av,av+aw-1 do ax=aj(as[ah(aj(ax,buffer.readu8(au,b)),0xff)],al(ax,8))end return am(ax)end local function au(av,aw,
ax)buffer.writeu8(av,aw,ah(al(ax,24),0xff))buffer.writeu8(av,aw+1,ah(al(ax,16),0xff))buffer.writeu8(av,aw+2,ah(al(ax,8),
0xff))buffer.writeu8(av,aw+3,ah(ax,0xff))end function ae.encodePng(av:number,aw:number,ax):string local b=av*4+1 local c
=b*aw local d=math.max(math.ceil(c/65535),1)local e=2+c+d*5+4 local f=33+(12+e)+12 local g,h=buffer.create(f),0 buffer.
writestring(g,0,'\137PNG\r\n\26\n')h=8 au(g,h,13)buffer.writestring(g,h+4,'IHDR')au(g,h+8,av)au(g,h+12,aw)buffer.
writeu8(g,h+16,8)buffer.writeu8(g,h+17,6)au(g,h+21,at(g,h+4,17))h+=25 au(g,h,e)buffer.writestring(g,h+4,'IDAT')local i=h
+4 h+=8 buffer.writeu8(g,h,0x78)buffer.writeu8(g,h+1,0x1)h+=2 local j,k=buffer.create(c),av*4 for l=0,aw-1 do buffer.
copy(j,l*b+1,ax,l*k,k)end local l,m=1,0 for n=0,c-1 do l+=buffer.readu8(j,n)if l>=65521 then l-=65521 end m+=l if m>=
65521 then m-=65521 end if n%262144==0 then an(n//262144)end end local n,o=c,0 for p=1,d do local q=math.min(n,65535)
buffer.writeu8(g,h,if p==d then 1 else 0)buffer.writeu16(g,h+1,q)buffer.writeu16(g,h+3,aj(q,0xffff))buffer.copy(g,h+5,j,
o,q)h+=5+q o+=q n-=q end au(g,h,ai(ak(m,16),l))h+=4 au(g,h,at(g,i,h-i))h+=4 au(g,h,0)buffer.writestring(g,h+4,'IEND')au(
g,h+8,at(g,h+4,4))return buffer.tostring(g)end return ae end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(
function(...)local ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.variables)type AvatarCallback=ae.AvatarCallback type
PreloadCallback=ae.PreloadCallback local ag={}ag.rewrites=ae.rewrites ag.onBlock=nil::((unknown)->())?type
PendingProperties={[string]:boolean}ag.pending={}::{[number]:{[Instance]:PendingProperties}}local ah,ai:{[string]:
boolean}=false,{Image=true,HoverImage=true,PressedImage=true}local function aj(ak:unknown):number?if type(ak)=='number'
then return ak elseif type(ak)=='string'then return tonumber(string.match(ak,'^rbxassetid://(%d+)$'))end return nil end
local function ak(al:unknown):string if ag.onBlock then ag.onBlock(al)end return''end function ag.preload(al:
PreloadCallback?):(boolean,number)ah=false return ae.preload(function(am)ah=true table.clear(ag.pending)if al then al(am
)end end)end function ag.avatar(al:number,am:AvatarCallback?):string if not af.secureMode then return`rbxthumb://type=AvatarHeadShot&id={
al}&w=48&h=48`end return ae.avatar(al,am)end function ag.assign(al:Instance,am:string,an:unknown)local ao=al::any if not
ai[am]then ao[am]=an return end ao[am]=ag.resolve(an)if af.secureMode and not ah then local ap=aj(an)if ap and not ag.
rewrites[ap]then local aq=ag.pending[ap]if not aq then aq=setmetatable({},{__mode='k'})::any ag.pending[ap]=aq end local
ar=aq[al]if not ar then ar={}aq[al]=ar end ar[am]=true end end end ae.onCached=function(al:number)local am=ag.pending[al
]if not am then return end local an=ag.rewrites[al]if an then for ao,ap in am do if ao.Parent then local aq=ao::any for
ar in ap do aq[ar]=an end end end end ag.pending[al]=nil end function ag.resolve(al:unknown):string if al==nil or al==0
or al==''then return''end if type(al)=='string'then if string.sub(al,1,11)=='rbxasset://'then return al end if string.
sub(al,1,11)=='rbxthumb://'then return if af.secureMode then ak(al)else al end end local am:number?if type(al)=='number'
then am=al elseif type(al)=='string'then am=tonumber(string.match(al,'^rbxassetid://(%d+)$'))end local an=if am then ag.
rewrites[am]else nil if an then return an end if af.secureMode then return ak(al)end if type(al)=='number'then return
'rbxassetid://'..al end if type(al)=='string'then return al end return ak(al)end return ag end)()end,[57]=function()
local aa,ab,ac=a(57)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),ac(ab.
Parent.variables),ac(ab.Parent.constants)export type RewriteMap={[number]:string}export type CacheSettledCallback=(
failed:number)->()export type PreloadCallback=CacheSettledCallback export type AvatarCallback=(uri:string)->()export
type OnCachedCallback=(id:number)->()export type ThumbnailEntry={state:string?,imageUrl:string?}export type
ThumbnailResponse={data:{ThumbnailEntry}?}local ai,aj,ak,al,am,an,ao,ap:{[number]:string}={},ag.fileSystemManager:
getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/aesthetic143147-arch/Rayfield-preview-Gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for aq,ar
in ah.icons do local as=ar::number ap[as]=am..tostring(as)..'.png'end local aq=0 for ar in ap do aq+=1 end ai.rewrites={
}::RewriteMap ai.onCached=nil::OnCachedCallback?local ar='\137PNG\r\n\26\n'local function as(at:string,au:string):string
?if type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(at)
then pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local av=al:getAssetContentFromUrl(au,at,false)if not av or
string.sub(av,1,8)~=ar then return nil end if not pcall(ae.writefile,at,av)then return nil end end local av,aw=pcall(
getfenv().getcustomasset,at)return if av and type(aw)=='string'then aw else nil end local function at(au:number):string
return af.join(ak,'avatar_'..tostring(au)..'.png')end local function au(av:string):string?local aw,ax=pcall(function()
return ag.httpService:JSONDecode(av)end)if not aw or type(ax)~='table'then return nil end local b=(ax::ThumbnailResponse
).data if type(b)~='table'then return nil end local c=b[1]if type(c)~='table'then return nil end local d=c::
ThumbnailEntry if d.state=='Completed'and type(d.imageUrl)=='string'then return d.imageUrl end return nil end
local function av(aw:number):string?local ax:string?for b=1,4 do local c=al:getAssetContentFromUrl(string.format(ao,aw,
an,an),'avatar:'..tostring(aw),b>1)if c then local d=au(c)if d then ax=d break end end if b<4 then task.wait(0.3)end end
if not ax then return nil end return as(at(aw),ax)end local aw:{[number]:{AvatarCallback}},ax:{[number]:boolean}={},{}
function ai.preload(b:PreloadCallback?):(boolean,number)local c=getfenv()if type(c.getcustomasset)~='function'or typeof(
ae.isfile)~='function'then if b then task.defer(b,aq)end return false,aq end local d=ai.rewrites table.clear(d)
local function e()if not b then return end local f=0 for g in ap do if not d[g]then f+=1 end end b(f)end local f,g,h=0,0
,true for i,j in ap do local k,l:string?=(af.join(ak,tostring(i)..'.png'))if ae.isfile(k)then local m,n=pcall(c.
getcustomasset,k)l=if m and type(n)=='string'then n else nil end if l then d[i]=l else g+=1 f+=1 task.spawn(function()
local m=as(k,j)if m then d[i]=m if ai.onCached then pcall(ai.onCached,i)end end f-=1 if f==0 and not h then e()end end)
end end h=false if f==0 then e()end return g==0,g end function ai.avatar(b:unknown,c:AvatarCallback?):string if type(b)
~='number'then return''end if typeof(ae.isfile)~='function'then return''end local d=at(b)if ae.isfile(d)then local e,f=
pcall(getfenv().getcustomasset,d)if e and type(f)=='string'then return f end end if ax[b]then return''end local e=aw[b]
if e then if c then table.insert(e,c)end return''end if c then aw[b]={c}task.spawn(function()local f,g=av(b),aw[b]aw[b]=
nil if not f then ax[b]=true return end if g then for h,i in g do pcall(i,f)end end end)end return''end function ai.
remote(b:string):string?if not string.match(b,'^[%w%-_]+%.png$')then return nil end local c,d=pcall(as,af.join(ak,b),am
..b)return if c then d else nil end function ai.url(b:string,c:string):string?if not string.match(c,'^[%w%-_]+%.png$')
then return nil end local d,e=pcall(as,af.join(ak,c),b)return if d then e else nil end return ai end)()end,[58]=function
()local aa,ab,ac=a(58)local ad return(function(...)local ae,af={},64 local ag,ah,ai=af+7,38,3 export type Mode='top'|
'sidebar'export type Layout={mode:Mode,topbarHeight:number,chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize
:UDim2,fadeTransparency:NumberSequence,fadeCorners:{string}?,tabStripTop:number?,tabStripHeight:number?,railWidth:number
?,railCollapsedWidth:number?,railCollapseBelow:number?,rowHeight:number?,rowCornerRadius:number?,rowSpacing:number?,
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
end return al end return ae end)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)local ae,af,ag=ac(
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
and aj~=''then return string.lower(aj)end return'en'end return ag end)()end,[60]=function()local aa,ab,ac=a(60)local ad
return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.Lock(ah,ai:string?)ah.window:
_setElementLocked(ah,true,ai)end function ag.Unlock(ah)ah.window:_setElementLocked(ah,false)end function ag.IsLocked(ah)
:boolean return ah.locked==true end return af end return ae end)()end,[61]=function()local aa,ab,ac=a(61)local ad return
(function(...)local ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean local function ag():boolean return
ae.secureMode end local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.setSecureModeSource(aj:
SuppressPredicate?)ah=if type(aj)=='function'then aj else ag end function af.setSuppressPredicate(aj:SuppressPredicate?)
ai=if type(aj)=='function'then aj else nil end local function aj():boolean if ai and ai()then return true end return ah(
)end function af.warn(...)if aj()then return end warn(...)end function af.print(...)if aj()then return end print(...)end
return af end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent
.variables),ac(ab.Parent.network),ac(ab.Parent.filesystem),ac(ab.Parent.path),ac(ab.Parent.gifSheet),{}aj.fits={banner=
Vector2.new(256,64),square=Vector2.new(128,128)}local ak=8388608 function aj.folder():string return ah.join(ae.
fileSystemManager:getRootFolder(),'Nameplate')end local function al(am:string):string local an,ao=5381,52711 for ap=1,#
am do local aq=string.byte(am,ap)an=bit32.band(an*33+aq,0xffffffff)ao=bit32.band(ao*31+aq,0xffffffff)end return string.
format('%08x%08x',an,ao)end function aj.direct(am:string,an):(string?,string?)am=am:gsub('^%s+',''):gsub('%s+$','')local
ao=am:match'^https?://giphy%.com/gifs/[%w%-]*%-(%w+)/?$'or am:match'^https?://giphy%.com/gifs/(%w+)/?$'if ao then return
`https://i.giphy.com/media/{ao}/giphy.gif`end local ap=am:match'^https?://imgur%.com/(%w+)/?$'if ap then return`https://i.imgur.com/{
ap}.gif`end local aq=am:match'^(https?://i%.imgur%.com/%w+)%.gifv$'or am:match'^(https?://i%.imgur%.com/%w+)%.mp4$'if aq
then return aq..'.gif'end if am:match'^https?://tenor%.com/'or am:match'^https?://www%.tenor%.com/'then local ar,as=an(
am)if not ar then return nil,"Couldn't open that Tenor page."end local at=as:match
'"(https://media%d*%.tenor%.com/[^"]-%.gif)"'or as:match'(https://media%d*%.tenor%.com/[^"\'%s<>]-%.gif)'if not at then
return nil,"Couldn't find the GIF on that Tenor page."end return at end return am end local function am(an:string):(
boolean,string)local ao=af.getRequestFn()if not ao then return false,"This executor can't make web requests."end local
ap,aq=pcall(ao,{Url=an,Method='GET'})if not ap or type(aq)~='table'then return false,"Couldn't download that."end local
ar=tonumber(aq.StatusCode)or 0 if ar<200 or ar>=300 or type(aq.Body)~='string'then return false,
"Couldn't download that ("..tostring(ar)..').'end return true,aq.Body end aj.io={get=am,isfile=function(an)return ag.
isfile(an)end,read=function(an)return ag.readfile(an)end,write=function(an,ao)ag.ensureFolder(ae.fileSystemManager:
getRootFolder())ag.ensureFolder(ae.fileSystemManager:getAssetsFolder())ag.writefile(an,ao)end,asset=function(an)local ao
=getfenv().getcustomasset if type(ao)~='function'then return nil end local ap,aq=pcall(ao,an)return if ap and type(aq)==
'string'then aq else nil end}local function an(ao:string):string?if ao:sub(1,6)=='GIF87a'or ao:sub(1,6)=='GIF89a'then
return'gif'elseif ao:sub(1,8)=='\137PNG\r\n\26\n'then return'png'elseif ao:sub(1,3)=='\255\216\255'then return'jpg'
elseif ao:sub(1,4)=='RIFF'and ao:sub(9,12)=='WEBP'then return'webp'end return nil end function aj.load(ao:string,ap:
string?)local aq=aj.io if type(ao)~='string'or ao:match'^%s*$'then return nil,'Paste a link or a file name.'end ao=ao:
gsub('^%s+',''):gsub('%s+$','')local ar=aj.fits[ap or'banner']or aj.fits.banner local as,at=al(ao..'|'..tostring(ar)),ae
.fileSystemManager:getAssetsFolder()local au,av=ah.join(at,'media_'..as..'.png'),ah.join(at,'media_'..as..'.json')local
aw,ax=pcall(function()if aq.isfile(av)then return ae.httpService:JSONDecode(aq.read(av))end return nil end)if aw and
type(ax)=='table'and ax.file and aq.isfile(ax.file)then local b=aq.asset(ax.file)if b then return aj.visual(b,ax)end end
local b if ao:match'^https?://'then local c,d=aj.direct(ao,aq.get)if not c then return nil,d end local e,f=aq.get(c)if
not e then return nil,f end b=f else local c=if ao:find('/',1,true)then ao else ah.join(aj.folder(),ao)local d,e=pcall(
function()return if aq.isfile(c)then aq.read(c)else nil end)if not d or not e then return nil,`No file called {ao} in workspace/{
aj.folder()}.`end b=e end if#b>ak then return nil,'That file is too big (8 MB at most).'end local c,d=(an(b))if c=='gif'
then local e,f=pcall(function()return ai.pack(ai.decode(b),ar.X,ar.Y)end)if not e then return nil,
"That GIF couldn't be read."end d={file=au,frames=f.frames,columns=f.columns,frameWidth=f.frameWidth,frameHeight=f.
frameHeight,fps=f.fps}aq.write(au,f.png)elseif c=='png'or c=='jpg'then d={file=ah.join(at,'media_'..as..'.'..c),frames=1
}aq.write(d.file,b)elseif c=='webp'then return nil,"WebP isn't supported. Use a GIF, PNG or JPG link."else return nil,
"That link isn't an image or a GIF."end pcall(aq.write,av,ae.httpService:JSONEncode(d))local e=aq.asset(d.file)if not e
then return nil,"This executor can't load custom images."end return aj.visual(e,d)end function aj.visual(ao:string,ap)if
(ap.frames or 1)<=1 then return{uri=ao}end return{uri=ao,sheet={frames=ap.frames,columns=ap.columns,frameWidth=ap.
frameWidth,frameHeight=ap.frameHeight,fps=ap.fps}}end return aj end)()end,[63]=function()local aa,ab,ac=a(63)local ad
return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:_moveElement(ah
,ai)end function ag.MoveToTop(ah)ah.tab:_moveElement(ah,1)end function ag.MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab
.elements)end function ag.MoveUp(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai-1)end
end function ag.MoveDown(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai+1)end end return
af end return ae end)()end,[64]=function()local aa,ab,ac=a(64)local ad return(function(...)local ae={}ae.__index=ae
export type RequestFn=(...any)->any function ae.getRequestFn(af:any?):RequestFn?af=af or getfenv()return af.request or
af.http_request or(af.http and af.http.request)or(af.syn and af.syn.request)or(af.fluxus and af.fluxus.request)end
return ae end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(function(...)local ae=ac(ab.Parent.variables)
local af,ag=ae.textService,{}ag.__index=ag local ah=20 local function ai(aj,ak,al)local am=Instance.new
'GetTextBoundsParams'am.Text=al am.Font=aj am.Size=ak am.Width=math.huge local an,ao=pcall(af.GetTextBoundsAsync,af,am)
return if an then ao else Vector2.new(ak*0.6,ak)end local aj={}local function ak(al,am)local an=tostring(al.Family)..'|'
..tostring(al.Weight)..'|'..tostring(al.Style)..'|'..tostring(am)local ao=aj[an]if ao then return ao end local ap,aq={},
0 for ar=0,9 do local as=math.ceil(ai(al,am,tostring(ar)).X)ap[ar]=as if as>aq then aq=as end end ao={advance=ap,
maxWidth=aq}aj[an]=ao return ao end function ag.new(al,am,an)an=an or{}local ao=setmetatable({window=al,container=am,
textSize=an.textSize or 16,transparency=an.transparency or 1,duration=an.duration or 0.55,slots={},length=0},ag)ao.roll=
TweenInfo.new(ao.duration,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ao.zIndex=math.max(am.ZIndex+1,6)ao.height=
math.ceil(ao.textSize)local ap=ak(al.theme.Font,ao.textSize)ao.advance=ap.advance ao.maxWidth=ap.maxWidth al:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=an.alignment or Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(
0,0),Parent=am})return ao end function ag._reel(al,am)local an=al.slots[am]if an.reel then return an.reel end local ao=
al.window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,
BorderSizePixel=0,ClipsDescendants=true,ZIndex=al.zIndex,Parent=al.container})local ap=al.window:Create('Frame',{Size=
UDim2.fromOffset(al.maxWidth,al.height),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=al.zIndex,Parent=ao})for aq=0,ah-1 do al.window:Create('TextLabel',{
Text=tostring(aq%10),Position=UDim2.fromOffset(0,aq*al.height),Size=UDim2.fromOffset(al.maxWidth,al.height),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment
=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=ap},{TextColor3='ContentColor',
FontFace='Font'})end local aq={cell=ao,strip=ap,digit=0,target=0,stripTween=nil,sizeTween=nil}an.reel=aq return aq end
function ag._static(al,am)local an=al.slots[am]if an.static then return an.static end local ao=al.window:Create(
'TextLabel',{Name='Static',Size=UDim2.fromOffset(0,al.height),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=
1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.
Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=al.container},{TextColor3='ContentColor',FontFace='Font'
})an.static=ao return ao end local function al(am)if am.stripTween then am.stripTween:Cancel()am.stripTween=nil end if
am.sizeTween then am.sizeTween:Cancel()am.sizeTween=nil end end function ag._reelSnap(am,an,ao)al(an)an.cell.Size=UDim2.
fromOffset(am.advance[ao],am.height)an.strip.Position=UDim2.new(0.5,0,0,-ao*am.height)an.digit=ao an.target=ao end
function ag._reelRoll(am,an,ao,ap)if an.stripTween or an.sizeTween then am:_reelSnap(an,an.target)end local aq=an.digit
if aq==ao then return end local ar,as if ap then ar=aq as=aq+(ao-aq)%10 else ar=aq+10 as=ar-(aq-ao)%10 end an.strip.
Position=UDim2.new(0.5,0,0,-ar*am.height)an.target=ao local at,au=ae.tweenService:Create(an.strip,am.roll,{Position=
UDim2.new(0.5,0,0,-as*am.height)}),ae.tweenService:Create(an.cell,am.roll,{Size=UDim2.fromOffset(am.advance[ao],am.
height)})an.stripTween=at an.sizeTween=au at.Completed:Connect(function(av)if av==Enum.PlaybackState.Completed and an.
stripTween==at then am:_reelSnap(an,ao)end end)at:Play()au:Play()an.digit=ao end function ag._putDigit(am,an,ao,ap,aq)
local ar=am:_reel(an)local as=not ar.cell.Visible ar.cell.Visible=true ar.cell.LayoutOrder=-an if am.slots[an].static
then am.slots[an].static.Visible=false end if aq and not as then am:_reelRoll(ar,ao,ap)else am:_reelSnap(ar,ao)end end
function ag._putStatic(am,an,ao)local ap=am:_static(an)if not ap.Visible then ap.TextTransparency=am.transparency end ap
.Text=ao ap.Visible=true ap.LayoutOrder=-an if am.slots[an].reel then am.slots[an].reel.cell.Visible=false end end
function ag._hide(am,an)local ao=am.slots[an]if not ao then return end if ao.reel then ao.reel.cell.Visible=false end if
ao.static then ao.static.Visible=false end end function ag._render(am,an,ao,ap)an=tostring(an)if an==am._lastText then
return end am._lastText=an local aq={}for ar,as in utf8.codes(an)do table.insert(aq,utf8.char(as))end local ar=#aq for
as=0,math.max(ar,am.length)-1 do am.slots[as]=am.slots[as]or{}if as<ar then local at=aq[ar-as]if at:match'%d'then am:
_putDigit(as,tonumber(at),ap,ao)else am:_putStatic(as,at)end else am:_hide(as)end end am.length=ar end function ag.to(am
,an,ao)am:_render(an,true,ao)end function ag.snap(am,an)am:_render(an,false,true)end function ag.reveal(am,an,ao,ap)am.
transparency=an for aq,ar in am.slots do if ar.static and ar.static.Visible then am.window:_reveal(ar.static,{
TextTransparency=an},ao,ap)end if ar.reel then for as,at in ar.reel.strip:GetChildren()do if at:IsA'TextLabel'then am.
window:_reveal(at,{TextTransparency=an},ao,ap)end end end end end return ag end)()end,[66]=function()local aa,ab,ac=a(66
)local ad return(function(...)type OrderedElement={main:GuiObject,descriptor:{main:GuiObject}?}local function ae(af:
OrderedElement,ag:number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.main.LayoutOrder=ag+1 end end return
ae end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae={}function ae.join(af:string,ag:
string?):string if not ag or ag==''then return af end return af..'/'..ag end local function af(ag:string):string local
ah repeat ah=ag ag=ag:gsub('%.%.','')until ag==ah return ag end function ae.sanitizeFolder(ag:unknown):string local ah=
tostring(ag):gsub('\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')return(ah:gsub('^/+',''))end function ae.
sanitizeFile(ag:unknown):string local ah=tostring(ag):gsub('[/\\]',''):gsub('[:<>"|?*%c]','')return af(ah)end function
ae.basename(ag:unknown):string return tostring(ag):match'[^/\\]+$'or tostring(ag)end function ae.stripExtension(ag:
unknown,ah:string?):string if ah and ah~=''then local ai=tostring(ag)if ai:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end
return ai end local ai=tostring(ag):match'^(.+)%.%w+$'return ai or tostring(ag)end return ae end)()end,[68]=function()
local aa,ab,ac=a(68)local ad return(function(...)local ae,af,ag={},ac(ab.Parent.persistenceConfig),ac(ab.Parent.
persistenceSettings)ae.getPath=af.getPath ae.save=af.save ae.load=af.load ae.applyTo=af.applyTo ae.list=af.list ae.
delete=af.delete ae.getSettingsPath=ag.getSettingsPath ae.saveSettings=ag.saveSettings ae.loadSettings=ag.loadSettings
return ae end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.
Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.log),ac(ab.Parent.path),ac(ab.Parent.persistencePaths),ac(ab.
Parent.persistenceWrite),{}type PersistedControl={value:unknown,flag:string?,_canBeNil:boolean?,_serialize:((
PersistedControl)->unknown)?,_deserialize:((PersistedControl,unknown)->())?,Set:(PersistedControl,unknown)->()}type
ConfigWindow={controls:{[string]:PersistedControl},configuration:{fileName:string?,customFolder:string?},name:string,
_loading:boolean?,_loadedConfig:{[string]:unknown}?,_loadedConfigPath:string?}function ak.getPath(al:ConfigWindow,am:
unknown?):(string?,string?)return ai.getConfigPath(al,am)end function ak.save(al:ConfigWindow,am:unknown?):boolean local
an,ao=ak.getPath(al,am)if not an or not ao then ag.warn("Rayfield: configuration name '"..tostring(am)..
"' has no usable characters")return false end if typeof(af.writefile)~='function'then return false end local ap:{[string
]:unknown}={}for aq,ar in al.controls do local as,at=pcall(function()local as=ar._serialize if as then return as(ar)end
return ar.value end)if as then ap[aq]=at else ag.warn("Rayfield: Failed to serialize flag '"..tostring(aq).."' - "..
tostring(at))end end local aq=al._loadedConfig if aq and al._loadedConfigPath==ao then for ar,as in aq do if al.controls
[ar]==nil then ap[ar]=as end end end local ar,as=pcall(ae.httpService.JSONEncode,ae.httpService,ap)if not ar then ag.
warn('Rayfield: Failed to encode configuration - '..tostring(as))return false end local at,au=pcall(function()aj.write(
an,ao,as)end)if not at then ag.warn('Rayfield: Failed to save configuration - '..tostring(au))return false end if al.
_loadedConfigPath==nil or al._loadedConfigPath==ao then al._loadedConfig=ap al._loadedConfigPath=ao end return true end
local function al(am:string):({[string]:unknown}?,string?)if not af.isfile(am)then return nil,nil end local an,ao=pcall(
af.readfile,am)if not an or type(ao)~='string'then ag.warn'Rayfield: Failed to read configuration file'return nil,nil
end local ap,aq=pcall(ae.httpService.JSONDecode,ae.httpService,ao)if not ap or type(aq)~='table'then return nil,ao end
return aq::{[string]:unknown},ao end local function am(an:string):string local ao=ah.stripExtension(an,'.rfld')local ap,
aq=ao..' (Incorrect Format).rfld',2 while aq<=100 and af.isfile(ap)do ap=ao..' (Incorrect Format '..aq..').rfld'aq+=1
end return ap end function ak.load(an:ConfigWindow,ao:unknown?):boolean local ap,aq=ak.getPath(an,ao)if not ap or not aq
then ag.warn("Rayfield: configuration name '"..tostring(ao).."' has no usable characters")return false end if typeof(af.
isfile)~='function'then return false end local ar,as=al(aq)if not ar and af.isfile(aq)then local at,au=al(aj.
tempPathFor(aq))if at and au then ar=at pcall(aj.write,ap,aq,au)end end if not ar then if as then ag.warn
[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local at=am(aq)pcall(function()af.
ensureDir(ap)af.writefile(at,as)af.delfile(aq)end)end return false end local at,au=ar::{[string]:unknown},an._loading an
._loading=true local av,aw=pcall(function()for av,aw in an.controls do ak.applyTo(aw,at[av])end end)an._loading=au if
not av then ag.warn('Rayfield: Failed to apply configuration - '..tostring(aw))end an._loadedConfig=at an.
_loadedConfigPath=aq return true end function ak.applyTo(an:PersistedControl,ao:unknown)if ao==nil and not an._canBeNil
then return end local ap,aq=pcall(function()local ap=an._deserialize if ap then ap(an,ao)else an:Set(ao)end end)if not
ap then ag.warn("Rayfield: Failed to restore flag '"..tostring(an.flag).."' - "..tostring(aq))end end function ak.list(
an:ConfigWindow):{string}local ao,ap:{string}=ak.getPath(an),{}if not ao then return ap end local aq,ar=pcall(af.
listfiles,ao)if not aq or type(ar)~='table'then return ap end for as,at in ar do local au=ah.basename(at)if au:sub(-5)==
'.rfld'then local av=ah.stripExtension(au,'.rfld')if av and av~=''and not av:find' %(Incorrect Format[^%)]*%)$'then
table.insert(ap,av)end end end table.sort(ap)return ap end function ak.delete(an:ConfigWindow,ao:unknown):boolean if
type(ao)~='string'or ao==''then return false end local ap,aq=ak.getPath(an,ao)if not aq then return false end if typeof(
af.isfile)~='function'or not af.isfile(aq)then return false end pcall(af.delfile,aj.tempPathFor(aq))return(pcall(af.
delfile,aq))end return ak end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae,af,ag=ac(ab
.Parent.variables),ac(ab.Parent.path),{}type ConfigWindow={configuration:{fileName:string?,customFolder:string?},name:
string}function ag.getConfigPath(ah:ConfigWindow,ai:unknown?):(string?,string?)local aj=ae.fileSystemManager:getPath
'Configurations'if ah.configuration.customFolder then aj=af.join(aj,af.sanitizeFolder(ah.configuration.customFolder))end
if ai~=nil then local ak=af.sanitizeFile(ai)if ak==''then return nil,nil end return aj,af.join(aj,ak..'.rfld')end local
ak=af.sanitizeFile(ah.configuration.fileName or ah.name)if ak==''then ak=af.sanitizeFile(ah.name)end if ak==''then ak=
'Configuration'end return aj,af.join(aj,ak..'.rfld')end function ag.getSettingsPath():(string,string)local ah=ae.
fileSystemManager:getPath'Settings'return ah,af.join(ah,'rayfield.rfld')end return ag end)()end,[71]=function()local aa,
ab,ac=a(71)local ad return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(
ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),ac(ab.Parent.constants),{}type
SettingsWindow={settings:{toggleKeybind:EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics
:boolean,showProfile:boolean,theme:string?}}type DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:
unknown?,keepOnScreen:unknown?,welcomeToast:unknown?,haptics:unknown?,showProfile:unknown?,theme:unknown?}function ak.
getSettingsPath():(string,string)return ag.getSettingsPath()end function ak.saveSettings(al:SettingsWindow):boolean
local am,an=ak.getSettingsPath()local ao:{[string]:unknown}={toggleKeybind={tostring(al.settings.toggleKeybind.EnumType)
,al.settings.toggleKeybind.Value}::{unknown},mouseOverride=al.settings.mouseOverride,keepOnScreen=al.settings.
keepOnScreen,welcomeToast=al.settings.welcomeToast,haptics=al.settings.haptics,showProfile=al.settings.showProfile,theme
=al.settings.theme}local ap,aq=pcall(ae.httpService.JSONEncode,ae.httpService,ao)if not ap then return false end local
ar=pcall(ah.write,am,an,aq)if not ar then return false end return true end local function al(am:string):(DecodedSettings
?,string?)local an=false pcall(function()an=af.isfile(am)end)if not an then return nil,nil end local ao,ap=pcall(af.
readfile,am)if not ao or type(ap)~='string'then return nil,nil end local aq,ar=pcall(ae.httpService.JSONDecode,ae.
httpService,ap)if not aq or type(ar)~='table'then return nil,ap end return ar::DecodedSettings,ap end function ak.
loadSettings(am:SettingsWindow):boolean local an,ao=ak.getSettingsPath()local ap=al(ao)if not ap then local aq,ar=al(ah.
tempPathFor(ao))if aq and ar then ap=aq pcall(ah.write,an,ao,ar)end end if not ap then return false end if ap.
toggleKeybind then pcall(function()local aq=tostring(ap.toggleKeybind[1]):gsub('^Enum%.','')local ar=(Enum::any)[aq]if
ar then local as=ai.itemFromValue(ar,ap.toggleKeybind[2])if as then am.settings.toggleKeybind=as end end end)end if
type(ap.mouseOverride)=='boolean'then am.settings.mouseOverride=ap.mouseOverride end if type(ap.keepOnScreen)=='boolean'
then am.settings.keepOnScreen=ap.keepOnScreen end if type(ap.welcomeToast)=='boolean'then am.settings.welcomeToast=ap.
welcomeToast end if type(ap.haptics)=='boolean'then am.settings.haptics=ap.haptics end if type(ap.showProfile)==
'boolean'then am.settings.showProfile=ap.showProfile end if type(ap.theme)=='string'and table.find(aj.builtInThemes,ap.
theme)then am.settings.theme=ap.theme end return true end return ak end)()end,[72]=function()local aa,ab,ac=a(72)local
ad return(function(...)local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string
return ah..ag end function af.write(ah:string,ai:string,aj:string)local ak=af.tempPathFor(ai)ae.ensureDir(ah)ae.
writefile(ak,aj)if ae.readfile(ak)~=aj then error'parked copy did not write cleanly'end ae.writefile(ai,aj)pcall(ae.
delfile,ak)end return af end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae,af,ag=ac(ab.
Parent.variables),ac(ab.Parent.network),{}function ag.request(ah,ai:string,aj:string,ak:any?):(boolean,any)if ah.
transport then local al,am,an=pcall(ah.transport,ai,aj,ak)if not al then return false,{error=tostring(am)}end return am,
an end if type(ah.endpoint)~='string'then return false,{error='No relay address.'}end local al=af.getRequestFn()if not
al then return false,{error="This executor can't make web requests."}end local am={['Content-Type']='application/json'}
if ah.key then am['X-Chat-Key']=tostring(ah.key)end local an,ao=pcall(al,{Url=ah.endpoint..aj,Method=ai,Headers=am,Body=
if ak~=nil then ae.httpService:JSONEncode(ak)else nil})if not an or type(ao)~='table'then return false,{error=
'No response from the relay.'}end local ap if type(ao.Body)=='string'and ao.Body~=''then local aq,ar=pcall(ae.
httpService.JSONDecode,ae.httpService,ao.Body)ap=if aq then ar else nil end local aq=tonumber(ao.StatusCode)or 0 return
aq>=200 and aq<300,ap or{}end function ag.segment(ah):string local ai=tostring(ah):gsub('[^%w%-_%.~]',function(ai)return
string.format('%%%02X',string.byte(ai))end)return ai end function ag.base(ah):string?if type(ah)~='string'then return
nil end local ai=ah:gsub('/+$','')return ai end return ag end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(
function(...)local ae=ac(ab.Parent.services)export type RuntimeState={secureMode:boolean,coreGui:CoreGui,workspace:
Workspace,runService:RunService,userInputService:UserInputService,guiService:GuiService,localPlayer:Player?,tweenService
:TweenService,httpService:HttpService,textService:TextService,replicatedStorage:ReplicatedStorage,localizationService:
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
end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae={}function ae.getService(af)local ag=
game:GetService(af)return if cloneref then cloneref(ag)else ag end return ae end)()end,[76]=function()local aa,ab,ac=a(
76)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{}
,{},0,1024 local function ak(al:GetTextBoundsParams):unknown local am,an=pcall(function()return af:GetTextBoundsAsync(al
)end)return if am then an else nil end local function al(am:unknown,an:'X'|'Y'):number?if typeof(am)=='Vector2'then
return if an=='X'then am.X else am.Y end if type(am)=='table'and type((am::any)[an])=='number'then return(am::any)[an]
end return nil end function ag.textWidth(am:Font,an:number,ao:any):number ao=tostring(ao)local ap=tostring(am.Family)..
'|'..tostring(am.Weight)..'|'..tostring(am.Style)..'|'..tostring(an)..'|'..ao local aq=ah[ap]if aq then return aq end
local ar=Instance.new'GetTextBoundsParams'ar.Text=ao ar.Font=am ar.Size=an ar.Width=math.huge local as=al(ak(ar),'X')if
not as then local at=utf8.len(ao)or#ao return math.ceil(an*0.55*at)end local at=math.ceil(as)if ai>=aj then ah={}ai=0
end ah[ap]=at ai+=1 return at end function ag.textHeight(am:Font,an:number,ao:any,ap:number):number local aq=Instance.
new'GetTextBoundsParams'aq.Text=tostring(ao)aq.Font=am aq.Size=an aq.Width=ap local ar=al(ak(aq),'Y')return if ar then
math.ceil(ar)else an end return ag end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(function(...)local ae,af
,ag,ah,ai,aj=ac(ab.Parent.runtime),ac(ab.Parent.constants),ac(ab.Parent.log),ac(ab.Parent.filesystemManager),ac(ab.
Parent.assetResolver),ac(ab.Parent.fontManager)type RuntimeState=ae.RuntimeState type FileSystemManager=ah.
FileSystemManager type AssetResolver=ai.AssetResolver type FontManager=aj.FontManager export type VariablesState=
RuntimeState&{fallbackFont:Font,fileSystemManager:FileSystemManager,assetResolver:AssetResolver,fontManager:FontManager,
setFallbackFont:(font:Enum.Font|Font)->(),brandFont:(weight:Enum.FontWeight?)->Font}local ak=table.clone(ae)::
VariablesState ag.setSecureModeSource(function()return ak.secureMode end)ak.fallbackFont=Font.fromEnum(Enum.Font.
BuilderSans)ak.fileSystemManager=ah.new()ak.assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl)::
AssetResolver ak.fontManager=aj.new(ak.fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.AssetDownloadUrl.
RoProxyDownloadUrl,{saveToDisk=true,skipCache=false,fallbackFont=ak.fallbackFont})::FontManager function ak.
setFallbackFont(al:Enum.Font|Font)if typeof(al)=='EnumItem'then al=Font.fromEnum(al)end if typeof(al)=='Font'then ak.
fallbackFont=al ak.fontManager.defaultOptions.fallbackFont=al end end function ak.brandFont(al:Enum.FontWeight?):Font if
ak.secureMode then return Font.new(ak.fallbackFont.Family,al)end return Font.new(af.fontAsset,al)end return ak end)()end
,[78]=function()local aa,ab,ac=a(78)local ad return(function(...)local ae,af=ac(ab.Parent.layouts),{}export type Profile
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
Vector2?,ap:ae.Mode?):number if not ao or ao.X<ag or ao.Y<ag then return 1 end local aq=af.profile(ap)local ar=math.min(
ao.X*am/aq.defaultSize.X,ao.Y*an/aq.defaultSize.Y)return math.floor(math.clamp(ar,af.minScale,1)*100)/100 end function
af.fit(ao:Vector2?,ap:ae.Mode?):UDim2 local aq=af.profile(ap)if not ao or ao.X<ag or ao.Y<ag then return UDim2.
fromOffset(aq.defaultSize.X,aq.defaultSize.Y)end local ar,as=math.min(ao.X*aq.maxOccupancyX,ao.X-aq.marginFloorX),ai(aq,
ao.Y)if aq.minAspectRatio then return al(aq,ar,as)end return ak(aq,ar,as)end return af end)()end},{{1,2,{'Rayfield'},{{
34,1,{'themes'},{{39,2,{'frost'}},{35,2,{'amethyst'}},{40,2,{'rose'}},{37,2,{'default'}},{38,2,{'ember'}},{36,2,{
'cobalt'}}}},{42,1,{'utility'},{{61,2,{'log'}},{72,2,{'persistenceWrite'}},{77,2,{'variables'}},{65,2,{'odometer'}},{44,
2,{'animatedImage'}},{52,2,{'flagNames'}},{67,2,{'path'}},{78,2,{'windowSizing'}},{60,2,{'lockable'}},{53,2,{
'fontManager'}},{57,2,{'imageCache'}},{43,2,{'HapticEngine'}},{68,2,{'persistence'}},{56,2,{'image'}},{64,2,{'network'}}
,{46,2,{'colors'}},{47,2,{'columns'}},{70,2,{'persistencePaths'}},{69,2,{'persistenceConfig'}},{48,2,{'constants'}},{66,
2,{'ordering'}},{71,2,{'persistenceSettings'}},{75,2,{'services'}},{74,2,{'runtime'}},{45,2,{'assetResolver'}},{59,2,{
'locale'}},{73,2,{'relayClient'}},{76,2,{'textMetrics'}},{50,2,{'filesystem'}},{63,2,{'moveable'}},{55,2,{'gifSheet'}},{
58,2,{'layouts'}},{51,2,{'filesystemManager'}},{62,2,{'mediaLoader'}},{54,2,{'functions'}},{49,2,{'enums'}}}},{41,2,{
'types'}},{2,1,{'components'},{{5,2,{'chat'}},{9,2,{'console'}},{7,2,{'colorpicker'}},{33,2,{'window'}},{32,2,{'toggle'}
},{14,2,{'group'}},{18,2,{'notification'}},{12,2,{'drag'}},{23,2,{'sidebar'}},{11,2,{'divider'}},{16,2,{'keybind'}},{4,2
,{'button'}},{27,2,{'tabSection'}},{3,2,{'action'}},{30,2,{'text'}},{6,2,{'chrome'}},{22,2,{'section'}},{19,2,{'popup'}}
,{29,2,{'tag'}},{21,2,{'search'}},{10,2,{'descriptor'}},{17,2,{'nameplate'}},{24,2,{'slider'}},{25,2,{'stat'}},{26,2,{
'tab'}},{8,2,{'column'}},{28,2,{'tabSelector'}},{20,2,{'progress'}},{15,2,{'input'}},{31,2,{'toast'}},{13,2,{'dropdown'}
}}}}}},'0.4.1','Rayfield',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,xpcall,
tostring,tonumber,_VERSION local av,aw,ax,b,c,d,e=aj.insert,aj.remove,aj.freeze or function(av)return av end,al.wrap,ae.
sub,ae.match,ae.gmatch if at and c(at,1,4)=='Lune'then local f,g=ap(ao,'@lune/task')if f and g then af=g end end local f
=af and af.defer local g,h,i,j,k,l,m,n,o=f or function(g,...)b(g)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',
[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local p,q={GetFullName={{},function(p)local q,r=p.Name,p.Parent
while r do q=r.Name..'.'..q r=r.Parent end return q end},GetChildren={{},function(p)local q={}for r in ai,o[p]do av(q,r)
end return q end},GetDescendants={{},function(p)local q={}for r in ai,o[p]do av(q,r)for s,t in ai,r:GetDescendants()do
av(q,t)end end return q end},FindFirstChild={{'string','boolean?'},function(p,q,r)local s=o[p]for t in ai,s do if t.Name
==q then return t end end if r then for t in ai,s do return t:FindFirstChild(q,true)end end end},FindFirstAncestor={{
'string'},function(p,q)local r=p.Parent while r do if r.Name==q then return r end r=r.Parent end end},WaitForChild={{
'string','number?'},function(p,q)return p:FindFirstChild(q)end}},{}for r,s in ai,p do local t,u,v=s[1],s[2],{}for w,x in
ai,t do local y,z=d(x,'^([^%?]+)(%??)')v[w]={y,z}end q[r]=function(w,...)if not o[w]then ah(
"Expected ':' not '.' calling member function "..r,2)end local x={...}for y,z in ai,v do local A=x[y]local B,C,D=an(A),z
[1],z[2]if A==nil and not D then ah('Argument '..A..' missing or nil',3)end if C~='any'and B~=C and not(B=='nil'and D)
then ah('Argument '..y..' expects type "'..C..'", got "'..B..'"',2)end end return u(w,...)end end local function r(s,t,u
)local v,w=(ag({},{__mode='k'}))local function x(y)ah(y..' is not a valid (virtual) member of '..s..' "'..t..'"',3)end
local function y(z)ah('Unable to assign (virtual) property '..z..'. Property is read only',3)end local z,A={},{}A.
__metatable=false A.__index=function(B,C)if C=='ClassName'then return s elseif C=='Name'then return t elseif C=='Parent'
then return u elseif s=='StringValue'and C=='Value'then return w else local D=q[C]if D then return D end end for D in ai
,v do if D.Name==C then return D end end x(C)end A.__newindex=function(B,C,D)if C=='ClassName'then y(C)elseif C=='Name'
then t=D elseif C=='Parent'then if D==z then return end if u~=nil then o[u][z]=nil end u=D if D~=nil then o[D][z]=true
end elseif s=='StringValue'and C=='Value'then w=D else x(C)end end A.__tostring=function()return t end ag(z,A)o[z]=v if
u~=nil then o[u][z]=true end return z end local function s(t,u)local v,w,x,y=t[1],t[2],t[3],t[4]local z=h[w]local A=x
and aw(x,1)or z local B=r(z,A,u)i[v]=B if x then for C,D in ai,x do B[C]=D end end if y then for C,D in ai,y do s(D,B)
end end return B end local t=r('Folder','['..ad..']')for u,v in ai,ab do s(v,t)end for u,v in ai,aa do local w=i[u]j[w]=
v k[w]=u local x=w.ClassName if x=='LocalScript'or x=='Script'then av(m,w)end end local function u(v)local w,x=v.
ClassName,l[v]if x and w=='ModuleScript'then return ak(x)end local y=j[v]local function z(A)local B,C,D=nil,ap(function(
)return debug.traceback(nil,2)end)if C then B=D end return{Message=A,Traceback=B}end local function A(B)local C,D=ar(B.
Message),v:GetFullName()local E,F=d(C,'[^:]+:(%d+): (.+)')local G if not E or not au then G=D..':*: '..(F or C)else E=
as(E)local H=k[v]local I=au[H]local J=E-I+1 if J<0 then J='?'end G=D..':'..J..': '..F end local H=B.Traceback if H and H
~=''then G=G..'\n'..H end return G end if w=='LocalScript'or w=='Script'then local B,C=aq(y,z)if not B then ah(A(C),0)
end else local B={aq(y,z)}local C=aw(B,1)if not C then local D=aw(B,1)ah(A(D),0)end l[v]=B return ak(B)end end function
a(v)local w=i[v]local function x(y,...)local z={ap(y,...)}local A=aw(z,1)if not A then ah(z[1],3)end return ak(z)end
local y=ax(ag({},{__index=n,__newindex=function(y,z,A)n[z]=A end,__len=function()return#n end,__iter=function()return ai
,n end}))local z,A=ax{version=ac,envname=ad,shared=y,script=am,require=ao},w local function B(C,...)local D,E,F=an(C),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if D=='table'and o[C]then if C.
ClassName~='ModuleScript'then ah(E,2)elseif C==w then ah(F,2)end return u(C)elseif D=='string'and c(C,1,1)~='@'then if#C
==0 then ah('Attempted to call require with empty string',2)end local G=w if c(C,1,1)=='/'then G=t elseif c(C,1,2)=='./'
then C=c(C,3)end local H for I in e(C,'([^/]*)/?')do local J=I if I=='..'then J='Parent'end if J~=''then local K=G:
FindFirstChild(J)if not K then local L=G.Parent if L then K=L:FindFirstChild(J)end end if K then G=K elseif I~=H and I~=
'init'and I~='init.server'and I~='init.client'then ah('Virtual script path "'..C..'" not found',2)end end H=I end if G.
ClassName~='ModuleScript'then ah(E,2)elseif G==w then ah(F,2)end return u(G)end return x(ao,C,...)end return z,A,B end
for v,w in ai,m do g(u,w)end return u(t:GetChildren()[1])