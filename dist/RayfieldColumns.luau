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
screenSize=Vector2.new(210,50),closeScale=1.7,closeDistance=8,farDistance=40,size=Vector2.new(4.4,1.05),lift=2.4,
maxDistance=1000,cornerRadius=0.26,accent=Color3.fromRGB(125,180,255),accentDeep=Color3.fromRGB(59,130,246),cardColor=
Color3.fromRGB(5,7,14),cardTransparency=0.14,veilColor=Color3.fromRGB(3,4,9),veilStrength=0.8,titleColor=Color3.fromRGB(
250,251,255),subtitleColor=Color3.fromRGB(150,162,186),badgeTextColor=Color3.fromRGB(235,244,255),logo='omnity-logo.png'
,logoTint=g,logoScale=0.66,backdrop='nameplate-galaxy.png',backdropTint=g,backdropTransparency=0.25,glowImage=
'nameplate-glow.png',titleFont=nil,subtitleFont=nil,titleTop=0.2,titleSize=0.3,subtitleSize=0.2,entrance='unfold',
logoSway=6,logoSpin=0,halo=true,sparkles=4,sparkleColor=Color3.fromRGB(220,235,255),titleShine=true,sweep=true,
sweepEvery=7,border=true,borderThickness=1,borderTransparency=0.45,borderSpeed=40,glow=false,bob=true,bobHeight=0.06,
bobSpeed=1.6}}h.Midnight=table.clone(h.Omnity)h.Midnight.backdrop='nameplate-mountains.png'h.Midnight.accent=Color3.
fromRGB(96,165,250)h.Midnight.accentDeep=Color3.fromRGB(37,99,235)h.Midnight.sparkles=3 h.Mono=table.clone(h.Omnity)h.
Mono.backdrop=false h.Mono.accent=Color3.fromRGB(220,224,232)h.Mono.accentDeep=Color3.fromRGB(120,126,140)h.Mono.
sparkleColor=g h.Mono.sparkles=0 h.Mono.cardColor=Color3.fromRGB(10,10,12)ae.presets=h local i,j,k,l=0.35,1.1,3,20
local function m(n)return math.clamp(n,0,1)end local function n(o,p,q)return m((o-p)/q)end local function o(p)return 1-(
1-p)^3 end local function p(q)return 1-(1-q)^5 end local function q(r)local s,t=1.6,2.6 return 1+t*(r-1)^3+s*(r-1)^2 end
local function r(s)return-(math.cos(math.pi*s)-1)/2 end local function s(t:string):string return(t:gsub('&','&amp;'):
gsub('<','&lt;'):gsub('>','&gt;'))end local function t(u,v)local w=h[u]or h.Omnity local x=table.clone(w)if type(v)==
'table'then for y,z in v do x[y]=z end end x.logo=h.Omnity.logo return x end local u={logo='square',backdrop='banner',
glowImage='square'}function ae.new(v,w)w=if typeof(w)=='table'then w else{}local x=table.clone(w.style or w.Style or{})
for y,z in{'accent','backdrop','maxDistance','lift'}do local A=w[z]if A==nil then A=w[z:sub(1,1):upper()..z:sub(2)]end
if A~=nil and x[z]==nil then x[z]=A end end local y=setmetatable({window=v,title=w.title or w.Title or string.upper(
tostring(v.name or'Rayfield')),subtitle=w.subtitle or w.Subtitle,badge=w.badge or w.Badge,preset=w.preset or w.Preset or
'Omnity',overrides=x,endpoint=ai.base(w.endpoint or w.Endpoint),key=w.key or w.Key,transport=w.transport or w.Transport,
showSelf=w.showSelf~=false and w.ShowSelf~=false,hideDefaultName=w.hideDefaultName~=false and w.HideDefaultName~=false,
checkInInterval=math.max(tonumber(w.checkInInterval)or l,5),autoCheckIn=w.autoCheckIn~=false,playerMedia=w.playerMedia~=
false,settingsSection=w.settings~=false,enabled=true,plates={},users={},images={},_sheets={},_loaded={},_dying={},_alive
=true},ae)y.style=t(y.preset,x)y.players=ah.getService'Players'y.folder=v:Create('Folder',{Name=ag.httpService:
GenerateGUID(false),Parent=ag.guiContainer})y:_loadImages()local z=ag.localPlayer if z and y.showSelf then y.users[z.
UserId]={badge=y.badge}end if y.players and y.players.PlayerAdded then v:Connect(y.players.PlayerAdded,function(A)y:
_reconcile(A)end)v:Connect(y.players.PlayerRemoving,function(A)y:_drop(A)end)end y.stepConnection=v:Connect(ag.
runService.RenderStepped,function()y:_step(os.clock())end)y:_reconcileAll()if(y.endpoint or y.transport)and y.
autoCheckIn then y:_startCheckIns()end if y.settingsSection then y:_buildSettings()end y:_restoreOwnMedia()return y end
function ae._download(v,w,x,y)if w=='remote'then return b.remote(x)end return b.url(x,y)end function ae._sheetVisual(v,w
)if type(w)~='table'or type(w.id)~='string'or not w.id:match'^%x+$'then return nil end local x=v._sheets[w.id]if x then
return x end if not v.endpoint then return nil end local y=v:_download('url',`{v.endpoint}/v1/media/{w.id}.png`,`media_{
w.id}.png`)if not y then return nil end local z={uri=y,sheet={frames=math.max(tonumber(w.frames)or 1,1),columns=math.
max(tonumber(w.columns)or 1,1),frameWidth=tonumber(w.frameWidth)or 0,frameHeight=tonumber(w.frameHeight)or 0,fps=
tonumber(w.fps)or 0}}v._sheets[w.id]=z return z end function ae._resolveVisual(v,w,x)if w==nil or w==false then return
nil elseif type(w)=='number'or(type(w)=='string'and w:match'^%d+$')then return{uri='rbxassetid://'..tostring(w)}elseif
type(w)=='string'then if w:match'^[%w%-_]+%.png$'then local y=v:_download('remote',w)return if y then{uri=y}else nil
elseif w:match'^https?://'then return v:_loadMedia(w,x)or v:_relayVisual(w,x)end return{uri=w}elseif type(w)=='table'
then if w.gif or w.url then local y=tostring(w.gif or w.url)return v:_loadMedia(y,x)or v:_relayVisual(y,x)elseif w.sheet
then local y=v:_resolveVisual(w.sheet,x)if not y or not y.uri then return nil end local z,A=w.frameSize or Vector2.new(w
.frameWidth or 0,w.frameHeight or 0),math.max(tonumber(w.frames)or 1,1)return{uri=y.uri,sheet={frames=A,columns=math.
max(tonumber(w.columns)or A,1),frameWidth=z.X,frameHeight=z.Y,fps=tonumber(w.fps)or 10}}elseif type(w.images)=='table'
then local y={}for z,A in w.images do local B=v:_resolveVisual(A,x)if B and B.uri then table.insert(y,B.uri)end end
return if#y>0 then{list=y,fps=tonumber(w.fps)or 8}else nil end end return nil end function ae._loadMedia(v,w,x)local y=
tostring(w)..'|'..tostring(x)if v._loaded[y]then return v._loaded[y]end local z,A=d.load(w,x)if z then v._loaded[y]=z
end return z,A end function ae._relayVisual(v,w,x)if not v.endpoint and not v.transport then return nil end local y,z=ai
.request(v,'POST','/v1/media',{url=w,fit=x})if not y then return nil end return v:_sheetVisual(z)end function ae.
_loadImages(v)table.clear(v.images)local w={}v._imageGeneration=w for x,y in{'logo','backdrop','glowImage'}do task.
spawn(function()local z=v:_resolveVisual(v.style[y],u[y])if z and v._alive and v._imageGeneration==w then v.images[y]=z
for A,B in v.plates do v:_applyImages(B)end end end)end end function ae._applyImages(v,w)local x=w.parts if not x then
return end local y=v.images local z,A,B=y.logo,y.backdrop,v.playerMedia and w.media if B and B.visual then A=B.visual
end c.apply(x.logo,z)x.logo.Visible=z~=nil x.monogram.Visible=z==nil c.apply(x.backdrop,A)x.backdrop.Visible=A~=nil
local C=y.glowImage x.halo.Image=if C then C.uri or''else''x.halo.Visible=v.style.halo and C~=nil w.visuals={{label=x.
logo,visual=z,state={}},{label=x.backdrop,visual=A,state={}}}end function ae._syncMedia(v,w)local x=v.users[w.player.
UserId]local y=x and x.media local z=if type(y)=='table'then(y.url or y.id)else nil if z==w.mediaId then return end w.
mediaId=z if not z or not v.playerMedia then w.media=nil v:_applyImages(w)return end task.spawn(function()local A if
type(y.url)=='string'then A=v:_loadMedia(y.url,'banner')end if not A and y.id then A=v:_sheetVisual(y)end if w.mediaId~=
z then return end w.media=if A then{visual=A,slot=y.slot}else nil v:_applyImages(w)end)end function ae._listPlayers(v)if
v.players and v.players.GetPlayers then return v.players:GetPlayers()end return{ag.localPlayer}end function ae._wants(v,
w)return w~=nil and v.users[w.UserId]~=nil end function ae._reconcileAll(v)for w,x in v:_listPlayers()do v:_reconcile(x)
end for w in v.plates do if not v:_wants(w)then v:_drop(w)end end end function ae._reconcile(v,w)if not v:_wants(w)then
v:_drop(w)return end local x=v.plates[w]if not x then x={player=w}v.plates[w]=x if w.CharacterAdded then x.
characterConnection=v.window:Connect(w.CharacterAdded,function(y)v:_attach(w,y)end)end if w.Character then v:_attach(w,w
.Character)end elseif x.parts then v:_writeText(x)end v:_syncMedia(x)end function ae._drop(v,w)local x=v.plates[w]if not
x then return end v.plates[w]=nil if x.characterConnection then v.window:Disconnect(x.characterConnection)end v:_vanish(
x)end function ae._subtitleFor(v,w)if type(v.subtitle)=='function'then return tostring(v.subtitle(w))elseif type(v.
subtitle)=='string'then return v.subtitle end return'@'..w.Name end function ae._badgeFor(v,w)local x=v.users[w.UserId]
local y=x and x.badge return if type(y)=='string'and y~=''then string.upper(y)else nil end local function v(w)return if
w.sizeMode=='world'then w.size else w.screenSize end local function w(x)local y=v(x)local z=y.X/y.Y local A=0.14/z local
B=A+x.logoScale/2/z return{aspect=z,logoCenter=B,closedWidth=math.min(B*2,1),textLeft=B+(x.logoScale/2+0.2)/z,margin=0.2
/z}end function ae._writeText(x,y)local z,A,B=y.parts,x.style,y.layout z.title.Text=x.title z.subtitle.Text=s(x:
_subtitleFor(y.player))local C=x:_badgeFor(y.player)z.badge.Visible=C~=nil local D=1-B.margin if C then z.badgeText.Text
=C local E=0.22 local F=(#C*0.62*E*0.6+E*1.1)/B.aspect z.badge.Size=UDim2.fromScale(F,E)D-=F+0.06/B.aspect end z.title.
Size=UDim2.fromScale(math.max(D-B.textLeft,0.1),A.titleSize)z.subtitle.Size=UDim2.fromScale(1-B.margin-B.textLeft,A.
subtitleSize)z.badgeStroke.Color=A.accent z.badge.BackgroundColor3=A.accent end function ae._attach(x,y,z)local A=x.
plates[y]if not A or not z then return end A.character=z if A.gui then x:_vanish(table.clone(A))A.gui=nil A.parts=nil
end local B=z:FindFirstChild'Head'if not B and z.WaitForChild then B=z:WaitForChild('Head',5)end if not B or x.plates[y]
~=A then return end local C,D=x.window,x.style local E,F,G,H,I=w(D),D.accent:Lerp(g,0.6),UDim.new(D.cornerRadius,0),D.
titleFont or ag.brandFont(Enum.FontWeight.Bold),D.subtitleFont or ag.brandFont(Enum.FontWeight.Medium)local J,K=function
(J)C:Create('UICorner',{CornerRadius=G,Parent=J})end,C:Create('BillboardGui',{Name='Nameplate',Adornee=B,Size=if D.
sizeMode=='world'then UDim2.fromScale(D.size.X,D.size.Y)else UDim2.fromOffset(math.round(D.screenSize.X*(x.window.scale
or 1)),math.round(D.screenSize.Y*(x.window.scale or 1))),StudsOffset=Vector3.new(0,D.lift,0),MaxDistance=D.maxDistance,
AlwaysOnTop=true,LightInfluence=0,ResetOnSpawn=false,ClipsDescendants=false,Parent=x.folder})local L=C:Create('Frame',{
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
.logoCenter,0.5)local aq,ar,as,at,au=C:Create('ImageLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=ap,Size=UDim2.
fromScale(D.logoScale*1.6,D.logoScale*1.6),SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundTransparency=1,
ImageColor3=D.accent,ImageTransparency=1,Visible=false,ZIndex=8,Parent=L}),C:Create('ImageLabel',{AnchorPoint=Vector2.
new(0.5,0.5),Position=ap,Size=ao,SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundTransparency=1,ImageColor3=D.
logoTint,ImageTransparency=1,Visible=false,ZIndex=10,Parent=L}),C:Create('TextLabel',{AnchorPoint=Vector2.new(0.5,0.5),
Position=ap,Size=ao,SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundTransparency=1,Text=string.sub(x.title,1,1),
TextScaled=true,TextColor3=F,TextTransparency=1,FontFace=H,ZIndex=10,Parent=L}),{},math.max(math.floor(tonumber(D.
sparkles)or 0),0)for av=1,au do local aw=C:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromScale(0.04,
0.04),SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundColor3=D.sparkleColor,BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=11,Parent=L})C:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=aw})table.insert(at,{frame=
aw,offset=(av-1)/au*math.pi*2,speed=0.5+(av%3)*0.1,size=0.028+(av%3)*0.006})end local av,aw=(z:FindFirstChild'Humanoid')
if av and x.hideDefaultName then aw=av.DisplayDistanceType or Enum.HumanoidDisplayDistanceType.Viewer av.
DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None end A.gui=K A.head=B A.humanoid=av A.nameType=aw A.layout=E A.
born=os.clock()A.phase=(y.UserId%97)/97*10 A.parts={shell=L,scale=M,glow=N,glowStroke=O,card=P,content=Q,backdrop=R,veil
=S,shine=U,sweep=V,border=al,borderStroke=am,borderGradient=an,title=W,titleShine=X,subtitle=Y,badge=Z,badgeScale=_,
badgeStroke=aj,badgeText=ak,halo=aq,logo=ar,monogram=as,sparks=at}x:_writeText(A)x:_applyImages(A)x:_step(os.clock())end
function ae._vanish(aj,ak)if not ak.gui then return end if ak.humanoid and ak.nameType and ak.humanoid.Parent then ak.
humanoid.DisplayDistanceType=ak.nameType end ak.diedAt=os.clock()ak.humanoid=nil table.insert(aj._dying,ak)end
local function aj(ak,al)if ak=='none'then return{mark=1,card=1,edge=1,title=1,subtitle=1,badge=1,sparks=1,fade=1}elseif
ak=='fade'then local am=n(al,0,0.5)return{mark=am,card=1,edge=am,title=am,subtitle=am,badge=am,sparks=am,fade=am}end
return{mark=n(al,0,0.5),card=n(al,0.15,0.6),edge=n(al,0.45,0.4),title=n(al,0.42,0.45),subtitle=n(al,0.52,0.45),badge=n(
al,0.65,0.4),sparks=n(al,0.3,0.6),fade=n(al,0.1,0.35)}end local function ak(al,am)return 1-(1-al)*am end local function
al(am,an,ao,ap)local aq=an.parts if not aq then return false end local ar,as,at=am.style,an.layout,ao-an.born local au,
av,aw=aj(ar.entrance,at),ap,1 if an.diedAt then local x=m((ao-an.diedAt)/i)if x>=1 then return true end av*=1-o(x)aw=1-
0.08*x end local x=ag.workspace.CurrentCamera if x and an.head and an.head.Parent then local y=(x.CFrame.Position-an.
head.Position).Magnitude local z=m((y-ar.maxDistance*0.6)/(ar.maxDistance*0.4))av*=1-z if an.player==ag.localPlayer then
av*=m((y-k)/2)end if ar.sizeMode~='world'then local A=math.max(ar.farDistance-ar.closeDistance,1)local B=1-m((y-ar.
closeDistance)/A)local C,D=1+(ar.closeScale-1)*B*B,am.window.scale or 1 local E,F=math.round(ar.screenSize.X*D*C),math.
round(ar.screenSize.Y*D*C)if an.gui.Size.X.Offset~=E or an.gui.Size.Y.Offset~=F then an.gui.Size=UDim2.fromOffset(E,F)
end end end aq.scale.Scale=aw local y,z=ao+an.phase,au.mark local A,B,C=o(z)*av,ar.logoScale*(0.35+0.65*q(z)),(1-o(z))*-
90+math.sin(y*0.8)*(ar.logoSway or 0)+y*(ar.logoSpin or 0)for D,E in{aq.logo,aq.monogram}do E.Size=UDim2.fromScale(B,B)E
.Rotation=C%360 end aq.logo.ImageTransparency=1-A aq.monogram.TextTransparency=1-A local D=0.5+0.5*math.sin(y*2.1)aq.
halo.ImageTransparency=1-A*(0.18+0.12*D)local E=ar.logoScale*(1.45+0.12*D)*(0.5+0.5*o(z))aq.halo.Size=UDim2.fromScale(E,
E)local F,G=o(au.sparks)*av,math.rad(-25)for H,I in aq.sparks do local J=y*I.speed+I.offset local K,L=math.cos(J)*0.62,
math.sin(J)*0.2 local M,N,O=K*math.cos(G)-L*math.sin(G),K*math.sin(G)+L*math.cos(G),math.sin(J)>0 local P,Q=if O then 1
else 0.7,0.75+0.25*math.sin(y*5+I.offset*3)I.frame.Position=UDim2.fromScale(as.logoCenter+M*ar.logoScale/as.aspect,0.5+N
*ar.logoScale)I.frame.Size=UDim2.fromScale(I.size*P,I.size*P)I.frame.ZIndex=if O then 11 else 9 I.frame.
BackgroundTransparency=1-F*Q*(if O then 0.8 else 0.3)end local H=p(au.card)local I=as.closedWidth+(1-as.closedWidth)*H
local J=UDim2.fromScale(I,1)aq.card.Size=J aq.border.Size=J aq.glow.Size=J aq.content.Size=UDim2.fromScale(1/I,1)local K
=o(au.fade)*av aq.card.BackgroundTransparency=ak(ar.cardTransparency,K)aq.backdrop.ImageTransparency=ak(ar.
backdropTransparency,K*H)aq.veil.BackgroundTransparency=ak(0,K)aq.shine.BackgroundTransparency=ak(0,K)local L=o(au.edge)
*av aq.borderStroke.Transparency=ak(ar.borderTransparency,math.max(L,K*0.6))aq.glowStroke.Transparency=if ar.glow then
ak(0.85,L)else 1 aq.borderGradient.Rotation=(y*ar.borderSpeed)%360 local M=o(au.title)aq.title.TextTransparency=1-M*av
aq.title.Position=UDim2.fromScale(as.textLeft+(1-M)*0.03,ar.titleTop)local N=o(au.subtitle)aq.subtitle.TextTransparency=
1-N*av aq.subtitle.Position=UDim2.fromScale(as.textLeft+(1-N)*0.02,ar.titleTop+ar.titleSize+0.05)aq.badgeScale.Scale=q(
au.badge)local O=m(au.badge*1.5)*av aq.badge.BackgroundTransparency=ak(0.86,O)aq.badgeStroke.Transparency=ak(0.55,O)aq.
badgeText.TextTransparency=1-O if ar.titleShine then aq.titleShine.Offset=Vector2.new(((y*0.3)%2)-1,0)end if an.visuals
then for P,Q in an.visuals do if Q.visual then c.step(Q.label,Q.visual,y,Q.state)end end end local P=if ar.bob then math
.sin(y*ar.bobSpeed)*ar.bobHeight else 0 an.gui.StudsOffset=Vector3.new(0,ar.lift+P,0)if ar.sweep then local Q=(y%ar.
sweepEvery)/j aq.sweep.Offset=Vector2.new(if Q<1 then-1+2*r(Q)else-1,0)end return false end function ae._step(am,an)
local ao=if am.enabled then 1 else 0 for ap,aq in am.plates do if aq.gui then al(am,aq,an,ao)end end local ap=am._dying
for aq=#ap,1,-1 do local ar=ap[aq]if al(am,ar,an,ao)then table.remove(ap,aq)am.window:DestroySubtree(ar.gui)end end end
function ae._identity(am)local an=ag.localPlayer return{user={id=if an then an.UserId else 0,name=if an then an.Name
else'Player'},jobId=tostring(game.JobId~=nil and game.JobId~=''and game.JobId or'studio')}end function ae.CheckIn(am):
boolean if not am._alive then return false end local an,ao=ai.request(am,'POST','/v1/presence',am:_identity())if not an
or type(ao)~='table'or type(ao.users)~='table'then return false end local ap={}for aq,ar in ao.users do local as=
tonumber(type(ar)=='table'and ar.id)if as then ap[as]={badge=if type(ar.badge)=='string'then ar.badge else nil,media=if
type(ar.media)=='table'then ar.media else nil}end end local aq=ag.localPlayer if aq then if am.showSelf then ap[aq.
UserId]=ap[aq.UserId]or{}ap[aq.UserId].badge=ap[aq.UserId].badge or am.badge else ap[aq.UserId]=nil end end am.users=ap
am:_reconcileAll()return true end function ae._startCheckIns(am)task.spawn(function()while am._alive and not am.window.
unloaded do am:CheckIn()task.wait(am.checkInInterval)end ai.request(am,'DELETE','/v1/presence',am:_identity())end)end
function ae.SetEnabled(am,an:boolean)am.enabled=an~=false end function ae.SetTitle(am,an:string)am.title=tostring(an)for
ao,ap in am.plates do if ap.parts then am:_writeText(ap)end end end function ae.SetStyle(am,an,ao:string?)if type(an)==
'string'then ao,an=an,nil end if ao then am.preset=ao end if type(an)=='table'then for ap,aq in an do am.overrides[ap]=
aq end end am.style=t(am.preset,am.overrides)am:_loadImages()for ap,aq in am.plates do if aq.character then am:_attach(
ap,aq.character)end end end local function am()return f.join(ag.fileSystemManager:getRootFolder(),'nameplate-token.txt')
end function ae._token(an)if an._savedToken then return an._savedToken end local ao,ap=pcall(function()return if e.
isfile(am())then e.readfile(am())else nil end)an._savedToken=if ao and type(ap)=='string'and ap~=''then ap else nil
return an._savedToken end function ae._saveToken(an,ao)if type(ao)~='string'or ao==''then return end an._savedToken=ao
pcall(function()e.ensureFolder(ag.fileSystemManager:getRootFolder())e.writefile(am(),ao)end)end local function an()
return f.join(ag.fileSystemManager:getRootFolder(),'nameplate.json')end function ae._saveChoice(ao,ap)pcall(function()e.
ensureFolder(ag.fileSystemManager:getRootFolder())e.writefile(an(),ag.httpService:JSONEncode(ap or{}))end)end function
ae._restoreOwnMedia(ao)local ap,aq=pcall(function()return if e.isfile(an())then ag.httpService:JSONDecode(e.readfile(an(
)))else nil end)if ap and type(aq)=='table'and type(aq.link)=='string'and aq.link~=''then task.spawn(function()ao:
SetMedia(aq.link)end)end end function ae.SetMedia(ao,ap:string):(boolean,string?)ap=tostring(ap or''):gsub('^%s+',''):
gsub('%s+$','')local aq='backdrop'if ap==''then return false,'Paste a link or a file name.'end local ar,as=ao:
_loadMedia(ap,'banner')if not ar then return false,as or"Couldn't load that."end ao:_saveChoice{link=ap,slot=aq}ao:
_setOwnMedia({url=ap,slot=aq},ar)if not ap:match'^https?://'then return true,
'Only you can see files from your workspace.'end if not ao.endpoint and not ao.transport then return true,
'Only you can see it: this hub has no relay to share it.'end local at=ao:_identity()at.token=ao:_token()at.media={url=ap
,slot=aq}local au,av=ai.request(ao,'PUT','/v1/profile',at)if not au or type(av)~='table'then local aw=if type(av)==
'table'and type(av.error)=='string'then av.error else'no answer'return true,"Set for you, but others can't see it yet ("
..aw..').'end ao:_saveToken(av.token)return true,'Everyone running the script can see it.'end function ae.ClearMedia(ao)
:boolean ao:_saveChoice{}ao:_setOwnMedia(nil)if not ao.endpoint and not ao.transport then return true end local ap=ao:
_identity()ap.token=ao:_token()local aq,ar=ai.request(ao,'DELETE','/v1/profile',ap)if aq and type(ar)=='table'then ao:
_saveToken(ar.token)end return true end function ae._setOwnMedia(ao,ap,aq)local ar=ag.localPlayer if not ar then return
end ao.users[ar.UserId]=ao.users[ar.UserId]or{badge=ao.badge}ao.users[ar.UserId].media=ap local as=ao.plates[ar]if not
as then return end as.mediaId=if ap then ap.url else nil as.media=if ap and aq then{visual=aq,slot='backdrop'}else nil
ao:_applyImages(as)end function ae._buildSettings(ao)local ap=ao.window.rfSettings if not ap or not ap.CreateSection
then return end ap:CreateSection{name='Nameplate'}ap:CreateToggle{name='Show nameplates',value=true,callback=function(aq
)ao:SetEnabled(aq)end}ap:CreateInput{name='My image or GIF',placeholder='Paste a Tenor, Giphy or Imgur link',callback=
function(aq)if aq==''then return end task.spawn(function()local ar,as=ao:SetMedia(aq)ao.window:Toast{title=if ar then
'Nameplate updated'else"Couldn't use that",subtitle=as}end)end}ap:CreateButton{name='Remove my image',callback=function(
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
aw.content)local b=aw.icon~=nil and aw.icon~=0 and aw.icon~=''aw.main=aw.window:Create('Frame',{Name='Notification',
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
body})if b then aw.iconLabel=aw.window:Create('ImageLabel',{Image=aw.icon,Size=UDim2.fromOffset(24,24),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.notification,ImageTransparency=1,Parent=aw.
body},{ImageColor3='ContentColor'})end aw.container=aw.window:Create('Frame',{Size=UDim2.fromOffset(b and 222 or 260,0),
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.
notification,Parent=aw.body})aw.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=aw.container})aw.titleLabel=aw.window:Create('TextLabel',{Text=aw.
title,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=16,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=aw.
container},{TextColor3='ContentColor',FontFace='TitleFont'})if aw.content~=''then aw.descriptionLabel=aw.window:Create(
'TextLabel',{Text=aw.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
TextSize=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=
2,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=aw.container},{TextColor3='ContentColor',FontFace='Font'})end
aw.window._notificationCount=(aw.window._notificationCount or 0)+1 aw.main.LayoutOrder=aw.window._notificationCount
local c=aw.window._liveNotifications if not c then c={}aw.window._liveNotifications=c end table.insert(c,aw)while#c>ar
do local d=table.remove(c,1)if d and d~=aw then task.spawn(d._dismiss,d)end end aw._connections={aw.window:Connect(aw.
body.MouseEnter,function()aw._hovered=true end),aw.window:Connect(aw.body.MouseLeave,function()aw._hovered=false end),aw
.window:Connect(aw.body.InputBegan,function(d)if d.UserInputType==Enum.UserInputType.MouseButton1 or d.UserInputType==
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
b=task.wait()if not au._hovered then aw+=b end end au:_dismiss()end function ae._dismiss(au)if au._dismissed then return
end au._dismissed=true local av=au.window._liveNotifications local aw=av and table.find(av,au)if av and aw then table.
remove(av,aw)end if not au.main.Parent then return end ag.tweenService:Create(au.body,al,{BackgroundTransparency=1}):
Play()ag.tweenService:Create(au.stroke,al,{Transparency=1}):Play()ag.tweenService:Create(au.shadow,am,{Transparency=1}):
Play()ag.tweenService:Create(au.titleLabel,am,{TextTransparency=1}):Play()if au.descriptionLabel then ag.tweenService:
Create(au.descriptionLabel,am,{TextTransparency=1}):Play()end if au.iconLabel then ag.tweenService:Create(au.iconLabel,
am,{ImageTransparency=1}):Play()end ag.tweenService:Create(au.body,ao,{Size=UDim2.new(1,-90,1,0)}):Play()local b=ag.
tweenService:Create(au.main,ao,{Size=UDim2.new(1,0,0,0)})b:Play()b.Completed:Wait()if not au.main.Parent then return end
for c,d in au._connections do au.window:Disconnect(d)end au.window:DestroySubtree(au.main)end return ae end)()end,[19]=
function()local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=ac(af.variables),ac(af.functions),ac(af.constants),ac(
af.locale),ac(af.log),ac(af.HapticEngine),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),400,22,24,22,16
local av,aw,b,c,d,e,f,g=aq-ar*2,18,14,15,16,12,300,4 local h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w=av-g*2,16,13,20,10,15,14,8,10
,40,8,UDim.new(1,0),16,0.5,{}local function x()for y=#v,1,-1 do local z=v[y]if z._closed or not z.screenGui.Parent then
table.remove(v,y)end end end local function y(z)x()return v[#v]==z end function ae.new(z,A)A=if typeof(A)=='table'then A
else{}local B=setmetatable({window=assert(z,'Missing argument #1 (Window expected)'),title=A.title or A.Title or'Popup',
subtitle=A.subtitle or A.Subtitle,content=A.content or A.Content,icon=A.icon or A.Icon,boxes=A.boxes or A.Boxes,options=
A.options or A.Options,dismissable=if A.dismissable~=nil then A.dismissable elseif A.Dismissable~=nil then A.Dismissable
else true,_reveal={},_connections={},_closed=false},ae)if not B.options or#B.options==0 then B.options={{text='Okay'}}
end B:_build()x()table.insert(v,B)task.spawn(function()B:_show()end)return B end function ae._fade(z,A,B,C)table.insert(
z._reveal,{instance=A,prop=B,to=C})return A end function ae._build(z)local A,B=z.window,z.icon~=nil and z.icon~=0 and z.
icon~=''z.screenGui=A:Create('ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false
,Enabled=true,DisplayOrder=ai.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})z.
backdrop=A:Create('Frame',{Name='Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.
fromScale(1,1),Active=true,BackgroundTransparency=1,Parent=z.screenGui})z:_fade(z.backdrop,'BackgroundTransparency',u)z.
card=A:Create('Frame',{Name='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,14),Size=UDim2.fromOffset(aq,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,
BorderSizePixel=0,BackgroundTransparency=1,Parent=z.screenGui})z:_fade(z.card,'BackgroundTransparency',0)A:
_scaleSurface(z.card)A:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=z.card},{Color={'WindowColor'
,ah.toColorSequence}})A:Create('UICorner',{Parent=z.card},{CornerRadius='CornerRoundness'})z.cardStroke=A:Create(
'UIStroke',{Transparency=1,Parent=z.card},{Color='SurfaceStroke'})z:_fade(z.cardStroke,'Transparency',0.95)z.cardShadow=
A:CreateGlow(z.card,'ShadowColor',26,1)z:_fade(z.cardShadow,'Transparency',0.55)A:Create('UIPadding',{PaddingLeft=UDim.
new(0,ar),PaddingRight=UDim.new(0,ar),PaddingTop=UDim.new(0,as),PaddingBottom=UDim.new(0,at),Parent=z.card})A:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,au),Parent=z.card})local C=z:_measureHeader(B)z:_buildHeader(B,C)local D=z
:_buildContent()z:_buildFooter()local E=2+(D>0 and 1 or 0)local F=as+C+D+q+at+au*(E-1)z.card.Size=UDim2.fromOffset(aq,F)
z.card.AutomaticSize=Enum.AutomaticSize.None if z.dismissable then table.insert(z._connections,A:Connect(z.backdrop.
InputBegan,function(G)if G.UserInputType==Enum.UserInputType.MouseButton1 or G.UserInputType==Enum.UserInputType.Touch
then z:Close()end end))table.insert(z._connections,A:Connect(ag.userInputService.InputBegan,function(G,H)if not H and G.
KeyCode==Enum.KeyCode.Escape and y(z)then if G==w then return end w=G z:Close()end end))end end function ae._buildHeader
(z,A,B)local C=z.window local D=C:Create('Frame',{Name='Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,B),
LayoutOrder=1,Parent=z.card})C:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum
.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding
=UDim.new(0,e),Parent=D})if A then z:_fade(C:Create('ImageLabel',{Image=z.icon,Size=UDim2.fromOffset(d,d),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=D},{ImageColor3='TitlingColor'}),
'ImageTransparency',0)end local E=C:Create('Frame',{Name='Text',BackgroundTransparency=1,Size=UDim2.new(1,A and-(d+e)or
0,0,z._columnH),LayoutOrder=2,Parent=D})C:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=E})z:_fade(C:Create('TextLabel',{Text=aj.t(z.title),Size=UDim2.
new(1,0,0,z._titleH),BackgroundTransparency=1,TextSize=aw,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=E},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if z.
subtitle and z.subtitle~=''then z:_fade(C:Create('TextLabel',{Text=aj.t(z.subtitle),Size=UDim2.new(1,0,0,z._subH),
BackgroundTransparency=1,TextSize=b,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,
TextTransparency=1,Parent=E},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0.55)end end function ae.
_buildContent(z)if(not z.content or z.content=='')and(not z.boxes or#z.boxes==0)then return 0 end local A,B=z.window,if
z.boxes and#z.boxes>0 then z:_measureBoxes()else z:_measureText()local C=math.min(B,f)+g*2 local D=A:Create(
'ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,C),CanvasSize=UDim2.
new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(255,255,
255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,ScrollBarImageTransparency=1,Parent=z.card})z:_fade(D,
'ScrollBarImageTransparency',0.8)A:Create('UIPadding',{PaddingLeft=UDim.new(0,g),PaddingRight=UDim.new(0,g),PaddingTop=
UDim.new(0,g),PaddingBottom=UDim.new(0,g),Parent=D})if z.boxes and#z.boxes>0 then A:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,o),Parent=D})for E,F in z.boxes do z:_buildBox(D,F,E)end else z:_fade(A:Create('TextLabel',{Text=aj.
t(z.content),Size=UDim2.new(1,0,0,B),BackgroundTransparency=1,TextSize=c,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,TextTransparency=1,Parent=D},{TextColor3='ContentColor',FontFace
='Font'}),'TextTransparency',0.5)end return C end function ae._buildBox(z,A,B,C)local D=z.window B=if typeof(B)=='table'
then B else{title=tostring(B)}local E,F,G,H,I=B.icon~=nil and B.icon~=0 and B.icon~='',z:_measureBox(B)local J=D:Create(
'Frame',{Name='Box',BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-p,0,F),LayoutOrder=
C,BackgroundTransparency=1,Parent=A})z:_fade(J,'BackgroundTransparency',0)local K=D:StyleElementPanel(J)z:_fade(K,
'Transparency',D.theme.ElementStrokeTransparency)D:Create('UIPadding',{PaddingLeft=UDim.new(0,i),PaddingRight=UDim.new(0
,i),PaddingTop=UDim.new(0,j),PaddingBottom=UDim.new(0,j),Parent=J})D:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,l),Parent=J})if E then z:_fade(D:Create('ImageLabel',{Image
=B.icon,Size=UDim2.fromOffset(k,k),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=J
},{ImageColor3='ContentColor'}),'ImageTransparency',0)end local L=D:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
new(1,E and-(k+l)or 0,0,I),LayoutOrder=2,Parent=J})D:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=L})z:_fade(D:Create('TextLabel',{Text=aj.t(B.title or
B.Title or''),Size=UDim2.new(1,0,0,G),BackgroundTransparency=1,TextSize=m,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=L},{TextColor3='ContentColor',FontFace='TitleFont'}),
'TextTransparency',0)local M=B.description or B.Description if M and M~=''then z:_fade(D:Create('TextLabel',{Text=aj.t(M
),Size=UDim2.new(1,0,0,H),BackgroundTransparency=1,TextSize=n,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Top,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=L},{TextColor3='ContentColor',FontFace=
'Font'}),'TextTransparency',0.65)end end function ae._buildFooter(z)local A=z.window local B=A:Create('Frame',{Name=
'Footer',BackgroundTransparency=1,Size=UDim2.new(1,0,0,q),LayoutOrder=3,Parent=z.card})A:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,r),Parent=B})for C,D in z.options do z:_buildButton(B,D,C)end end function ae._buildButton(z,A,B,C)local D=z.
window B=if typeof(B)=='table'then B else{text=tostring(B)}local E,F,G,H,I,J,K=B.style or B.Style or'neutral',B.text or
B.Text or B.name or B.Name or'Okay',B.callback or B.Callback if E=='primary'then H,I,J,K=D.theme.AccentColor,D.theme.
AccentStroke,D.theme.AccentStroke,0.1 elseif E=='danger'then H,I,J,K=D.theme.ErrorColor,D.theme.ErrorStrokeColor,D.theme
.ErrorStrokeColor,0 else H,I,J,K=D.theme.NeutralButton,D.theme.NeutralButtonHover,D.theme.NeutralButtonStroke,0.85 end
local L=D:Create('Frame',{Name='Button',BackgroundColor3=H,BorderSizePixel=0,Size=UDim2.new(0,0,0,q),LayoutOrder=C,
BackgroundTransparency=1,Parent=A})z:_fade(L,'BackgroundTransparency',0)D:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=L})D:Create('UICorner',{CornerRadius=s,Parent=L})local M=D:Create('UIStroke',{Color=J,Transparency=1,Parent=
L})z:_fade(M,'Transparency',K)z:_fade(D:Create('TextLabel',{Text=aj.t(F),Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,TextSize=t,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,
TextColor3=ah.contrastText(H),TextTransparency=1,Parent=L},{FontFace='Font'}),'TextTransparency',0)local N,O=D:Create(
'TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=L}),TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(z._connections,D:Connect(N.MouseEnter,function()
if z._closed then return end ag.tweenService:Create(L,O,{BackgroundColor3=I}):Play()end))table.insert(z._connections,D:
Connect(N.MouseLeave,function()ag.tweenService:Create(L,O,{BackgroundColor3=H}):Play()end))table.insert(z._connections,D
:Connect(N.MouseButton1Click,function()if z._closed then return end al.click()ag.tweenService:Create(M,O,{Transparency=1
}):Play()if G then task.spawn(function()local P,Q=pcall(G)if not P then ak.warn("Rayfield: popup button '"..F..
"' callback errored:")ak.print(Q)end end)end z:Close()end))end function ae._measureHeader(z,A)local B=av-(if A then d+e
else 0)z._titleH=ah.textHeight(z.window.theme.Font,aw,aj.resolve(z.title),B)z._subH=if z.subtitle and z.subtitle~=''then
ah.textHeight(z.window.theme.Font,b,aj.resolve(z.subtitle),B)else 0 z._columnH=z._titleH+(if z._subH>0 then 3+z._subH
else 0)return math.max(z._columnH,if A then d else 0)end function ae._measureText(z)return ah.textHeight(z.window.theme.
Font,c,aj.resolve(z.content),h)end function ae._measureBox(z,A)A=if typeof(A)=='table'then A else{title=tostring(A)}
local B=A.icon~=nil and A.icon~=0 and A.icon~=''local C=h-p-i*2-(if B then k+l else 0)local D,E,F=ah.textHeight(z.window
.theme.TitleFont,m,aj.resolve(A.title or A.Title or''),C),0,A.description or A.Description if F and F~=''then E=ah.
textHeight(z.window.theme.Font,n,aj.resolve(F),C)end local G=D+(if E>0 then 3+E else 0)local H=math.max(G,if B then k
else 0)+j*2 return H,D,E,G end function ae._measureBoxes(z)local A=0 for B,C in z.boxes do A+=(z:_measureBox(C))if B<#z.
boxes then A+=o end end return A end function ae._show(z)if not z.screenGui.Parent then return end al.notify()ag.
tweenService:Create(z.card,am,{Position=UDim2.new(0.5,0,0.5,0)}):Play()for A,B in z._reveal do local C=if B.instance==z.
backdrop then ap else an ag.tweenService:Create(B.instance,C,{[B.prop]=B.to}):Play()end end function ae.Close(z)if z.
_closed then return end z._closed=true local A=table.find(v,z)if A then table.remove(v,A)end for B,C in z._connections
do z.window:Disconnect(C)end z._connections={}if not z.screenGui.Parent then return end ag.tweenService:Create(z.card,ao
,{Position=UDim2.new(0.5,0,0.5,10)}):Play()for B,C in z._reveal do ag.tweenService:Create(C.instance,ao,{[C.prop]=1}):
Play()end task.delay(ao.Time,function()z.window:DestroySubtree(z.screenGui)end)end return ae end)()end,[20]=function()
local aa,ab,ac=a(20)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.
locale),60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local av=TweenInfo.new(au,Enum.EasingStyle.Quint
,Enum.EasingDirection.InOut,-1,true)local function aw(b:unknown):number?local c=tonumber(b)if c==nil or c~=c or math.
abs(c)==math.huge then return nil end return c end function ae.new(b,c)c=if typeof(c)=='table'then c else{}local d=aw(c.
steps or c.Steps)d=if d and d>=2 then math.floor(d)else nil local e=c.range or c.Range local f,g=aw(e and e[1])or 0,aw(e
and e[2])or d or 1 if f>g then f,g=g,f end local h=setmetatable({tab=assert(b,'Missing argument #1 (Tab expected)'),
window=b.window,name=c.name or c.Name or'Progress',icon=c.icon or c.Icon,description=c.description or c.Description,min=
f,max=g,steps=d,value=0,text=c.text or c.Text,format=c.format or c.Format,showValue=if c.showValue==nil then true else c
.showValue==true,indeterminate=c.indeterminate or c.Indeterminate or false},ae)h.value=h:_clamp(aw(c.value or c.Value)or
f)h:_build()if h.description then h.descriptor=ac(ab.Parent.descriptor).new(h.tab,{description=h.description})end return
h end function ae._clamp(b,c:number):number return math.clamp(aw(c)or b.min,b.min,b.max)end function ae._ratio(b):number
local c=b.max-b.min if c<=0 then return 1 end return(b.value-b.min)/c end function ae._filledSteps(b):number local c=b.
steps::number return math.clamp(math.round(b:_ratio()*c),0,c)end function ae._readout(b):string if b.text then return aj
.resolve(b.text)end if b.format then local c,d=pcall(b.format,b.value,b.min,b.max)if c and type(d)=='string'then return
d end end if b.steps then return string.format('%d/%d',b:_filledSteps(),b.steps)end return string.format('%d%%',math.
round(b:_ratio()*100))end function ae._build(b)b.main=b.window:Create('Frame',{Size=UDim2.new(1,-20,0,ak),
BorderSizePixel=0,Name=b.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=b.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})b.stroke=b.window:StyleElementBody(b.main)b.container=b.window:Create(
'Frame',{Size=UDim2.new(0,170,0,ap),Position=UDim2.new(0,am,0,20),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=
1,BorderSizePixel=0,Parent=b.main})b.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.container})if b.icon then b.iconLabel=b.window:Create('ImageLabel',{
Image=b.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=b.
container},{ImageColor3='ContentColor'})end b.title=b.window:Create('TextLabel',{Text=aj.t(b.name),Size=UDim2.
fromOffset(250,ap),BorderSizePixel=0,BackgroundTransparency=1,TextSize=ap,AutomaticSize=Enum.AutomaticSize.X,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=b.container},{
TextColor3='ContentColor',FontFace='Font'})b.readout=b.window:Create('TextLabel',{Text=b:_readout(),AnchorPoint=Vector2.
new(1,0.5),Position=UDim2.new(1,-am,0,20),Size=UDim2.fromOffset(50,aq),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=aq,TextXAlignment=Enum.TextXAlignment.Right,Visible=b.showValue,
TextTransparency=1,Parent=b.main},{TextColor3='ContentColor',FontFace='Font'})if b.steps then b:_buildSteps()return end
b.track=b.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.new(1,-am*2,0
,al),BorderSizePixel=0,BackgroundTransparency=1,Parent=b.main},{BackgroundColor3='SliderBackground'})b.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=b.track})b.fill=b.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(if b.indeterminate then 0 else b:_ratio(),1),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=b.track})b.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=b.fill})b.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2
,Transparency=at,Parent=b.fill},{Color={'SliderProgress',ah.toColorSequence}})b.fillGlow=b.window:CreateGlow(b.fill,
'AccentColor',20,1)if b.indeterminate then b:_startSweep()end end function ae._buildSteps(b)local c=b.steps::number b.
track=b.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2.new(1,-am*2,0,
an),BackgroundTransparency=1,BorderSizePixel=0,Parent=b.main})b.window:Create('UIListLayout',{Padding=UDim.new(0,ao),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.track})b.stepFrames={}for d=1,c do local e=b.
window:Create('Frame',{Size=UDim2.new(1/c,-(ao*(c-1))/c,1,0),BorderSizePixel=0,LayoutOrder=d,BackgroundTransparency=1,
Parent=b.track},{BackgroundColor3='SliderBackground'})b.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=e})
local f=b.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=
0,ZIndex=2,BackgroundTransparency=1,Parent=e})b.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=f})b.window:
Create('UIGradient',{Rotation=90,Parent=f},{Color={'SliderProgress',ah.toColorSequence}})table.insert(b.stepFrames,{
segment=e,fill=f})end end function ae._startSweep(b)if b._sweep or b.steps then return end b.fill.AnchorPoint=Vector2.
new(0,0.5)b.fill.Position=UDim2.fromScale(0,0.5)b.fill.Size=UDim2.fromScale(0,1)b._sweep=ag.tweenService:Create(b.fill,
av,{Size=UDim2.fromScale(1,1)})b._sweep:Play()end function ae._stopSweep(b)if not b._sweep then return end b._sweep:
Cancel()b._sweep=nil b.fill.AnchorPoint=Vector2.new(0,0.5)b.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(
b,c:boolean?)b.readout.Text=b:_readout()if b.steps then if not b._shown then return end local d=b:_filledSteps()for e,f
in b.stepFrames do local g=if e<=d then 0 else 1 if c==false then f.fill.BackgroundTransparency=g else ag.tweenService:
Create(f.fill,as,{BackgroundTransparency=g}):Play()end end return end local d=UDim2.fromScale(b:_ratio(),1)if c==false
then b.fill.Size=d else ag.tweenService:Create(b.fill,as,{Size=d}):Play()end end function ae.Set(b,c)b.value=b:_clamp(c)
if b.indeterminate then b.indeterminate=false b:_stopSweep()end b:_render()end function ae.Get(b):number return b.value
end function ae.GetPercentage(b):number return b:_ratio()end function ae.SetRange(b,c,d)c=aw(c)or b.min d=aw(d)or b.max
if c>d then c,d=d,c end b.min,b.max=c,d b.value=b:_clamp(b.value)b:_render()end function ae.SetText(b,c)b.text=c b.
readout.Text=b:_readout()end function ae.SetIndeterminate(b,c)c=c==true if c==b.indeterminate then return end b.
indeterminate=c if c then b:_startSweep()else b:_stopSweep()b:_render(false)end end function ae._setShown(b,c,d)local e=
b.window b._shown=c e:_reveal(b.readout,{TextTransparency=if c then ar else 1},d)if c then e:_revealCommon(b,d)else e:
_hideCommon(b,d)end if b.steps then local f=b:_filledSteps()for g,h in b.stepFrames do e:_reveal(h.segment,{
BackgroundTransparency=if c then 0 else 1},d)e:_reveal(h.fill,{BackgroundTransparency=if c and g<=f then 0 else 1},d)end
return end e:_reveal(b.track,{BackgroundTransparency=if c then 0 else 1},d)e:_reveal(b.fill,{BackgroundTransparency=if c
then 0 else 1},d)e:_reveal(b.fillGlow,{Transparency=if c then e.theme.AccentGlow else 1},d)end function ae.Remove(b)b:
_stopSweep()if b.descriptor then b.descriptor:Remove()end if b.tab._forget then b.tab:_forget(b)end b.window:
DestroySubtree(b.main)end ai(ae)return ae end)()end,[21]=function()local aa,ab,ac=a(21)local ad return(function(...)
local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am=ac(ae.variables),ac(ae.constants),ac(ae.locale),ac(ab.
Parent.action),{},TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.6,0.2 local function an(ao)if ao
.__type=='Group'then local ap={}local function aq(ar)for as,at in ar.elements do if at.__type=='Group'then aq(at)elseif
at.name then table.insert(ap,at.name)end end end aq(ao)return table.concat(ap,'\n')end return ao.name or''end
local function ao(ap)local aq={}for ar,as in ap.tabs do if as.neglectSelector then continue end for at,au in as.elements
do if au.__type~='Section'then table.insert(aq,au)end end end return aq end local function ap(aq,ar,as)af.tweenService:
Create(aq.searchPill,as,{BackgroundTransparency=if ar then 0.9 else 1}):Play()af.tweenService:Create(aq.searchStroke,as,
{Transparency=if ar then 0.85 else 1}):Play()af.tweenService:Create(aq.searchShadow,as,{Transparency=if ar then 0.92
else 1}):Play()af.tweenService:Create(aq.searchIcon,as,{ImageTransparency=if ar then 0.65 else 1}):Play()af.tweenService
:Create(aq.searchInput,as,{TextTransparency=if ar then 0.2 else 1}):Play()end local function aq(ar,as,at)if ar.layout.
mode=='sidebar'then return end for au,av in ar.tabs do if not av.neglectSelector and av.topbarItem then av:_applyVisual(
if as then(if ar.selectedTab==av then'selected'else'unselected')else'hidden',at)end end end local function ar(as,at)at=
string.lower(at or'')local au=false for av,aw in as._searchUnits do local b=at==''or string.find(aw.text,at,1,true)~=nil
aw.unit.main.Visible=b if aw.unit.descriptor then aw.unit.descriptor.main.Visible=b end au=au or b end as.searchEmpty.
Visible=not au and at~=''end local function as(at)at._searchUnits={}local au=0 for av,aw in ao(at)do au+=1 local b=aw.
main table.insert(at._searchUnits,{unit=aw,text=string.lower(an(aw)),homeParent=b.Parent,homeOrder=b.LayoutOrder,
descOrder=aw.descriptor and aw.descriptor.main.LayoutOrder})b.LayoutOrder=au*10 b.Parent=at.searchPage b.Visible=true if
aw.descriptor then aw.descriptor.main.LayoutOrder=au*10+1 aw.descriptor.main.Parent=at.searchPage aw.descriptor.main.
Visible=true end end end local function at(au)for av,aw in au._searchUnits do local b=aw.unit if b.main and b.main.
Parent then b.main.LayoutOrder=aw.homeOrder b.main.Parent=aw.homeParent b.main.Visible=true end if b.descriptor and b.
descriptor.main and b.descriptor.main.Parent then b.descriptor.main.LayoutOrder=aw.descOrder b.descriptor.main.Parent=aw
.homeParent b.descriptor.main.Visible=true end end au._searchUnits={}end function aj.open(au)if au._searching or au.
minimised or not au:_interactive()then return end au._searching=true as(au)ar(au,'')au:_jumpTo(au.searchPage)aq(au,false
,ak)task.delay(ak.Time,function()if au._searching and au.layout.mode~='sidebar'then au.tabList.Visible=false end end)au.
searchPill.Visible=true ap(au,true,ak)au.searchInput:CaptureFocus()af.tweenService:Create(au.searchAction.iconLabel,ak,{
ImageTransparency=am}):Play()end function aj.close(au,av)if not au._searching then return end av=av or{}au._searching=
false au.searchInput.Text=''au.searchInput:ReleaseFocus()au.searchEmpty.Visible=false at(au)local aw=if av.jumpTo==nil
then au.selectedTab and au.selectedTab.tabPage else av.jumpTo if aw then au:_jumpTo(aw)end ap(au,false,ak)task.delay(ak.
Time,function()if not au._searching then au.searchPill.Visible=false end end)if av.showTabs then au.tabList.Visible=true
aq(au,true,ak)end af.tweenService:Create(au.searchAction.iconLabel,ak,{ImageTransparency=al}):Play()end function aj.
toggle(au)if au._searching then aj.close(au,{showTabs=true})else aj.open(au)end end function aj.railWidth(au,av)if au.
searchPill then au.searchPill.Size=UDim2.new(1,-(av+30),0,35)end end function aj.build(au)au._searching=false au.
searchPage=au:Create('ScrollingFrame',{Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),
AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,
CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=ag.pageScrollbar.thickness,ScrollBarImageTransparency=ag.pageScrollbar.
transparency,VerticalScrollBarInset=Enum.ScrollBarInset.None,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=
2000,Parent=au.elements},{ScrollBarImageColor3='ContentColor'})au:Create('UIListLayout',{Padding=UDim.new(0,7),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=au.searchPage})au:Create('UIPadding',{PaddingTop=
UDim.new(0,if au.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),Parent=au.searchPage})au.
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
,aw in au do if at then af.tweenService:Create(av,at,aw):Play()else for b,c in aw do av[b]=c end end end end function ak
.setProfileEnabled(ar,as)if not ar.profile then ar.settings.showProfile=as return end if as then ar.settings.showProfile
=true ak.reflowProfile(ar)ak.setProfileShown(ar,true,ao)return end ak.setProfileShown(ar,false,ao)task.delay(ao.Time,
function()if ar.unloaded or ar.settings.showProfile then return end ak.reflowProfile(ar)end)ar.settings.showProfile=
false end function ak.setSubtitle(ar,as)if not ar.profileSubtitle then return end local at=if type(as)=='string'and as~=
''then ah.resolve(as)else nil ar.profileSubtitle.Text=at or''ar.profileSubtitle.Visible=at~=nil end return ak end)()end,
[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.
Parent.Parent.utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af
.lockable),ac(af.locale),ac(af.HapticEngine)local function an(ao)local ap=0 while ap<6 do local aq=ao*10^ap if math.abs(
aq-math.round(aq))<1e-9 then break end ap+=1 end return ap end local function ao(ap,aq,ar)local as=ap[1]+math.round((ar-
ap[1])/aq)*aq return math.clamp(as,ap[1],ap[2])end local ap,aq,ar,as,at,au=TweenInfo.new(0.45,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo
.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),440,Vector2.new(35,20),Vector2.new(41,22)local av=math.ceil(at
.X/2)local function aw(b:number):UDim2 return UDim2.new(b,math.round(av*(1-2*b)),1,0)end local function b():UDim2 return
UDim2.new(1,0,0.5,0)end local function c(d:number,e:number,f:number):number return math.clamp((d-e)/f,0,1)end function
ae.new(d,e)e=if typeof(e)=='table'then e else{}local f=setmetatable({tab=assert(d,'Missing argument #1 (Tab expected)'),
window=d.window,name=e.name or e.Name or'Slider',icon=e.icon or e.Icon,description=e.description or e.Description,
forgetState=e.forgetState or e.ForgetState or d.forgetState,range=e.range or e.Range or{0,100},increment=e.increment or
e.Increment or 1,suffix=e.suffix or e.Suffix or'',callback=e.callback or e.Callback or function()end,dragging=false,
minimal=e.minimal or e.Minimal or false,_handleWidth=at.X},ae)assert(typeof(f.range)=='table'and typeof(f.range[1])==
'number'and typeof(f.range[2])=='number','A slider range needs two numbers, like { 0, 100 }.')if f.range[1]>f.range[2]
then f.range={f.range[2],f.range[1]}end if f.increment<=0 then f.increment=1 end f.value=if(e.value or e.Value)~=nil
then(e.value or e.Value)elseif(e.currentValue or e.CurrentValue)~=nil then(e.currentValue or e.CurrentValue)else f.range
[1]f.value=ao(f.range,f.increment,f.value)f._decimals=an(f.increment)f.flag=e.flag or e.Flag or(not f.forgetState and ah
.deriveFlagFromName(f.name)or nil)f.window:_registerControl(f)f.main=f.window:Create('Frame',{Size=UDim2.new(1,-20,0,65)
,BorderSizePixel=0,Name=f.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=f.tab.
tabPage},{BackgroundTransparency='ElementTransparency'})f.stroke=f.window:StyleElementBody(f.main)f._lastValue=f.value
if not f.minimal then f:_buildLabel()end f.track=f.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
new(1,-15,0.5,0),Size=UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=f.main},{
BackgroundColor3='SliderBackground'})f.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=f.track})f.progress=
f.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=f.track})f.
window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=f.progress})f.window:Create('UIGradient',{Offset=Vector2.
new(0,0.5),Rotation=2,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)
},Parent=f.progress},{Color={'SliderProgress',ah.toColorSequence}})f.progressGlow=f.window:CreateGlow(f.progress,
'AccentColor',20,1)f.handle=f.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=b(),Size=UDim2.
fromOffset(at.X,at.Y),BorderSizePixel=0,ZIndex=50,BackgroundTransparency=1,Parent=f.progress},{BackgroundColor3=
'SliderHandle'})f.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=f.handle})f.handleGlow=f.window:
CreateGlow(f.handle,Color3.fromRGB(255,255,255),10,1)f.handleStroke=f.window:Create('UIStroke',{Transparency=1,Parent=f.
handle},{Color='SliderStroke'})f.interact=f.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,
1),Text='',TextTransparency=1,ZIndex=10,Parent=f.track})f.window:ConnectFor(f,f.main.MouseEnter,function()if not f.
window:_interactive()then return end ag.tweenService:Create(f.track,ap,{BackgroundColor3=f.window.theme.
SliderBackgroundHover}):Play()end)f.window:ConnectFor(f,f.main.MouseLeave,function()ag.tweenService:Create(f.track,ap,{
BackgroundColor3=f.window.theme.SliderBackground}):Play()end)f.window:ConnectFor(f,f.interact.InputBegan,function(g)if g
.UserInputType==Enum.UserInputType.MouseButton1 or g.UserInputType==Enum.UserInputType.Touch then am.click()f.dragging=
true f:_setHeld(true)f:_updateFromMouse()if f._dragConnection then f._dragConnection:Disconnect()f._dragConnection=nil
end f._dragConnection=ag.runService.RenderStepped:Connect(function()if f.window.unloaded or not f.dragging then if f.
_dragConnection then f._dragConnection:Disconnect()f._dragConnection=nil end return end f:_updateFromMouse()end)end end)
f.window:ConnectFor(f,ag.userInputService.InputEnded,function(g)if g.UserInputType==Enum.UserInputType.MouseButton1 or g
.UserInputType==Enum.UserInputType.Touch then f:_endDrag()end end)f.window:ConnectFor(f,ag.userInputService.
WindowFocusReleased,function()f:_endDrag()end)if f.description and not f.minimal then f.descriptor=ac(ab.Parent.
descriptor).new(f.tab,{description=f.description})end f.window:ConnectFor(f,f.main:GetPropertyChangedSignal
'AbsoluteSize',function()if f.window.animating or(f.window.hidden and f.window.hasShownOnce)then return end f:
_applyLayout()end)f:_applyLayout()if f.minimal then f.main.Size=UDim2.new(1,-20,0,41)f.track.AnchorPoint=Vector2.new(0.5
,0.5)f.track.Position=UDim2.new(0.5,0,0.5,0)f.track.Size=UDim2.new(1,-30,0,14)end f:_renderProgress()return f end
function ae._buildLabel(d)d.container=d.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,
0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=d.main})d.
containerLayout=d.window:Create('UIListLayout',{Padding=UDim.new(0,2),VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=d.container})d.titleContainer=d.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=d.container})d.window:Create('UIListLayout',{Padding=UDim
.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=d.titleContainer})d.titleFlex=d.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,
Parent=d.titleContainer})if d.icon then d.iconLabel=d.window:Create('ImageLabel',{Image=d.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=d.titleContainer},{ImageColor3=
'ContentColor'})end d.title=d.window:Create('TextLabel',{Text=al.t(d.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
RichText=true,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=d.titleContainer},{TextColor3='ContentColor',FontFace=
'Font'})d.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=d.title})d.valueHost=d.window:Create(
'Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=d.container})
d.valueOdo=ai.new(d.window,d.valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28
})d.valueOdo:snap(d:_format(d.value))end function ae._setMainHeight(d,e)if d._widthManaged then d.main.Size=UDim2.new(d.
main.Size.X.Scale,d.main.Size.X.Offset,0,e)else d.main.Size=UDim2.new(1,-20,0,e)end end function ae._applyLayout(d)if d.
minimal then return end local e=d.main.AbsoluteSize.X local f=if e>0 and e<as then'narrow'else'wide'if d._layoutMode==f
then return end d._layoutMode=f if f=='narrow'then d:_setMainHeight(70)d.container.AnchorPoint=Vector2.new(0,0)d.
container.Position=UDim2.new(0,20,0,14)d.container.Size=UDim2.new(1,-40,0,16)d.containerLayout.FillDirection=Enum.
FillDirection.Horizontal d.titleFlex.FlexMode=Enum.UIFlexMode.Fill d.valueHost.AutomaticSize=Enum.AutomaticSize.X d.
valueHost.Size=UDim2.new(0,0,0,16)d.track.AnchorPoint=Vector2.new(0.5,1)d.track.Position=UDim2.new(0.5,0,1,-14)d.track.
Size=UDim2.new(1,-30,0,14)else d:_setMainHeight(65)d.container.AnchorPoint=Vector2.new(0,0.5)d.container.Position=UDim2.
new(0,20,0.5,0)d.container.Size=UDim2.new(0,170,0,33)d.containerLayout.FillDirection=Enum.FillDirection.Vertical d.
titleFlex.FlexMode=Enum.UIFlexMode.None d.valueHost.AutomaticSize=Enum.AutomaticSize.None d.valueHost.Size=UDim2.new(1,0
,0,16)d.track.AnchorPoint=Vector2.new(1,0.5)d.track.Position=UDim2.new(1,-15,0.5,0)d.track.Size=UDim2.new(0,222,0,14)end
end function ae._format(d,e)local f=string.format('%.'..d._decimals..'f',e)if d.suffix~=''then return f..' '..d.suffix
end return f end function ae._pillTravel(d)return math.max(d.track.AbsoluteSize.X-av*2,0)end function ae._renderProgress
(d,e)local f=d.range[2]-d.range[1]local g=if f~=0 then math.clamp((d.value-d.range[1])/f,0,1)else 0 local h=aw(g)if e
then ag.tweenService:Create(d.progress,e,{Size=h}):Play()else d.progress.Size=h end end function ae._updateFromMouse(d)
local e=d:_pillTravel()if e<=0 then return end local f=c(ag.userInputService:GetMouseLocation().X,d.track.
AbsolutePosition.X+av,e)local g=ao(d.range,d.increment,d.range[1]+f*(d.range[2]-d.range[1]))if g~=d.value then d.value=g
if d.valueOdo then d.valueOdo:snap(d:_format(g))end d._lastValue=g d:_renderProgress(ar)d:_fireCallback(g)end end
function ae._endDrag(d)if not d.dragging then return end d.dragging=false d:_setHeld(false)if d._dragConnection then d.
_dragConnection:Disconnect()d._dragConnection=nil end d.window:_persist(d)end function ae._setHeld(d,e)if not e then d:
_fireCallback(d.value)end local f=if e then au else at d._handleWidth=f.X ag.tweenService:Create(d.handle,aq,{Size=UDim2
.fromOffset(f.X,f.Y),BackgroundTransparency=if e then 0.7 else 0}):Play()ag.tweenService:Create(d.handleStroke,aq,{
Transparency=if e then 0.6 else 1}):Play()d:_renderProgress(aq)end function ae._fireCallback(d,e)d.window:_runGuarded(d,
d.callback,e,d.dragging==true)end function ae.Set(d,e,f)e=ao(d.range,d.increment,e)d.value=e if d.valueOdo then d.
valueOdo:to(d:_format(e),e>=(d._lastValue or e))end d._lastValue=e d:_renderProgress(ap)if not f then d:_fireCallback(e)
d.window:_persist(d)end end local d=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35
)function ae._setShown(e,f,g)local h=e.window if f then h:_revealCommon(e,g)h:_reveal(e.track,{BackgroundTransparency=0}
,g)h:_reveal(e.progress,{BackgroundTransparency=0},g)h:_reveal(e.handle,{BackgroundTransparency=0},g)if e.valueOdo then
e.valueOdo:reveal(0.3,g)end h:_reveal(e.progressGlow,{Transparency=math.max(0.55,h.theme.AccentGlow)},g,d)h:_reveal(e.
handleGlow,{Transparency=0.8},g,d)else h:_hideCommon(e,g)h:_reveal(e.track,{BackgroundTransparency=1},g)h:_reveal(e.
progress,{BackgroundTransparency=1},g)h:_reveal(e.handle,{BackgroundTransparency=1},g)if e.valueOdo then e.valueOdo:
reveal(1,g)end h:_reveal(e.progressGlow,{Transparency=1},g,d)h:_reveal(e.handleGlow,{Transparency=1},g,d)end end
function ae._refreshTheme(e)ag.tweenService:Create(e.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=math.max(0.55,e.window.theme.AccentGlow)}):Play()end function ae._minWidth(e)if e.
minimal then return 100 end local f=40 if e.icon then f+=22 end f+=ah.textWidth(e.window.theme.Font,16,al.resolve(e.name
))f+=12 f+=ah.textWidth(e.window.theme.Font,15,e:_format(e.value))return math.max(f,160)end aj(ae)ak(ae)return ae end)()
end,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local
af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable)
,ac(af.constants),ac(af.locale),ac(af.log)local an,ao,ap,aq=ak.statAccents,NumberSequence.new{NumberSequenceKeypoint.
new(0,0.85),NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function ar(as)
return as.fill.Keypoints[1].Value end local function as(at)if at>0 then return string.format('+%.1f%%',at)elseif at<0
then return string.format('%.1f%%',at)else return'0%'end end local function at(au)if typeof(au)~='number'then return
tostring(au)end local av=math.round(math.abs(au))local aw=string.format('%.0f',av)local b=aw:reverse():gsub('%d%d%d',
'%0,'):reverse()if b:sub(1,1)==','then b=b:sub(2)end return if au<0 and av~=0 then'-'..b else b end local function au(av
)local aw=math.round(av)if aw>0 then return'+'..at(aw)elseif aw<0 then return at(aw)else return'0'end end function ae.
new(av,aw)aw=if typeof(aw)=='table'then aw else{}local b=setmetatable({tab=assert(av,
'Missing argument #1 (Tab expected)'),window=av.window,name=aw.name or aw.Name or'Statistic',icon=aw.icon or aw.Icon,
description=aw.description or aw.Description,value=if(aw.value or aw.Value)~=nil then(aw.value or aw.Value)else 0,
_hasValue=(aw.value or aw.Value)~=nil,numberEasing=if(aw.numberEasing~=nil)then aw.numberEasing elseif aw.NumberEasing~=
nil then aw.NumberEasing else true,changeMode=aw.changeMode or aw.ChangeMode or'percentage',changeBaseline=aw.
changeBaseline or aw.ChangeBaseline or'previous',prefix=aw.prefix or aw.Prefix or'',suffix=aw.suffix or aw.Suffix or'',
compact=aw.compact or aw.Compact or av.compact or false,display=(aw.display or aw.Display or'value'),_initialValue=if(aw
.value or aw.Value)~=nil then(aw.value or aw.Value)else nil,_lastChange=0},ae)if b.compact then b:_buildCompact()else b:
_buildFull()end if b.description then if b.compact then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
b.name}'.`)else b.descriptor=ac(ab.Parent.descriptor).new(b.tab,{description=b.description})end end return b end
function ae._buildFull(av)local aw=av.window av.main=aw:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,
Name=av.name,ZIndex=5,BackgroundTransparency=1,Parent=av.tab.tabPage},{BackgroundColor3='StatBackground',
BackgroundTransparency='ElementTransparency'})aw:Create('UICorner',{Parent=av.main},{CornerRadius='ElementCornerRadius'}
)av.stroke=aw:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=av.main},{Transparency=
'ElementStrokeTransparency'})av.strokeGradient=aw:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.
neutral.stroke,Transparency=ao,Parent=av.stroke})av.titleContainer=aw:Create('Frame',{Size=UDim2.new(1,-40,0,32),
Position=UDim2.fromOffset(20,15),BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=av.main})av.
gradientContainer=aw:Create('Frame',{Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,
BackgroundTransparency=1,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=5,Parent=av.main})av.glow=aw:CreateGlow(av.
main,ar(an.neutral),13,1)av.title=aw:Create('TextLabel',{Text=al.t(av.name),Size=UDim2.fromOffset(300,19),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=av.titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})av
.mainGradient=aw:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=ao,Parent=
av.gradientContainer})aw:Create('UICorner',{Parent=av.gradientContainer},{CornerRadius='ElementCornerRadius'})if av.icon
then av.iconLabel=aw:Create('ImageLabel',{Image=av.icon,Size=UDim2.fromOffset(32,32),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=av.titleContainer},{ImageColor3='ContentColor'})end av.
containerLayout=aw:Create('UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=av.titleContainer})av.valueHost=aw:Create('Frame',{AnchorPoint=Vector2.new(0,1),Position=
UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=av.main}
)av.changeHost=aw:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-20,1,-15),Size=UDim2.fromOffset(200
,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=av.main})av.valueOdo=ai.new(aw,av.valueHost,{textSize=
20,alignment=Enum.HorizontalAlignment.Left,transparency=1})av.valueOdo:snap(av:_formatValue(av.value))av.changeOdo=ai.
new(aw,av.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,transparency=1})av.changeOdo:snap(av:
_formatChange(0))av._accentGradients={av.strokeGradient,av.mainGradient}end function ae._buildCompact(av)local aw,b=av.
window,av.tab.compact or false av.main=aw:Create('Frame',{Name=av.name,Size=if b then UDim2.fromOffset(0,ap)else UDim2.
new(1,-20,0,ap),AutomaticSize=if b then Enum.AutomaticSize.X else Enum.AutomaticSize.None,ClipsDescendants=true,
BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=av.tab.tabPage},{BackgroundColor3='StatBackground',
BackgroundTransparency='ElementTransparency'})aw:Create('UICorner',{Parent=av.main},{CornerRadius='ElementCornerRadius'}
)av.stroke=aw:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=av.main},{Transparency=
'ElementStrokeTransparency'})av.strokeGradient=aw:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.
neutral.stroke,Transparency=ao,Parent=av.stroke})if b then aw:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=
av.main})end aw:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
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
function ae._setAccent(av,aw,b)local c=an[aw]av.strokeGradient.Color=c.stroke av.mainGradient.Color=c.fill if av.glow
then av.glow.Color=ar(c)end local d,e=if b==1 then 14 elseif b==-1 then-10 else 2,if b==1 then Vector2.new(0.04,0.5)
elseif b==-1 then Vector2.new(-4E-2,0.5)else Vector2.new(0,0.5)for f,g in av._accentGradients do ag.tweenService:Create(
g,aq,{Rotation=d,Offset=e}):Play()end end function ae._formatValue(av,aw)return av.prefix..at(aw)..av.suffix end
function ae._formatChange(av,aw)if av.changeMode=='absolute'then return au(aw)else return as(aw)end end function ae.
_showValue(av,aw,b,c,d)if av.numberEasing and not d then aw:to(av:_formatValue(b),b>=c)else aw:snap(av:_formatValue(b))
end end function ae._updateFullReadouts(av,aw,b,c,d,e,f)av:_showValue(av.valueOdo,aw,b,f)if e then av.changeOdo:snap(e)
av._lastChange=0 elseif av.numberEasing and not d then av.changeOdo:to(av:_formatChange(c),c>=av._lastChange)av.
_lastChange=c else av.changeOdo:snap(av:_formatChange(c or 0))av._lastChange=c or 0 end end function ae.
_updateCompactReadout(av,aw,b,c,d,e,f)if av.display=='change'then if e then av.readoutOdo:snap(e)av._lastChange=0 elseif
av.numberEasing and not d then av.readoutOdo:to(av:_formatChange(c),c>=av._lastChange)av._lastChange=c else av.
readoutOdo:snap(av:_formatChange(c or 0))av._lastChange=c or 0 end else av:_showValue(av.readoutOdo,aw,b,f)end end
function ae.Set(av,aw)assert(typeof(aw)=='number','Statistic:Set() - value must be a number, got '..typeof(aw))local b,c
=av.value,not av._hasValue av.value=aw av._hasValue=true if c then av._initialValue=aw end local d=if av.changeBaseline
=='initial'then av._initialValue else b local e,f,g,h,i=c or d==aw if e then f=0 h='neutral'i=0 elseif d==0 then local j
,k=if aw>0 then'+'else'-',if av.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'g=j..k h=if aw>0 then'positive'else
'negative'i=if aw>0 then 1 else-1 elseif av.changeMode=='percentage'then f=((aw-d)/math.abs(d))*100 i=if f>0 then 1
elseif f<0 then-1 else 0 h=if i==1 then'positive'elseif i==-1 then'negative'else'neutral'else f=aw-d i=if f>0 then 1
elseif f<0 then-1 else 0 h=if i==1 then'positive'elseif i==-1 then'negative'else'neutral'end av:_setAccent(h,i)if av.
compact then av:_updateCompactReadout(aw,b,f,e,g,c)else av:_updateFullReadouts(aw,b,f,e,g,c)end end function ae.
ResetBaseline(av,aw)local b,c,d=av.value,not av._hasValue,if typeof(aw)=='number'then aw else av.value av._initialValue=
d av.value=d av._hasValue=true av._lastChange=0 if av.compact then if av.display=='change'then av.readoutOdo:snap(av:
_formatChange(0))else av:_showValue(av.readoutOdo,d,b,c)end else av.changeOdo:snap(av:_formatChange(0))av:_showValue(av.
valueOdo,d,b,c)end av:_setAccent('neutral',0)end function ae._setShown(av,aw,b)local c=av.window if av.compact then c:
_reveal(av.main,{BackgroundTransparency=if aw then(av.window.theme.ElementTransparency or 0)else 1},b)c:_reveal(av.
stroke,{Transparency=if aw then av.window.theme.ElementStrokeTransparency else 1},b)c:_reveal(av.card,{
BackgroundTransparency=if aw then 0 else 1},b)c:_reveal(av.title,{TextTransparency=if aw then 0 else 1},b)if av.
iconLabel then c:_reveal(av.iconLabel,{ImageTransparency=if aw then 0 else 1},b)end av.readoutOdo:reveal(if aw then 0
else 1,b)return end if aw then c:_revealCommon(av,b)c:_reveal(av.gradientContainer,{BackgroundTransparency=0},b)c:
_reveal(av.glow,{Transparency=0.82},b)av.valueOdo:reveal(0,b)av.changeOdo:reveal(0,b)else c:_hideCommon(av,b)c:_reveal(
av.gradientContainer,{BackgroundTransparency=1},b)c:_reveal(av.glow,{Transparency=1},b)av.valueOdo:reveal(1,b)av.
changeOdo:reveal(1,b)end end function ae._minWidth(av)local aw=40 if av.icon then aw+=26 end aw+=ah.textWidth(av.window.
theme.Font,16,al.resolve(av.name))local b=if av.display=='change'then av:_formatChange(0)else av:_formatValue(av.value)
aw+=ah.textWidth(av.window.theme.Font,17,b)return aw end aj(ae)return ae end)()end,[26]=function()local aa,ab,ac=a(26)
local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.Parent.utility local ag,ah,ai,aj
,ak,al,am,an=ac(af.variables),ac(af.constants),ac(af.HapticEngine),ac(af.log),ac(af.columns),ac(ab.Parent.search),ac(ab.
Parent.tabSelector),ac(ab.Parent.column)local function ao(ap,aq)for ar,as in aq do if as.__type=='Group'then ao(ap,as.
elements)else ap:_unregisterControl(as)end if as.connections then for at,au in as.connections do ap:Disconnect(au)end as
.connections=nil end if as._dragConnection then as._dragConnection:Disconnect()as._dragConnection=nil end if ap.
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
pageWidth(au.size.X.Offset,au.layout)else 0 local aw,b,c=ak.shouldStack(av),#as.elements>0,#at.elements>0 as.main.
Visible=b at.main.Visible=c ar.stacked=aw if aw or not(b and c)then ar.columnsLayout.FillDirection=Enum.FillDirection.
Vertical ar.columnsLayout.Padding=UDim.new(0,if b and c then 20 else 0)as.main.Size=UDim2.fromScale(1,0)at.main.Size=
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
Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,b,c,d,e,f,g,h=ac(af.variables),ac(af.
functions),ac(af.constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.
new(0.5,0,0.5,-180),UDim2.new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function i(j)return math.clamp(#j*0.06+3,3,9)
end local function j(k)if type(k)=='number'then return'rbxassetid://'..tostring(k)end return k end function ae.new(k,l,m
)l=if typeof(l)=='table'then l else{}local n=setmetatable({window=assert(k,'Missing argument #1 (Window expected)'),
title=l.title or l.Title or'',subtitle=l.subtitle or l.Subtitle,icon=l.icon or l.Icon,avatar=l.avatar or l.Avatar,
minWidth=l.minWidth or l.MinWidth,subtitleAbove=l.subtitleAbove or l.SubtitleAbove or false,position=l.position or'Top',
_hovered=false,_dismissed=false},ae)n.duration=l.duration or l.Duration or i(n.title..(n.subtitle or''))local o=n.avatar
~=nil and n.avatar~=0 local p=o or(n.icon~=nil and n.icon~=0 and n.icon~='')n._iconImage=if o then aj.avatar(n.avatar,
function(q)if n.iconLabel and not n._dismissed and n.main.Parent then aj.assign(n.iconLabel,'Image',q)end end)elseif p
then j(n.icon)else nil n._iconSize=if o then ar else aq n._leftPad=if o then au else as n._rightPad=if o then av else at
n._minWidth=math.clamp(n.minWidth or 0,c,d)local q=n.subtitle~=nil and n.subtitle~=''n.main=n.window:Create('Frame',{
Name='Toast',BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=m or n.
window.toasts})n.window:Create('UIPadding',{PaddingTop=UDim.new(0,b),Parent=n.main})n.body=n.window:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=if n.position=='Bottom'then g else f,
AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=n.
main})n.window:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=n.body},{Color={'WindowColor',ah.
toColorSequence}})n.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=n.body})n.stroke=n.window:Create(
'UIStroke',{Transparency=1,Parent=n.body},{Color='SurfaceStroke'})n.shadow=n.window:CreateGlow(n.body,'ShadowColor',20,1
)n.window:Create('UIPadding',{PaddingLeft=UDim.new(0,n._leftPad),PaddingRight=UDim.new(0,n._rightPad),Parent=n.body})n.
window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.
Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,aw),
Parent=n.body})if p then n.iconLabel=n.window:Create('ImageLabel',{Image=n._iconImage,Size=UDim2.fromOffset(n._iconSize,
n._iconSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,
BackgroundTransparency=1,ImageTransparency=1,Parent=n.body},if o then nil else{ImageColor3='ContentColor'})n.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=n.iconLabel})end n.container=n.window:Create('Frame',{AutomaticSize
=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,q and 32 or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,
ZIndex=ai.zIndex.toastContent,Parent=n.body})n.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=n.
container})n.titleLabel=n.window:Create('TextLabel',{Text=n.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,16),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if n.
subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=n.container},{TextColor3=
'ContentColor',FontFace='TitleFont'})if q then n.subtitleLabel=n.window:Create('TextLabel',{Text=n.subtitle,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=if n.subtitleAbove then 1 else 2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent
=n.container},{TextColor3='ContentColor',FontFace='Font'})end n.window._toastCount=(n.window._toastCount or 0)+1 n.main.
LayoutOrder=-n.window._toastCount local r=n.window._liveToasts if not r then r={}n.window._liveToasts=r end local s=r[n.
main.Parent]if not s then s={}r[n.main.Parent]=s end n._live=s table.insert(s,n)while#s>e do local t=table.remove(s,1)if
t and t~=n then task.spawn(t._dismiss,t)end end n._connections={n.window:Connect(n.body.MouseEnter,function()n._hovered=
true end),n.window:Connect(n.body.MouseLeave,function()n._hovered=false end),n.window:Connect(n.body.InputBegan,function
(t)if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then n:_dismiss()end
end)}task.spawn(function()n:_show()end)return n end function ae._measure(k)local l,m=ah.textWidth(k.window.theme.
TitleFont,16,k.title),if k.subtitleLabel then ah.textWidth(k.window.theme.Font,14,k.subtitle)else 0 local n,o=math.max(l
,m),if k.iconLabel then k._leftPad+k._iconSize+aw else k._leftPad local p=math.clamp(o+n+k._rightPad,k._minWidth,d)if o+
n+k._rightPad>d then local q=d-o-k._rightPad for r,s in{k.titleLabel,k.subtitleLabel}do if s then s.AutomaticSize=Enum.
AutomaticSize.None s.TextTruncate=Enum.TextTruncate.AtEnd s.Size=UDim2.fromOffset(q,s.Size.Y.Offset)end end end local q=
if k.subtitleLabel then 31 else 16 local r=math.max(q,if k.iconLabel then k._iconSize else 0)+18 return p,r end function
ae._show(k)if not k.main.Parent then return end ak.notify()local l,m=k:_measure()if k._dismissed or not k.main.Parent
then return end k.main.Size=UDim2.new(0,l,0,0)ag.tweenService:Create(k.main,am,{Size=UDim2.new(0,l,0,m+b)}):Play()ag.
tweenService:Create(k.body,al,{Position=h}):Play()ag.tweenService:Create(k.body,an,{BackgroundTransparency=0}):Play()ag.
tweenService:Create(k.stroke,an,{Transparency=0.9}):Play()ag.tweenService:Create(k.shadow,ao,{Transparency=0.6}):Play()
ag.tweenService:Create(k.titleLabel,ao,{TextTransparency=0}):Play()task.wait(0.05)if k._dismissed or not k.main.Parent
then return end if k.iconLabel then ag.tweenService:Create(k.iconLabel,ao,{BackgroundTransparency=0.95}):Play()ag.
tweenService:Create(k.iconLabel,ao,{ImageTransparency=0}):Play()end task.wait(0.05)if k._dismissed or not k.main.Parent
then return end if k.subtitleLabel then ag.tweenService:Create(k.subtitleLabel,ao,{TextTransparency=0.5}):Play()end
local n=0 while n<k.duration and not k._dismissed and k.main.Parent do local o=task.wait()if not k._hovered then n+=o
end end k:_dismiss()end function ae._dismiss(k)if k._dismissed then return end k._dismissed=true local l=k._live local m
=l and table.find(l,k)if l and m then table.remove(l,m)end if not k.main.Parent then return end ag.tweenService:Create(k
.body,an,{BackgroundTransparency=1}):Play()ag.tweenService:Create(k.stroke,an,{Transparency=1}):Play()ag.tweenService:
Create(k.shadow,ao,{Transparency=1}):Play()ag.tweenService:Create(k.titleLabel,ao,{TextTransparency=1}):Play()if k.
subtitleLabel then ag.tweenService:Create(k.subtitleLabel,ao,{TextTransparency=1}):Play()end if k.iconLabel then ag.
tweenService:Create(k.iconLabel,ao,{ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(k.
body,ap,{Size=UDim2.new(1,-60,1,0)}):Play()local n=ag.tweenService:Create(k.main,ap,{Size=UDim2.new(0,k.main.Size.X.
Offset,0,0)})n:Play()n.Completed:Wait()if not k.main.Parent then return end for o,p in k._connections do k.window:
Disconnect(p)end k.window:DestroySubtree(k.main)end return ae end)()end,[32]=function()local aa,ab,ac=a(32)local ad
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
ac(ab.Parent.sidebar),ac(ae.variables),ab.Parent.Parent.themes,{}at.__index=at local au,av,aw,b,c=TweenInfo.new(0.4,Enum
.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.new(0.5,0,0,20
),UDim2.new(0.5,0,0,12)local d,e,f,g,h,i,j,k,l=UDim2.new(0.5,0,0,b.Y.Offset+av.Y.Offset+12),TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2 local function m(n,o):(UDim2,number)local p=ar.
workspace.CurrentCamera local q=p and p.ViewportSize local r=o or am.scaleFor(q,n)return am.fit(if q then q/r else nil,n
),r end local n,o={'TopLeftRadius','TopRightRadius','BottomLeftRadius','BottomRightRadius'},(function()return(pcall(
function()local n=Instance.new'UICorner'n.TopLeftRadius=UDim.new(0,1)n:Destroy()end))end)()local function p(q)return if
q then an.sidebar else an.top end local q={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,
TabBackground=true,TabStroke=true,SliderProgress=true}local function r(s,t)if q[s]and typeof(t)=='Color3'then return
ColorSequence.new(t)end return t end local function s(t)return if typeof(t)=='ColorSequence'then t.Keypoints[1].Value
else t end local function t(u,v)local w=u._toastsTop if not w then return end local x=if u._collapsedShown then d else c
if not v or w.Position==x then w.Position=x return end ar.tweenService:Create(w,e,{Position=x}):Play()end local function
u(v,w)local x=0.299*v.R+0.587*v.G+0.114*v.B local y=if x>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return v:Lerp(y
,w)end local function v(w,x)if x.ElementGradient then local y=s(w.ElementGradient)if x.ElementStroke==nil then w.
ElementStroke=u(y,0.28)end if x.ElementStrokeGradient==nil then w.ElementStrokeGradient=ColorSequence.new(u(y,0.4))end
if x.ElementStrokeHover==nil then w.ElementStrokeHover=u(y,0.52)end end if x.TabBackground and x.TabStroke==nil then w.
TabStroke=ColorSequence.new(u(s(w.TabBackground),0.4))end end local function w(x)if typeof(x)~='string'then return nil
end for y,z in ai.builtInThemes do if string.lower(z)==string.lower(x)then return z end end return nil end
local function x(y)if typeof(y)=='table'then return y elseif typeof(y)=='string'then local z=as:FindFirstChild(string.
lower(y))if z then return ac(z)end ak.warn("Rayfield: unknown theme '"..y.."', using default")elseif y~=nil then ak.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(as.default)end
local function y(z)local A,B=table.clone(ac(as.default)),x(z)for C,D in B do A[C]=r(C,D)end if typeof(z)=='table'then v(
A,B)end local C=if typeof(z)=='table'then z else nil if not(C and(C.Font or C.font))then A.Font=ar.brandFont(Enum.
FontWeight.Medium)end if not(C and(C.TitleFont or C.titleFont))then A.TitleFont=ar.brandFont(Enum.FontWeight.SemiBold)
end return A end function at.new(z)z=if typeof(z)=='table'then z else{}if z.translations or z.Translations then aj.
register(z.translations or z.Translations)end if z.translator or z.Translator then aj.translator=z.translator or z.
Translator end aj.setActive(z.locale or z.Locale or aj.detect())local A=z.fallbackFont or z.FallbackFont if A then ar.
setFallbackFont(A)end local B,C=p(z.sidebarLayout or z.SidebarLayout),z.scale or z.Scale if C~=nil and(typeof(C)~=
'number'or C<=0)then ak.warn[[Rayfield: scale must be a number above 0, using automatic scaling]]C=nil end local D,E=m(B
.mode,C)local F=setmetatable({name=z.name or z.Name or'Rayfield Window',subheading=z.subtitle or z.Subtitle,layout=B,
size=D,scale=E,fixedScale=C,instances={},connections={},icon=z.icon or z.Icon,showName=z.showName or z.ShowName or
'Rayfield',showIcon=z.showIcon or z.ShowIcon or ai.icons.rayfield,showIconOnly=z.showIconOnly or z.ShowIconOnly or false
,profileText=z.profile or z.Profile,themeProperties={},_scaledSurfaces={},actions={},localeProperties={},tabs={},
tabSections={},tags={},selectedTab=nil,theme=y(z.theme or z.Theme),themeName=w(z.theme or z.Theme)or'Default',controls={
},configuration=(function()local F=z.configuration or z.Configuration if not F then return{}end return{autoSave=F.
autoSave or F.AutoSave,autoLoad=F.autoLoad or F.AutoLoad,fileName=F.fileName or F.FileName,customFolder=F.customFolder
or F.CustomFolder}end)()},at)F.Flags=setmetatable({},{__index=function(G,H)local I=F.controls[H]return I and I.value end
,__newindex=function(G,H,I)local J=F.controls[H]if not J then ak.warn("Rayfield: no flag '"..tostring(H).."' to set")
return end J:Set(I)end,__iter=function()local G return function()local H G,H=next(F.controls,G)if G then return G,H.
value end return nil end end})F.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast
=true,haptics=true,showProfile=true,theme=nil}F.screenGui=F:Create('ScreenGui',{Name=ar.httpService:GenerateGUID(false),
IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.
ZIndexBehavior.Global,Parent=ar.guiContainer})F.main=F:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name
=F.name,ZIndex=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((F.size.X.Offset
-50),0),BackgroundTransparency=1,Visible=false,Parent=F.screenGui})F.uiScale=F:Create('UIScale',{Scale=F.scale,Parent=F.
main})F.drag=ac(ab.Parent.drag).new(F)F.windowCorner=F:Create('UICorner',{Parent=F.main},{CornerRadius='CornerRoundness'
})F.windowStroke=F:Create('UIStroke',{Transparency=1,Parent=F.main},{Color='SurfaceStroke'})F.windowGradient=F:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=F.main},{Color={'WindowColor',ag.toColorSequence}})F.
bottomFade=F:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,AnchorPoint=Vector2.new(1,1)
,Position=UDim2.fromScale(1,1),Size=F.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,BackgroundTransparency=1,Parent=F.main
})F.bottomFadeCorner=F:_roundCorners(F.bottomFade,F.layout.fadeCorners)F.bottomFadeGradient=F:Create('UIGradient',{
Rotation=270,Offset=Vector2.new(0,0.2),Transparency=F.layout.fadeTransparency,Parent=F.bottomFade},{Color={'WindowColor'
,function(G)return ColorSequence.new(ag.toColorSequence(G).Keypoints[1].Value)end}})F.topbar=F:Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,F.layout.topbarHeight),Active=true,Parent=F.main})F.topContainer=F:Create(
'Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,Parent=F.topbar})F.topContainerLayout=F:Create('UIListLayout',{Padding=UDim.
new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment
=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=F.topContainer})F.titleContainer=F:Create(
'Frame',{Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=F.topContainer})F.titleContainerLayout=F:Create(
'UIListLayout',{Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=F.titleContainer})if F.name then F.title=F:Create('TextLabel',{Text=
aj.t(F.name),FontFace=ar.brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize
.X,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,
Parent=F.titleContainer},{FontFace='Font',TextColor3='TitlingColor'})end if F.icon then F.topbarIcon=F:Create(
'ImageLabel',{Image=F.icon,BackgroundTransparency=1,Size=UDim2.fromOffset(32,32),ImageTransparency=1,Parent=F.
topContainer},{ImageColor3='TitlingColor'})end if F.subheading then F.subtitle=F:Create('TextLabel',{Text=aj.t(F.
subheading),Size=UDim2.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=F.titleContainer},{TextColor3=
'TitlingColor',FontFace='Font'})end F.tagContainer=F:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0
,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,LayoutOrder=2,
Visible=false,Parent=F.topContainer})F.tagContainerLayout=F:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Parent=F.tagContainer})F.windowShadow=F:CreateGlow(F.main,'ShadowColor',20,1)F.elements=F:Create('Frame',{Size=UDim2.
new(1,0,1,-F.layout.chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,Parent=F.main})if F.layout.mode==
'sidebar'then F.elementsCorner=F:_roundCorners(F.elements,F.layout.cardCorners)F.elementsStroke=F:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=F.elements},{Color='SurfaceStroke'})F:Create(
'UIGradient',{Rotation=F.layout.cardStrokeRotation,Transparency=F.layout.cardStrokeTransparency,Parent=F.elementsStroke}
)end F.elementsLayout=F:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=F.layout.pageDirection,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.
EasingStyle.Exponential,TweenTime=0.4,Parent=F.elements})if F.layout.mode=='sidebar'then aq.build(F,F.layout)aq.
applyWidth(F,an.railWidthFor(F.layout,F.size.X.Offset))else F.tabList=F:Create('ScrollingFrame',{Name='Tabs',Active=true
,Size=UDim2.new(1,0,0,F.layout.tabStripHeight),Position=UDim2.new(0.5,0,0,F.layout.tabStripTop),AnchorPoint=Vector2.new(
0.5,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=F.main})F.
tabListLayout=F:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=F.tabList})F:Create('UIPadding',{PaddingLeft=UDim.new(0,22),PaddingRight=UDim.new(0,10),
Parent=F.tabList})end F.actionContainer=F:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,Parent=F.topbar})F.
actionsListLayout=F:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=F.actionContainer})F.rfSettings=F:CreateTab{name='Rayfield Settings',customOrder=1000,
neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(F,{name='Close',icon=ai.icons.close,order=1,callback=
function()F:ToggleHide()end})F.minimiseAction=ac(ab.Parent.action).new(F,{name='Minimise',icon=ai.icons.minimise,order=2
,callback=function()F:ToggleMinimise()end})F.settingsAction=ac(ab.Parent.action).new(F,{name='Settings',icon=ai.icons.
settings,order=3,linkedTab=F.rfSettings,callback=function()F.rfSettings:Select()end})ap.build(F)F:_applyRailWidth()F.
unloaded=false F.minimised=false F.hidden=true F.animating=false F._revealing=false F.hasShownOnce=false F.
_collapsedShown=false F:LoadSettings()if F.settings.theme then F:ChangeTheme(F.settings.theme)end if F.layout.mode==
'sidebar'then aq.reflowProfile(F)aq.setSubtitle(F,F.profileText)end al.setContainer(F.screenGui)al.setEnabled(F.settings
.haptics)ao.buildCollapsedFace(F)F:_bindKeybind()F:_bindMouseOverride()F:_bindTopbarDrag()F:_watchViewport()F:
_buildSettingsUI()F:_syncLiveAnimation()return F end function at._syncLiveAnimation(z)if not z.theme.LiveAnimation then
z._liveAnimating=false return end if z._liveAnimating then return end z._liveAnimating=true z._liveGeneration=(z.
_liveGeneration or 0)+1 local A=z._liveGeneration task.spawn(function()local B,C=true,TweenInfo.new(10,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)while z._liveGeneration==A and z._liveAnimating and not z.unloaded do local D=ar.
tweenService:Create(z.windowGradient,C,{Offset=Vector2.new(if B then 0.4 else-0.2,0),Rotation=(if B then 220 else 280)})
z._liveTween=D D:Play()D.Completed:Wait()B=not B end if z._liveGeneration==A then z._liveAnimating=false z._liveTween=
nil end end)end function at._builtInThemeName(z)return z.themeName end function at.ChangeTheme(z,A)z.themeName=w(A)local
B=if typeof(A)=='table'then A else y(A)for C,D in B do z.theme[C]=r(C,D)end if typeof(A)=='table'then v(z.theme,B)end
for C,D in z.themeProperties do for E,F in D do local G=if typeof(F)=='table'then F[2](z.theme[F[1] ])else z.theme[F]if
typeof(G)=='Color3'or typeof(G)=='number'then ar.tweenService:Create(C,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[E]=G}):Play()else C[E]=G end end end if z.hidden then z._themeRefreshPending=true else z:
_refreshElementThemes()end z:_syncLiveAnimation()end function at._refreshElementThemes(z)for A,B in z.tabs do for C,D in
B.elements do if D._refreshTheme then D:_refreshTheme()end end end end function at.CreateTab(z,A)assert(not z.unloaded,
'Cannot create a tab on an unloaded window.')local B=ac(ab.Parent.tab).new(z,A)table.insert(z.tabs,B)if not B.
neglectSelector then local C=true for D,E in z.tabs do if E~=B and not E.neglectSelector then C=false break end end if C
then B:Select(true)end if not z.hidden and not z.minimised then B.topbarItem.Visible=true B:_applyVisual(if z.
selectedTab==B then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end
return B end function at.CreateSection(z,A)assert(not z.unloaded,'Cannot create a section on an unloaded window.')local
B=ac(ab.Parent.tabSection).new(z,A)table.insert(z.tabSections,B)if not B.inert and not z.hidden and not z.minimised then
B:_setVisible(true)B:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return B end
function at._setTabSectionsShown(z,A,B)for C,D in z.tabSections do D:_setShown(A,B)end end function at.
_setTabSectionsVisible(z,A)for B,C in z.tabSections do C:_setVisible(A)end end function at.CreateTag(z,A)assert(not z.
unloaded,'Cannot create a tag on an unloaded window.')local B=ac(ab.Parent.tag).new(z,A)table.insert(z.tags,B)return B
end function at._registerControl(z,A)if not A.flag or A.flag==''or A.forgetState then return end local B=A.flag if z.
controls[B]then local C=2 while z.controls[B..C]do C+=1 end B=B..C ak.warn("Rayfield: duplicate config flag '"..A.flag..
"', saving this one as '"..B.."'. Set a unique flag to keep it stable across sessions.")end A.flag=B z.controls[B]=A
return B end function at._restoreLate(z,A)if not z._loadedConfig or not A.flag or A.forgetState then return end local B=
z._loading z._loading=true ah.applyTo(A,z._loadedConfig[A.flag])z._loading=B end function at._persist(z,A)if A.flag and
not A.forgetState and z.configuration.autoSave and not z._loading then task.spawn(z.Save,z)end end function at.
_unregisterControl(z,A)if A.flag and z.controls[A.flag]==A then z.controls[A.flag]=nil end end function at._keybindUsing
(z,A,B)if typeof(A)~='EnumItem'or A==Enum.KeyCode.Unknown then return nil end for C,D in z.tabs do for E,F in D.elements
do if F~=B and F.__type=='Keybind'and F.value==A then return F end end end return nil end function at.Notify(z,A)if z.
unloaded then return end if not z.notifications then z.notifications=z:Create('Frame',{Name='Notifications',Size=UDim2.
new(0,300,0,800),Position=UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=z.
screenGui})z:_scaleSurface(z.notifications)z:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=z.notifications})end return ac(ab.Parent.notification).new(z,A)end
function at.CreateNameplate(z,A)assert(not z.unloaded,'Cannot create nameplates on an unloaded window.')local B=ac(ab.
Parent.nameplate).new(z,A)z._nameplates=z._nameplates or{}table.insert(z._nameplates,B)return B end function at.Toast(z,
A)if z.unloaded then return end A=if typeof(A)=='table'then A else{}local B=A.position or A.Position or'Top'local C=
typeof(B)~='string'or B:lower()~='bottom'A.position=if C then'Top'else'Bottom'local D=if C then'_toastsTop'else
'_toastsBottom'local E=z[D]if not E then E=z:Create('Frame',{Name='Toasts',Size=UDim2.new(0,f,1,-24),Position=if C then
c else UDim2.new(0.5,0,1,-12),AnchorPoint=if C then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,
ZIndex=ai.zIndex.toast,Parent=z.screenGui})z:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=if C then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=E})z[D]=E z:_scaleSurface(E
)if C then t(z,false)end end return ac(ab.Parent.toast).new(z,A,E)end function at.Popup(z,A)if z.unloaded then return
end return ac(ab.Parent.popup).new(z,A)end function at.Hide(z)if z.animating or z.hidden then return end if z._searching
then ap.close(z,{showTabs=false,jumpTo=z.selectedTab and z.selectedTab.tabPage})end if z._recordingKeybind then z.
_recordingKeybind:_stopRecording()end z.animating=true z._revealing=true z.hidden=true z.collapsedInteract.Visible=false
if z.minimised then z.minimised=false z.minimiseAction:_setIcon(ai.icons.minimise)end z._restorePosition=z.main.Position
local A,B=z:_collapsedRect()local C,D,E,F=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.
new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ar.tweenService:Create(z.drag.
dragCosmetic,C,{Size=UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not z.hidden
then return end z.drag.drag.Visible=false end)z:_fadeSurfaces(false,C)if z.title then ar.tweenService:Create(z.title,C,{
TextTransparency=1}):Play()end if z.subtitle then ar.tweenService:Create(z.subtitle,C,{TextTransparency=1}):Play()end if
z.topbarIcon then ar.tweenService:Create(z.topbarIcon,C,{ImageTransparency=1}):Play()end for G,H in ipairs(z.
actionContainer:GetChildren())do if H:IsA'Frame'then ar.tweenService:Create(H.ImageLabel,C,{ImageTransparency=1}):Play()
end end for G,H in z.tags do H:_setShown(false,C)end for G,H in pairs(z.tabs)do if not H.neglectSelector and H.
topbarItem then H:_applyVisual('hidden',C)end end z:_setTabSectionsShown(false,C)z:_fadeSelectedElementsOut()local G=ar.
tweenService:Create(z.main,D,{Size=B,Position=A})G.Completed:Connect(function()if z.unloaded or not z.hidden then return
end z._collapsedShown=true t(z,true)z.collapsedInteract.Visible=true z.animating=false z._revealing=false end)G:Play()ar
.tweenService:Create(z.windowCorner,E,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()if not z.hidden then
return end z.topbar.Visible=false z:_setContentVisible(false)ao.setCollapsedShown(z,true,F)end)end function at.
ToggleHide(z)if z.animating then return end if z.hidden then z:Show()else z:Hide()end end function at.ToggleMinimise(z)
if z.animating or z.hidden then return end if z._searching then ap.close(z,{showTabs=true})end z.animating=true local A,
B=TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out)if z.minimised then z.minimised=false z.minimiseAction:_setIcon(ai.icons.minimise)
ar.tweenService:Create(z.main,A,{Size=z.size}):Play()z:_fadeSurfaces(true,B)ar.tweenService:Create(z.drag.drag,A,{
Position=UDim2.new(z.main.Position.X.Scale,z.main.Position.X.Offset,z.main.Position.Y.Scale,z.main.Position.Y.Offset+z:
_hang(z.size.Y.Offset))}):Play()task.delay(0.2,function()if z.minimised or z.hidden then return end z:
_setContentVisible(true)for C,D in pairs(z.tabs)do if not D.neglectSelector and D.topbarItem then D.topbarItem.Visible=
true D:_applyVisual(if z.selectedTab==D then'selected'else'unselected',B)end end z:_setTabSectionsVisible(true)z:
_setTabSectionsShown(true,B)z:_revealElements(0.035,0.4)end)task.delay(0.5,function()z.animating=false end)else z.
minimised=true z.minimiseAction:_setIcon(ai.icons.maximise)z:_fadeSelectedElementsOut()for C,D in pairs(z.tabs)do if not
D.neglectSelector and D.topbarItem then D:_applyVisual('hidden',B)end end z:_setTabSectionsShown(false,B)task.delay(0.3,
function()if not z.minimised then return end z:_setContentVisible(false)for C,D in pairs(z.tabs)do if not D.
neglectSelector and D.topbarItem then D.topbarItem.Visible=false end end z:_setTabSectionsVisible(false)end)z:
_fadeSurfaces(false,B)ar.tweenService:Create(z.main,A,{Size=UDim2.fromOffset(z.size.X.Offset,z.layout.topbarHeight)}):
Play()ar.tweenService:Create(z.drag.drag,A,{Position=UDim2.new(z.main.Position.X.Scale,z.main.Position.X.Offset,z.main.
Position.Y.Scale,z.main.Position.Y.Offset+z:_hang(z.layout.topbarHeight))}):Play()task.delay(0.5,function()z.animating=
false end)end end function at._syncDragBar(z)local A=z.drag and z.drag.drag if not A then return end local B,C=z.main.
Position,z:_hang(z.size.Y.Offset)A.Position=UDim2.new(B.X.Scale,B.X.Offset,B.Y.Scale,B.Y.Offset+C)end function at.
_clampedPosition(z,A:UDim2):UDim2 if not z.settings or not z.settings.keepOnScreen then return A end if A.X.Scale~=0 or
A.Y.Scale~=0 then return A end local B,C,D,E=z.screenGui.AbsoluteSize,z.size.X.Offset*z.scale/2,z.size.Y.Offset*z.scale/
2,8 local F,G=math.clamp(A.X.Offset,C+E,math.max(C+E,B.X-C-E)),math.clamp(A.Y.Offset,D+E,math.max(D+E,B.Y-D-E))if F==A.X
.Offset and G==A.Y.Offset then return A end return UDim2.fromOffset(F,G)end function at._clampToScreen(z)z.main.Position
=z:_clampedPosition(z.main.Position)end function at._applyWindowSize(z)if z.unloaded then return end local A,B=m(z.
layout.mode,z.fixedScale)local C=A~=z.size or B~=z.scale z.size=A z.scale=B z.uiScale.Scale=B z:_rescaleSurfaces()for D,
E in z.actions do E:_fit()end z:_applyRailWidth()if C then z:_layoutColumns()end if z.hidden or z.minimised or z.
animating or z._revealing then z._pendingResize=z._pendingResize or C return end if not C and not z._pendingResize then
return end z._pendingResize=false z.main.Size=A z:_clampToScreen()z:_syncDragBar()end function at._layoutColumns(z)for A
,B in z.tabs do B:_layoutColumns()end end function at._applyRailWidth(z)if z.layout.mode~='sidebar'then return end aq.
applyWidth(z,an.railWidthFor(z.layout,z.size.X.Offset))end function at._watchViewport(z)local A,B:RBXScriptConnection?=
false local function C()if A then return end A=true task.defer(function()A=false z:_applyWindowSize()end)end
local function D()if B then z:Disconnect(B)B=nil end local E=ar.workspace.CurrentCamera if E then B=z:Connect(E:
GetPropertyChangedSignal'ViewportSize',C)end C()end z:Connect(ar.workspace:GetPropertyChangedSignal'CurrentCamera',D)D()
local E=0 z:Connect(ar.runService.Heartbeat,function(F:number)E+=F if E<l then return end E=0 z:_applyWindowSize()end)
end function at._bindKeybind(z)z:Connect(ar.userInputService.InputBegan,function(A,B)if B or z._recordingKeybind then
return end if A.KeyCode==z.settings.toggleKeybind or A.UserInputType==z.settings.toggleKeybind then z:ToggleHide()end
end)end function at._bindMouseOverride(z)local A=ar.userInputService local function B()return z.settings.mouseOverride
and not z.hidden and not z.minimised end local function C()if not B()then return end if A:IsMouseButtonPressed(Enum.
UserInputType.MouseButton2)then return end if A.MouseBehavior~=Enum.MouseBehavior.Default then A.MouseBehavior=Enum.
MouseBehavior.Default end if not A.MouseIconEnabled then A.MouseIconEnabled=true end end z:Connect(A:
GetPropertyChangedSignal'MouseBehavior',C)z:Connect(A:GetPropertyChangedSignal'MouseIconEnabled',C)z:Connect(A.
InputEnded,function(D)if D.UserInputType==Enum.UserInputType.MouseButton2 then C()end end)z._freeMouse=C end function at
._bindTopbarDrag(z)local A,B,C,D=ar.userInputService,false,Vector2.zero,Vector2.zero if z.screenGui and z.screenGui.
IgnoreGuiInset then D=ar.guiService:GetGuiInset()end local function E()local F=A:GetMouseLocation()+C+D local G,H=F.X,F.
Y if z.settings and z.settings.keepOnScreen then local I,J,K=z.main.AbsoluteSize,z.screenGui.AbsoluteSize,8 local L,M=I.
X/2,I.Y/2 G=math.clamp(G,L+K,math.max(L+K,J.X-L-K))H=math.clamp(H,M+K,math.max(M+K,J.Y-M-K))end return UDim2.fromOffset(
G,H)end local function F(G,H)for I,J in{z.tabList,z.actionContainer}do local K,L=J.AbsolutePosition,J.AbsoluteSize if G
>=K.X and G<=K.X+L.X and H>=K.Y and H<=K.Y+L.Y then return true end end return false end z:Connect(z.topbar.InputBegan,
function(G,H)if H then return end local I=G.UserInputType.Name if I~='MouseButton1'and I~='Touch'then return end if F(G.
Position.X,G.Position.Y)then return end if not z:_interactive()then return end B=true if z.screenGui and z.screenGui.
IgnoreGuiInset then D=ar.guiService:GetGuiInset()end C=z.main.AbsolutePosition+z.main.AbsoluteSize*z.main.AnchorPoint-A:
GetMouseLocation()end)z:Connect(A.InputEnded,function(G)local H=G.UserInputType.Name if H=='MouseButton1'or H=='Touch'
then B=false end end)z:Connect(A.WindowFocusReleased,function()B=false end)z:Connect(ar.runService.RenderStepped,
function()if not B then return end if not z:_interactive()then B=false return end z.main.Position=E()if z.drag and z.
drag.drag then local G=z.main.Position z.drag.drag.Position=UDim2.new(G.X.Scale,G.X.Offset,G.Y.Scale,G.Y.Offset+z:_hang(
z.main.Size.Y.Offset))end end)end function at._buildSettingsUI(z)z.rfSettings:CreateSection{name='General'}z.rfSettings:
CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=z.settings.toggleKeybind,isMenuToggle=true,onChanged=
function(A)z.settings.toggleKeybind=A z:SaveSettings()end}z.rfSettings:CreateToggle{name='Unlock cursor while open',
description=[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=z.
settings.mouseOverride,callback=function(A)z.settings.mouseOverride=A z:SaveSettings()end}z.rfSettings:CreateToggle{name
='Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=z
.settings.welcomeToast,callback=function(A)z.settings.welcomeToast=A z:SaveSettings()end}z.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=z.settings.haptics,
callback=function(A)z.settings.haptics=A al.setEnabled(A)z:SaveSettings()end}z.rfSettings:CreateSection{name='Window'}z.
rfSettings:CreateDropdown{name='Theme',description=
[[Changes the colours of this menu. Your choice is remembered next time.]],options=ai.builtInThemes,value=z.settings.
theme or z:_builtInThemeName()or ai.builtInThemes[1],callback=function(A)if typeof(A)~='string'or A==''then return end z
.settings.theme=A z:ChangeTheme(A)z:SaveSettings()end}if z.layout.mode=='sidebar'and z.profile then z.rfSettings:
CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=z.settings.showProfile,callback=function(A)aq.setProfileEnabled(z,A)z:SaveSettings()end}end z.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=z.settings.keepOnScreen,callback=function(
A)z.settings.keepOnScreen=A z:SaveSettings()end}z.rfSettings:CreateButton{name='Reset Window Position',callback=function
()ar.tweenService:Create(z.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2
.new(0.5,0,0.5,0)}):Play()ar.tweenService:Create(z.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,z:_hang(z.size.Y.Offset))}):Play()end}if next(z.configuration)~=nil
then z.rfSettings:CreateSection{name='Configurations'}local A,B,C=(z:ListConfigs()[1])local function D()local E=z:
ListConfigs()B:Refresh(E)if A and not table.find(E,A)then A=E[1]end if A then B:Set(A,true)end end B=z.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=z:ListConfigs(),value=A,placeholder=
'No saved configurations',callback=function(E)A=E end}C=z.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local E=z.rfSettings:CreateGroup()E:CreateButton{name='Save',icon=ai.icons.config,callback=function()local F=C.
value if F==''then F=A end if not F or F==''then z:Toast{title=aj.resolve'Name your configuration first'}return end if z
:Save(F)then C:Set''A=F D()z:Toast{title=aj.resolve'Saved configuration',subtitle=F,icon=ai.icons.config}else z:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=F}end end}E:CreateButton{name='Load',callback=function()if not A
or A==''then z:Toast{title=aj.resolve'Pick a configuration to load'}return end if z:_applyNamedConfig(A)then z:Toast{
title=aj.resolve'Loaded configuration',subtitle=A}else z:Toast{title=aj.resolve"Couldn't load configuration",subtitle=A}
end end}E:CreateButton{name='Delete',callback=function()local F=A if not F or F==''then z:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if z:DeleteConfig(F)then D()z:Toast{title=aj.resolve'Deleted configuration',
subtitle=F}else z:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=F}end end}end end function at.
SetProfile(z,A)z.profileText=A aq.setSubtitle(z,A)end function at.SaveSettings(z)return ah.saveSettings(z)end function
at.LoadSettings(z)return ah.loadSettings(z)end function at._roundCorners(z,A,B)if not B or not o then return z:Create(
'UICorner',{Parent=A},{CornerRadius='CornerRoundness'})end local C,D={Parent=A},{}for E,F in n do C[F]=UDim.new(0,0)end
for E,F in B do C[F]=nil D[F]='CornerRoundness'end return z:Create('UICorner',C,D)end function at._setElementLocked(z,A,
B,C)B=B==true local D=A.locked==true if D==B and not(B and C)then return end A.locked=B if not A.lockScrim then z:
_buildLockScrim(A)end local E=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if B then A.lockScrim.
Visible=true end ar.tweenService:Create(A.lockScrim,E,{BackgroundTransparency=if B then h else 1}):Play()if not B then
task.delay(E.Time,function()if not A.locked and A.lockScrim then A.lockScrim.Visible=false end end)end local F=A.
descriptor if not F then return end if B then A._descriptionBefore=A._descriptionBefore or F.titleLabel.Text F.
titleLabel.Text=aj.resolve(C or'This element is locked.')elseif A._descriptionBefore then F.titleLabel.Text=A.
_descriptionBefore A._descriptionBefore=nil end ar.tweenService:Create(F.titleLabel,E,{TextTransparency=if B then i else
0.7}):Play()end function at._buildLockScrim(z,A)A.lockScrim=z:Create('TextButton',{Name='ElementLock',Active=true,
AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=A.main},{BackgroundColor3={'WindowColor',s}})z:Create(
'UICorner',{Parent=A.lockScrim},{CornerRadius='ElementCornerRadius'})end function at._setContentVisible(z,A)z.elements.
Visible=A z.tabList.Visible=A if z.sidebar then z.sidebar.Visible=A end end function at._fadeSurfaces(z,A,B)local C={[z.
windowShadow]={Transparency=if A then 0.6 else 1},[z.windowStroke]={Transparency=if A then 0.95 else 1},[z.bottomFade]={
BackgroundTransparency=if A then 0 else 1}}if z.elementsStroke then C[z.elements]={BackgroundTransparency=if A then z.
layout.cardTransparency else 1}C[z.elementsStroke]={Transparency=if A then 0 else 1}end for D,E in C do if B then ar.
tweenService:Create(D,B,E):Play()else for F,G in E do D[F]=G end end end aq.setProfileShown(z,A,B)end function at.
_fadeSelectedElementsOut(z)if z.selectedTab then for A,B in ipairs(z.selectedTab.elements)do B:_setShown(false,true)end
end end function at._revealElements(z,A,B)for C,D in pairs(z.tabs)do if D~=z.selectedTab then for E,F in ipairs(D.
elements)do F:_setShown(true,false)end end end local C=z.selectedTab if not C then return end local D=C.tabPage local E=
D.AbsolutePosition.Y local F,G,H=E+D.AbsoluteWindowSize.Y,table.clone(C.elements),{}for I,J in G do H[J]=I end table.
sort(G,function(I,J)local K,L=I.main.AbsolutePosition,J.main.AbsolutePosition if K.Y~=L.Y then return K.Y<L.Y end if K.X
~=L.X then return K.X<L.X end return H[I]<H[J]end)local I,J=math.floor(B/A),0 for K,L in G do local M=L.main.
AbsolutePosition.Y local N=(M+L.main.AbsoluteSize.Y)>E and M<F if N then L:_setShown(true,true)J+=1 if J<=I then task.
wait(A)end else L:_setShown(true,false)end end end function at.Show(z)if z.animating or not z.hidden then return end z.
animating=true z._revealing=true if z.configuration.autoLoad and not z._autoLoaded then z._autoLoaded=true local A,B=
pcall(z.Load,z)if not A then ak.warn('Rayfield: Failed to load configuration - '..tostring(B))end end z.hidden=false z.
minimised=false if z._themeRefreshPending then z._themeRefreshPending=false z:_refreshElementThemes()end z.
collapsedInteract.Visible=false if z._freeMouse then z._freeMouse()end if z.hasShownOnce then z:_quickRestore()else z.
hasShownOnce=true z:_firstShow()end end function at._quickRestore(z)local A=z:_clampedPosition(z._restorePosition or
UDim2.new(0.5,0,0.5,0))z._restorePosition=A local B,C,D=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)ao.setCollapsedShown(z,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local E=ar.tweenService:Create(z.main,B,{Size=z.size,Position=A})E.Completed:Connect(
function()if z.hidden or z.unloaded then return end z._collapsedShown=false t(z,true)end)E:Play()ar.tweenService:Create(
z.windowCorner,C,{CornerRadius=z.theme.CornerRoundness}):Play()task.delay(0.22,function()z.topbar.Visible=true z:
_setContentVisible(true)z:_fadeSurfaces(true,D)if z.topbarIcon then ar.tweenService:Create(z.topbarIcon,D,{
ImageTransparency=0}):Play()end if z.title then ar.tweenService:Create(z.title,D,{TextTransparency=0}):Play()end if z.
subtitle then ar.tweenService:Create(z.subtitle,D,{TextTransparency=0.7}):Play()end for F,G in ipairs(z.actionContainer:
GetChildren())do if G:IsA'Frame'then ar.tweenService:Create(G.ImageLabel,D,{ImageTransparency=0.6}):Play()end end if z.
settingsAction and z.selectedTab==z.rfSettings then ar.tweenService:Create(z.settingsAction.iconLabel,D,{
ImageTransparency=0.2}):Play()end for F,G in z.tags do G:_setShown(true,D)end for F,G in pairs(z.tabs)do if not G.
neglectSelector and G.topbarItem then G.topbarItem.Visible=true G:_applyVisual(if z.selectedTab==G then'selected'else
'unselected',D)end end z:_setTabSectionsVisible(true)z:_setTabSectionsShown(true,D)z:_revealElements(0.035,0.4)end)task.
delay(0.22,function()z.drag.drag.Position=UDim2.new(A.X.Scale,A.X.Offset,A.Y.Scale,A.Y.Offset+z:_hang(z.size.Y.Offset))z
.drag.dragCosmetic.Size=UDim2.fromOffset(0,4)z.drag.dragCosmetic.BackgroundTransparency=1 z.drag.drag.Visible=true ar.
tweenService:Create(z.drag.dragCosmetic,B,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()z.animating=false z._revealing=false end)end function at._firstShow(z)z:_setContentVisible(true)z.
drag.drag.Visible=false z.main.Visible=true ar.tweenService:Create(z.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=z.size}):Play()task.wait(0.85)z:_fadeSurfaces(true,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if z.icon then ar.tweenService:Create(z.
topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if
z.title then ar.tweenService:Create(z.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if z.subtitle then ar.tweenService:Create(z.subtitle,TweenInfo.new(0.4,Enum
.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for A,B in ipairs(z.actionContainer
:GetChildren())do if B:IsA'Frame'then task.wait(0.02)ar.tweenService:Create(B.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for A,B in z.tags do B:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()local A=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)z:_setTabSectionsVisible(true)z:
_setTabSectionsShown(true,A)local B=0 for C,D in pairs(z.tabs)do if not D.neglectSelector then D.topbarItem.Visible=true
D:_applyVisual(if z.selectedTab==D then'selected'else'unselected',A)D:_spinGradients()B+=1 if B<=k then task.wait(j)end
end end end)z:_revealElements(0.03,2)task.wait(1)z:_syncDragBar()z.drag.drag.Visible=true ar.tweenService:Create(z.drag.
dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):
Play()ar.tweenService:Create(z.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
{Size=UDim2.fromOffset(100,4)}):Play()z.animating=false z._revealing=false local A=ar.localPlayer if A and z.settings.
welcomeToast and ao.isNewUser()then z:Toast{title=A.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,
avatar=A.UserId,minWidth=220}end end function at.GetPath(z)return ah.getPath(z)end function at.Save(z,A)if A~=nil and(
type(A)~='string'or A=='')then return false end return ah.save(z,A)end function at.Load(z,A)if A~=nil and(type(A)~=
'string'or A=='')then return false end return ah.load(z,A)end function at._applyNamedConfig(z,A)if not z:Load(A)then
return false end local B,C=ah.getPath(z)z._loadedConfigPath=C z:Save()return true end function at.ListConfigs(z)return
ah.list(z)end function at.DeleteConfig(z,A)return ah.delete(z,A)end function at.Get(z,A)local B=z.controls[A]return B
and B.value end function at.Set(z,A,B)local C=z.controls[A]if not C then return false end C:Set(B)return true end
function at._jumpTo(z,A)if A then z.elementsLayout:JumpTo(A)end end function at.Navigate(z,A)if A==nil then return end
local B for C,D in z.tabs do if D==A or D.name==A or D.tabPage==A then B=D break end end if not B then return end B:
Select()end function at.Create(z,A,B,C)assert(typeof(A)=='string','Invalid argument #1 (string expected)')local D=
Instance.new(A)if C and z.theme then for E,F in C do D[E]=(if typeof(F)=='table'then F[2](z.theme[F[1] ])else z.theme[F]
)end z.themeProperties[D]=C end if B then for E,F in B do if aj.isToken(F)then z:_bindLocale(D,E,aj.sourceOf(F))else af.
assign(D,E,F)end end end table.insert(z.instances,D)return D end function at._bindLocale(z,A,B,C)A[B]=aj.resolve(C)local
D=z.localeProperties[A]if not D then D={}z.localeProperties[A]=D end D[B]=C end function at.SetLocale(z,A)aj.setActive(A
)for B,C in z.localeProperties do for D,E in C do B[D]=aj.resolve(E)end end end function at.SetTranslator(z,A)aj.
translator=A end function at.RegisterTranslations(z,A)aj.register(A)z:SetLocale(aj.current)end function at.CreateGlow(z,
A,B,C,D)local E={BlurRadius=UDim.new(0,C),Transparency=D,ZIndex=-1,Parent=A}if typeof(B)=='string'then return z:Create(
'UIShadow',E,{Color={B,function(F)return if typeof(F)=='ColorSequence'then F.Keypoints[1].Value else F end}})end E.Color
=B return z:Create('UIShadow',E)end function at._flashResult(z,A,B)local C=A.box if not C then return end local D,E,F,G,
H,I=A.glow,A.boxStroke,B and ai.accent.on or z.theme.ErrorColor,B and ai.accent.onStroke or z.theme.ErrorStrokeColor,
TweenInfo.new(0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)ar.tweenService:Create(C,H,{BackgroundColor3=F}):Play()if E then ar.tweenService:Create(E,H,{Color=G
,Transparency=0.4}):Play()end if D then ar.tweenService:Create(D,H,{Color=G,Transparency=0.6}):Play()end A._flashToken=(
A._flashToken or 0)+1 local J=A._flashToken task.delay(0.22,function()if A._flashToken~=J then return end ar.
tweenService:Create(C,I,{BackgroundColor3=z.theme.FieldBackground}):Play()if E then ar.tweenService:Create(E,I,{Color=z.
theme.SurfaceStroke,Transparency=0.85}):Play()end if D then ar.tweenService:Create(D,I,{Color=z.theme.FieldGlow,
Transparency=A._glowIdle or 1}):Play()end end)end function at.CreateHoverOverlay(z,A)local B=z:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex
=1,Parent=A})z:Create('UICorner',{Parent=B},{CornerRadius='ElementCornerRadius'})return B end function at.
_wireElementHover(z,A)local B,C=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),z.theme z:
ConnectFor(A,A.main.MouseEnter,function()if not z:_interactive()then return end ar.tweenService:Create(A.stroke,B,{
Transparency=C.ElementStrokeHoverTransparency,Color=C.ElementStrokeHover}):Play()ar.tweenService:Create(A.title,B,{
TextColor3=C.ElementTextHoverColor}):Play()if A.hoverOverlay then ar.tweenService:Create(A.hoverOverlay,B,{
BackgroundTransparency=0.97}):Play()end end)z:ConnectFor(A,A.main.MouseLeave,function()ar.tweenService:Create(A.stroke,B
,{Transparency=C.ElementStrokeTransparency,Color=C.ElementStroke}):Play()ar.tweenService:Create(A.title,B,{TextColor3=C.
ContentColor}):Play()if A.hoverOverlay then ar.tweenService:Create(A.hoverOverlay,B,{BackgroundTransparency=1}):Play()
end end)end function at._runGuarded(z,A,B,...)if A.locked then return end local C=table.pack(...)task.spawn(function()
local D,E=pcall(function()return B(table.unpack(C,1,C.n))end)if D or A._errored then return end A._errored=true local F,
G=A.flashTarget or A.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ar.tweenService:Create(F,G,
{BackgroundColor3=z.theme.ErrorColor}):Play()ar.tweenService:Create(A.stroke,G,{Color=z.theme.ErrorStrokeColor}):Play()
if A.title then A.title.Text=aj.resolve'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {
A.__type} component named '{A.name}':`)ak.print(E)task.wait(1)if A.title then A.title.Text=aj.resolve(A.name)end ar.
tweenService:Create(F,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.
fromRGB(255,255,255)}):Play()ar.tweenService:Create(A.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Color=z.theme.ElementStroke}):Play()A._errored=false end)end function at.StyleElementBody(z,A)z:
Create('UIGradient',{Rotation=270,Parent=A},{Color='ElementGradient'})z:Create('UICorner',{Parent=A},{CornerRadius=
'ElementCornerRadius'})return z:Create('UIStroke',{Transparency=1,Parent=A},{Color='ElementStroke',Transparency=
'ElementStrokeTransparency'})end function at._buildCompactRow(z,A,B,C)local D=z:Create('Frame',{Name=B,Size=UDim2.
fromOffset(0,g),AutomaticSize=Enum.AutomaticSize.X,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Parent=A.tabPage},{BackgroundTransparency='ElementTransparency'})local E=z:
StyleElementBody(D)z:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=D})z:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,
Parent=D})local F=z:Create('TextButton',{Text='',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,g),BorderSizePixel=0,TextTransparency=1,ZIndex=C or 1,Parent=
D})z:Create('UICorner',{Parent=F},{CornerRadius='ElementCornerRadius'})return D,E,F end function at.StyleElementPanel(z,
A)z:Create('UIGradient',{Rotation=270,Parent=A},{Color='ElementGradient'})z:Create('UICorner',{Parent=A},{CornerRadius=
'ElementCornerRadius'})local B=z:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=A})z:Create(
'UIGradient',{Rotation=270,Parent=B},{Color='ElementStrokeGradient'})return B end function at._reveal(z,A,B,C,D)if not A
then return end if C then ar.tweenService:Create(A,D or au,B):Play()else for E,F in B do A[E]=F end end end function at.
_revealCommon(z,A,B)z:_reveal(A.stroke,{Transparency=z.theme.ElementStrokeTransparency},B)z:_reveal(A.title,{
TextTransparency=0},B)z:_reveal(A.main,{BackgroundTransparency=z.theme.ElementTransparency or 0},B)if A.iconLabel then z
:_reveal(A.iconLabel,{ImageTransparency=0},B)end if A.descriptor then z:_reveal(A.descriptor.titleLabel,{
TextTransparency=0.7},B)end end function at._hideCommon(z,A,B)z:_reveal(A.stroke,{Transparency=1},B)z:_reveal(A.title,{
TextTransparency=1},B)z:_reveal(A.main,{BackgroundTransparency=1},B)if A.iconLabel then z:_reveal(A.iconLabel,{
ImageTransparency=1},B)end if A.descriptor then z:_reveal(A.descriptor.titleLabel,{TextTransparency=1},B)end end
function at._collapsedRect(z)local A=if z.showIconOnly then aw else av if z._collapsedPosition then return z.
_collapsedPosition,A end local B=UDim2.new(b.X.Scale,b.X.Offset,b.Y.Scale,b.Y.Offset+A.Y.Offset*z.scale/2)return B,A end
function at._scaleSurface(z,A)local B=z:Create('UIScale',{Scale=z.scale,Parent=A})table.insert(z._scaledSurfaces,B)
return B end function at._rescaleSurfaces(z)for A=#z._scaledSurfaces,1,-1 do local B=z._scaledSurfaces[A]if B.Parent
then B.Scale=z.scale else table.remove(z._scaledSurfaces,A)end end end function at._hang(z,A:number):number return A*z.
scale/2+15 end function at._interactive(z)return not z.animating and not z.hidden end function at._settled(z)return not
z.hidden and not z._revealing end function at.Connect(z,A,B)local C=A:Connect(B)table.insert(z.connections,C)return C
end function at.ConnectFor(z,A,B,C)local D=z:Connect(B,C)A.connections=A.connections or{}table.insert(A.connections,D)
return D end function at.Disconnect(z,A)if not A then return end local B=table.find(z.connections,A)if B then table.
remove(z.connections,B)end A:Disconnect()end function at.DestroySubtree(z,A)if not A then return end local B={[A]=true}
for C,D in A:GetDescendants()do B[D]=true end for C=#z.instances,1,-1 do local D=z.instances[C]if B[D]then table.remove(
z.instances,C)z.themeProperties[D]=nil z.localeProperties[D]=nil end end A:Destroy()end function at.DisconnectMany(z,A,B
)if not B or#B==0 then return end local C={}for D,E in B do C[E]=true E:Disconnect()end local function D(E)if not E then
return end local F=0 for G=1,#E do local H=E[G]if not C[H]then F+=1 E[F]=H end end for G=#E,F+1,-1 do E[G]=nil end end
D(z.connections)if A and A~=z then D(A.connections)end end function at.DestroySubtrees(z,A)if not A or#A==0 then return
end local B={}for C,D in A do B[D]=true for E,F in D:GetDescendants()do B[F]=true end end local C=0 for D=1,#z.instances
do local E=z.instances[D]if B[E]then z.themeProperties[E]=nil z.localeProperties[E]=nil else C+=1 z.instances[C]=E end
end for D=#z.instances,C+1,-1 do z.instances[D]=nil end for D,E in A do E:Destroy()end end function at.Unload(z)z.
unloaded=true for A,B in z._nameplates or{}do B._alive=false end al.teardown()al.releaseContainer(z.screenGui)if z.
_liveTween then z._liveTween:Cancel()z._liveTween=nil end for A=#z.connections,1,-1 do z.connections[A]:Disconnect()end
for A=#z.instances,1,-1 do z.instances[A]:Destroy()end table.clear(z.connections)table.clear(z.instances)table.clear(z.
themeProperties)table.clear(z.localeProperties)table.clear(z.controls)table.clear(z.tabs)table.clear(z._scaledSurfaces)
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
'screen'|'world')?,screenSize:Vector2?,closeScale:number?,closeDistance:number?,farDistance:number?,size:Vector2?,lift:
number?,maxDistance:number?,cornerRadius:number?,accent:Color3?,accentDeep:Color3?,cardColor:Color3?,cardTransparency:
number?,veilColor:Color3?,veilStrength:number?,titleColor:Color3?,subtitleColor:Color3?,badgeTextColor:Color3?,logoTint:
Color3?,logoScale:number?,backdrop:any?,backdropTint:Color3?,backdropTransparency:number?,glowImage:(string|number|
boolean)?,titleFont:Font?,subtitleFont:Font?,titleTop:number?,titleSize:number?,subtitleSize:number?,entrance:('unfold'|
'fade'|'none')?,logoSway:number?,logoSpin:number?,halo:boolean?,sparkles:number?,sparkleColor:Color3?,titleShine:boolean
?,sweep:boolean?,sweepEvery:number?,border:boolean?,borderThickness:number?,borderTransparency:number?,borderSpeed:
number?,glow:boolean?,bob:boolean?,bobHeight:number?,bobSpeed:number?}export type NameplateProps={title:string?,subtitle
:(string|((player:Player)->string))?,badge:string?,preset:('Omnity'|'Midnight'|'Mono')?,style:NameplateStyle?,endpoint:
string?,key:string?,transport:ChatTransport?,showSelf:boolean?,hideDefaultName:boolean?,checkInInterval:number?,
autoCheckIn:boolean?,playerMedia:boolean?,settings:boolean?,accent:Color3?,backdrop:(string|number|boolean)?,maxDistance
:number?,lift:number?}export type Nameplate={SetEnabled:(self:Nameplate,enabled:boolean)->(),SetTitle:(self:Nameplate,
title:string)->(),SetStyle:(self:Nameplate,style:NameplateStyle|string,preset:string?)->(),SetMedia:(self:Nameplate,link
:string)->(boolean,string?),ClearMedia:(self:Nameplate)->boolean,Add:(self:Nameplate,player:Player,badge:string?)->(),
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
if aw~=nil then return aw end local b=at(av)if not b then return nil end local c=au.fontCache if c then local d=c[b]if d
then local e=as(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local f=d.variants and d.variants[e]if f then return f end
for g,h in pairs(d.variants or{})do return h end end end return nil end function an.new(au:string,av:boolean?,aw:boolean
?,b:ai.AssetDownloadUrl?,c:FontResolverOptions?):FontManager local d=c or{saveToDisk=true,skipCache=not aw or false,
fallbackFont=Font.fromEnum(Enum.Font.SourceSans)}local e=setmetatable({rootFolder=au,fontCache=if aw then{}::FontCache
else nil,assetResolver=ai.new(aw,b),defaultOptions=d,_debug=av or ag:IsStudio()or false,_pendingLoads={}}::
FontManagerState,an)::any pcall(ah.ensureFolder,au)return e end local function au(av:FontManager,aw:number,b:Enum.
FontWeight,c:Enum.FontStyle,d:string):Font?local e=av.rootFolder..'/'..aw..'.json'if typeof(ah.isfile)~='function'then
return av.defaultOptions.fallbackFont end local f,g:string?=false if ag:IsStudio()and av._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]g=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(e)then local h,i=pcall(ah.readfile,e)g=h and i or nil else g=av.assetResolver:getAssetContentFromId(aw,
false)f=g~=nil end local h:FontManifest?if g then local i,j=pcall(am,g)if i and j then h=ao(j)else if av._debug then aj.
warn('Failed to parse font manifest for font id: '..tostring(aw)..'. Error: '..tostring(j))end end else return av.
defaultOptions.fallbackFont end if not h then if av._debug then aj.warn('Font manifest is nil for font id: '..tostring(
aw))end pcall(ah.delfile,e)return av.defaultOptions.fallbackFont end if f and g then pcall(ah.writefile,e,g)end local i,
j=av.rootFolder..'/'..h.name,true if not pcall(ah.ensureFolder,i)then return av.defaultOptions.fallbackFont end for k,l
in ipairs(h.faces)do local m=i..'/'..l.name:gsub(' ','-')..'.ttf'if ah.isfile(m)then local n,o=pcall(ah.readfile,m)if
not n or type(o)~='string'or not aq(o)then pcall(ah.delfile,m)end end if not ah.isfile(m)then local n=av.assetResolver:
resolve(l.assetId)local o=if n~=nil then av.assetResolver:getAssetContentFromId(n,false)else nil if not o or not aq(o)
then j=false if av._debug then aj.warn('Font face content is missing or not a font for font id: '..tostring(aw)..
', face: '..l.name)end continue end pcall(ah.writefile,m,o)end local n,o=pcall(ar.getcustomasset,m)if n and type(o)==
'string'then h.faces[k].assetId=o if av._debug then aj.print('Loaded font face for id: '..tostring(aw)..', face: '..l.
name)end else j=false if av._debug then aj.warn('Failed to load font face for id: '..tostring(aw)..', face: '..l.name)
end end end if not j then return av.defaultOptions.fallbackFont end local k=al(h)if not k or not pcall(ah.writefile,i..
'/manifest.json',k)then return av.defaultOptions.fallbackFont end local l,m=pcall(ar.getcustomasset,i..'/manifest.json')
if not l or not m then if av._debug then aj.warn('Failed to load font manifest for id: '..tostring(aw))end return av.
defaultOptions.fallbackFont end local n,o=pcall(Font.new,m::any,b,c)if not n or not o then if av._debug then aj.warn(
'Failed to load font for id: '..tostring(aw))end return av.defaultOptions.fallbackFont end local p=av.fontCache if p
then p[aw]={customId=m,manifest=h,loadedFromDisk=true,variants={[d]=o}}if av._debug then aj.print('Cached font for id: '
..tostring(aw))end end return o end function an.loadFont(av:FontManager,aw:(number|string)?,b:Enum.FontWeight?,c:Enum.
FontStyle?,d:boolean?,e:boolean?):Font?if d==nil then d=av.defaultOptions.saveToDisk end if e==nil then e=av.
defaultOptions.skipCache end local f,g=b or Enum.FontWeight.Regular,c or Enum.FontStyle.Normal local h,i=as(f,g),av.
assetResolver:resolve(aw)local j=at(i)if not j then aj.warn('Invalid font id: '..tostring(aw))return av.defaultOptions.
fallbackFont end local k=av.fontCache if k and not e then local l=k[j]if l then local m=l.variants and l.variants[h]if m
then if av._debug then aj.print('Loaded font from cache for id: '..tostring(j))end return m end local n,o=pcall(Font.new
,l.customId::any,f,g)if n and o then l.variants=l.variants or{}l.variants[h]=o if av._debug then aj.print(
'Loaded font variant from cache for id: '..tostring(j))end return o else if av._debug then aj.warn(
'Failed to load font from cache for id: '..tostring(j))end k[j]=nil return av.defaultOptions.fallbackFont end end end if
not d then if av._debug then aj.warn[[Font loading without saving to disk can be detected by Anti-cheats.]]end return av
.defaultOptions.fallbackFont end local l,m=av._pendingLoads,tostring(j)..'|'..h local n=l[m]if n then table.insert(n,
coroutine.running())return coroutine.yield()end l[m]={}local o,p=pcall(au,av,j,f,g,h)local q=if o then p else av.
defaultOptions.fallbackFont n=l[m]l[m]=nil if n then for r,s in n do coroutine.resume(s,q)end end return q end function
an.resolve(av:FontManager,aw:number|string):Font?local b=at(aw)if not b then return nil end local c=av.fontCache if c
then local d=c[b]if d then if av._debug then aj.print('Resolved font for id: '..tostring(b))end for e,f in pairs(d.
variants or{})do return f end end end return nil end function an.getFontFromId(av:FontManager,aw:number|string):Font?
return av:resolve(aw)end return an end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local ae,af
,ag,ah={},ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.flagNames)ae.textWidth=af.textWidth ae.textHeight=
af.textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae.contrastColor=ag.contrastColor ae.toColorSequence=ag.
toColorSequence ae.contrastText=ag.contrastText return ae end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(
function(...)local ae,af,ag,ah,ai,aj,ak,al,am={},1024,48,bit32.band,bit32.bor,bit32.bxor,bit32.lshift,bit32.rshift,bit32
.bnot local function an(ao)if ao%2==0 and task and task.wait then task.wait()end end local function ao(ap,aq)local ar={}
while true do local as=buffer.readu8(ap,aq)aq+=1 if as==0 then break end table.insert(ar,buffer.readstring(ap,aq,as))aq
+=as end return table.concat(ar),aq end local function ap(aq,ar,as)local at=table.create(as)for au=0,as-1 do local av=ar
+au*3 at[au]={buffer.readu8(aq,av),buffer.readu8(aq,av+1),buffer.readu8(aq,av+2)}end return at,ar+as*3 end
local function aq(ar:string,as:number,at:number)local au,av=buffer.create(at),ak(1,as)local aw,b,c,d=av+1,table.create(
4096,0),table.create(4096,0),table.create(4097,0)for e=0,av-1 do c[e]=e end local e=as+1 local f,g,h,i,j,k,l,m,n=ak(1,e)
-1,av+2,-1,0,0,0,0,#ar,1 while j<at do while k<e do if n>m then return au end l=ai(l,ak(string.byte(ar,n),k))n+=1 k+=8
end local o=ah(l,f)l=al(l,e)k-=e if o==av then e=as+1 f=ak(1,e)-1 g=av+2 h=-1 elseif o==aw then break else local p,q=o,0
if h==-1 then buffer.writeu8(au,j,c[o])j+=1 h=o i=c[o]continue end if o>=g then q+=1 d[q]=i o=h end while o>=av do q+=1
d[q]=c[o]o=b[o]end i=c[o]q+=1 d[q]=i while q>0 and j<at do buffer.writeu8(au,j,d[q])j+=1 q-=1 end if g<4096 then b[g]=h
c[g]=i g+=1 if g>f and e<12 then e+=1 f=ak(1,e)-1 end end h=p end end return au end function ae.decode(ar:string)local
as=buffer.fromstring(ar)local at=buffer.readstring(as,0,6)if at~='GIF87a'and at~='GIF89a'then error'not a GIF'end local
au,av,aw,b,c=buffer.readu16(as,6),buffer.readu16(as,8),buffer.readu8(as,10),13 if ah(aw,0x80)~=0 then c,b=ap(as,b,ak(1,
ah(aw,7)+1))end local d,e,f,g,h,i,j=buffer.create(au*av*4),{},0.1,0,(buffer.len(as))while b<h and#e<400 do local k=
buffer.readu8(as,b)b+=1 if k==0x3b then break elseif k==0x21 then local l=buffer.readu8(as,b)b+=1 if l==0xf9 then local
m=buffer.readu8(as,b+1)g=ah(al(m,2),7)local n=buffer.readu16(as,b+2)f=if n>1 then n/100 else 0.1 i=if ah(m,1)~=0 then
buffer.readu8(as,b+4)else nil end local m,n=ao(as,b+(if l==0xf9 then 0 else 0))b=n elseif k==0x2c then local l,m,n,o,p=
buffer.readu16(as,b),buffer.readu16(as,b+2),buffer.readu16(as,b+4),buffer.readu16(as,b+6),buffer.readu8(as,b+8)b+=9
local q=c if ah(p,0x80)~=0 then q,b=ap(as,b,ak(1,ah(p,7)+1))end local r,s=(buffer.readu8(as,b))s,b=ao(as,b+1)local t=aq(
s,r,n*o)if g==3 then j=buffer.create(buffer.len(d))buffer.copy(j,0,d)end local u=table.create(o)if ah(p,0x40)~=0 then
local v=0 for w,x in{{0,8},{4,8},{2,4},{1,2}}do for y=x[1],o-1,x[2]do u[v]=y v+=1 end end else for v=0,o-1 do u[v]=v end
end for v=0,o-1 do local w=m+u[v]if w<av then for x=0,n-1 do local y=l+x if y<au then local z=buffer.readu8(t,v*n+x)if z
~=i and q and q[z]then local A,B=q[z],(w*au+y)*4 buffer.writeu8(d,B,A[1])buffer.writeu8(d,B+1,A[2])buffer.writeu8(d,B+2,
A[3])buffer.writeu8(d,B+3,255)end end end end end local v=buffer.create(buffer.len(d))buffer.copy(v,0,d)table.insert(e,{
pixels=v,delay=f})if g==2 then for w=m,math.min(m+o,av)-1 do buffer.fill(d,(w*au+l)*4,0,math.min(n,au-l)*4)end elseif g
==3 and j then buffer.copy(d,0,j)end f,g,i=0.1,0,nil an(#e)else break end end if#e==0 then error'the GIF has no frames'
end return{width=au,height=av,frames=e}end local function ar(as,at,au,av,aw,b,c,d,e)local f=math.max(d/at,e/au)local g,h
=(at*f-d)/2,(au*f-e)/2 for i=0,e-1 do local j=math.clamp((i+h+0.5)/f-0.5,0,au-1)local k=math.floor(j)local l,m=math.min(
k+1,au-1),j-k for n=0,d-1 do local o=math.clamp((n+g+0.5)/f-0.5,0,at-1)local p=math.floor(o)local q,r,s=math.min(p+1,at-
1),o-p,(k*at+p)*4 local t,u,v,w=(k*at+q)*4,(l*at+p)*4,(l*at+q)*4,((c+i)*aw+b+n)*4 for x=0,3 do local y,z=buffer.readu8(
as,s+x)*(1-r)+buffer.readu8(as,t+x)*r,buffer.readu8(as,u+x)*(1-r)+buffer.readu8(as,v+x)*r buffer.writeu8(av,w+x,math.
floor(y*(1-m)+z*m+0.5))end end end end function ae.pack(as,at:number,au:number)local av=math.max(math.floor(af/at),1)
local aw,b=math.min(av*math.max(math.floor(af/au),1),ag),#as.frames local c=math.min(b,aw)av=math.min(av,c)local d=math.
ceil(c/av)local e,f=av*at,d*au local g,h=buffer.create(e*f*4),0 for i,j in as.frames do h+=j.delay end for i=0,c-1 do
local j=as.frames[math.floor(i*b/c)+1]ar(j.pixels,as.width,as.height,g,e,(i%av)*at,(i//av)*au,at,au)an(i)end return{png=
ae.encodePng(e,f,g),frames=c,columns=av,frameWidth=at,frameHeight=au,fps=if c>1 and h>0 then math.clamp(c/h,1,30)else 0}
end local as local function at(au,av,aw)if not as then as=table.create(256)for b=0,255 do local c=b for d=1,8 do c=if
ah(c,1)~=0 then aj(0xedb88320,al(c,1))else al(c,1)end as[b]=c end end local b=0xffffffff for c=av,av+aw-1 do b=aj(as[ah(
aj(b,buffer.readu8(au,c)),0xff)],al(b,8))end return am(b)end local function au(av,aw,b)buffer.writeu8(av,aw,ah(al(b,24),
0xff))buffer.writeu8(av,aw+1,ah(al(b,16),0xff))buffer.writeu8(av,aw+2,ah(al(b,8),0xff))buffer.writeu8(av,aw+3,ah(b,0xff)
)end function ae.encodePng(av:number,aw:number,b):string local c=av*4+1 local d=c*aw local e=math.max(math.ceil(d/65535)
,1)local f=2+d+e*5+4 local g=33+(12+f)+12 local h,i=buffer.create(g),0 buffer.writestring(h,0,'\137PNG\r\n\26\n')i=8 au(
h,i,13)buffer.writestring(h,i+4,'IHDR')au(h,i+8,av)au(h,i+12,aw)buffer.writeu8(h,i+16,8)buffer.writeu8(h,i+17,6)au(h,i+
21,at(h,i+4,17))i+=25 au(h,i,f)buffer.writestring(h,i+4,'IDAT')local j=i+4 i+=8 buffer.writeu8(h,i,0x78)buffer.writeu8(h
,i+1,0x1)i+=2 local k,l=buffer.create(d),av*4 for m=0,aw-1 do buffer.copy(k,m*c+1,b,m*l,l)end local m,n=1,0 for o=0,d-1
do m+=buffer.readu8(k,o)if m>=65521 then m-=65521 end n+=m if n>=65521 then n-=65521 end if o%262144==0 then an(o//
262144)end end local o,p=d,0 for q=1,e do local r=math.min(o,65535)buffer.writeu8(h,i,if q==e then 1 else 0)buffer.
writeu16(h,i+1,r)buffer.writeu16(h,i+3,aj(r,0xffff))buffer.copy(h,i+5,k,p,r)i+=5+r p+=r o-=r end au(h,i,ai(ak(n,16),m))i
+=4 au(h,i,at(h,j,i-j))i+=4 au(h,i,0)buffer.writestring(h,i+4,'IEND')au(h,i+8,at(h,i+4,4))return buffer.tostring(h)end
return ae end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(...)local ae,af=ac(ab.Parent.imageCache)
,ac(ab.Parent.variables)type AvatarCallback=ae.AvatarCallback type PreloadCallback=ae.PreloadCallback local ag={}ag.
rewrites=ae.rewrites ag.onBlock=nil::((unknown)->())?type PendingProperties={[string]:boolean}ag.pending={}::{[number]:{
[Instance]:PendingProperties}}local ah,ai:{[string]:boolean}=false,{Image=true,HoverImage=true,PressedImage=true}
local function aj(ak:unknown):number?if type(ak)=='number'then return ak elseif type(ak)=='string'then return tonumber(
string.match(ak,'^rbxassetid://(%d+)$'))end return nil end local function ak(al:unknown):string if ag.onBlock then ag.
onBlock(al)end return''end function ag.preload(al:PreloadCallback?):(boolean,number)ah=false return ae.preload(function(
am)ah=true table.clear(ag.pending)if al then al(am)end end)end function ag.avatar(al:number,am:AvatarCallback?):string
if not af.secureMode then return`rbxthumb://type=AvatarHeadShot&id={al}&w=48&h=48`end return ae.avatar(al,am)end
function ag.assign(al:Instance,am:string,an:unknown)local ao=al::any if not ai[am]then ao[am]=an return end ao[am]=ag.
resolve(an)if af.secureMode and not ah then local ap=aj(an)if ap and not ag.rewrites[ap]then local aq=ag.pending[ap]if
not aq then aq=setmetatable({},{__mode='k'})::any ag.pending[ap]=aq end local ar=aq[al]if not ar then ar={}aq[al]=ar end
ar[am]=true end end end ae.onCached=function(al:number)local am=ag.pending[al]if not am then return end local an=ag.
rewrites[al]if an then for ao,ap in am do if ao.Parent then local aq=ao::any for ar in ap do aq[ar]=an end end end end
ag.pending[al]=nil end function ag.resolve(al:unknown):string if al==nil or al==0 or al==''then return''end if type(al)
=='string'then if string.sub(al,1,11)=='rbxasset://'then return al end if string.sub(al,1,11)=='rbxthumb://'then return
if af.secureMode then ak(al)else al end end local am:number?if type(al)=='number'then am=al elseif type(al)=='string'
then am=tonumber(string.match(al,'^rbxassetid://(%d+)$'))end local an=if am then ag.rewrites[am]else nil if an then
return an end if af.secureMode then return ak(al)end if type(al)=='number'then return'rbxassetid://'..al end if type(al)
=='string'then return al end return ak(al)end return ag end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(
function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.
constants)export type RewriteMap={[number]:string}export type CacheSettledCallback=(failed:number)->()export type
PreloadCallback=CacheSettledCallback export type AvatarCallback=(uri:string)->()export type OnCachedCallback=(id:number
)->()export type ThumbnailEntry={state:string?,imageUrl:string?}export type ThumbnailResponse={data:{ThumbnailEntry}?}
local ai,aj,ak,al,am,an,ao,ap:{[number]:string}={},ag.fileSystemManager:getRootFolder(),ag.fileSystemManager:
getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/aesthetic143147-arch/Rayfield-preview-Gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for aq,ar
in ah.icons do local as=ar::number ap[as]=am..tostring(as)..'.png'end local aq=0 for ar in ap do aq+=1 end ai.rewrites={
}::RewriteMap ai.onCached=nil::OnCachedCallback?local ar='\137PNG\r\n\26\n'local function as(at:string,au:string):string
?if type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(at)
then pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local av=al:getAssetContentFromUrl(au,at,false)if not av or
string.sub(av,1,8)~=ar then return nil end if not pcall(ae.writefile,at,av)then return nil end end local av,aw=pcall(
getfenv().getcustomasset,at)return if av and type(aw)=='string'then aw else nil end local function at(au:number):string
return af.join(ak,'avatar_'..tostring(au)..'.png')end local function au(av:string):string?local aw,b=pcall(function()
return ag.httpService:JSONDecode(av)end)if not aw or type(b)~='table'then return nil end local c=(b::ThumbnailResponse).
data if type(c)~='table'then return nil end local d=c[1]if type(d)~='table'then return nil end local e=d::ThumbnailEntry
if e.state=='Completed'and type(e.imageUrl)=='string'then return e.imageUrl end return nil end local function av(aw:
number):string?local b:string?for c=1,4 do local d=al:getAssetContentFromUrl(string.format(ao,aw,an,an),'avatar:'..
tostring(aw),c>1)if d then local e=au(d)if e then b=e break end end if c<4 then task.wait(0.3)end end if not b then
return nil end return as(at(aw),b)end local aw:{[number]:{AvatarCallback}},b:{[number]:boolean}={},{}function ai.preload
(c:PreloadCallback?):(boolean,number)local d=getfenv()if type(d.getcustomasset)~='function'or typeof(ae.isfile)~=
'function'then if c then task.defer(c,aq)end return false,aq end local e=ai.rewrites table.clear(e)local function f()if
not c then return end local g=0 for h in ap do if not e[h]then g+=1 end end c(g)end local g,h,i=0,0,true for j,k in ap
do local l,m:string?=(af.join(ak,tostring(j)..'.png'))if ae.isfile(l)then local n,o=pcall(d.getcustomasset,l)m=if n and
type(o)=='string'then o else nil end if m then e[j]=m else h+=1 g+=1 task.spawn(function()local n=as(l,k)if n then e[j]=
n if ai.onCached then pcall(ai.onCached,j)end end g-=1 if g==0 and not i then f()end end)end end i=false if g==0 then f(
)end return h==0,h end function ai.avatar(c:unknown,d:AvatarCallback?):string if type(c)~='number'then return''end if
typeof(ae.isfile)~='function'then return''end local e=at(c)if ae.isfile(e)then local f,g=pcall(getfenv().getcustomasset,
e)if f and type(g)=='string'then return g end end if b[c]then return''end local f=aw[c]if f then if d then table.insert(
f,d)end return''end if d then aw[c]={d}task.spawn(function()local g,h=av(c),aw[c]aw[c]=nil if not g then b[c]=true
return end if h then for i,j in h do pcall(j,g)end end end)end return''end function ai.remote(c:string):string?if not
string.match(c,'^[%w%-_]+%.png$')then return nil end local d,e=pcall(as,af.join(ak,c),am..c)return if d then e else nil
end function ai.url(c:string,d:string):string?if not string.match(d,'^[%w%-_]+%.png$')then return nil end local e,f=
pcall(as,af.join(ak,d),c)return if e then f else nil end return ai end)()end,[58]=function()local aa,ab,ac=a(58)local ad
return(function(...)local ae,af={},64 local ag,ah,ai=af+7,38,3 export type Mode='top'|'sidebar'export type Layout={mode:
Mode,topbarHeight:number,chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize:UDim2,fadeTransparency:
NumberSequence,fadeCorners:{string}?,tabStripTop:number?,tabStripHeight:number?,railWidth:number?,railCollapsedWidth:
number?,railCollapseBelow:number?,rowHeight:number?,rowCornerRadius:number?,rowSpacing:number?,railPadding:number?,
rowInset:number?,rowPadding:number?,rowContentSpacing:number?,rowIconSize:number?,footerHeight:number?,avatarSize:number
?,cardTransparency:number?,cardStrokeRotation:number?,cardStrokeTransparency:NumberSequence?,cardCorners:{string}?}ae.
top={mode='top'::Mode,topbarHeight=af,chromeHeight=ag+ah+ai,tabStripTop=ag,tabStripHeight=ah,pageDirection=Enum.
FillDirection.Horizontal,fadeSize=UDim2.new(1,0,-9.3E-2,100),fadeTransparency=NumberSequence.new{NumberSequenceKeypoint.
new(0,0),NumberSequenceKeypoint.new(0.4414,0),NumberSequenceKeypoint.new(0.7007,0.631),NumberSequenceKeypoint.new(1,1)}}
::Layout ae.sidebar={mode='sidebar'::Mode,topbarHeight=af,chromeHeight=af,railWidth=219,railCollapsedWidth=64,
railCollapseBelow=589,rowHeight=38,rowCornerRadius=14,rowSpacing=4,railPadding=17,rowInset=15,rowPadding=10,
rowContentSpacing=6,rowIconSize=20,footerHeight=60,avatarSize=34,pageDirection=Enum.FillDirection.Vertical,
cardTransparency=0.98,cardStrokeRotation=55,cardCorners={'TopLeftRadius','BottomRightRadius'},cardStrokeTransparency=
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
aw,b=pcall(function()if aq.isfile(av)then return ae.httpService:JSONDecode(aq.read(av))end return nil end)if aw and
type(b)=='table'and b.file and aq.isfile(b.file)then local c=aq.asset(b.file)if c then return aj.visual(c,b)end end
local c if ao:match'^https?://'then local d,e=aj.direct(ao,aq.get)if not d then return nil,e end local f,g=aq.get(d)if
not f then return nil,g end c=g else local d=if ao:find('/',1,true)then ao else ah.join(aj.folder(),ao)local e,f=pcall(
function()return if aq.isfile(d)then aq.read(d)else nil end)if not e or not f then return nil,`No file called {ao} in workspace/{
aj.folder()}.`end c=f end if#c>ak then return nil,'That file is too big (8 MB at most).'end local d,e=(an(c))if d=='gif'
then local f,g=pcall(function()return ai.pack(ai.decode(c),ar.X,ar.Y)end)if not f then return nil,
"That GIF couldn't be read."end e={file=au,frames=g.frames,columns=g.columns,frameWidth=g.frameWidth,frameHeight=g.
frameHeight,fps=g.fps}aq.write(au,g.png)elseif d=='png'or d=='jpg'then e={file=ah.join(at,'media_'..as..'.'..d),frames=1
}aq.write(e.file,c)elseif d=='webp'then return nil,"WebP isn't supported. Use a GIF, PNG or JPG link."else return nil,
"That link isn't an image or a GIF."end pcall(aq.write,av,ae.httpService:JSONEncode(e))local f=aq.asset(e.file)if not f
then return nil,"This executor can't load custom images."end return aj.visual(f,e)end function aj.visual(ao:string,ap)if
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
34,1,{'themes'},{{38,2,{'ember'}},{37,2,{'default'}},{40,2,{'rose'}},{39,2,{'frost'}},{36,2,{'cobalt'}},{35,2,{
'amethyst'}}}},{2,1,{'components'},{{7,2,{'colorpicker'}},{33,2,{'window'}},{22,2,{'section'}},{17,2,{'nameplate'}},{32,
2,{'toggle'}},{6,2,{'chrome'}},{23,2,{'sidebar'}},{21,2,{'search'}},{10,2,{'descriptor'}},{30,2,{'text'}},{29,2,{'tag'}}
,{28,2,{'tabSelector'}},{27,2,{'tabSection'}},{13,2,{'dropdown'}},{14,2,{'group'}},{25,2,{'stat'}},{18,2,{'notification'
}},{5,2,{'chat'}},{15,2,{'input'}},{20,2,{'progress'}},{9,2,{'console'}},{24,2,{'slider'}},{19,2,{'popup'}},{31,2,{
'toast'}},{4,2,{'button'}},{8,2,{'column'}},{11,2,{'divider'}},{3,2,{'action'}},{16,2,{'keybind'}},{26,2,{'tab'}},{12,2,
{'drag'}}}},{41,2,{'types'}},{42,1,{'utility'},{{77,2,{'variables'}},{45,2,{'assetResolver'}},{46,2,{'colors'}},{73,2,{
'relayClient'}},{75,2,{'services'}},{62,2,{'mediaLoader'}},{67,2,{'path'}},{50,2,{'filesystem'}},{65,2,{'odometer'}},{68
,2,{'persistence'}},{70,2,{'persistencePaths'}},{69,2,{'persistenceConfig'}},{56,2,{'image'}},{60,2,{'lockable'}},{61,2,
{'log'}},{43,2,{'HapticEngine'}},{76,2,{'textMetrics'}},{44,2,{'animatedImage'}},{74,2,{'runtime'}},{64,2,{'network'}},{
54,2,{'functions'}},{51,2,{'filesystemManager'}},{71,2,{'persistenceSettings'}},{63,2,{'moveable'}},{58,2,{'layouts'}},{
48,2,{'constants'}},{49,2,{'enums'}},{55,2,{'gifSheet'}},{57,2,{'imageCache'}},{78,2,{'windowSizing'}},{53,2,{
'fontManager'}},{72,2,{'persistenceWrite'}},{66,2,{'ordering'}},{59,2,{'locale'}},{47,2,{'columns'}},{52,2,{'flagNames'}
}}}}}},'0.4.1','Rayfield',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,xpcall,
tostring,tonumber,_VERSION local av,aw,b,c,d,e,f=aj.insert,aj.remove,aj.freeze or function(av)return av end,al.wrap,ae.
sub,ae.match,ae.gmatch if at and d(at,1,4)=='Lune'then local g,h=ap(ao,'@lune/task')if g and h then af=h end end local g
=af and af.defer local h,i,j,k,l,m,n,o,p=g or function(h,...)c(h)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',
[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local q,r={GetFullName={{},function(q)local r,s=q.Name,q.Parent
while s do r=s.Name..'.'..r s=s.Parent end return r end},GetChildren={{},function(q)local r={}for s in ai,p[q]do av(r,s)
end return r end},GetDescendants={{},function(q)local r={}for s in ai,p[q]do av(r,s)for t,u in ai,s:GetDescendants()do
av(r,u)end end return r end},FindFirstChild={{'string','boolean?'},function(q,r,s)local t=p[q]for u in ai,t do if u.Name
==r then return u end end if s then for u in ai,t do return u:FindFirstChild(r,true)end end end},FindFirstAncestor={{
'string'},function(q,r)local s=q.Parent while s do if s.Name==r then return s end s=s.Parent end end},WaitForChild={{
'string','number?'},function(q,r)return q:FindFirstChild(r)end}},{}for s,t in ai,q do local u,v,w=t[1],t[2],{}for x,y in
ai,u do local z,A=e(y,'^([^%?]+)(%??)')w[x]={z,A}end r[s]=function(x,...)if not p[x]then ah(
"Expected ':' not '.' calling member function "..s,2)end local y={...}for z,A in ai,w do local B=y[z]local C,D,E=an(B),A
[1],A[2]if B==nil and not E then ah('Argument '..B..' missing or nil',3)end if D~='any'and C~=D and not(C=='nil'and E)
then ah('Argument '..z..' expects type "'..D..'", got "'..C..'"',2)end end return v(x,...)end end local function s(t,u,v
)local w,x=(ag({},{__mode='k'}))local function y(z)ah(z..' is not a valid (virtual) member of '..t..' "'..u..'"',3)end
local function z(A)ah('Unable to assign (virtual) property '..A..'. Property is read only',3)end local A,B={},{}B.
__metatable=false B.__index=function(C,D)if D=='ClassName'then return t elseif D=='Name'then return u elseif D=='Parent'
then return v elseif t=='StringValue'and D=='Value'then return x else local E=r[D]if E then return E end end for E in ai
,w do if E.Name==D then return E end end y(D)end B.__newindex=function(C,D,E)if D=='ClassName'then z(D)elseif D=='Name'
then u=E elseif D=='Parent'then if E==A then return end if v~=nil then p[v][A]=nil end v=E if E~=nil then p[E][A]=true
end elseif t=='StringValue'and D=='Value'then x=E else y(D)end end B.__tostring=function()return u end ag(A,B)p[A]=w if
v~=nil then p[v][A]=true end return A end local function t(u,v)local w,x,y,z=u[1],u[2],u[3],u[4]local A=i[x]local B=y
and aw(y,1)or A local C=s(A,B,v)j[w]=C if y then for D,E in ai,y do C[D]=E end end if z then for D,E in ai,z do t(E,C)
end end return C end local u=s('Folder','['..ad..']')for v,w in ai,ab do t(w,u)end for v,w in ai,aa do local x=j[v]k[x]=
w l[x]=v local y=x.ClassName if y=='LocalScript'or y=='Script'then av(n,x)end end local function v(w)local x,y=w.
ClassName,m[w]if y and x=='ModuleScript'then return ak(y)end local z=k[w]local function A(B)local C,D,E=nil,ap(function(
)return debug.traceback(nil,2)end)if D then C=E end return{Message=B,Traceback=C}end local function B(C)local D,E=ar(C.
Message),w:GetFullName()local F,G=e(D,'[^:]+:(%d+): (.+)')local H if not F or not au then H=E..':*: '..(G or D)else F=
as(F)local I=l[w]local J=au[I]local K=F-J+1 if K<0 then K='?'end H=E..':'..K..': '..G end local I=C.Traceback if I and I
~=''then H=H..'\n'..I end return H end if x=='LocalScript'or x=='Script'then local C,D=aq(z,A)if not C then ah(B(D),0)
end else local C={aq(z,A)}local D=aw(C,1)if not D then local E=aw(C,1)ah(B(E),0)end m[w]=C return ak(C)end end function
a(w)local x=j[w]local function y(z,...)local A={ap(z,...)}local B=aw(A,1)if not B then ah(A[1],3)end return ak(A)end
local z=b(ag({},{__index=o,__newindex=function(z,A,B)o[A]=B end,__len=function()return#o end,__iter=function()return ai,
o end}))local A,B=b{version=ac,envname=ad,shared=z,script=am,require=ao},x local function C(D,...)local E,F,G=an(D),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if E=='table'and p[D]then if D.
ClassName~='ModuleScript'then ah(F,2)elseif D==x then ah(G,2)end return v(D)elseif E=='string'and d(D,1,1)~='@'then if#D
==0 then ah('Attempted to call require with empty string',2)end local H=x if d(D,1,1)=='/'then H=u elseif d(D,1,2)=='./'
then D=d(D,3)end local I for J in f(D,'([^/]*)/?')do local K=J if J=='..'then K='Parent'end if K~=''then local L=H:
FindFirstChild(K)if not L then local M=H.Parent if M then L=M:FindFirstChild(K)end end if L then H=L elseif J~=I and J~=
'init'and J~='init.server'and J~='init.client'then ah('Virtual script path "'..D..'" not found',2)end end I=J end if H.
ClassName~='ModuleScript'then ah(F,2)elseif H==x then ah(G,2)end return v(H)end return y(ao,D,...)end return A,B,C end
for w,x in ai,n do h(v,x)end return v(u:GetChildren()[1])