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
.utility local ag,ah,ai,b,c,d,e,f=ac(af.variables),ac(af.services),ac(af.relayClient),ac(af.imageCache),ac(af.
animatedImage),ac(af.filesystem),ac(af.path),Color3.new(1,1,1)local g={Omnity={size=Vector2.new(4.4,1.05),lift=2.4,
maxDistance=100,cornerRadius=0.26,accent=Color3.fromRGB(125,180,255),accentDeep=Color3.fromRGB(59,130,246),cardColor=
Color3.fromRGB(5,7,14),cardTransparency=0.14,veilColor=Color3.fromRGB(3,4,9),veilStrength=0.8,titleColor=Color3.fromRGB(
250,251,255),subtitleColor=Color3.fromRGB(150,162,186),badgeTextColor=Color3.fromRGB(235,244,255),logo='omnity-logo.png'
,logoTint=f,logoScale=0.66,backdrop='nameplate-galaxy.png',backdropTint=f,backdropTransparency=0.25,glowImage=
'nameplate-glow.png',titleFont=nil,subtitleFont=nil,titleTop=0.2,titleSize=0.3,subtitleSize=0.2,entrance='unfold',
logoSway=6,logoSpin=0,halo=true,sparkles=4,sparkleColor=Color3.fromRGB(220,235,255),titleShine=true,sweep=true,
sweepEvery=7,border=true,borderThickness=1,borderTransparency=0.45,borderSpeed=40,glow=false,bob=true,bobHeight=0.06,
bobSpeed=1.6}}g.Midnight=table.clone(g.Omnity)g.Midnight.backdrop='nameplate-mountains.png'g.Midnight.accent=Color3.
fromRGB(96,165,250)g.Midnight.accentDeep=Color3.fromRGB(37,99,235)g.Midnight.sparkles=3 g.Mono=table.clone(g.Omnity)g.
Mono.backdrop=false g.Mono.accent=Color3.fromRGB(220,224,232)g.Mono.accentDeep=Color3.fromRGB(120,126,140)g.Mono.
sparkleColor=f g.Mono.sparkles=0 g.Mono.cardColor=Color3.fromRGB(10,10,12)ae.presets=g local h,i,j,k=0.35,1.1,3,20
local function l(m)return math.clamp(m,0,1)end local function m(n,o,p)return l((n-o)/p)end local function n(o)return 1-(
1-o)^3 end local function o(p)return 1-(1-p)^5 end local function p(q)local r,s=1.6,2.6 return 1+s*(q-1)^3+r*(q-1)^2 end
local function q(r)return-(math.cos(math.pi*r)-1)/2 end local function r(s:string):string return(s:gsub('&','&amp;'):
gsub('<','&lt;'):gsub('>','&gt;'))end local function s(t,u)local v=g[t]or g.Omnity local w=table.clone(v)if type(u)==
'table'then for x,y in u do w[x]=y end end return w end local t={logo='square',backdrop='banner',glowImage='square'}
function ae.new(u,v)v=if typeof(v)=='table'then v else{}local w=table.clone(v.style or v.Style or{})for x,y in{'accent',
'logo','backdrop','maxDistance','lift'}do local z=v[y]if z==nil then z=v[y:sub(1,1):upper()..y:sub(2)]end if z~=nil and
w[y]==nil then w[y]=z end end local x=setmetatable({window=u,title=v.title or v.Title or string.upper(tostring(u.name or
'Rayfield')),subtitle=v.subtitle or v.Subtitle,badge=v.badge or v.Badge,preset=v.preset or v.Preset or'Omnity',overrides
=w,endpoint=ai.base(v.endpoint or v.Endpoint),key=v.key or v.Key,transport=v.transport or v.Transport,showSelf=v.
showSelf~=false and v.ShowSelf~=false,hideDefaultName=v.hideDefaultName~=false and v.HideDefaultName~=false,
checkInInterval=math.max(tonumber(v.checkInInterval)or k,5),autoCheckIn=v.autoCheckIn~=false,playerMedia=v.playerMedia~=
false,enabled=true,plates={},users={},images={},_sheets={},_dying={},_alive=true},ae)x.style=s(x.preset,w)x.players=ah.
getService'Players'x.folder=u:Create('Folder',{Name=ag.httpService:GenerateGUID(false),Parent=ag.guiContainer})x:
_loadImages()local y=ag.localPlayer if y and x.showSelf then x.users[y.UserId]={badge=x.badge}end if x.players and x.
players.PlayerAdded then u:Connect(x.players.PlayerAdded,function(z)x:_reconcile(z)end)u:Connect(x.players.
PlayerRemoving,function(z)x:_drop(z)end)end x.stepConnection=u:Connect(ag.runService.RenderStepped,function()x:_step(os.
clock())end)x:_reconcileAll()if(x.endpoint or x.transport)and x.autoCheckIn then x:_startCheckIns()end return x end
function ae._download(u,v,w,x)if v=='remote'then return b.remote(w)end return b.url(w,x)end function ae._sheetVisual(u,v
)if type(v)~='table'or type(v.id)~='string'or not v.id:match'^%x+$'then return nil end local w=u._sheets[v.id]if w then
return w end if not u.endpoint then return nil end local x=u:_download('url',`{u.endpoint}/v1/media/{v.id}.png`,`media_{
v.id}.png`)if not x then return nil end local y={uri=x,sheet={frames=math.max(tonumber(v.frames)or 1,1),columns=math.
max(tonumber(v.columns)or 1,1),frameWidth=tonumber(v.frameWidth)or 0,frameHeight=tonumber(v.frameHeight)or 0,fps=
tonumber(v.fps)or 0}}u._sheets[v.id]=y return y end function ae._resolveVisual(u,v,w)if v==nil or v==false then return
nil elseif type(v)=='number'or(type(v)=='string'and v:match'^%d+$')then return{uri='rbxassetid://'..tostring(v)}elseif
type(v)=='string'then if v:match'^[%w%-_]+%.png$'then local x=u:_download('remote',v)return if x then{uri=x}else nil
elseif v:match'^https?://'then return u:_relayVisual(v,w)end return{uri=v}elseif type(v)=='table'then if v.gif or v.url
then return u:_relayVisual(tostring(v.gif or v.url),w)elseif v.sheet then local x=u:_resolveVisual(v.sheet,w)if not x or
not x.uri then return nil end local y,z=v.frameSize or Vector2.new(v.frameWidth or 0,v.frameHeight or 0),math.max(
tonumber(v.frames)or 1,1)return{uri=x.uri,sheet={frames=z,columns=math.max(tonumber(v.columns)or z,1),frameWidth=y.X,
frameHeight=y.Y,fps=tonumber(v.fps)or 10}}elseif type(v.images)=='table'then local x={}for y,z in v.images do local A=u:
_resolveVisual(z,w)if A and A.uri then table.insert(x,A.uri)end end return if#x>0 then{list=x,fps=tonumber(v.fps)or 8}
else nil end end return nil end function ae._relayVisual(u,v,w)if not u.endpoint and not u.transport then return nil end
local x,y=ai.request(u,'POST','/v1/media',{url=v,fit=w})if not x then return nil end return u:_sheetVisual(y)end
function ae._loadImages(u)table.clear(u.images)local v={}u._imageGeneration=v for w,x in{'logo','backdrop','glowImage'}
do task.spawn(function()local y=u:_resolveVisual(u.style[x],t[x])if y and u._alive and u._imageGeneration==v then u.
images[x]=y for z,A in u.plates do u:_applyImages(A)end end end)end end function ae._applyImages(u,v)local w=v.parts if
not w then return end local x=u.images local y,z,A=x.logo,x.backdrop,u.playerMedia and v.media if A and A.visual then if
A.slot=='logo'then y=A.visual else z=A.visual end end c.apply(w.logo,y)w.logo.Visible=y~=nil w.monogram.Visible=y==nil w
.logoCorner.CornerRadius=UDim.new(if A and A.slot=='logo'then 0.22 else 0,0)c.apply(w.backdrop,z)w.backdrop.Visible=z~=
nil local B=x.glowImage w.halo.Image=if B then B.uri or''else''w.halo.Visible=u.style.halo and B~=nil v.visuals={{label=
w.logo,visual=y,state={}},{label=w.backdrop,visual=z,state={}}}end function ae._syncMedia(u,v)local w=u.users[v.player.
UserId]local x=w and w.media local y=if type(x)=='table'then x.id else nil if y==v.mediaId then return end v.mediaId=y
if not y or not u.playerMedia then v.media=nil u:_applyImages(v)return end task.spawn(function()local z=u:_sheetVisual(x
)if v.mediaId~=y then return end v.media=if z then{visual=z,slot=x.slot}else nil u:_applyImages(v)end)end function ae.
_listPlayers(u)if u.players and u.players.GetPlayers then return u.players:GetPlayers()end return{ag.localPlayer}end
function ae._wants(u,v)return v~=nil and u.users[v.UserId]~=nil end function ae._reconcileAll(u)for v,w in u:
_listPlayers()do u:_reconcile(w)end for v in u.plates do if not u:_wants(v)then u:_drop(v)end end end function ae.
_reconcile(u,v)if not u:_wants(v)then u:_drop(v)return end local w=u.plates[v]if not w then w={player=v}u.plates[v]=w if
v.CharacterAdded then w.characterConnection=u.window:Connect(v.CharacterAdded,function(x)u:_attach(v,x)end)end if v.
Character then u:_attach(v,v.Character)end elseif w.parts then u:_writeText(w)end u:_syncMedia(w)end function ae._drop(u
,v)local w=u.plates[v]if not w then return end u.plates[v]=nil if w.characterConnection then u.window:Disconnect(w.
characterConnection)end u:_vanish(w)end function ae._subtitleFor(u,v)if type(u.subtitle)=='function'then return
tostring(u.subtitle(v))elseif type(u.subtitle)=='string'then return u.subtitle end return'@'..v.Name end function ae.
_badgeFor(u,v)local w=u.users[v.UserId]local x=w and w.badge return if type(x)=='string'and x~=''then string.upper(x)
else nil end local function u(v)local w=v.size.X/v.size.Y local x=0.14/w local y=x+v.logoScale/2/w return{aspect=w,
logoCenter=y,closedWidth=math.min(y*2,1),textLeft=y+(v.logoScale/2+0.2)/w,margin=0.2/w}end function ae._writeText(v,w)
local x,y,z=w.parts,v.style,w.layout x.title.Text=v.title x.subtitle.Text=r(v:_subtitleFor(w.player))local A=v:
_badgeFor(w.player)x.badge.Visible=A~=nil local B=1-z.margin if A then x.badgeText.Text=A local C=0.22 local D=(#A*0.62*
C*0.6+C*1.1)/z.aspect x.badge.Size=UDim2.fromScale(D,C)B-=D+0.06/z.aspect end x.title.Size=UDim2.fromScale(math.max(B-z.
textLeft,0.1),y.titleSize)x.subtitle.Size=UDim2.fromScale(1-z.margin-z.textLeft,y.subtitleSize)x.badgeStroke.Color=y.
accent x.badge.BackgroundColor3=y.accent end function ae._attach(v,w,x)local y=v.plates[w]if not y or not x then return
end y.character=x if y.gui then v:_vanish(table.clone(y))y.gui=nil y.parts=nil end local z=x:FindFirstChild'Head'if not
z and x.WaitForChild then z=x:WaitForChild('Head',5)end if not z or v.plates[w]~=y then return end local A,B=v.window,v.
style local C,D,E,F,G=u(B),B.accent:Lerp(f,0.6),UDim.new(B.cornerRadius,0),B.titleFont or ag.brandFont(Enum.FontWeight.
Bold),B.subtitleFont or ag.brandFont(Enum.FontWeight.Medium)local H,I=function(H)A:Create('UICorner',{CornerRadius=E,
Parent=H})end,A:Create('BillboardGui',{Name='Nameplate',Adornee=z,Size=UDim2.fromScale(B.size.X,B.size.Y),StudsOffset=
Vector3.new(0,B.lift,0),MaxDistance=B.maxDistance,AlwaysOnTop=false,LightInfluence=0,ResetOnSpawn=false,ClipsDescendants
=false,Parent=v.folder})local J=A:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=I})local K,L
=A:Create('UIScale',{Parent=J}),A:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=J})H(L)local
M,N=A:Create('UIStroke',{Color=B.accentDeep,Thickness=3,Transparency=1,Parent=L}),A:Create('Frame',{Size=UDim2.
fromScale(1,1),BackgroundColor3=B.cardColor,BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,Parent=J})
H(N)local O=A:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=N})local P=A:Create('ImageLabel'
,{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ScaleType=Enum.ScaleType.Crop,ImageColor3=B.backdropTint,
ImageTransparency=1,Visible=false,ZIndex=1,Parent=O})H(P)local Q=A:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=B.veilColor,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=2,Parent=O})H(Q)local R=l(B.veilStrength)
A:Create('UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1-R),NumberSequenceKeypoint.new(0.55
,1-R*0.55),NumberSequenceKeypoint.new(1,1-R*0.12)},Parent=Q})local S=A:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=f,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,Visible=B.sweep,Parent=O})H(S)local T,U=A:Create(
'UIGradient',{Rotation=20,Offset=Vector2.new(-1,0),Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.42,1),NumberSequenceKeypoint.new(0.5,0.9),NumberSequenceKeypoint.new(0.58,1),
NumberSequenceKeypoint.new(1,1)},Parent=S}),A:Create('TextLabel',{Position=UDim2.fromScale(C.textLeft,B.titleTop),
BackgroundTransparency=1,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Bottom,TextColor3=B.titleColor,TextTransparency=1,FontFace=F,ZIndex=5,Parent=O})local V,W,X=A:Create('UIGradient',{Color
=ColorSequence.new{ColorSequenceKeypoint.new(0,f),ColorSequenceKeypoint.new(0.5,D),ColorSequenceKeypoint.new(1,f)},
Enabled=B.titleShine,Parent=U}),A:Create('TextLabel',{Position=UDim2.fromScale(C.textLeft,B.titleTop+B.titleSize+0.05),
BackgroundTransparency=1,RichText=true,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextColor3=B.subtitleColor,TextTransparency=1,FontFace=G,ZIndex=5,Parent=O}),A:Create('Frame',{
AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1-C.margin,B.titleTop+0.02),BackgroundColor3=B.accent,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=6,Parent=O})A:Create('UICorner',{CornerRadius=UDim.new(1
,0),Parent=X})local Y,Z,_,aj=A:Create('UIScale',{Scale=0,Parent=X}),A:Create('UIStroke',{Color=B.accent,Thickness=1,
Transparency=1,Parent=X}),A:Create('TextLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.52),Size
=UDim2.fromScale(0.76,0.58),BackgroundTransparency=1,TextScaled=true,TextColor3=B.badgeTextColor,TextTransparency=1,
FontFace=F,ZIndex=7,Parent=X}),A:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Visible=B.border,
Parent=J})H(aj)local ak=A:Create('UIStroke',{Color=f,Thickness=B.borderThickness,Transparency=1,Parent=aj})local al,am,
an=A:Create('UIGradient',{Color=ColorSequence.new{ColorSequenceKeypoint.new(0,B.accentDeep),ColorSequenceKeypoint.new(
0.5,D),ColorSequenceKeypoint.new(1,B.accentDeep)},Parent=ak}),UDim2.fromScale(B.logoScale,B.logoScale),UDim2.fromScale(C
.logoCenter,0.5)local ao,ap=A:Create('ImageLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=an,Size=UDim2.fromScale(B.
logoScale*1.6,B.logoScale*1.6),SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundTransparency=1,ImageColor3=B.
accent,ImageTransparency=1,Visible=false,ZIndex=8,Parent=J}),A:Create('ImageLabel',{AnchorPoint=Vector2.new(0.5,0.5),
Position=an,Size=am,SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundTransparency=1,ImageColor3=B.logoTint,
ImageTransparency=1,Visible=false,ZIndex=10,Parent=J})local aq,ar,as,at=A:Create('UICorner',{CornerRadius=UDim.new(0,0),
Parent=ap}),A:Create('TextLabel',{AnchorPoint=Vector2.new(0.5,0.5),Position=an,Size=am,SizeConstraint=Enum.
SizeConstraint.RelativeYY,BackgroundTransparency=1,Text=string.sub(v.title,1,1),TextScaled=true,TextColor3=D,
TextTransparency=1,FontFace=F,ZIndex=10,Parent=J}),{},math.max(math.floor(tonumber(B.sparkles)or 0),0)for au=1,at do
local av=A:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromScale(0.04,0.04),SizeConstraint=Enum.
SizeConstraint.RelativeYY,BackgroundColor3=B.sparkleColor,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=11,Parent=J}
)A:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=av})table.insert(as,{frame=av,offset=(au-1)/at*math.pi*2,speed=
0.5+(au%3)*0.1,size=0.028+(au%3)*0.006})end local au,av=(x:FindFirstChild'Humanoid')if au and v.hideDefaultName then av=
au.DisplayDistanceType or Enum.HumanoidDisplayDistanceType.Viewer au.DisplayDistanceType=Enum.
HumanoidDisplayDistanceType.None end y.gui=I y.head=z y.humanoid=au y.nameType=av y.layout=C y.born=os.clock()y.phase=(w
.UserId%97)/97*10 y.parts={shell=J,scale=K,glow=L,glowStroke=M,card=N,content=O,backdrop=P,veil=Q,shine=S,sweep=T,border
=aj,borderStroke=ak,borderGradient=al,title=U,titleShine=V,subtitle=W,badge=X,badgeScale=Y,badgeStroke=Z,badgeText=_,
halo=ao,logo=ap,logoCorner=aq,monogram=ar,sparks=as}v:_writeText(y)v:_applyImages(y)v:_step(os.clock())end function ae.
_vanish(aj,ak)if not ak.gui then return end if ak.humanoid and ak.nameType and ak.humanoid.Parent then ak.humanoid.
DisplayDistanceType=ak.nameType end ak.diedAt=os.clock()ak.humanoid=nil table.insert(aj._dying,ak)end local function aj(
ak,al)if ak=='none'then return{mark=1,card=1,edge=1,title=1,subtitle=1,badge=1,sparks=1,fade=1}elseif ak=='fade'then
local am=m(al,0,0.5)return{mark=am,card=1,edge=am,title=am,subtitle=am,badge=am,sparks=am,fade=am}end return{mark=m(al,0
,0.5),card=m(al,0.15,0.6),edge=m(al,0.45,0.4),title=m(al,0.42,0.45),subtitle=m(al,0.52,0.45),badge=m(al,0.65,0.4),sparks
=m(al,0.3,0.6),fade=m(al,0.1,0.35)}end local function ak(al,am)return 1-(1-al)*am end local function al(am,an,ao,ap)
local aq=an.parts if not aq then return false end local ar,as,at=am.style,an.layout,ao-an.born local au,av,v=aj(ar.
entrance,at),ap,1 if an.diedAt then local w=l((ao-an.diedAt)/h)if w>=1 then return true end av*=1-n(w)v=1-0.08*w end
local w=ag.workspace.CurrentCamera if w and an.head and an.head.Parent then local x=(w.CFrame.Position-an.head.Position)
.Magnitude local y,z=l((x-ar.maxDistance*0.6)/(ar.maxDistance*0.4)),l((x-j)/2)av*=(1-y)*z end aq.scale.Scale=v local x,y
=ao+an.phase,au.mark local z,A,B=n(y)*av,ar.logoScale*(0.35+0.65*p(y)),(1-n(y))*-90+math.sin(x*0.8)*(ar.logoSway or 0)+x
*(ar.logoSpin or 0)for C,D in{aq.logo,aq.monogram}do D.Size=UDim2.fromScale(A,A)D.Rotation=B%360 end aq.logo.
ImageTransparency=1-z aq.monogram.TextTransparency=1-z local C=0.5+0.5*math.sin(x*2.1)aq.halo.ImageTransparency=1-z*(
0.18+0.12*C)local D=ar.logoScale*(1.45+0.12*C)*(0.5+0.5*n(y))aq.halo.Size=UDim2.fromScale(D,D)local E,F=n(au.sparks)*av,
math.rad(-25)for G,H in aq.sparks do local I=x*H.speed+H.offset local J,K=math.cos(I)*0.62,math.sin(I)*0.2 local L,M,N=J
*math.cos(F)-K*math.sin(F),J*math.sin(F)+K*math.cos(F),math.sin(I)>0 local O,P=if N then 1 else 0.7,0.75+0.25*math.sin(x
*5+H.offset*3)H.frame.Position=UDim2.fromScale(as.logoCenter+L*ar.logoScale/as.aspect,0.5+M*ar.logoScale)H.frame.Size=
UDim2.fromScale(H.size*O,H.size*O)H.frame.ZIndex=if N then 11 else 9 H.frame.BackgroundTransparency=1-E*P*(if N then 0.8
else 0.3)end local G=o(au.card)local H=as.closedWidth+(1-as.closedWidth)*G local I=UDim2.fromScale(H,1)aq.card.Size=I aq
.border.Size=I aq.glow.Size=I aq.content.Size=UDim2.fromScale(1/H,1)local J=n(au.fade)*av aq.card.BackgroundTransparency
=ak(ar.cardTransparency,J)aq.backdrop.ImageTransparency=ak(ar.backdropTransparency,J*G)aq.veil.BackgroundTransparency=
ak(0,J)aq.shine.BackgroundTransparency=ak(0,J)local K=n(au.edge)*av aq.borderStroke.Transparency=ak(ar.
borderTransparency,math.max(K,J*0.6))aq.glowStroke.Transparency=if ar.glow then ak(0.85,K)else 1 aq.borderGradient.
Rotation=(x*ar.borderSpeed)%360 local L=n(au.title)aq.title.TextTransparency=1-L*av aq.title.Position=UDim2.fromScale(as
.textLeft+(1-L)*0.03,ar.titleTop)local M=n(au.subtitle)aq.subtitle.TextTransparency=1-M*av aq.subtitle.Position=UDim2.
fromScale(as.textLeft+(1-M)*0.02,ar.titleTop+ar.titleSize+0.05)aq.badgeScale.Scale=p(au.badge)local N=l(au.badge*1.5)*av
aq.badge.BackgroundTransparency=ak(0.86,N)aq.badgeStroke.Transparency=ak(0.55,N)aq.badgeText.TextTransparency=1-N if ar.
titleShine then aq.titleShine.Offset=Vector2.new(((x*0.3)%2)-1,0)end if an.visuals then for O,P in an.visuals do if P.
visual then c.step(P.label,P.visual,x,P.state)end end end local O=if ar.bob then math.sin(x*ar.bobSpeed)*ar.bobHeight
else 0 an.gui.StudsOffset=Vector3.new(0,ar.lift+O,0)if ar.sweep then local P=(x%ar.sweepEvery)/i aq.sweep.Offset=Vector2
.new(if P<1 then-1+2*q(P)else-1,0)end return false end function ae._step(am,an)local ao=if am.enabled then 1 else 0 for
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
am.preset=ao end if type(an)=='table'then for ap,aq in an do am.overrides[ap]=aq end end am.style=s(am.preset,am.
overrides)am:_loadImages()for ap,aq in am.plates do if aq.character then am:_attach(ap,aq.character)end end end
local function am()return e.join(ag.fileSystemManager:getRootFolder(),'nameplate-token.txt')end function ae._token(an)if
an._savedToken then return an._savedToken end local ao,ap=pcall(function()return if d.isfile(am())then d.readfile(am())
else nil end)an._savedToken=if ao and type(ap)=='string'and ap~=''then ap else nil return an._savedToken end function ae
._saveToken(an,ao)if type(ao)~='string'or ao==''then return end an._savedToken=ao pcall(function()d.ensureFolder(ag.
fileSystemManager:getRootFolder())d.writefile(am(),ao)end)end function ae.SetMedia(an,ao:string,ap:string?):(boolean,
string?)if not an.endpoint and not an.transport then return false,'Custom images need a relay (endpoint).'end local aq=
an:_identity()aq.token=an:_token()aq.media={url=tostring(ao),slot=if ap=='logo'then'logo'else'backdrop'}local ar,as=ai.
request(an,'PUT','/v1/profile',aq)if not ar or type(as)~='table'then return false,if type(as)=='table'and type(as.error)
=='string'then as.error else"Couldn't set that image."end an:_saveToken(as.token)an:_setOwnMedia(as.media)return true
end function ae.ClearMedia(an):boolean if not an.endpoint and not an.transport then return false end local ao=an:
_identity()ao.token=an:_token()local ap,aq=ai.request(an,'DELETE','/v1/profile',ao)if ap and type(aq)=='table'then an:
_saveToken(aq.token)an:_setOwnMedia(nil)end return ap end function ae._setOwnMedia(an,ao)local ap=ag.localPlayer if not
ap then return end an.users[ap.UserId]=an.users[ap.UserId]or{badge=an.badge}an.users[ap.UserId].media=ao if an.plates[ap
]then an:_syncMedia(an.plates[ap])end end function ae.Add(an,ao,ap:string?)if typeof(ao)~='Instance'and type(ao)~=
'table'then return end an.users[ao.UserId]={badge=ap}an:_reconcile(ao)end function ae.Remove(an,ao)if ao then an.users[
ao.UserId]=nil an:_drop(ao)end end function ae.Destroy(an)if not an._alive then return end an._alive=false for ao in an.
plates do an:_drop(ao)end task.delay(h+0.05,function()if an.stepConnection then an.window:Disconnect(an.stepConnection)
end if an.folder then an.window:DestroySubtree(an.folder)end end)end return ae end)()end,[18]=function()local aa,ab,ac=
a(18)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Notification'local af=ab.Parent.Parent.utility
local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.HapticEngine),
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8 local function at(au)return math.clamp(#au*0.06
+3,3,9)end function ae.new(au,av)av=if typeof(av)=='table'then av else{}local b=setmetatable({window=assert(au,
'Missing argument #1 (Window expected)'),title=av.title or av.Title or'Notification',content=av.content or av.Content or
'',icon=av.icon or av.Icon,_hovered=false,_dismissed=false},ae)b.duration=av.duration or av.Duration or at(b.content)
local c=b.icon~=nil and b.icon~=0 and b.icon~=''b.main=b.window:Create('Frame',{Name='Notification',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.notification,Parent=b.window.
notifications})b.window:Create('UIPadding',{PaddingTop=UDim.new(0,as),Parent=b.main})b.body=b.window:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=ap,AnchorPoint=Vector2.new(0.5,0.5),Active
=true,BorderSizePixel=0,ZIndex=ai.zIndex.notification,BackgroundTransparency=1,Parent=b.main})b.window:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=b.body},{Color={'WindowColor',ah.toColorSequence}})b.window
:Create('UICorner',{Parent=b.body},{CornerRadius='CornerRoundness'})b.stroke=b.window:Create('UIStroke',{Transparency=1,
Parent=b.body},{Color='SurfaceStroke'})b.shadow=b.window:CreateGlow(b.body,'ShadowColor',20,1)b.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=b.body})b.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=b.body})if c then b.
iconLabel=b.window:Create('ImageLabel',{Image=b.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.notification,ImageTransparency=1,Parent=b.body},{ImageColor3=
'ContentColor'})end b.container=b.window:Create('Frame',{Size=UDim2.fromOffset(c and 222 or 260,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.notification,Parent=b.body})b.
window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=
UDim.new(0,4),Parent=b.container})b.titleLabel=b.window:Create('TextLabel',{Text=b.title,Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=b.container},{TextColor3=
'ContentColor',FontFace='TitleFont'})if b.content~=''then b.descriptionLabel=b.window:Create('TextLabel',{Text=b.content
,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=ai.zIndex.
notification,TextTransparency=1,Parent=b.container},{TextColor3='ContentColor',FontFace='Font'})end b.window.
_notificationCount=(b.window._notificationCount or 0)+1 b.main.LayoutOrder=b.window._notificationCount local d=b.window.
_liveNotifications if not d then d={}b.window._liveNotifications=d end table.insert(d,b)while#d>ar do local e=table.
remove(d,1)if e and e~=b then task.spawn(e._dismiss,e)end end b._connections={b.window:Connect(b.body.MouseEnter,
function()b._hovered=true end),b.window:Connect(b.body.MouseLeave,function()b._hovered=false end),b.window:Connect(b.
body.InputBegan,function(e)if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.
Touch then b:_dismiss()end end)}task.spawn(function()b:_show()end)return b end function ae._measure(au)local av=au.
iconLabel and 222 or 260 local b=ah.textHeight(au.window.theme.TitleFont,16,au.title,av)if au.descriptionLabel then b=b+
4+ah.textHeight(au.window.theme.Font,15,au.content,av)end return math.max(b,au.iconLabel and 24 or 0)+28 end function ae
._show(au)local av=au:_measure()+as if au._dismissed or not au.main.Parent then return end aj.notify()ag.tweenService:
Create(au.main,ak,{Size=UDim2.new(1,0,0,av)}):Play()ag.tweenService:Create(au.body,an,{Position=aq}):Play()ag.
tweenService:Create(au.body,al,{BackgroundTransparency=0}):Play()ag.tweenService:Create(au.titleLabel,am,{
TextTransparency=0}):Play()ag.tweenService:Create(au.stroke,al,{Transparency=0.95}):Play()ag.tweenService:Create(au.
shadow,am,{Transparency=0.6}):Play()task.wait(0.05)if au._dismissed or not au.main.Parent then return end if au.
iconLabel then ag.tweenService:Create(au.iconLabel,am,{ImageTransparency=0}):Play()end task.wait(0.05)if au._dismissed
or not au.main.Parent then return end if au.descriptionLabel then ag.tweenService:Create(au.descriptionLabel,am,{
TextTransparency=0.35}):Play()end local b=0 while b<au.duration and not au._dismissed and au.main.Parent do local c=task
.wait()if not au._hovered then b+=c end end au:_dismiss()end function ae._dismiss(au)if au._dismissed then return end au
._dismissed=true local av=au.window._liveNotifications local b=av and table.find(av,au)if av and b then table.remove(av,
b)end if not au.main.Parent then return end ag.tweenService:Create(au.body,al,{BackgroundTransparency=1}):Play()ag.
tweenService:Create(au.stroke,al,{Transparency=1}):Play()ag.tweenService:Create(au.shadow,am,{Transparency=1}):Play()ag.
tweenService:Create(au.titleLabel,am,{TextTransparency=1}):Play()if au.descriptionLabel then ag.tweenService:Create(au.
descriptionLabel,am,{TextTransparency=1}):Play()end if au.iconLabel then ag.tweenService:Create(au.iconLabel,am,{
ImageTransparency=1}):Play()end ag.tweenService:Create(au.body,ao,{Size=UDim2.new(1,-90,1,0)}):Play()local c=ag.
tweenService:Create(au.main,ao,{Size=UDim2.new(1,0,0,0)})c:Play()c.Completed:Wait()if not au.main.Parent then return end
for d,e in au._connections do au.window:Disconnect(e)end au.window:DestroySubtree(au.main)end return ae end)()end,[19]=
function()local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=ac(af.variables),ac(af.functions),ac(af.constants),ac(
af.locale),ac(af.log),ac(af.HapticEngine),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),400,22,24,22,16
local av,b,c,d,e,f,g,h=aq-ar*2,18,14,15,16,12,300,4 local i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x=av-h*2,16,13,20,10,15,14,8,10,
40,8,UDim.new(1,0),16,0.5,{}local function y()for z=#w,1,-1 do local A=w[z]if A._closed or not A.screenGui.Parent then
table.remove(w,z)end end end local function z(A)y()return w[#w]==A end function ae.new(A,B)B=if typeof(B)=='table'then B
else{}local C=setmetatable({window=assert(A,'Missing argument #1 (Window expected)'),title=B.title or B.Title or'Popup',
subtitle=B.subtitle or B.Subtitle,content=B.content or B.Content,icon=B.icon or B.Icon,boxes=B.boxes or B.Boxes,options=
B.options or B.Options,dismissable=if B.dismissable~=nil then B.dismissable elseif B.Dismissable~=nil then B.Dismissable
else true,_reveal={},_connections={},_closed=false},ae)if not C.options or#C.options==0 then C.options={{text='Okay'}}
end C:_build()y()table.insert(w,C)task.spawn(function()C:_show()end)return C end function ae._fade(A,B,C,D)table.insert(
A._reveal,{instance=B,prop=C,to=D})return B end function ae._build(A)local B,C=A.window,A.icon~=nil and A.icon~=0 and A.
icon~=''A.screenGui=B:Create('ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false
,Enabled=true,DisplayOrder=ai.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})A.
backdrop=B:Create('Frame',{Name='Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.
fromScale(1,1),Active=true,BackgroundTransparency=1,Parent=A.screenGui})A:_fade(A.backdrop,'BackgroundTransparency',v)A.
card=B:Create('Frame',{Name='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,14),Size=UDim2.fromOffset(aq,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,
BorderSizePixel=0,BackgroundTransparency=1,Parent=A.screenGui})A:_fade(A.card,'BackgroundTransparency',0)B:
_scaleSurface(A.card)B:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=A.card},{Color={'WindowColor'
,ah.toColorSequence}})B:Create('UICorner',{Parent=A.card},{CornerRadius='CornerRoundness'})A.cardStroke=B:Create(
'UIStroke',{Transparency=1,Parent=A.card},{Color='SurfaceStroke'})A:_fade(A.cardStroke,'Transparency',0.95)A.cardShadow=
B:CreateGlow(A.card,'ShadowColor',26,1)A:_fade(A.cardShadow,'Transparency',0.55)B:Create('UIPadding',{PaddingLeft=UDim.
new(0,ar),PaddingRight=UDim.new(0,ar),PaddingTop=UDim.new(0,as),PaddingBottom=UDim.new(0,at),Parent=A.card})B:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,au),Parent=A.card})local D=A:_measureHeader(C)A:_buildHeader(C,D)local E=A
:_buildContent()A:_buildFooter()local F=2+(E>0 and 1 or 0)local G=as+D+E+r+at+au*(F-1)A.card.Size=UDim2.fromOffset(aq,G)
A.card.AutomaticSize=Enum.AutomaticSize.None if A.dismissable then table.insert(A._connections,B:Connect(A.backdrop.
InputBegan,function(H)if H.UserInputType==Enum.UserInputType.MouseButton1 or H.UserInputType==Enum.UserInputType.Touch
then A:Close()end end))table.insert(A._connections,B:Connect(ag.userInputService.InputBegan,function(H,I)if not I and H.
KeyCode==Enum.KeyCode.Escape and z(A)then if H==x then return end x=H A:Close()end end))end end function ae._buildHeader
(A,B,C)local D=A.window local E=D:Create('Frame',{Name='Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,C),
LayoutOrder=1,Parent=A.card})D:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum
.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding
=UDim.new(0,f),Parent=E})if B then A:_fade(D:Create('ImageLabel',{Image=A.icon,Size=UDim2.fromOffset(e,e),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=E},{ImageColor3='TitlingColor'}),
'ImageTransparency',0)end local F=D:Create('Frame',{Name='Text',BackgroundTransparency=1,Size=UDim2.new(1,B and-(e+f)or
0,0,A._columnH),LayoutOrder=2,Parent=E})D:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=F})A:_fade(D:Create('TextLabel',{Text=aj.t(A.title),Size=UDim2.
new(1,0,0,A._titleH),BackgroundTransparency=1,TextSize=b,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=F},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if A.
subtitle and A.subtitle~=''then A:_fade(D:Create('TextLabel',{Text=aj.t(A.subtitle),Size=UDim2.new(1,0,0,A._subH),
BackgroundTransparency=1,TextSize=c,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,
TextTransparency=1,Parent=F},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0.55)end end function ae.
_buildContent(A)if(not A.content or A.content=='')and(not A.boxes or#A.boxes==0)then return 0 end local B,C=A.window,if
A.boxes and#A.boxes>0 then A:_measureBoxes()else A:_measureText()local D=math.min(C,g)+h*2 local E=B:Create(
'ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,D),CanvasSize=UDim2.
new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(255,255,
255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,ScrollBarImageTransparency=1,Parent=A.card})A:_fade(E,
'ScrollBarImageTransparency',0.8)B:Create('UIPadding',{PaddingLeft=UDim.new(0,h),PaddingRight=UDim.new(0,h),PaddingTop=
UDim.new(0,h),PaddingBottom=UDim.new(0,h),Parent=E})if A.boxes and#A.boxes>0 then B:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,p),Parent=E})for F,G in A.boxes do A:_buildBox(E,G,F)end else A:_fade(B:Create('TextLabel',{Text=aj.
t(A.content),Size=UDim2.new(1,0,0,C),BackgroundTransparency=1,TextSize=d,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,TextTransparency=1,Parent=E},{TextColor3='ContentColor',FontFace
='Font'}),'TextTransparency',0.5)end return D end function ae._buildBox(A,B,C,D)local E=A.window C=if typeof(C)=='table'
then C else{title=tostring(C)}local F,G,H,I,J=C.icon~=nil and C.icon~=0 and C.icon~='',A:_measureBox(C)local K=E:Create(
'Frame',{Name='Box',BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-q,0,G),LayoutOrder=
D,BackgroundTransparency=1,Parent=B})A:_fade(K,'BackgroundTransparency',0)local L=E:StyleElementPanel(K)A:_fade(L,
'Transparency',E.theme.ElementStrokeTransparency)E:Create('UIPadding',{PaddingLeft=UDim.new(0,j),PaddingRight=UDim.new(0
,j),PaddingTop=UDim.new(0,k),PaddingBottom=UDim.new(0,k),Parent=K})E:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,m),Parent=K})if F then A:_fade(E:Create('ImageLabel',{Image
=C.icon,Size=UDim2.fromOffset(l,l),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=K
},{ImageColor3='ContentColor'}),'ImageTransparency',0)end local M=E:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
new(1,F and-(l+m)or 0,0,J),LayoutOrder=2,Parent=K})E:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=M})A:_fade(E:Create('TextLabel',{Text=aj.t(C.title or
C.Title or''),Size=UDim2.new(1,0,0,H),BackgroundTransparency=1,TextSize=n,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=M},{TextColor3='ContentColor',FontFace='TitleFont'}),
'TextTransparency',0)local N=C.description or C.Description if N and N~=''then A:_fade(E:Create('TextLabel',{Text=aj.t(N
),Size=UDim2.new(1,0,0,I),BackgroundTransparency=1,TextSize=o,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Top,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=M},{TextColor3='ContentColor',FontFace=
'Font'}),'TextTransparency',0.65)end end function ae._buildFooter(A)local B=A.window local C=B:Create('Frame',{Name=
'Footer',BackgroundTransparency=1,Size=UDim2.new(1,0,0,r),LayoutOrder=3,Parent=A.card})B:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,s),Parent=C})for D,E in A.options do A:_buildButton(C,E,D)end end function ae._buildButton(A,B,C,D)local E=A.
window C=if typeof(C)=='table'then C else{text=tostring(C)}local F,G,H,I,J,K,L=C.style or C.Style or'neutral',C.text or
C.Text or C.name or C.Name or'Okay',C.callback or C.Callback if F=='primary'then I,J,K,L=E.theme.AccentColor,E.theme.
AccentStroke,E.theme.AccentStroke,0.1 elseif F=='danger'then I,J,K,L=E.theme.ErrorColor,E.theme.ErrorStrokeColor,E.theme
.ErrorStrokeColor,0 else I,J,K,L=E.theme.NeutralButton,E.theme.NeutralButtonHover,E.theme.NeutralButtonStroke,0.85 end
local M=E:Create('Frame',{Name='Button',BackgroundColor3=I,BorderSizePixel=0,Size=UDim2.new(0,0,0,r),LayoutOrder=D,
BackgroundTransparency=1,Parent=B})A:_fade(M,'BackgroundTransparency',0)E:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=M})E:Create('UICorner',{CornerRadius=t,Parent=M})local N=E:Create('UIStroke',{Color=K,Transparency=1,Parent=
M})A:_fade(N,'Transparency',L)A:_fade(E:Create('TextLabel',{Text=aj.t(G),Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,TextSize=u,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,
TextColor3=ah.contrastText(I),TextTransparency=1,Parent=M},{FontFace='Font'}),'TextTransparency',0)local O,P=E:Create(
'TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=M}),TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(A._connections,E:Connect(O.MouseEnter,function()
if A._closed then return end ag.tweenService:Create(M,P,{BackgroundColor3=J}):Play()end))table.insert(A._connections,E:
Connect(O.MouseLeave,function()ag.tweenService:Create(M,P,{BackgroundColor3=I}):Play()end))table.insert(A._connections,E
:Connect(O.MouseButton1Click,function()if A._closed then return end al.click()ag.tweenService:Create(N,P,{Transparency=1
}):Play()if H then task.spawn(function()local Q,R=pcall(H)if not Q then ak.warn("Rayfield: popup button '"..G..
"' callback errored:")ak.print(R)end end)end A:Close()end))end function ae._measureHeader(A,B)local C=av-(if B then e+f
else 0)A._titleH=ah.textHeight(A.window.theme.Font,b,aj.resolve(A.title),C)A._subH=if A.subtitle and A.subtitle~=''then
ah.textHeight(A.window.theme.Font,c,aj.resolve(A.subtitle),C)else 0 A._columnH=A._titleH+(if A._subH>0 then 3+A._subH
else 0)return math.max(A._columnH,if B then e else 0)end function ae._measureText(A)return ah.textHeight(A.window.theme.
Font,d,aj.resolve(A.content),i)end function ae._measureBox(A,B)B=if typeof(B)=='table'then B else{title=tostring(B)}
local C=B.icon~=nil and B.icon~=0 and B.icon~=''local D=i-q-j*2-(if C then l+m else 0)local E,F,G=ah.textHeight(A.window
.theme.TitleFont,n,aj.resolve(B.title or B.Title or''),D),0,B.description or B.Description if G and G~=''then F=ah.
textHeight(A.window.theme.Font,o,aj.resolve(G),D)end local H=E+(if F>0 then 3+F else 0)local I=math.max(H,if C then l
else 0)+k*2 return I,E,F,H end function ae._measureBoxes(A)local B=0 for C,D in A.boxes do B+=(A:_measureBox(D))if C<#A.
boxes then B+=p end end return B end function ae._show(A)if not A.screenGui.Parent then return end al.notify()ag.
tweenService:Create(A.card,am,{Position=UDim2.new(0.5,0,0.5,0)}):Play()for B,C in A._reveal do local D=if C.instance==A.
backdrop then ap else an ag.tweenService:Create(C.instance,D,{[C.prop]=C.to}):Play()end end function ae.Close(A)if A.
_closed then return end A._closed=true local B=table.find(w,A)if B then table.remove(w,B)end for C,D in A._connections
do A.window:Disconnect(D)end A._connections={}if not A.screenGui.Parent then return end ag.tweenService:Create(A.card,ao
,{Position=UDim2.new(0.5,0,0.5,10)}):Play()for C,D in A._reveal do ag.tweenService:Create(D.instance,ao,{[D.prop]=1}):
Play()end task.delay(ao.Time,function()A.window:DestroySubtree(A.screenGui)end)end return ae end)()end,[20]=function()
local aa,ab,ac=a(20)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.
locale),60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local av=TweenInfo.new(au,Enum.EasingStyle.Quint
,Enum.EasingDirection.InOut,-1,true)local function b(c:unknown):number?local d=tonumber(c)if d==nil or d~=d or math.abs(
d)==math.huge then return nil end return d end function ae.new(c,d)d=if typeof(d)=='table'then d else{}local e=b(d.steps
or d.Steps)e=if e and e>=2 then math.floor(e)else nil local f=d.range or d.Range local g,h=b(f and f[1])or 0,b(f and f[2
])or e or 1 if g>h then g,h=h,g end local i=setmetatable({tab=assert(c,'Missing argument #1 (Tab expected)'),window=c.
window,name=d.name or d.Name or'Progress',icon=d.icon or d.Icon,description=d.description or d.Description,min=g,max=h,
steps=e,value=0,text=d.text or d.Text,format=d.format or d.Format,showValue=if d.showValue==nil then true else d.
showValue==true,indeterminate=d.indeterminate or d.Indeterminate or false},ae)i.value=i:_clamp(b(d.value or d.Value)or g
)i:_build()if i.description then i.descriptor=ac(ab.Parent.descriptor).new(i.tab,{description=i.description})end return
i end function ae._clamp(c,d:number):number return math.clamp(b(d)or c.min,c.min,c.max)end function ae._ratio(c):number
local d=c.max-c.min if d<=0 then return 1 end return(c.value-c.min)/d end function ae._filledSteps(c):number local d=c.
steps::number return math.clamp(math.round(c:_ratio()*d),0,d)end function ae._readout(c):string if c.text then return aj
.resolve(c.text)end if c.format then local d,e=pcall(c.format,c.value,c.min,c.max)if d and type(e)=='string'then return
e end end if c.steps then return string.format('%d/%d',c:_filledSteps(),c.steps)end return string.format('%d%%',math.
round(c:_ratio()*100))end function ae._build(c)c.main=c.window:Create('Frame',{Size=UDim2.new(1,-20,0,ak),
BorderSizePixel=0,Name=c.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=c.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})c.stroke=c.window:StyleElementBody(c.main)c.container=c.window:Create(
'Frame',{Size=UDim2.new(0,170,0,ap),Position=UDim2.new(0,am,0,20),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=
1,BorderSizePixel=0,Parent=c.main})c.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=c.container})if c.icon then c.iconLabel=c.window:Create('ImageLabel',{
Image=c.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=c.
container},{ImageColor3='ContentColor'})end c.title=c.window:Create('TextLabel',{Text=aj.t(c.name),Size=UDim2.
fromOffset(250,ap),BorderSizePixel=0,BackgroundTransparency=1,TextSize=ap,AutomaticSize=Enum.AutomaticSize.X,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=c.container},{
TextColor3='ContentColor',FontFace='Font'})c.readout=c.window:Create('TextLabel',{Text=c:_readout(),AnchorPoint=Vector2.
new(1,0.5),Position=UDim2.new(1,-am,0,20),Size=UDim2.fromOffset(50,aq),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=aq,TextXAlignment=Enum.TextXAlignment.Right,Visible=c.showValue,
TextTransparency=1,Parent=c.main},{TextColor3='ContentColor',FontFace='Font'})if c.steps then c:_buildSteps()return end
c.track=c.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.new(1,-am*2,0
,al),BorderSizePixel=0,BackgroundTransparency=1,Parent=c.main},{BackgroundColor3='SliderBackground'})c.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=c.track})c.fill=c.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(if c.indeterminate then 0 else c:_ratio(),1),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=c.track})c.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=c.fill})c.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2
,Transparency=at,Parent=c.fill},{Color={'SliderProgress',ah.toColorSequence}})c.fillGlow=c.window:CreateGlow(c.fill,
'AccentColor',20,1)if c.indeterminate then c:_startSweep()end end function ae._buildSteps(c)local d=c.steps::number c.
track=c.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2.new(1,-am*2,0,
an),BackgroundTransparency=1,BorderSizePixel=0,Parent=c.main})c.window:Create('UIListLayout',{Padding=UDim.new(0,ao),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=c.track})c.stepFrames={}for e=1,d do local f=c.
window:Create('Frame',{Size=UDim2.new(1/d,-(ao*(d-1))/d,1,0),BorderSizePixel=0,LayoutOrder=e,BackgroundTransparency=1,
Parent=c.track},{BackgroundColor3='SliderBackground'})c.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=f})
local g=c.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=
0,ZIndex=2,BackgroundTransparency=1,Parent=f})c.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=g})c.window:
Create('UIGradient',{Rotation=90,Parent=g},{Color={'SliderProgress',ah.toColorSequence}})table.insert(c.stepFrames,{
segment=f,fill=g})end end function ae._startSweep(c)if c._sweep or c.steps then return end c.fill.AnchorPoint=Vector2.
new(0,0.5)c.fill.Position=UDim2.fromScale(0,0.5)c.fill.Size=UDim2.fromScale(0,1)c._sweep=ag.tweenService:Create(c.fill,
av,{Size=UDim2.fromScale(1,1)})c._sweep:Play()end function ae._stopSweep(c)if not c._sweep then return end c._sweep:
Cancel()c._sweep=nil c.fill.AnchorPoint=Vector2.new(0,0.5)c.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(
c,d:boolean?)c.readout.Text=c:_readout()if c.steps then if not c._shown then return end local e=c:_filledSteps()for f,g
in c.stepFrames do local h=if f<=e then 0 else 1 if d==false then g.fill.BackgroundTransparency=h else ag.tweenService:
Create(g.fill,as,{BackgroundTransparency=h}):Play()end end return end local e=UDim2.fromScale(c:_ratio(),1)if d==false
then c.fill.Size=e else ag.tweenService:Create(c.fill,as,{Size=e}):Play()end end function ae.Set(c,d)c.value=c:_clamp(d)
if c.indeterminate then c.indeterminate=false c:_stopSweep()end c:_render()end function ae.Get(c):number return c.value
end function ae.GetPercentage(c):number return c:_ratio()end function ae.SetRange(c,d,e)d=b(d)or c.min e=b(e)or c.max if
d>e then d,e=e,d end c.min,c.max=d,e c.value=c:_clamp(c.value)c:_render()end function ae.SetText(c,d)c.text=d c.readout.
Text=c:_readout()end function ae.SetIndeterminate(c,d)d=d==true if d==c.indeterminate then return end c.indeterminate=d
if d then c:_startSweep()else c:_stopSweep()c:_render(false)end end function ae._setShown(c,d,e)local f=c.window c.
_shown=d f:_reveal(c.readout,{TextTransparency=if d then ar else 1},e)if d then f:_revealCommon(c,e)else f:_hideCommon(c
,e)end if c.steps then local g=c:_filledSteps()for h,i in c.stepFrames do f:_reveal(i.segment,{BackgroundTransparency=if
d then 0 else 1},e)f:_reveal(i.fill,{BackgroundTransparency=if d and h<=g then 0 else 1},e)end return end f:_reveal(c.
track,{BackgroundTransparency=if d then 0 else 1},e)f:_reveal(c.fill,{BackgroundTransparency=if d then 0 else 1},e)f:
_reveal(c.fillGlow,{Transparency=if d then f.theme.AccentGlow else 1},e)end function ae.Remove(c)c:_stopSweep()if c.
descriptor then c.descriptor:Remove()end if c.tab._forget then c.tab:_forget(c)end c.window:DestroySubtree(c.main)end
ai(ae)return ae end)()end,[21]=function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent.
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
lower(at or'')local au=false for av,b in as._searchUnits do local c=at==''or string.find(b.text,at,1,true)~=nil b.unit.
main.Visible=c if b.unit.descriptor then b.unit.descriptor.main.Visible=c end au=au or c end as.searchEmpty.Visible=not
au and at~=''end local function as(at)at._searchUnits={}local au=0 for av,b in ao(at)do au+=1 local c=b.main table.
insert(at._searchUnits,{unit=b,text=string.lower(an(b)),homeParent=c.Parent,homeOrder=c.LayoutOrder,descOrder=b.
descriptor and b.descriptor.main.LayoutOrder})c.LayoutOrder=au*10 c.Parent=at.searchPage c.Visible=true if b.descriptor
then b.descriptor.main.LayoutOrder=au*10+1 b.descriptor.main.Parent=at.searchPage b.descriptor.main.Visible=true end end
end local function at(au)for av,b in au._searchUnits do local c=b.unit if c.main and c.main.Parent then c.main.
LayoutOrder=b.homeOrder c.main.Parent=b.homeParent c.main.Visible=true end if c.descriptor and c.descriptor.main and c.
descriptor.main.Parent then c.descriptor.main.LayoutOrder=b.descOrder c.descriptor.main.Parent=b.homeParent c.descriptor
.main.Visible=true end end au._searchUnits={}end function aj.open(au)if au._searching or au.minimised or not au:
_interactive()then return end au._searching=true as(au)ar(au,'')au:_jumpTo(au.searchPage)aq(au,false,ak)task.delay(ak.
Time,function()if au._searching and au.layout.mode~='sidebar'then au.tabList.Visible=false end end)au.searchPill.Visible
=true ap(au,true,ak)au.searchInput:CaptureFocus()af.tweenService:Create(au.searchAction.iconLabel,ak,{ImageTransparency=
am}):Play()end function aj.close(au,av)if not au._searching then return end av=av or{}au._searching=false au.searchInput
.Text=''au.searchInput:ReleaseFocus()au.searchEmpty.Visible=false at(au)local b=if av.jumpTo==nil then au.selectedTab
and au.selectedTab.tabPage else av.jumpTo if b then au:_jumpTo(b)end ap(au,false,ak)task.delay(ak.Time,function()if not
au._searching then au.searchPill.Visible=false end end)if av.showTabs then au.tabList.Visible=true aq(au,true,ak)end af.
tweenService:Create(au.searchAction.iconLabel,ak,{ImageTransparency=al}):Play()end function aj.toggle(au)if au.
_searching then aj.close(au,{showTabs=true})else aj.open(au)end end function aj.railWidth(au,av)if au.searchPill then au
.searchPill.Size=UDim2.new(1,-(av+30),0,35)end end function aj.build(au)au._searching=false au.searchPage=au:Create(
'ScrollingFrame',{Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5
),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=ag.pageScrollbar.thickness,ScrollBarImageTransparency=ag.pageScrollbar.transparency,
VerticalScrollBarInset=Enum.ScrollBarInset.None,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2000,Parent=au.
elements},{ScrollBarImageColor3='ContentColor'})au:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.
FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=au.searchPage})au:Create('UIPadding',{PaddingTop=UDim.new(0,if au.layout.
mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),Parent=au.searchPage})au.searchEmpty=au:Create('TextLabel',
{Name='NoResults',Text=ah.t'No results',FontFace=af.brandFont(Enum.FontWeight.Medium),TextSize=15,TextTransparency=0.6,
BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.55,0),Size=UDim2.fromOffset(200,20)
,Visible=false,ZIndex=3,Parent=au.main},{TextColor3='ContentColor',FontFace='Font'})local av=au.layout.mode=='sidebar'
local b=if av then au.layout.chromeHeight+8 else au.layout.tabStripTop+1 au.searchPill=au:Create('Frame',{Name=
'SearchBar',AnchorPoint=Vector2.new(if av then 1 else 0.5,0),Position=UDim2.new(if av then 1 else 0.5,if av then-15 else
0,0,b),Size=UDim2.new(1,if av then-(au.layout.railWidth+30)else-35,0,35),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=au.main})au:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=au.searchPill})au.searchStroke=au:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=1,
Transparency=1,Parent=au.searchPill})au.searchShadow=au:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=Color3.
fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=au.searchPill})au.searchIcon=au:Create('ImageLabel',{Image=
'rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,15,0.5,1),Size=UDim2.
fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=au.searchPill},{ImageColor3=
'ContentColor'})au.searchInput=au:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,TextTransparency=1,Parent
=au.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})au:Connect(au.
searchInput:GetPropertyChangedSignal'Text',function()if au._searching then ar(au,au.searchInput.Text)end end)au.
searchAction=ai.new(au,{name='Search',icon=ag.icons.search,order=4,callback=function()aj.toggle(au)end})au.searchAction.
isLit=function()return au._searching end end return aj end)()end,[22]=function()local aa,ab,ac=a(22)local ad return(
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
and aq.settings.showProfile and af.localPlayer~=nil end local function aq(ar,as)local at=af.localPlayer if not at then
return end ar.profile=ar:Create('Frame',{Name='Profile',AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),
Size=UDim2.new(1,0,0,as.footerHeight),BackgroundTransparency=1,Parent=ar.sidebar})ar.profileContainer=ar:Create('Frame',
{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,as.rowInset,0.5,0),Size=UDim2.new(1,-as.rowInset,1,0),
BackgroundTransparency=1,Parent=ar.profile})ar.profileLayout=ar:Create('UIListLayout',{Padding=UDim.new(0,10),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=ar.profileContainer})ar.profileAvatar=ar:Create(
'ImageLabel',{Name='Avatar',Image=ag.avatar(at.UserId,function(au)if ar.profileAvatar and not ar.unloaded then ag.
assign(ar.profileAvatar,'Image',au)end end),Size=UDim2.fromOffset(as.avatarSize,as.avatarSize),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=ar.profileContainer})ar:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=ar.profileAvatar})ar.profileLabels=ar:Create('Frame',{Size=UDim2.
fromOffset(50,as.avatarSize),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=ar.
profileContainer})ar:Create('UIListLayout',{Padding=UDim.new(0,2),FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=ar.profileLabels})ar.profileName=ar:Create('TextLabel',{Text=at.DisplayName,Size=UDim2.
fromOffset(50,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTransparency=1,Parent=ar.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})ar.
profileSubtitle=ar:Create('TextLabel',{Text='',Size=UDim2.fromOffset(50,14),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,Visible=false,
TextTransparency=1,Parent=ar.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})end function ak.build(ar,as)ar.
sidebar=ar:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),Size=UDim2.new(0,as
.railWidth,1,-as.chromeHeight),BackgroundTransparency=1,Visible=false,Parent=ar.main})ar.tabList=ar:Create(
'ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1
,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,Parent=ar.sidebar})ar:Create('UIPadding',{PaddingTop
=UDim.new(0,as.railPadding),PaddingBottom=UDim.new(0,as.railPadding),Parent=ar.tabList})ar.tabListLayout=ar:Create(
'UIListLayout',{Padding=UDim.new(0,as.rowSpacing),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=ar
.tabList})aq(ar,as)ak.reflowProfile(ar)end function ak.reflowProfile(ar)local as,at=ar.layout,ap(ar)if ar.profile then
ar.profile.Visible=at end ar.tabList.Size=UDim2.new(1,0,1,if at then-as.footerHeight else 0)end function ak.applyWidth(
ar,as)local at=ar.layout ar.sidebar.Size=UDim2.new(0,as,1,-at.chromeHeight)ar.elements.Size=UDim2.new(1,-as,1,-at.
chromeHeight)ar.bottomFade.Size=UDim2.new(1,-as,at.fadeSize.Y.Scale,at.fadeSize.Y.Offset)aj.railWidth(ar,as)local au=as<
(at.railWidth::number)for av,b in ar.tabs do if not b.neglectSelector then ai.setRowCollapsed(b,au,at)end end if ar.
profileContainer then ar.profileContainer.Position=UDim2.new(0,if au then 0 else at.rowInset,0.5,0)ar.profileContainer.
Size=UDim2.new(1,if au then 0 else-at.rowInset,1,0)ar.profileLayout.HorizontalAlignment=if au then Enum.
HorizontalAlignment.Center else Enum.HorizontalAlignment.Left ar.profileLabels.Visible=not au end end function ak.
setProfileShown(ar,as,at)if not ar.profile or not ar.profile.Visible then return end local au={[ar.profileAvatar]={
ImageTransparency=if as then 0 else 1,BackgroundTransparency=if as then an else 1},[ar.profileName]={TextTransparency=if
as then al else 1},[ar.profileSubtitle]={TextTransparency=if as then am else 1}}for av,b in au do if at then af.
tweenService:Create(av,at,b):Play()else for c,d in b do av[c]=d end end end end function ak.setProfileEnabled(ar,as)if
not ar.profile then ar.settings.showProfile=as return end if as then ar.settings.showProfile=true ak.reflowProfile(ar)ak
.setProfileShown(ar,true,ao)return end ak.setProfileShown(ar,false,ao)task.delay(ao.Time,function()if ar.unloaded or ar.
settings.showProfile then return end ak.reflowProfile(ar)end)ar.settings.showProfile=false end function ak.setSubtitle(
ar,as)if not ar.profileSubtitle then return end local at=if type(as)=='string'and as~=''then ah.resolve(as)else nil ar.
profileSubtitle.Text=at or''ar.profileSubtitle.Visible=at~=nil end return ak end)()end,[24]=function()local aa,ab,ac=a(
24)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.Parent.Parent.utility local ag,ah
,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.
HapticEngine)local function an(ao)local ap=0 while ap<6 do local aq=ao*10^ap if math.abs(aq-math.round(aq))<1e-9 then
break end ap+=1 end return ap end local function ao(ap,aq,ar)local as=ap[1]+math.round((ar-ap[1])/aq)*aq return math.
clamp(as,ap[1],ap[2])end local ap,aq,ar,as,at,au=TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),440,Vector2.new(35,20),Vector2.new(41,22)local av=math.ceil(at.X/2)local function b(c:number):
UDim2 return UDim2.new(c,math.round(av*(1-2*c)),1,0)end local function c():UDim2 return UDim2.new(1,0,0.5,0)end
local function d(e:number,f:number,g:number):number return math.clamp((e-f)/g,0,1)end function ae.new(e,f)f=if typeof(f)
=='table'then f else{}local g=setmetatable({tab=assert(e,'Missing argument #1 (Tab expected)'),window=e.window,name=f.
name or f.Name or'Slider',icon=f.icon or f.Icon,description=f.description or f.Description,forgetState=f.forgetState or
f.ForgetState or e.forgetState,range=f.range or f.Range or{0,100},increment=f.increment or f.Increment or 1,suffix=f.
suffix or f.Suffix or'',callback=f.callback or f.Callback or function()end,dragging=false,minimal=f.minimal or f.Minimal
or false,_handleWidth=at.X},ae)assert(typeof(g.range)=='table'and typeof(g.range[1])=='number'and typeof(g.range[2])==
'number','A slider range needs two numbers, like { 0, 100 }.')if g.range[1]>g.range[2]then g.range={g.range[2],g.range[1
]}end if g.increment<=0 then g.increment=1 end g.value=if(f.value or f.Value)~=nil then(f.value or f.Value)elseif(f.
currentValue or f.CurrentValue)~=nil then(f.currentValue or f.CurrentValue)else g.range[1]g.value=ao(g.range,g.increment
,g.value)g._decimals=an(g.increment)g.flag=f.flag or f.Flag or(not g.forgetState and ah.deriveFlagFromName(g.name)or nil
)g.window:_registerControl(g)g.main=g.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=g.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=g.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})g.stroke=g.window:StyleElementBody(g.main)g._lastValue=g.value if not g.minimal then g:
_buildLabel()end g.track=g.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=g.main},{BackgroundColor3='SliderBackground'}
)g.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=g.track})g.progress=g.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=g.track})g.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=g.progress})g.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=g.progress},{Color={
'SliderProgress',ah.toColorSequence}})g.progressGlow=g.window:CreateGlow(g.progress,'AccentColor',20,1)g.handle=g.window
:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=c(),Size=UDim2.fromOffset(at.X,at.Y),BorderSizePixel=0,ZIndex
=50,BackgroundTransparency=1,Parent=g.progress},{BackgroundColor3='SliderHandle'})g.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=g.handle})g.handleGlow=g.window:CreateGlow(g.handle,Color3.fromRGB(255,255,255),10,1)g
.handleStroke=g.window:Create('UIStroke',{Transparency=1,Parent=g.handle},{Color='SliderStroke'})g.interact=g.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=g.
track})g.window:ConnectFor(g,g.main.MouseEnter,function()if not g.window:_interactive()then return end ag.tweenService:
Create(g.track,ap,{BackgroundColor3=g.window.theme.SliderBackgroundHover}):Play()end)g.window:ConnectFor(g,g.main.
MouseLeave,function()ag.tweenService:Create(g.track,ap,{BackgroundColor3=g.window.theme.SliderBackground}):Play()end)g.
window:ConnectFor(g,g.interact.InputBegan,function(h)if h.UserInputType==Enum.UserInputType.MouseButton1 or h.
UserInputType==Enum.UserInputType.Touch then am.click()g.dragging=true g:_setHeld(true)g:_updateFromMouse()if g.
_dragConnection then g._dragConnection:Disconnect()g._dragConnection=nil end g._dragConnection=ag.runService.
RenderStepped:Connect(function()if g.window.unloaded or not g.dragging then if g._dragConnection then g._dragConnection:
Disconnect()g._dragConnection=nil end return end g:_updateFromMouse()end)end end)g.window:ConnectFor(g,ag.
userInputService.InputEnded,function(h)if h.UserInputType==Enum.UserInputType.MouseButton1 or h.UserInputType==Enum.
UserInputType.Touch then g:_endDrag()end end)g.window:ConnectFor(g,ag.userInputService.WindowFocusReleased,function()g:
_endDrag()end)if g.description and not g.minimal then g.descriptor=ac(ab.Parent.descriptor).new(g.tab,{description=g.
description})end g.window:ConnectFor(g,g.main:GetPropertyChangedSignal'AbsoluteSize',function()if g.window.animating or(
g.window.hidden and g.window.hasShownOnce)then return end g:_applyLayout()end)g:_applyLayout()if g.minimal then g.main.
Size=UDim2.new(1,-20,0,41)g.track.AnchorPoint=Vector2.new(0.5,0.5)g.track.Position=UDim2.new(0.5,0,0.5,0)g.track.Size=
UDim2.new(1,-30,0,14)end g:_renderProgress()return g end function ae._buildLabel(e)e.container=e.window:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=e.main})e.containerLayout=e.window:Create('UIListLayout',{Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.container})e.
titleContainer=e.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,
Parent=e.container})e.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.titleContainer})e.
titleFlex=e.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=e.titleContainer})if e.icon then e.
iconLabel=e.window:Create('ImageLabel',{Image=e.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=e.titleContainer},{ImageColor3='ContentColor'})end e.title=
e.window:Create('TextLabel',{Text=al.t(e.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=e.titleContainer},{TextColor3='ContentColor',FontFace='Font'})e.window:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=e.title})e.valueHost=e.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=e.container})e.valueOdo=ai.new(e.window,e.
valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})e.valueOdo:snap(e:_format(e
.value))end function ae._setMainHeight(e,f)if e._widthManaged then e.main.Size=UDim2.new(e.main.Size.X.Scale,e.main.Size
.X.Offset,0,f)else e.main.Size=UDim2.new(1,-20,0,f)end end function ae._applyLayout(e)if e.minimal then return end local
f=e.main.AbsoluteSize.X local g=if f>0 and f<as then'narrow'else'wide'if e._layoutMode==g then return end e._layoutMode=
g if g=='narrow'then e:_setMainHeight(70)e.container.AnchorPoint=Vector2.new(0,0)e.container.Position=UDim2.new(0,20,0,
14)e.container.Size=UDim2.new(1,-40,0,16)e.containerLayout.FillDirection=Enum.FillDirection.Horizontal e.titleFlex.
FlexMode=Enum.UIFlexMode.Fill e.valueHost.AutomaticSize=Enum.AutomaticSize.X e.valueHost.Size=UDim2.new(0,0,0,16)e.track
.AnchorPoint=Vector2.new(0.5,1)e.track.Position=UDim2.new(0.5,0,1,-14)e.track.Size=UDim2.new(1,-30,0,14)else e:
_setMainHeight(65)e.container.AnchorPoint=Vector2.new(0,0.5)e.container.Position=UDim2.new(0,20,0.5,0)e.container.Size=
UDim2.new(0,170,0,33)e.containerLayout.FillDirection=Enum.FillDirection.Vertical e.titleFlex.FlexMode=Enum.UIFlexMode.
None e.valueHost.AutomaticSize=Enum.AutomaticSize.None e.valueHost.Size=UDim2.new(1,0,0,16)e.track.AnchorPoint=Vector2.
new(1,0.5)e.track.Position=UDim2.new(1,-15,0.5,0)e.track.Size=UDim2.new(0,222,0,14)end end function ae._format(e,f)local
g=string.format('%.'..e._decimals..'f',f)if e.suffix~=''then return g..' '..e.suffix end return g end function ae.
_pillTravel(e)return math.max(e.track.AbsoluteSize.X-av*2,0)end function ae._renderProgress(e,f)local g=e.range[2]-e.
range[1]local h=if g~=0 then math.clamp((e.value-e.range[1])/g,0,1)else 0 local i=b(h)if f then ag.tweenService:Create(e
.progress,f,{Size=i}):Play()else e.progress.Size=i end end function ae._updateFromMouse(e)local f=e:_pillTravel()if f<=0
then return end local g=d(ag.userInputService:GetMouseLocation().X,e.track.AbsolutePosition.X+av,f)local h=ao(e.range,e.
increment,e.range[1]+g*(e.range[2]-e.range[1]))if h~=e.value then e.value=h if e.valueOdo then e.valueOdo:snap(e:
_format(h))end e._lastValue=h e:_renderProgress(ar)e:_fireCallback(h)end end function ae._endDrag(e)if not e.dragging
then return end e.dragging=false e:_setHeld(false)if e._dragConnection then e._dragConnection:Disconnect()e.
_dragConnection=nil end e.window:_persist(e)end function ae._setHeld(e,f)if not f then e:_fireCallback(e.value)end local
g=if f then au else at e._handleWidth=g.X ag.tweenService:Create(e.handle,aq,{Size=UDim2.fromOffset(g.X,g.Y),
BackgroundTransparency=if f then 0.7 else 0}):Play()ag.tweenService:Create(e.handleStroke,aq,{Transparency=if f then 0.6
else 1}):Play()e:_renderProgress(aq)end function ae._fireCallback(e,f)e.window:_runGuarded(e,e.callback,f,e.dragging==
true)end function ae.Set(e,f,g)f=ao(e.range,e.increment,f)e.value=f if e.valueOdo then e.valueOdo:to(e:_format(f),f>=(e.
_lastValue or f))end e._lastValue=f e:_renderProgress(ap)if not g then e:_fireCallback(f)e.window:_persist(e)end end
local e=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(f,g,h
)local i=f.window if g then i:_revealCommon(f,h)i:_reveal(f.track,{BackgroundTransparency=0},h)i:_reveal(f.progress,{
BackgroundTransparency=0},h)i:_reveal(f.handle,{BackgroundTransparency=0},h)if f.valueOdo then f.valueOdo:reveal(0.3,h)
end i:_reveal(f.progressGlow,{Transparency=math.max(0.55,i.theme.AccentGlow)},h,e)i:_reveal(f.handleGlow,{Transparency=
0.8},h,e)else i:_hideCommon(f,h)i:_reveal(f.track,{BackgroundTransparency=1},h)i:_reveal(f.progress,{
BackgroundTransparency=1},h)i:_reveal(f.handle,{BackgroundTransparency=1},h)if f.valueOdo then f.valueOdo:reveal(1,h)end
i:_reveal(f.progressGlow,{Transparency=1},h,e)i:_reveal(f.handleGlow,{Transparency=1},h,e)end end function ae.
_refreshTheme(f)ag.tweenService:Create(f.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
,{Transparency=math.max(0.55,f.window.theme.AccentGlow)}):Play()end function ae._minWidth(f)if f.minimal then return 100
end local g=40 if f.icon then g+=22 end g+=ah.textWidth(f.window.theme.Font,16,al.resolve(f.name))g+=12 g+=ah.textWidth(
f.window.theme.Font,15,f:_format(f.value))return math.max(g,160)end aj(ae)ak(ae)return ae end)()end,[25]=function()local
aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.constants),
ac(af.locale),ac(af.log)local an,ao,ap,aq=ak.statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function ar(as)return as.fill.
Keypoints[1].Value end local function as(at)if at>0 then return string.format('+%.1f%%',at)elseif at<0 then return
string.format('%.1f%%',at)else return'0%'end end local function at(au)if typeof(au)~='number'then return tostring(au)end
local av=math.round(math.abs(au))local b=string.format('%.0f',av)local c=b:reverse():gsub('%d%d%d','%0,'):reverse()if c:
sub(1,1)==','then c=c:sub(2)end return if au<0 and av~=0 then'-'..c else c end local function au(av)local b=math.round(
av)if b>0 then return'+'..at(b)elseif b<0 then return at(b)else return'0'end end function ae.new(av,b)b=if typeof(b)==
'table'then b else{}local c=setmetatable({tab=assert(av,'Missing argument #1 (Tab expected)'),window=av.window,name=b.
name or b.Name or'Statistic',icon=b.icon or b.Icon,description=b.description or b.Description,value=if(b.value or b.
Value)~=nil then(b.value or b.Value)else 0,_hasValue=(b.value or b.Value)~=nil,numberEasing=if(b.numberEasing~=nil)then
b.numberEasing elseif b.NumberEasing~=nil then b.NumberEasing else true,changeMode=b.changeMode or b.ChangeMode or
'percentage',changeBaseline=b.changeBaseline or b.ChangeBaseline or'previous',prefix=b.prefix or b.Prefix or'',suffix=b.
suffix or b.Suffix or'',compact=b.compact or b.Compact or av.compact or false,display=(b.display or b.Display or'value')
,_initialValue=if(b.value or b.Value)~=nil then(b.value or b.Value)else nil,_lastChange=0},ae)if c.compact then c:
_buildCompact()else c:_buildFull()end if c.description then if c.compact then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
c.name}'.`)else c.descriptor=ac(ab.Parent.descriptor).new(c.tab,{description=c.description})end end return c end
function ae._buildFull(av)local b=av.window av.main=b:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=
av.name,ZIndex=5,BackgroundTransparency=1,Parent=av.tab.tabPage},{BackgroundColor3='StatBackground',
BackgroundTransparency='ElementTransparency'})b:Create('UICorner',{Parent=av.main},{CornerRadius='ElementCornerRadius'})
av.stroke=b:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=av.main},{Transparency=
'ElementStrokeTransparency'})av.strokeGradient=b:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.
neutral.stroke,Transparency=ao,Parent=av.stroke})av.titleContainer=b:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position
=UDim2.fromOffset(20,15),BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=av.main})av.
gradientContainer=b:Create('Frame',{Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,
BackgroundTransparency=1,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=5,Parent=av.main})av.glow=b:CreateGlow(av.
main,ar(an.neutral),13,1)av.title=b:Create('TextLabel',{Text=al.t(av.name),Size=UDim2.fromOffset(300,19),BorderSizePixel
=0,BackgroundTransparency=1,TextSize=19,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10
,TextTransparency=1,Parent=av.titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})av.mainGradient=b:Create(
'UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=ao,Parent=av.gradientContainer})b:
Create('UICorner',{Parent=av.gradientContainer},{CornerRadius='ElementCornerRadius'})if av.icon then av.iconLabel=b:
Create('ImageLabel',{Image=av.icon,Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,
ImageTransparency=1,Parent=av.titleContainer},{ImageColor3='ContentColor'})end av.containerLayout=b:Create(
'UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
av.titleContainer})av.valueHost=b:Create('Frame',{AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2
.fromOffset(200,20),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=av.main})av.changeHost=b:Create('Frame',
{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=av.main})av.valueOdo=ai.new(b,av.valueHost,{textSize=20,alignment=Enum.
HorizontalAlignment.Left,transparency=1})av.valueOdo:snap(av:_formatValue(av.value))av.changeOdo=ai.new(b,av.changeHost,
{textSize=15,alignment=Enum.HorizontalAlignment.Right,transparency=1})av.changeOdo:snap(av:_formatChange(0))av.
_accentGradients={av.strokeGradient,av.mainGradient}end function ae._buildCompact(av)local b,c=av.window,av.tab.compact
or false av.main=b:Create('Frame',{Name=av.name,Size=if c then UDim2.fromOffset(0,ap)else UDim2.new(1,-20,0,ap),
AutomaticSize=if c then Enum.AutomaticSize.X else Enum.AutomaticSize.None,ClipsDescendants=true,BorderSizePixel=0,ZIndex
=5,BackgroundTransparency=1,Parent=av.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})b:Create('UICorner',{Parent=av.main},{CornerRadius='ElementCornerRadius'})av.stroke=b:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=av.main},{Transparency='ElementStrokeTransparency'})
av.strokeGradient=b:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.stroke,Transparency=ao,
Parent=av.stroke})if c then b:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=av.main})end b:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=av.main})av.card=b:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,
Size=UDim2.fromOffset(0,ap),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=av.main})b:Create('UICorner',{Parent=av.card},{CornerRadius='ElementCornerRadius'})av.
mainGradient=b:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=ao,Parent=av
.card})b:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=av.card})b:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=av.card})av.titleContainer=b:Create(
'Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=0,ZIndex=6,Parent=av.card})b:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=av.titleContainer})
b:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
av.titleContainer})if av.icon then av.iconLabel=b:Create('ImageLabel',{Image=av.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=av.titleContainer},{
ImageColor3='ContentColor'})end av.title=b:Create('TextLabel',{Text=al.t(av.name),Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=av.
titleContainer},{TextColor3='ContentColor',FontFace='Font'})b:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=av.title})av.readoutHost=b:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=av.card})av.readoutOdo=ai.new(b,av.readoutHost,
{textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})av.readoutOdo:snap(av.display=='change'and av:
_formatChange(0)or av:_formatValue(av.value))av._accentGradients={av.strokeGradient,av.mainGradient}end function ae.
_setAccent(av,b,c)local d=an[b]av.strokeGradient.Color=d.stroke av.mainGradient.Color=d.fill if av.glow then av.glow.
Color=ar(d)end local e,f=if c==1 then 14 elseif c==-1 then-10 else 2,if c==1 then Vector2.new(0.04,0.5)elseif c==-1 then
Vector2.new(-4E-2,0.5)else Vector2.new(0,0.5)for g,h in av._accentGradients do ag.tweenService:Create(h,aq,{Rotation=e,
Offset=f}):Play()end end function ae._formatValue(av,b)return av.prefix..at(b)..av.suffix end function ae._formatChange(
av,b)if av.changeMode=='absolute'then return au(b)else return as(b)end end function ae._showValue(av,b,c,d,e)if av.
numberEasing and not e then b:to(av:_formatValue(c),c>=d)else b:snap(av:_formatValue(c))end end function ae.
_updateFullReadouts(av,b,c,d,e,f,g)av:_showValue(av.valueOdo,b,c,g)if f then av.changeOdo:snap(f)av._lastChange=0 elseif
av.numberEasing and not e then av.changeOdo:to(av:_formatChange(d),d>=av._lastChange)av._lastChange=d else av.changeOdo:
snap(av:_formatChange(d or 0))av._lastChange=d or 0 end end function ae._updateCompactReadout(av,b,c,d,e,f,g)if av.
display=='change'then if f then av.readoutOdo:snap(f)av._lastChange=0 elseif av.numberEasing and not e then av.
readoutOdo:to(av:_formatChange(d),d>=av._lastChange)av._lastChange=d else av.readoutOdo:snap(av:_formatChange(d or 0))av
._lastChange=d or 0 end else av:_showValue(av.readoutOdo,b,c,g)end end function ae.Set(av,b)assert(typeof(b)=='number',
'Statistic:Set() - value must be a number, got '..typeof(b))local c,d=av.value,not av._hasValue av.value=b av._hasValue=
true if d then av._initialValue=b end local e=if av.changeBaseline=='initial'then av._initialValue else c local f,g,h,i,
j=d or e==b if f then g=0 i='neutral'j=0 elseif e==0 then local k,l=if b>0 then'+'else'-',if av.changeMode=='percentage'
then'\u{221e}%'else'\u{221e}'h=k..l i=if b>0 then'positive'else'negative'j=if b>0 then 1 else-1 elseif av.changeMode==
'percentage'then g=((b-e)/math.abs(e))*100 j=if g>0 then 1 elseif g<0 then-1 else 0 i=if j==1 then'positive'elseif j==-1
then'negative'else'neutral'else g=b-e j=if g>0 then 1 elseif g<0 then-1 else 0 i=if j==1 then'positive'elseif j==-1 then
'negative'else'neutral'end av:_setAccent(i,j)if av.compact then av:_updateCompactReadout(b,c,g,f,h,d)else av:
_updateFullReadouts(b,c,g,f,h,d)end end function ae.ResetBaseline(av,b)local c,d,e=av.value,not av._hasValue,if typeof(b
)=='number'then b else av.value av._initialValue=e av.value=e av._hasValue=true av._lastChange=0 if av.compact then if
av.display=='change'then av.readoutOdo:snap(av:_formatChange(0))else av:_showValue(av.readoutOdo,e,c,d)end else av.
changeOdo:snap(av:_formatChange(0))av:_showValue(av.valueOdo,e,c,d)end av:_setAccent('neutral',0)end function ae.
_setShown(av,b,c)local d=av.window if av.compact then d:_reveal(av.main,{BackgroundTransparency=if b then(av.window.
theme.ElementTransparency or 0)else 1},c)d:_reveal(av.stroke,{Transparency=if b then av.window.theme.
ElementStrokeTransparency else 1},c)d:_reveal(av.card,{BackgroundTransparency=if b then 0 else 1},c)d:_reveal(av.title,{
TextTransparency=if b then 0 else 1},c)if av.iconLabel then d:_reveal(av.iconLabel,{ImageTransparency=if b then 0 else 1
},c)end av.readoutOdo:reveal(if b then 0 else 1,c)return end if b then d:_revealCommon(av,c)d:_reveal(av.
gradientContainer,{BackgroundTransparency=0},c)d:_reveal(av.glow,{Transparency=0.82},c)av.valueOdo:reveal(0,c)av.
changeOdo:reveal(0,c)else d:_hideCommon(av,c)d:_reveal(av.gradientContainer,{BackgroundTransparency=1},c)d:_reveal(av.
glow,{Transparency=1},c)av.valueOdo:reveal(1,c)av.changeOdo:reveal(1,c)end end function ae._minWidth(av)local b=40 if av
.icon then b+=26 end b+=ah.textWidth(av.window.theme.Font,16,al.resolve(av.name))local c=if av.display=='change'then av:
_formatChange(0)else av:_formatValue(av.value)b+=ah.textWidth(av.window.theme.Font,17,c)return b end aj(ae)return ae end
)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=
ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an=ac(af.variables),ac(af.constants),ac(af.HapticEngine),ac(af.log),
ac(af.columns),ac(ab.Parent.search),ac(ab.Parent.tabSelector),ac(ab.Parent.column)local function ao(ap,aq)for ar,as in
aq do if as.__type=='Group'then ao(ap,as.elements)else ap:_unregisterControl(as)end if as.connections then for at,au in
as.connections do ap:Disconnect(au)end as.connections=nil end if as._dragConnection then as._dragConnection:Disconnect()
as._dragConnection=nil end if ap._recordingKeybind==as then ap._recordingKeybind=nil end if as._outsideClickConn then ap
:Disconnect(as._outsideClickConn)as._outsideClickConn=nil end end end local ap,aq=TweenInfo.new(0.4,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(ar,as
)as=if typeof(as)=='table'then as else{}local at=setmetatable({window=assert(ar,'Missing argument #1 (Window expected)')
,name=as.name or as.Name,icon=as.icon or as.Icon,neglectSelector=as.neglectSelector or as.NeglectSelector or false,
customOrder=as.customOrder or as.CustomOrder or 0,forgetState=as.forgetState or as.ForgetState or false,elements={},
connections={}},ae)assert(at.name or at.icon,'A tab needs a name or an icon.')if not at.neglectSelector then am.build(at
,at.window.layout)end at.tabPage=at.window:Create('ScrollingFrame',{Name=at.name,Size=UDim2.new(1,-20,1,0),Position=
UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=
Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=ah.pageScrollbar.thickness,
ScrollBarImageTransparency=ah.pageScrollbar.transparency,VerticalScrollBarInset=Enum.ScrollBarInset.None,
ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=at.customOrder or 0,Parent=at.window.elements},{
ScrollBarImageColor3='ContentColor'})at.tabPageLayout=at.window:Create('UIListLayout',{Padding=UDim.new(0,7),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=at.tabPage})at.window:Create('UIPadding',{
PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=at.tabPage})at.columnsRow=at.window:Create('Frame',{Name=
'Columns',BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.fromScale(1,0),Parent
=at.tabPage})at.columnsLayout=at.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.
LayoutOrder,Parent=at.columnsRow})at.Left=an.new(at,'Left')at.Right=an.new(at,'Right')at.left=at.Left at.right=at.Right
at:_layoutColumns()if not at.neglectSelector then table.insert(at.connections,at.window:Connect(at.topbarItemInteract.
MouseButton1Click,function()ai.click()at:Select()end))table.insert(at.connections,at.window:Connect(at.
topbarItemInteract.MouseEnter,function()if not at.window:_interactive()then return end if at.window.selectedTab~=at then
at:_applyVisual('hover',aq)at:_spinGradients()end end))table.insert(at.connections,at.window:Connect(at.
topbarItemInteract.MouseLeave,function()if at.window.selectedTab~=at then at:_applyVisual('unselected',aq)end end))end
return at end function ae._applyVisual(ar,as,at)if ar.neglectSelector or not ar.topbarItem then return end local au=am.
states[ar.window.layout.mode][as]if not au then return end am.applyVisual(ar,au,at)end function ae._spinGradients(ar)if
ar.neglectSelector then return end local as=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)for at,au
in{ar.topbarItemGradient,ar.topbarItemStrokeGradient}do au.Rotation=-270 ag.tweenService:Create(au,as,{Rotation=90}):
Play()end end function ae.Select(ar,as)if ar.window._searching then al.close(ar.window,{showTabs=true,jumpTo=false})end
ar.window.selectedTab=ar ar.window:_jumpTo(ar.tabPage)local at=as or not ar.window:_interactive()if not ar.
neglectSelector and not at then ar:_applyVisual('selected',ap)end for au,av in ar.window.tabs do if av~=ar.window.
selectedTab then av:Deselect(at)end end if ar~=ar.window.rfSettings and ar.window.settingsAction and not at then ag.
tweenService:Create(ar.window.settingsAction.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{ImageTransparency=0.6}):Play()end end function ae.Deselect(ar,as)if not ar.neglectSelector and not as then ar:
_applyVisual('unselected',ap)end end function ae.GetColumn(ar,as)local at=ak.resolveSide(as)if not at then aj.warn(`Rayfield: unknown column '{
tostring(as)}', using the left one. Use "Left" or "Right".`)at='Left'end return if at=='Right'then ar.Right else ar.Left
end function ae._columnFor(ar,as)if typeof(as)~='table'then return ar.Left end return ar:GetColumn(as.side or as.Side or
as.column or as.Column)end function ae._layoutColumns(ar)local as,at=ar.Left,ar.Right if not as or not at or not ar.
columnsRow then return end local au=ar.window local av=if au.size then ak.pageWidth(au.size.X.Offset,au.layout)else 0
local b,c,d=ak.shouldStack(av),#as.elements>0,#at.elements>0 as.main.Visible=c at.main.Visible=d ar.stacked=b if b or
not(c and d)then ar.columnsLayout.FillDirection=Enum.FillDirection.Vertical ar.columnsLayout.Padding=UDim.new(0,if c and
d then 20 else 0)as.main.Size=UDim2.fromScale(1,0)at.main.Size=UDim2.fromScale(1,0)else ar.columnsLayout.FillDirection=
Enum.FillDirection.Horizontal ar.columnsLayout.Padding=UDim.new(0,-ak.overlap)as.main.Size=UDim2.new(0.5,ak.overlap/2,0,
0)at.main.Size=UDim2.new(0.5,ak.overlap/2,0,0)end end function ae.CreateButton(ar,as)return ar:_columnFor(as):
CreateButton(as)end function ae.CreateToggle(ar,as)return ar:_columnFor(as):CreateToggle(as)end function ae.CreateSwitch
(ar,as)return ar:CreateToggle(as)end function ae.CreateSection(ar,as)return ar:_columnFor(as):CreateSection(as)end
function ae.CreateText(ar,as)return ar:_columnFor(as):CreateText(as)end function ae.CreateDivider(ar,as)return ar:
_columnFor(as):CreateDivider(as)end function ae.CreateProgress(ar,as)return ar:_columnFor(as):CreateProgress(as)end
function ae.CreateConsole(ar,as)return ar:_columnFor(as):CreateConsole(as)end function ae.CreateChat(ar,as)return ar:
_columnFor(as):CreateChat(as)end function ae.CreateStat(ar,as)return ar:_columnFor(as):CreateStat(as)end function ae.
CreateSlider(ar,as)return ar:_columnFor(as):CreateSlider(as)end function ae.CreateDropdown(ar,as)return ar:_columnFor(as
):CreateDropdown(as)end function ae.CreateInput(ar,as)return ar:_columnFor(as):CreateInput(as)end function ae.
CreateKeybind(ar,as)return ar:_columnFor(as):CreateKeybind(as)end function ae.CreateColorPicker(ar,as)return ar:
_columnFor(as):CreateColorPicker(as)end function ae.CreateGroup(ar,as)return ar:_columnFor(as):CreateGroup(as)end
function ae.Remove(ar)local as=ar.window if as._searching then al.close(as,{showTabs=true,jumpTo=as.selectedTab and as.
selectedTab.tabPage})end local at=table.find(as.tabs,ar)if at then table.remove(as.tabs,at)end if as.selectedTab==ar
then as.selectedTab=nil for au,av in ipairs(as.tabs)do if not av.neglectSelector then av:Select()break end end end ao(as
,ar.elements)for au,av in ar.connections do as:Disconnect(av)end ar.connections={}if ar.topbarItem then as:
DestroySubtree(ar.topbarItem)end if ar.tabPage then as:DestroySubtree(ar.tabPage)end ar.topbarItem=nil ar.tabPage=nil ar
.columnsRow=nil ar.elements={}for au,av in{ar.Left,ar.Right}do av.elements={}end end return ae end)()end,[27]=function()
local aa,ab,ac=a(27)local ad return(function(...)local ae={}ae.__index=ae ae.__type='TabSection'local af,ag,ah,ai,aj=ac(
ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.utility.log),20,6,3 local function ak(al)for am,an in al.tabs do if
not an.neglectSelector then return true end end return#al.tabSections>0 end function ae.new(al,am)am=if typeof(am)==
'table'then am else{}local an=setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),name=am.name or am
.Name or'Section',icon=am.icon or am.Icon},ae)if al.layout.mode~='sidebar'then if not al._warnedTabSection then al.
_warnedTabSection=true ag.warn
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
Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,b,c,d,e,f,g,h,i=ac(af.variables),ac(af.
functions),ac(af.constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.
new(0.5,0,0.5,-180),UDim2.new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function j(k)return math.clamp(#k*0.06+3,3,9)
end local function k(l)if type(l)=='number'then return'rbxassetid://'..tostring(l)end return l end function ae.new(l,m,n
)m=if typeof(m)=='table'then m else{}local o=setmetatable({window=assert(l,'Missing argument #1 (Window expected)'),
title=m.title or m.Title or'',subtitle=m.subtitle or m.Subtitle,icon=m.icon or m.Icon,avatar=m.avatar or m.Avatar,
minWidth=m.minWidth or m.MinWidth,subtitleAbove=m.subtitleAbove or m.SubtitleAbove or false,position=m.position or'Top',
_hovered=false,_dismissed=false},ae)o.duration=m.duration or m.Duration or j(o.title..(o.subtitle or''))local p=o.avatar
~=nil and o.avatar~=0 local q=p or(o.icon~=nil and o.icon~=0 and o.icon~='')o._iconImage=if p then aj.avatar(o.avatar,
function(r)if o.iconLabel and not o._dismissed and o.main.Parent then aj.assign(o.iconLabel,'Image',r)end end)elseif q
then k(o.icon)else nil o._iconSize=if p then ar else aq o._leftPad=if p then au else as o._rightPad=if p then av else at
o._minWidth=math.clamp(o.minWidth or 0,d,e)local r=o.subtitle~=nil and o.subtitle~=''o.main=o.window:Create('Frame',{
Name='Toast',BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=n or o.
window.toasts})o.window:Create('UIPadding',{PaddingTop=UDim.new(0,c),Parent=o.main})o.body=o.window:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=if o.position=='Bottom'then h else g,
AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=o.
main})o.window:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=o.body},{Color={'WindowColor',ah.
toColorSequence}})o.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=o.body})o.stroke=o.window:Create(
'UIStroke',{Transparency=1,Parent=o.body},{Color='SurfaceStroke'})o.shadow=o.window:CreateGlow(o.body,'ShadowColor',20,1
)o.window:Create('UIPadding',{PaddingLeft=UDim.new(0,o._leftPad),PaddingRight=UDim.new(0,o._rightPad),Parent=o.body})o.
window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.
Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,b),
Parent=o.body})if q then o.iconLabel=o.window:Create('ImageLabel',{Image=o._iconImage,Size=UDim2.fromOffset(o._iconSize,
o._iconSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,
BackgroundTransparency=1,ImageTransparency=1,Parent=o.body},if p then nil else{ImageColor3='ContentColor'})o.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=o.iconLabel})end o.container=o.window:Create('Frame',{AutomaticSize
=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,r and 32 or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,
ZIndex=ai.zIndex.toastContent,Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=o.
container})o.titleLabel=o.window:Create('TextLabel',{Text=o.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,16),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if o.
subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=o.container},{TextColor3=
'ContentColor',FontFace='TitleFont'})if r then o.subtitleLabel=o.window:Create('TextLabel',{Text=o.subtitle,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=if o.subtitleAbove then 1 else 2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent
=o.container},{TextColor3='ContentColor',FontFace='Font'})end o.window._toastCount=(o.window._toastCount or 0)+1 o.main.
LayoutOrder=-o.window._toastCount local s=o.window._liveToasts if not s then s={}o.window._liveToasts=s end local t=s[o.
main.Parent]if not t then t={}s[o.main.Parent]=t end o._live=t table.insert(t,o)while#t>f do local u=table.remove(t,1)if
u and u~=o then task.spawn(u._dismiss,u)end end o._connections={o.window:Connect(o.body.MouseEnter,function()o._hovered=
true end),o.window:Connect(o.body.MouseLeave,function()o._hovered=false end),o.window:Connect(o.body.InputBegan,function
(u)if u.UserInputType==Enum.UserInputType.MouseButton1 or u.UserInputType==Enum.UserInputType.Touch then o:_dismiss()end
end)}task.spawn(function()o:_show()end)return o end function ae._measure(l)local m,n=ah.textWidth(l.window.theme.
TitleFont,16,l.title),if l.subtitleLabel then ah.textWidth(l.window.theme.Font,14,l.subtitle)else 0 local o,p=math.max(m
,n),if l.iconLabel then l._leftPad+l._iconSize+b else l._leftPad local q=math.clamp(p+o+l._rightPad,l._minWidth,e)if p+o
+l._rightPad>e then local r=e-p-l._rightPad for s,t in{l.titleLabel,l.subtitleLabel}do if t then t.AutomaticSize=Enum.
AutomaticSize.None t.TextTruncate=Enum.TextTruncate.AtEnd t.Size=UDim2.fromOffset(r,t.Size.Y.Offset)end end end local r=
if l.subtitleLabel then 31 else 16 local s=math.max(r,if l.iconLabel then l._iconSize else 0)+18 return q,s end function
ae._show(l)if not l.main.Parent then return end ak.notify()local m,n=l:_measure()if l._dismissed or not l.main.Parent
then return end l.main.Size=UDim2.new(0,m,0,0)ag.tweenService:Create(l.main,am,{Size=UDim2.new(0,m,0,n+c)}):Play()ag.
tweenService:Create(l.body,al,{Position=i}):Play()ag.tweenService:Create(l.body,an,{BackgroundTransparency=0}):Play()ag.
tweenService:Create(l.stroke,an,{Transparency=0.9}):Play()ag.tweenService:Create(l.shadow,ao,{Transparency=0.6}):Play()
ag.tweenService:Create(l.titleLabel,ao,{TextTransparency=0}):Play()task.wait(0.05)if l._dismissed or not l.main.Parent
then return end if l.iconLabel then ag.tweenService:Create(l.iconLabel,ao,{BackgroundTransparency=0.95}):Play()ag.
tweenService:Create(l.iconLabel,ao,{ImageTransparency=0}):Play()end task.wait(0.05)if l._dismissed or not l.main.Parent
then return end if l.subtitleLabel then ag.tweenService:Create(l.subtitleLabel,ao,{TextTransparency=0.5}):Play()end
local o=0 while o<l.duration and not l._dismissed and l.main.Parent do local p=task.wait()if not l._hovered then o+=p
end end l:_dismiss()end function ae._dismiss(l)if l._dismissed then return end l._dismissed=true local m=l._live local n
=m and table.find(m,l)if m and n then table.remove(m,n)end if not l.main.Parent then return end ag.tweenService:Create(l
.body,an,{BackgroundTransparency=1}):Play()ag.tweenService:Create(l.stroke,an,{Transparency=1}):Play()ag.tweenService:
Create(l.shadow,ao,{Transparency=1}):Play()ag.tweenService:Create(l.titleLabel,ao,{TextTransparency=1}):Play()if l.
subtitleLabel then ag.tweenService:Create(l.subtitleLabel,ao,{TextTransparency=1}):Play()end if l.iconLabel then ag.
tweenService:Create(l.iconLabel,ao,{ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(l.
body,ap,{Size=UDim2.new(1,-60,1,0)}):Play()local o=ag.tweenService:Create(l.main,ap,{Size=UDim2.new(0,l.main.Size.X.
Offset,0,0)})o:Play()o.Completed:Wait()if not l.main.Parent then return end for p,q in l._connections do l.window:
Disconnect(q)end l.window:DestroySubtree(l.main)end return ae end)()end,[32]=function()local aa,ab,ac=a(32)local ad
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
ac(ab.Parent.sidebar),ac(ae.variables),ab.Parent.Parent.themes,{}at.__index=at local au,av,b,c,d=TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.new(0.5,0,0,20)
,UDim2.new(0.5,0,0,12)local e,f,g,h,i,j,k,l,m=UDim2.new(0.5,0,0,c.Y.Offset+av.Y.Offset+12),TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2 local function n(o,p):(UDim2,number)local q=ar.
workspace.CurrentCamera local r=q and q.ViewportSize local s=p or am.scaleFor(r,o)return am.fit(if r then r/s else nil,o
),s end local o,p={'TopLeftRadius','TopRightRadius','BottomLeftRadius','BottomRightRadius'},(function()return(pcall(
function()local o=Instance.new'UICorner'o.TopLeftRadius=UDim.new(0,1)o:Destroy()end))end)()local function q(r)return if
r then an.sidebar else an.top end local r={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,
TabBackground=true,TabStroke=true,SliderProgress=true}local function s(t,u)if r[t]and typeof(u)=='Color3'then return
ColorSequence.new(u)end return u end local function t(u)return if typeof(u)=='ColorSequence'then u.Keypoints[1].Value
else u end local function u(v,w)local x=v._toastsTop if not x then return end local y=if v._collapsedShown then e else d
if not w or x.Position==y then x.Position=y return end ar.tweenService:Create(x,f,{Position=y}):Play()end local function
v(w,x)local y=0.299*w.R+0.587*w.G+0.114*w.B local z=if y>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return w:Lerp(z
,x)end local function w(x,y)if y.ElementGradient then local z=t(x.ElementGradient)if y.ElementStroke==nil then x.
ElementStroke=v(z,0.28)end if y.ElementStrokeGradient==nil then x.ElementStrokeGradient=ColorSequence.new(v(z,0.4))end
if y.ElementStrokeHover==nil then x.ElementStrokeHover=v(z,0.52)end end if y.TabBackground and y.TabStroke==nil then x.
TabStroke=ColorSequence.new(v(t(x.TabBackground),0.4))end end local function x(y)if typeof(y)~='string'then return nil
end for z,A in ai.builtInThemes do if string.lower(A)==string.lower(y)then return A end end return nil end
local function y(z)if typeof(z)=='table'then return z elseif typeof(z)=='string'then local A=as:FindFirstChild(string.
lower(z))if A then return ac(A)end ak.warn("Rayfield: unknown theme '"..z.."', using default")elseif z~=nil then ak.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(as.default)end
local function z(A)local B,C=table.clone(ac(as.default)),y(A)for D,E in C do B[D]=s(D,E)end if typeof(A)=='table'then w(
B,C)end local D=if typeof(A)=='table'then A else nil if not(D and(D.Font or D.font))then B.Font=ar.brandFont(Enum.
FontWeight.Medium)end if not(D and(D.TitleFont or D.titleFont))then B.TitleFont=ar.brandFont(Enum.FontWeight.SemiBold)
end return B end function at.new(A)A=if typeof(A)=='table'then A else{}if A.translations or A.Translations then aj.
register(A.translations or A.Translations)end if A.translator or A.Translator then aj.translator=A.translator or A.
Translator end aj.setActive(A.locale or A.Locale or aj.detect())local B=A.fallbackFont or A.FallbackFont if B then ar.
setFallbackFont(B)end local C,D=q(A.sidebarLayout or A.SidebarLayout),A.scale or A.Scale if D~=nil and(typeof(D)~=
'number'or D<=0)then ak.warn[[Rayfield: scale must be a number above 0, using automatic scaling]]D=nil end local E,F=n(C
.mode,D)local G=setmetatable({name=A.name or A.Name or'Rayfield Window',subheading=A.subtitle or A.Subtitle,layout=C,
size=E,scale=F,fixedScale=D,instances={},connections={},icon=A.icon or A.Icon,showName=A.showName or A.ShowName or
'Rayfield',showIcon=A.showIcon or A.ShowIcon or ai.icons.rayfield,showIconOnly=A.showIconOnly or A.ShowIconOnly or false
,profileText=A.profile or A.Profile,themeProperties={},_scaledSurfaces={},actions={},localeProperties={},tabs={},
tabSections={},tags={},selectedTab=nil,theme=z(A.theme or A.Theme),themeName=x(A.theme or A.Theme)or'Default',controls={
},configuration=(function()local G=A.configuration or A.Configuration if not G then return{}end return{autoSave=G.
autoSave or G.AutoSave,autoLoad=G.autoLoad or G.AutoLoad,fileName=G.fileName or G.FileName,customFolder=G.customFolder
or G.CustomFolder}end)()},at)G.Flags=setmetatable({},{__index=function(H,I)local J=G.controls[I]return J and J.value end
,__newindex=function(H,I,J)local K=G.controls[I]if not K then ak.warn("Rayfield: no flag '"..tostring(I).."' to set")
return end K:Set(J)end,__iter=function()local H return function()local I H,I=next(G.controls,H)if H then return H,I.
value end return nil end end})G.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast
=true,haptics=true,showProfile=true,theme=nil}G.screenGui=G:Create('ScreenGui',{Name=ar.httpService:GenerateGUID(false),
IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.
ZIndexBehavior.Global,Parent=ar.guiContainer})G.main=G:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name
=G.name,ZIndex=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((G.size.X.Offset
-50),0),BackgroundTransparency=1,Visible=false,Parent=G.screenGui})G.uiScale=G:Create('UIScale',{Scale=G.scale,Parent=G.
main})G.drag=ac(ab.Parent.drag).new(G)G.windowCorner=G:Create('UICorner',{Parent=G.main},{CornerRadius='CornerRoundness'
})G.windowStroke=G:Create('UIStroke',{Transparency=1,Parent=G.main},{Color='SurfaceStroke'})G.windowGradient=G:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=G.main},{Color={'WindowColor',ag.toColorSequence}})G.
bottomFade=G:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,AnchorPoint=Vector2.new(1,1)
,Position=UDim2.fromScale(1,1),Size=G.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,BackgroundTransparency=1,Parent=G.main
})G.bottomFadeCorner=G:_roundCorners(G.bottomFade,G.layout.fadeCorners)G.bottomFadeGradient=G:Create('UIGradient',{
Rotation=270,Offset=Vector2.new(0,0.2),Transparency=G.layout.fadeTransparency,Parent=G.bottomFade},{Color={'WindowColor'
,function(H)return ColorSequence.new(ag.toColorSequence(H).Keypoints[1].Value)end}})G.topbar=G:Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,G.layout.topbarHeight),Active=true,Parent=G.main})G.topContainer=G:Create(
'Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,Parent=G.topbar})G.topContainerLayout=G:Create('UIListLayout',{Padding=UDim.
new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment
=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=G.topContainer})G.titleContainer=G:Create(
'Frame',{Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=G.topContainer})G.titleContainerLayout=G:Create(
'UIListLayout',{Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=G.titleContainer})if G.name then G.title=G:Create('TextLabel',{Text=
aj.t(G.name),FontFace=ar.brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize
.X,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,
Parent=G.titleContainer},{FontFace='Font',TextColor3='TitlingColor'})end if G.icon then G.topbarIcon=G:Create(
'ImageLabel',{Image=G.icon,BackgroundTransparency=1,Size=UDim2.fromOffset(32,32),ImageTransparency=1,Parent=G.
topContainer},{ImageColor3='TitlingColor'})end if G.subheading then G.subtitle=G:Create('TextLabel',{Text=aj.t(G.
subheading),Size=UDim2.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=G.titleContainer},{TextColor3=
'TitlingColor',FontFace='Font'})end G.tagContainer=G:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0
,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,LayoutOrder=2,
Visible=false,Parent=G.topContainer})G.tagContainerLayout=G:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Parent=G.tagContainer})G.windowShadow=G:CreateGlow(G.main,'ShadowColor',20,1)G.elements=G:Create('Frame',{Size=UDim2.
new(1,0,1,-G.layout.chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,Parent=G.main})if G.layout.mode==
'sidebar'then G.elementsCorner=G:_roundCorners(G.elements,G.layout.cardCorners)G.elementsStroke=G:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=G.elements},{Color='SurfaceStroke'})G:Create(
'UIGradient',{Rotation=G.layout.cardStrokeRotation,Transparency=G.layout.cardStrokeTransparency,Parent=G.elementsStroke}
)end G.elementsLayout=G:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=G.layout.pageDirection,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.
EasingStyle.Exponential,TweenTime=0.4,Parent=G.elements})if G.layout.mode=='sidebar'then aq.build(G,G.layout)aq.
applyWidth(G,an.railWidthFor(G.layout,G.size.X.Offset))else G.tabList=G:Create('ScrollingFrame',{Name='Tabs',Active=true
,Size=UDim2.new(1,0,0,G.layout.tabStripHeight),Position=UDim2.new(0.5,0,0,G.layout.tabStripTop),AnchorPoint=Vector2.new(
0.5,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=G.main})G.
tabListLayout=G:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=G.tabList})G:Create('UIPadding',{PaddingLeft=UDim.new(0,22),PaddingRight=UDim.new(0,10),
Parent=G.tabList})end G.actionContainer=G:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,Parent=G.topbar})G.
actionsListLayout=G:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=G.actionContainer})G.rfSettings=G:CreateTab{name='Rayfield Settings',customOrder=1000,
neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(G,{name='Close',icon=ai.icons.close,order=1,callback=
function()G:ToggleHide()end})G.minimiseAction=ac(ab.Parent.action).new(G,{name='Minimise',icon=ai.icons.minimise,order=2
,callback=function()G:ToggleMinimise()end})G.settingsAction=ac(ab.Parent.action).new(G,{name='Settings',icon=ai.icons.
settings,order=3,linkedTab=G.rfSettings,callback=function()G.rfSettings:Select()end})ap.build(G)G:_applyRailWidth()G.
unloaded=false G.minimised=false G.hidden=true G.animating=false G._revealing=false G.hasShownOnce=false G.
_collapsedShown=false G:LoadSettings()if G.settings.theme then G:ChangeTheme(G.settings.theme)end if G.layout.mode==
'sidebar'then aq.reflowProfile(G)aq.setSubtitle(G,G.profileText)end al.setContainer(G.screenGui)al.setEnabled(G.settings
.haptics)ao.buildCollapsedFace(G)G:_bindKeybind()G:_bindMouseOverride()G:_bindTopbarDrag()G:_watchViewport()G:
_buildSettingsUI()G:_syncLiveAnimation()return G end function at._syncLiveAnimation(A)if not A.theme.LiveAnimation then
A._liveAnimating=false return end if A._liveAnimating then return end A._liveAnimating=true A._liveGeneration=(A.
_liveGeneration or 0)+1 local B=A._liveGeneration task.spawn(function()local C,D=true,TweenInfo.new(10,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)while A._liveGeneration==B and A._liveAnimating and not A.unloaded do local E=ar.
tweenService:Create(A.windowGradient,D,{Offset=Vector2.new(if C then 0.4 else-0.2,0),Rotation=(if C then 220 else 280)})
A._liveTween=E E:Play()E.Completed:Wait()C=not C end if A._liveGeneration==B then A._liveAnimating=false A._liveTween=
nil end end)end function at._builtInThemeName(A)return A.themeName end function at.ChangeTheme(A,B)A.themeName=x(B)local
C=if typeof(B)=='table'then B else z(B)for D,E in C do A.theme[D]=s(D,E)end if typeof(B)=='table'then w(A.theme,C)end
for D,E in A.themeProperties do for F,G in E do local H=if typeof(G)=='table'then G[2](A.theme[G[1] ])else A.theme[G]if
typeof(H)=='Color3'or typeof(H)=='number'then ar.tweenService:Create(D,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[F]=H}):Play()else D[F]=H end end end if A.hidden then A._themeRefreshPending=true else A:
_refreshElementThemes()end A:_syncLiveAnimation()end function at._refreshElementThemes(A)for B,C in A.tabs do for D,E in
C.elements do if E._refreshTheme then E:_refreshTheme()end end end end function at.CreateTab(A,B)assert(not A.unloaded,
'Cannot create a tab on an unloaded window.')local C=ac(ab.Parent.tab).new(A,B)table.insert(A.tabs,C)if not C.
neglectSelector then local D=true for E,F in A.tabs do if F~=C and not F.neglectSelector then D=false break end end if D
then C:Select(true)end if not A.hidden and not A.minimised then C.topbarItem.Visible=true C:_applyVisual(if A.
selectedTab==C then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end
return C end function at.CreateSection(A,B)assert(not A.unloaded,'Cannot create a section on an unloaded window.')local
C=ac(ab.Parent.tabSection).new(A,B)table.insert(A.tabSections,C)if not C.inert and not A.hidden and not A.minimised then
C:_setVisible(true)C:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return C end
function at._setTabSectionsShown(A,B,C)for D,E in A.tabSections do E:_setShown(B,C)end end function at.
_setTabSectionsVisible(A,B)for C,D in A.tabSections do D:_setVisible(B)end end function at.CreateTag(A,B)assert(not A.
unloaded,'Cannot create a tag on an unloaded window.')local C=ac(ab.Parent.tag).new(A,B)table.insert(A.tags,C)return C
end function at._registerControl(A,B)if not B.flag or B.flag==''or B.forgetState then return end local C=B.flag if A.
controls[C]then local D=2 while A.controls[C..D]do D+=1 end C=C..D ak.warn("Rayfield: duplicate config flag '"..B.flag..
"', saving this one as '"..C.."'. Set a unique flag to keep it stable across sessions.")end B.flag=C A.controls[C]=B
return C end function at._restoreLate(A,B)if not A._loadedConfig or not B.flag or B.forgetState then return end local C=
A._loading A._loading=true ah.applyTo(B,A._loadedConfig[B.flag])A._loading=C end function at._persist(A,B)if B.flag and
not B.forgetState and A.configuration.autoSave and not A._loading then task.spawn(A.Save,A)end end function at.
_unregisterControl(A,B)if B.flag and A.controls[B.flag]==B then A.controls[B.flag]=nil end end function at._keybindUsing
(A,B,C)if typeof(B)~='EnumItem'or B==Enum.KeyCode.Unknown then return nil end for D,E in A.tabs do for F,G in E.elements
do if G~=C and G.__type=='Keybind'and G.value==B then return G end end end return nil end function at.Notify(A,B)if A.
unloaded then return end if not A.notifications then A.notifications=A:Create('Frame',{Name='Notifications',Size=UDim2.
new(0,300,0,800),Position=UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=A.
screenGui})A:_scaleSurface(A.notifications)A:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=A.notifications})end return ac(ab.Parent.notification).new(A,B)end
function at.CreateNameplate(A,B)assert(not A.unloaded,'Cannot create nameplates on an unloaded window.')local C=ac(ab.
Parent.nameplate).new(A,B)A._nameplates=A._nameplates or{}table.insert(A._nameplates,C)return C end function at.Toast(A,
B)if A.unloaded then return end B=if typeof(B)=='table'then B else{}local C=B.position or B.Position or'Top'local D=
typeof(C)~='string'or C:lower()~='bottom'B.position=if D then'Top'else'Bottom'local E=if D then'_toastsTop'else
'_toastsBottom'local F=A[E]if not F then F=A:Create('Frame',{Name='Toasts',Size=UDim2.new(0,g,1,-24),Position=if D then
d else UDim2.new(0.5,0,1,-12),AnchorPoint=if D then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,
ZIndex=ai.zIndex.toast,Parent=A.screenGui})A:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=if D then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=F})A[E]=F A:_scaleSurface(F
)if D then u(A,false)end end return ac(ab.Parent.toast).new(A,B,F)end function at.Popup(A,B)if A.unloaded then return
end return ac(ab.Parent.popup).new(A,B)end function at.Hide(A)if A.animating or A.hidden then return end if A._searching
then ap.close(A,{showTabs=false,jumpTo=A.selectedTab and A.selectedTab.tabPage})end if A._recordingKeybind then A.
_recordingKeybind:_stopRecording()end A.animating=true A._revealing=true A.hidden=true A.collapsedInteract.Visible=false
if A.minimised then A.minimised=false A.minimiseAction:_setIcon(ai.icons.minimise)end A._restorePosition=A.main.Position
local B,C=A:_collapsedRect()local D,E,F,G=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.
new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ar.tweenService:Create(A.drag.
dragCosmetic,D,{Size=UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not A.hidden
then return end A.drag.drag.Visible=false end)A:_fadeSurfaces(false,D)if A.title then ar.tweenService:Create(A.title,D,{
TextTransparency=1}):Play()end if A.subtitle then ar.tweenService:Create(A.subtitle,D,{TextTransparency=1}):Play()end if
A.topbarIcon then ar.tweenService:Create(A.topbarIcon,D,{ImageTransparency=1}):Play()end for H,I in ipairs(A.
actionContainer:GetChildren())do if I:IsA'Frame'then ar.tweenService:Create(I.ImageLabel,D,{ImageTransparency=1}):Play()
end end for H,I in A.tags do I:_setShown(false,D)end for H,I in pairs(A.tabs)do if not I.neglectSelector and I.
topbarItem then I:_applyVisual('hidden',D)end end A:_setTabSectionsShown(false,D)A:_fadeSelectedElementsOut()local H=ar.
tweenService:Create(A.main,E,{Size=C,Position=B})H.Completed:Connect(function()if A.unloaded or not A.hidden then return
end A._collapsedShown=true u(A,true)A.collapsedInteract.Visible=true A.animating=false A._revealing=false end)H:Play()ar
.tweenService:Create(A.windowCorner,F,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()if not A.hidden then
return end A.topbar.Visible=false A:_setContentVisible(false)ao.setCollapsedShown(A,true,G)end)end function at.
ToggleHide(A)if A.animating then return end if A.hidden then A:Show()else A:Hide()end end function at.ToggleMinimise(A)
if A.animating or A.hidden then return end if A._searching then ap.close(A,{showTabs=true})end A.animating=true local B,
C=TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out)if A.minimised then A.minimised=false A.minimiseAction:_setIcon(ai.icons.minimise)
ar.tweenService:Create(A.main,B,{Size=A.size}):Play()A:_fadeSurfaces(true,C)ar.tweenService:Create(A.drag.drag,B,{
Position=UDim2.new(A.main.Position.X.Scale,A.main.Position.X.Offset,A.main.Position.Y.Scale,A.main.Position.Y.Offset+A:
_hang(A.size.Y.Offset))}):Play()task.delay(0.2,function()if A.minimised or A.hidden then return end A:
_setContentVisible(true)for D,E in pairs(A.tabs)do if not E.neglectSelector and E.topbarItem then E.topbarItem.Visible=
true E:_applyVisual(if A.selectedTab==E then'selected'else'unselected',C)end end A:_setTabSectionsVisible(true)A:
_setTabSectionsShown(true,C)A:_revealElements(0.035,0.4)end)task.delay(0.5,function()A.animating=false end)else A.
minimised=true A.minimiseAction:_setIcon(ai.icons.maximise)A:_fadeSelectedElementsOut()for D,E in pairs(A.tabs)do if not
E.neglectSelector and E.topbarItem then E:_applyVisual('hidden',C)end end A:_setTabSectionsShown(false,C)task.delay(0.3,
function()if not A.minimised then return end A:_setContentVisible(false)for D,E in pairs(A.tabs)do if not E.
neglectSelector and E.topbarItem then E.topbarItem.Visible=false end end A:_setTabSectionsVisible(false)end)A:
_fadeSurfaces(false,C)ar.tweenService:Create(A.main,B,{Size=UDim2.fromOffset(A.size.X.Offset,A.layout.topbarHeight)}):
Play()ar.tweenService:Create(A.drag.drag,B,{Position=UDim2.new(A.main.Position.X.Scale,A.main.Position.X.Offset,A.main.
Position.Y.Scale,A.main.Position.Y.Offset+A:_hang(A.layout.topbarHeight))}):Play()task.delay(0.5,function()A.animating=
false end)end end function at._syncDragBar(A)local B=A.drag and A.drag.drag if not B then return end local C,D=A.main.
Position,A:_hang(A.size.Y.Offset)B.Position=UDim2.new(C.X.Scale,C.X.Offset,C.Y.Scale,C.Y.Offset+D)end function at.
_clampedPosition(A,B:UDim2):UDim2 if not A.settings or not A.settings.keepOnScreen then return B end if B.X.Scale~=0 or
B.Y.Scale~=0 then return B end local C,D,E,F=A.screenGui.AbsoluteSize,A.size.X.Offset*A.scale/2,A.size.Y.Offset*A.scale/
2,8 local G,H=math.clamp(B.X.Offset,D+F,math.max(D+F,C.X-D-F)),math.clamp(B.Y.Offset,E+F,math.max(E+F,C.Y-E-F))if G==B.X
.Offset and H==B.Y.Offset then return B end return UDim2.fromOffset(G,H)end function at._clampToScreen(A)A.main.Position
=A:_clampedPosition(A.main.Position)end function at._applyWindowSize(A)if A.unloaded then return end local B,C=n(A.
layout.mode,A.fixedScale)local D=B~=A.size or C~=A.scale A.size=B A.scale=C A.uiScale.Scale=C A:_rescaleSurfaces()for E,
F in A.actions do F:_fit()end A:_applyRailWidth()if D then A:_layoutColumns()end if A.hidden or A.minimised or A.
animating or A._revealing then A._pendingResize=A._pendingResize or D return end if not D and not A._pendingResize then
return end A._pendingResize=false A.main.Size=B A:_clampToScreen()A:_syncDragBar()end function at._layoutColumns(A)for B
,C in A.tabs do C:_layoutColumns()end end function at._applyRailWidth(A)if A.layout.mode~='sidebar'then return end aq.
applyWidth(A,an.railWidthFor(A.layout,A.size.X.Offset))end function at._watchViewport(A)local B,C:RBXScriptConnection?=
false local function D()if B then return end B=true task.defer(function()B=false A:_applyWindowSize()end)end
local function E()if C then A:Disconnect(C)C=nil end local F=ar.workspace.CurrentCamera if F then C=A:Connect(F:
GetPropertyChangedSignal'ViewportSize',D)end D()end A:Connect(ar.workspace:GetPropertyChangedSignal'CurrentCamera',E)E()
local F=0 A:Connect(ar.runService.Heartbeat,function(G:number)F+=G if F<m then return end F=0 A:_applyWindowSize()end)
end function at._bindKeybind(A)A:Connect(ar.userInputService.InputBegan,function(B,C)if C or A._recordingKeybind then
return end if B.KeyCode==A.settings.toggleKeybind or B.UserInputType==A.settings.toggleKeybind then A:ToggleHide()end
end)end function at._bindMouseOverride(A)local B=ar.userInputService local function C()return A.settings.mouseOverride
and not A.hidden and not A.minimised end local function D()if not C()then return end if B:IsMouseButtonPressed(Enum.
UserInputType.MouseButton2)then return end if B.MouseBehavior~=Enum.MouseBehavior.Default then B.MouseBehavior=Enum.
MouseBehavior.Default end if not B.MouseIconEnabled then B.MouseIconEnabled=true end end A:Connect(B:
GetPropertyChangedSignal'MouseBehavior',D)A:Connect(B:GetPropertyChangedSignal'MouseIconEnabled',D)A:Connect(B.
InputEnded,function(E)if E.UserInputType==Enum.UserInputType.MouseButton2 then D()end end)A._freeMouse=D end function at
._bindTopbarDrag(A)local B,C,D,E=ar.userInputService,false,Vector2.zero,Vector2.zero if A.screenGui and A.screenGui.
IgnoreGuiInset then E=ar.guiService:GetGuiInset()end local function F()local G=B:GetMouseLocation()+D+E local H,I=G.X,G.
Y if A.settings and A.settings.keepOnScreen then local J,K,L=A.main.AbsoluteSize,A.screenGui.AbsoluteSize,8 local M,N=J.
X/2,J.Y/2 H=math.clamp(H,M+L,math.max(M+L,K.X-M-L))I=math.clamp(I,N+L,math.max(N+L,K.Y-N-L))end return UDim2.fromOffset(
H,I)end local function G(H,I)for J,K in{A.tabList,A.actionContainer}do local L,M=K.AbsolutePosition,K.AbsoluteSize if H
>=L.X and H<=L.X+M.X and I>=L.Y and I<=L.Y+M.Y then return true end end return false end A:Connect(A.topbar.InputBegan,
function(H,I)if I then return end local J=H.UserInputType.Name if J~='MouseButton1'and J~='Touch'then return end if G(H.
Position.X,H.Position.Y)then return end if not A:_interactive()then return end C=true if A.screenGui and A.screenGui.
IgnoreGuiInset then E=ar.guiService:GetGuiInset()end D=A.main.AbsolutePosition+A.main.AbsoluteSize*A.main.AnchorPoint-B:
GetMouseLocation()end)A:Connect(B.InputEnded,function(H)local I=H.UserInputType.Name if I=='MouseButton1'or I=='Touch'
then C=false end end)A:Connect(B.WindowFocusReleased,function()C=false end)A:Connect(ar.runService.RenderStepped,
function()if not C then return end if not A:_interactive()then C=false return end A.main.Position=F()if A.drag and A.
drag.drag then local H=A.main.Position A.drag.drag.Position=UDim2.new(H.X.Scale,H.X.Offset,H.Y.Scale,H.Y.Offset+A:_hang(
A.main.Size.Y.Offset))end end)end function at._buildSettingsUI(A)A.rfSettings:CreateSection{name='General'}A.rfSettings:
CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=A.settings.toggleKeybind,isMenuToggle=true,onChanged=
function(B)A.settings.toggleKeybind=B A:SaveSettings()end}A.rfSettings:CreateToggle{name='Unlock cursor while open',
description=[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=A.
settings.mouseOverride,callback=function(B)A.settings.mouseOverride=B A:SaveSettings()end}A.rfSettings:CreateToggle{name
='Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=A
.settings.welcomeToast,callback=function(B)A.settings.welcomeToast=B A:SaveSettings()end}A.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=A.settings.haptics,
callback=function(B)A.settings.haptics=B al.setEnabled(B)A:SaveSettings()end}A.rfSettings:CreateSection{name='Window'}A.
rfSettings:CreateDropdown{name='Theme',description=
[[Changes the colours of this menu. Your choice is remembered next time.]],options=ai.builtInThemes,value=A.settings.
theme or A:_builtInThemeName()or ai.builtInThemes[1],callback=function(B)if typeof(B)~='string'or B==''then return end A
.settings.theme=B A:ChangeTheme(B)A:SaveSettings()end}if A.layout.mode=='sidebar'and A.profile then A.rfSettings:
CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=A.settings.showProfile,callback=function(B)aq.setProfileEnabled(A,B)A:SaveSettings()end}end A.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=A.settings.keepOnScreen,callback=function(
B)A.settings.keepOnScreen=B A:SaveSettings()end}A.rfSettings:CreateButton{name='Reset Window Position',callback=function
()ar.tweenService:Create(A.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2
.new(0.5,0,0.5,0)}):Play()ar.tweenService:Create(A.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,A:_hang(A.size.Y.Offset))}):Play()end}if next(A.configuration)~=nil
then A.rfSettings:CreateSection{name='Configurations'}local B,C,D=(A:ListConfigs()[1])local function E()local F=A:
ListConfigs()C:Refresh(F)if B and not table.find(F,B)then B=F[1]end if B then C:Set(B,true)end end C=A.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=A:ListConfigs(),value=B,placeholder=
'No saved configurations',callback=function(F)B=F end}D=A.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local F=A.rfSettings:CreateGroup()F:CreateButton{name='Save',icon=ai.icons.config,callback=function()local G=D.
value if G==''then G=B end if not G or G==''then A:Toast{title=aj.resolve'Name your configuration first'}return end if A
:Save(G)then D:Set''B=G E()A:Toast{title=aj.resolve'Saved configuration',subtitle=G,icon=ai.icons.config}else A:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=G}end end}F:CreateButton{name='Load',callback=function()if not B
or B==''then A:Toast{title=aj.resolve'Pick a configuration to load'}return end if A:_applyNamedConfig(B)then A:Toast{
title=aj.resolve'Loaded configuration',subtitle=B}else A:Toast{title=aj.resolve"Couldn't load configuration",subtitle=B}
end end}F:CreateButton{name='Delete',callback=function()local G=B if not G or G==''then A:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if A:DeleteConfig(G)then E()A:Toast{title=aj.resolve'Deleted configuration',
subtitle=G}else A:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=G}end end}end end function at.
SetProfile(A,B)A.profileText=B aq.setSubtitle(A,B)end function at.SaveSettings(A)return ah.saveSettings(A)end function
at.LoadSettings(A)return ah.loadSettings(A)end function at._roundCorners(A,B,C)if not C or not p then return A:Create(
'UICorner',{Parent=B},{CornerRadius='CornerRoundness'})end local D,E={Parent=B},{}for F,G in o do D[G]=UDim.new(0,0)end
for F,G in C do D[G]=nil E[G]='CornerRoundness'end return A:Create('UICorner',D,E)end function at._setElementLocked(A,B,
C,D)C=C==true local E=B.locked==true if E==C and not(C and D)then return end B.locked=C if not B.lockScrim then A:
_buildLockScrim(B)end local F=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if C then B.lockScrim.
Visible=true end ar.tweenService:Create(B.lockScrim,F,{BackgroundTransparency=if C then i else 1}):Play()if not C then
task.delay(F.Time,function()if not B.locked and B.lockScrim then B.lockScrim.Visible=false end end)end local G=B.
descriptor if not G then return end if C then B._descriptionBefore=B._descriptionBefore or G.titleLabel.Text G.
titleLabel.Text=aj.resolve(D or'This element is locked.')elseif B._descriptionBefore then G.titleLabel.Text=B.
_descriptionBefore B._descriptionBefore=nil end ar.tweenService:Create(G.titleLabel,F,{TextTransparency=if C then j else
0.7}):Play()end function at._buildLockScrim(A,B)B.lockScrim=A:Create('TextButton',{Name='ElementLock',Active=true,
AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=B.main},{BackgroundColor3={'WindowColor',t}})A:Create(
'UICorner',{Parent=B.lockScrim},{CornerRadius='ElementCornerRadius'})end function at._setContentVisible(A,B)A.elements.
Visible=B A.tabList.Visible=B if A.sidebar then A.sidebar.Visible=B end end function at._fadeSurfaces(A,B,C)local D={[A.
windowShadow]={Transparency=if B then 0.6 else 1},[A.windowStroke]={Transparency=if B then 0.95 else 1},[A.bottomFade]={
BackgroundTransparency=if B then 0 else 1}}if A.elementsStroke then D[A.elements]={BackgroundTransparency=if B then A.
layout.cardTransparency else 1}D[A.elementsStroke]={Transparency=if B then 0 else 1}end for E,F in D do if C then ar.
tweenService:Create(E,C,F):Play()else for G,H in F do E[G]=H end end end aq.setProfileShown(A,B,C)end function at.
_fadeSelectedElementsOut(A)if A.selectedTab then for B,C in ipairs(A.selectedTab.elements)do C:_setShown(false,true)end
end end function at._revealElements(A,B,C)for D,E in pairs(A.tabs)do if E~=A.selectedTab then for F,G in ipairs(E.
elements)do G:_setShown(true,false)end end end local D=A.selectedTab if not D then return end local E=D.tabPage local F=
E.AbsolutePosition.Y local G,H,I=F+E.AbsoluteWindowSize.Y,table.clone(D.elements),{}for J,K in H do I[K]=J end table.
sort(H,function(J,K)local L,M=J.main.AbsolutePosition,K.main.AbsolutePosition if L.Y~=M.Y then return L.Y<M.Y end if L.X
~=M.X then return L.X<M.X end return I[J]<I[K]end)local J,K=math.floor(C/B),0 for L,M in H do local N=M.main.
AbsolutePosition.Y local O=(N+M.main.AbsoluteSize.Y)>F and N<G if O then M:_setShown(true,true)K+=1 if K<=J then task.
wait(B)end else M:_setShown(true,false)end end end function at.Show(A)if A.animating or not A.hidden then return end A.
animating=true A._revealing=true if A.configuration.autoLoad and not A._autoLoaded then A._autoLoaded=true local B,C=
pcall(A.Load,A)if not B then ak.warn('Rayfield: Failed to load configuration - '..tostring(C))end end A.hidden=false A.
minimised=false if A._themeRefreshPending then A._themeRefreshPending=false A:_refreshElementThemes()end A.
collapsedInteract.Visible=false if A._freeMouse then A._freeMouse()end if A.hasShownOnce then A:_quickRestore()else A.
hasShownOnce=true A:_firstShow()end end function at._quickRestore(A)local B=A:_clampedPosition(A._restorePosition or
UDim2.new(0.5,0,0.5,0))A._restorePosition=B local C,D,E=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)ao.setCollapsedShown(A,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local F=ar.tweenService:Create(A.main,C,{Size=A.size,Position=B})F.Completed:Connect(
function()if A.hidden or A.unloaded then return end A._collapsedShown=false u(A,true)end)F:Play()ar.tweenService:Create(
A.windowCorner,D,{CornerRadius=A.theme.CornerRoundness}):Play()task.delay(0.22,function()A.topbar.Visible=true A:
_setContentVisible(true)A:_fadeSurfaces(true,E)if A.topbarIcon then ar.tweenService:Create(A.topbarIcon,E,{
ImageTransparency=0}):Play()end if A.title then ar.tweenService:Create(A.title,E,{TextTransparency=0}):Play()end if A.
subtitle then ar.tweenService:Create(A.subtitle,E,{TextTransparency=0.7}):Play()end for G,H in ipairs(A.actionContainer:
GetChildren())do if H:IsA'Frame'then ar.tweenService:Create(H.ImageLabel,E,{ImageTransparency=0.6}):Play()end end if A.
settingsAction and A.selectedTab==A.rfSettings then ar.tweenService:Create(A.settingsAction.iconLabel,E,{
ImageTransparency=0.2}):Play()end for G,H in A.tags do H:_setShown(true,E)end for G,H in pairs(A.tabs)do if not H.
neglectSelector and H.topbarItem then H.topbarItem.Visible=true H:_applyVisual(if A.selectedTab==H then'selected'else
'unselected',E)end end A:_setTabSectionsVisible(true)A:_setTabSectionsShown(true,E)A:_revealElements(0.035,0.4)end)task.
delay(0.22,function()A.drag.drag.Position=UDim2.new(B.X.Scale,B.X.Offset,B.Y.Scale,B.Y.Offset+A:_hang(A.size.Y.Offset))A
.drag.dragCosmetic.Size=UDim2.fromOffset(0,4)A.drag.dragCosmetic.BackgroundTransparency=1 A.drag.drag.Visible=true ar.
tweenService:Create(A.drag.dragCosmetic,C,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()A.animating=false A._revealing=false end)end function at._firstShow(A)A:_setContentVisible(true)A.
drag.drag.Visible=false A.main.Visible=true ar.tweenService:Create(A.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=A.size}):Play()task.wait(0.85)A:_fadeSurfaces(true,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if A.icon then ar.tweenService:Create(A.
topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if
A.title then ar.tweenService:Create(A.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if A.subtitle then ar.tweenService:Create(A.subtitle,TweenInfo.new(0.4,Enum
.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for B,C in ipairs(A.actionContainer
:GetChildren())do if C:IsA'Frame'then task.wait(0.02)ar.tweenService:Create(C.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for B,C in A.tags do C:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()local B=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)A:_setTabSectionsVisible(true)A:
_setTabSectionsShown(true,B)local C=0 for D,E in pairs(A.tabs)do if not E.neglectSelector then E.topbarItem.Visible=true
E:_applyVisual(if A.selectedTab==E then'selected'else'unselected',B)E:_spinGradients()C+=1 if C<=l then task.wait(k)end
end end end)A:_revealElements(0.03,2)task.wait(1)A:_syncDragBar()A.drag.drag.Visible=true ar.tweenService:Create(A.drag.
dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):
Play()ar.tweenService:Create(A.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
{Size=UDim2.fromOffset(100,4)}):Play()A.animating=false A._revealing=false local B=ar.localPlayer if B and A.settings.
welcomeToast and ao.isNewUser()then A:Toast{title=B.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,
avatar=B.UserId,minWidth=220}end end function at.GetPath(A)return ah.getPath(A)end function at.Save(A,B)if B~=nil and(
type(B)~='string'or B=='')then return false end return ah.save(A,B)end function at.Load(A,B)if B~=nil and(type(B)~=
'string'or B=='')then return false end return ah.load(A,B)end function at._applyNamedConfig(A,B)if not A:Load(B)then
return false end local C,D=ah.getPath(A)A._loadedConfigPath=D A:Save()return true end function at.ListConfigs(A)return
ah.list(A)end function at.DeleteConfig(A,B)return ah.delete(A,B)end function at.Get(A,B)local C=A.controls[B]return C
and C.value end function at.Set(A,B,C)local D=A.controls[B]if not D then return false end D:Set(C)return true end
function at._jumpTo(A,B)if B then A.elementsLayout:JumpTo(B)end end function at.Navigate(A,B)if B==nil then return end
local C for D,E in A.tabs do if E==B or E.name==B or E.tabPage==B then C=E break end end if not C then return end C:
Select()end function at.Create(A,B,C,D)assert(typeof(B)=='string','Invalid argument #1 (string expected)')local E=
Instance.new(B)if D and A.theme then for F,G in D do E[F]=(if typeof(G)=='table'then G[2](A.theme[G[1] ])else A.theme[G]
)end A.themeProperties[E]=D end if C then for F,G in C do if aj.isToken(G)then A:_bindLocale(E,F,aj.sourceOf(G))else af.
assign(E,F,G)end end end table.insert(A.instances,E)return E end function at._bindLocale(A,B,C,D)B[C]=aj.resolve(D)local
E=A.localeProperties[B]if not E then E={}A.localeProperties[B]=E end E[C]=D end function at.SetLocale(A,B)aj.setActive(B
)for C,D in A.localeProperties do for E,F in D do C[E]=aj.resolve(F)end end end function at.SetTranslator(A,B)aj.
translator=B end function at.RegisterTranslations(A,B)aj.register(B)A:SetLocale(aj.current)end function at.CreateGlow(A,
B,C,D,E)local F={BlurRadius=UDim.new(0,D),Transparency=E,ZIndex=-1,Parent=B}if typeof(C)=='string'then return A:Create(
'UIShadow',F,{Color={C,function(G)return if typeof(G)=='ColorSequence'then G.Keypoints[1].Value else G end}})end F.Color
=C return A:Create('UIShadow',F)end function at._flashResult(A,B,C)local D=B.box if not D then return end local E,F,G,H,
I,J=B.glow,B.boxStroke,C and ai.accent.on or A.theme.ErrorColor,C and ai.accent.onStroke or A.theme.ErrorStrokeColor,
TweenInfo.new(0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)ar.tweenService:Create(D,I,{BackgroundColor3=G}):Play()if F then ar.tweenService:Create(F,I,{Color=H
,Transparency=0.4}):Play()end if E then ar.tweenService:Create(E,I,{Color=H,Transparency=0.6}):Play()end B._flashToken=(
B._flashToken or 0)+1 local K=B._flashToken task.delay(0.22,function()if B._flashToken~=K then return end ar.
tweenService:Create(D,J,{BackgroundColor3=A.theme.FieldBackground}):Play()if F then ar.tweenService:Create(F,J,{Color=A.
theme.SurfaceStroke,Transparency=0.85}):Play()end if E then ar.tweenService:Create(E,J,{Color=A.theme.FieldGlow,
Transparency=B._glowIdle or 1}):Play()end end)end function at.CreateHoverOverlay(A,B)local C=A:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex
=1,Parent=B})A:Create('UICorner',{Parent=C},{CornerRadius='ElementCornerRadius'})return C end function at.
_wireElementHover(A,B)local C,D=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),A.theme A:
ConnectFor(B,B.main.MouseEnter,function()if not A:_interactive()then return end ar.tweenService:Create(B.stroke,C,{
Transparency=D.ElementStrokeHoverTransparency,Color=D.ElementStrokeHover}):Play()ar.tweenService:Create(B.title,C,{
TextColor3=D.ElementTextHoverColor}):Play()if B.hoverOverlay then ar.tweenService:Create(B.hoverOverlay,C,{
BackgroundTransparency=0.97}):Play()end end)A:ConnectFor(B,B.main.MouseLeave,function()ar.tweenService:Create(B.stroke,C
,{Transparency=D.ElementStrokeTransparency,Color=D.ElementStroke}):Play()ar.tweenService:Create(B.title,C,{TextColor3=D.
ContentColor}):Play()if B.hoverOverlay then ar.tweenService:Create(B.hoverOverlay,C,{BackgroundTransparency=1}):Play()
end end)end function at._runGuarded(A,B,C,...)if B.locked then return end local D=table.pack(...)task.spawn(function()
local E,F=pcall(function()return C(table.unpack(D,1,D.n))end)if E or B._errored then return end B._errored=true local G,
H=B.flashTarget or B.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ar.tweenService:Create(G,H,
{BackgroundColor3=A.theme.ErrorColor}):Play()ar.tweenService:Create(B.stroke,H,{Color=A.theme.ErrorStrokeColor}):Play()
if B.title then B.title.Text=aj.resolve'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {
B.__type} component named '{B.name}':`)ak.print(F)task.wait(1)if B.title then B.title.Text=aj.resolve(B.name)end ar.
tweenService:Create(G,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.
fromRGB(255,255,255)}):Play()ar.tweenService:Create(B.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Color=A.theme.ElementStroke}):Play()B._errored=false end)end function at.StyleElementBody(A,B)A:
Create('UIGradient',{Rotation=270,Parent=B},{Color='ElementGradient'})A:Create('UICorner',{Parent=B},{CornerRadius=
'ElementCornerRadius'})return A:Create('UIStroke',{Transparency=1,Parent=B},{Color='ElementStroke',Transparency=
'ElementStrokeTransparency'})end function at._buildCompactRow(A,B,C,D)local E=A:Create('Frame',{Name=C,Size=UDim2.
fromOffset(0,h),AutomaticSize=Enum.AutomaticSize.X,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Parent=B.tabPage},{BackgroundTransparency='ElementTransparency'})local F=A:
StyleElementBody(E)A:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=E})A:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,
Parent=E})local G=A:Create('TextButton',{Text='',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,h),BorderSizePixel=0,TextTransparency=1,ZIndex=D or 1,Parent=
E})A:Create('UICorner',{Parent=G},{CornerRadius='ElementCornerRadius'})return E,F,G end function at.StyleElementPanel(A,
B)A:Create('UIGradient',{Rotation=270,Parent=B},{Color='ElementGradient'})A:Create('UICorner',{Parent=B},{CornerRadius=
'ElementCornerRadius'})local C=A:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=B})A:Create(
'UIGradient',{Rotation=270,Parent=C},{Color='ElementStrokeGradient'})return C end function at._reveal(A,B,C,D,E)if not B
then return end if D then ar.tweenService:Create(B,E or au,C):Play()else for F,G in C do B[F]=G end end end function at.
_revealCommon(A,B,C)A:_reveal(B.stroke,{Transparency=A.theme.ElementStrokeTransparency},C)A:_reveal(B.title,{
TextTransparency=0},C)A:_reveal(B.main,{BackgroundTransparency=A.theme.ElementTransparency or 0},C)if B.iconLabel then A
:_reveal(B.iconLabel,{ImageTransparency=0},C)end if B.descriptor then A:_reveal(B.descriptor.titleLabel,{
TextTransparency=0.7},C)end end function at._hideCommon(A,B,C)A:_reveal(B.stroke,{Transparency=1},C)A:_reveal(B.title,{
TextTransparency=1},C)A:_reveal(B.main,{BackgroundTransparency=1},C)if B.iconLabel then A:_reveal(B.iconLabel,{
ImageTransparency=1},C)end if B.descriptor then A:_reveal(B.descriptor.titleLabel,{TextTransparency=1},C)end end
function at._collapsedRect(A)local B=if A.showIconOnly then b else av if A._collapsedPosition then return A.
_collapsedPosition,B end local C=UDim2.new(c.X.Scale,c.X.Offset,c.Y.Scale,c.Y.Offset+B.Y.Offset*A.scale/2)return C,B end
function at._scaleSurface(A,B)local C=A:Create('UIScale',{Scale=A.scale,Parent=B})table.insert(A._scaledSurfaces,C)
return C end function at._rescaleSurfaces(A)for B=#A._scaledSurfaces,1,-1 do local C=A._scaledSurfaces[B]if C.Parent
then C.Scale=A.scale else table.remove(A._scaledSurfaces,B)end end end function at._hang(A,B:number):number return B*A.
scale/2+15 end function at._interactive(A)return not A.animating and not A.hidden end function at._settled(A)return not
A.hidden and not A._revealing end function at.Connect(A,B,C)local D=B:Connect(C)table.insert(A.connections,D)return D
end function at.ConnectFor(A,B,C,D)local E=A:Connect(C,D)B.connections=B.connections or{}table.insert(B.connections,E)
return E end function at.Disconnect(A,B)if not B then return end local C=table.find(A.connections,B)if C then table.
remove(A.connections,C)end B:Disconnect()end function at.DestroySubtree(A,B)if not B then return end local C={[B]=true}
for D,E in B:GetDescendants()do C[E]=true end for D=#A.instances,1,-1 do local E=A.instances[D]if C[E]then table.remove(
A.instances,D)A.themeProperties[E]=nil A.localeProperties[E]=nil end end B:Destroy()end function at.DisconnectMany(A,B,C
)if not C or#C==0 then return end local D={}for E,F in C do D[F]=true F:Disconnect()end local function E(F)if not F then
return end local G=0 for H=1,#F do local I=F[H]if not D[I]then G+=1 F[G]=I end end for H=#F,G+1,-1 do F[H]=nil end end
E(A.connections)if B and B~=A then E(B.connections)end end function at.DestroySubtrees(A,B)if not B or#B==0 then return
end local C={}for D,E in B do C[E]=true for F,G in E:GetDescendants()do C[G]=true end end local D=0 for E=1,#A.instances
do local F=A.instances[E]if C[F]then A.themeProperties[F]=nil A.localeProperties[F]=nil else D+=1 A.instances[D]=F end
end for E=#A.instances,D+1,-1 do A.instances[E]=nil end for E,F in B do F:Destroy()end end function at.Unload(A)A.
unloaded=true for B,C in A._nameplates or{}do C._alive=false end al.teardown()al.releaseContainer(A.screenGui)if A.
_liveTween then A._liveTween:Cancel()A._liveTween=nil end for B=#A.connections,1,-1 do A.connections[B]:Disconnect()end
for B=#A.instances,1,-1 do A.instances[B]:Destroy()end table.clear(A.connections)table.clear(A.instances)table.clear(A.
themeProperties)table.clear(A.localeProperties)table.clear(A.controls)table.clear(A.tabs)table.clear(A._scaledSurfaces)
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
placeholder:string?,emojis:{string}?,onMessage:((message:ChatMessage)->())?}export type NameplateStyle={size:Vector2?,
lift:number?,maxDistance:number?,cornerRadius:number?,accent:Color3?,accentDeep:Color3?,cardColor:Color3?,
cardTransparency:number?,veilColor:Color3?,veilStrength:number?,titleColor:Color3?,subtitleColor:Color3?,badgeTextColor:
Color3?,logo:any?,logoTint:Color3?,logoScale:number?,backdrop:any?,backdropTint:Color3?,backdropTransparency:number?,
glowImage:(string|number|boolean)?,titleFont:Font?,subtitleFont:Font?,titleTop:number?,titleSize:number?,subtitleSize:
number?,entrance:('unfold'|'fade'|'none')?,logoSway:number?,logoSpin:number?,halo:boolean?,sparkles:number?,sparkleColor
:Color3?,titleShine:boolean?,sweep:boolean?,sweepEvery:number?,border:boolean?,borderThickness:number?,
borderTransparency:number?,borderSpeed:number?,glow:boolean?,bob:boolean?,bobHeight:number?,bobSpeed:number?}export type
NameplateProps={title:string?,subtitle:(string|((player:Player)->string))?,badge:string?,preset:('Omnity'|'Midnight'|
'Mono')?,style:NameplateStyle?,endpoint:string?,key:string?,transport:ChatTransport?,showSelf:boolean?,hideDefaultName:
boolean?,checkInInterval:number?,autoCheckIn:boolean?,playerMedia:boolean?,accent:Color3?,logo:(string|number|boolean)?,
backdrop:(string|number|boolean)?,maxDistance:number?,lift:number?}export type Nameplate={SetEnabled:(self:Nameplate,
enabled:boolean)->(),SetTitle:(self:Nameplate,title:string)->(),SetStyle:(self:Nameplate,style:NameplateStyle|string,
preset:string?)->(),SetMedia:(self:Nameplate,link:string,slot:('backdrop'|'logo')?)->(boolean,string?),ClearMedia:(self:
Nameplate)->boolean,Add:(self:Nameplate,player:Player,badge:string?)->(),Remove:(self:Nameplate,player:Player)->(),
CheckIn:(self:Nameplate)->boolean,Destroy:(self:Nameplate)->()}export type NotifyProps={title:string?,content:string?,
icon:(string|number)?,duration:number?}export type ToastProps={title:string?,subtitle:string?,subtitleAbove:boolean?,
icon:(string|number)?,avatar:number?,minWidth:number?,duration:number?,position:'Top'|'Bottom'?}export type PopupBox={
title:string?,description:string?,icon:(string|number)?}export type PopupOption={text:string?,style:string?,callback:((
)->())?}export type PopupProps={title:string?,subtitle:string?,icon:(string|number)?,content:string?,boxes:{PopupBox}?,
options:{PopupOption}?,dismissable:boolean?}export type Moveable={MoveTo:(self:any,index:number)->(),MoveToTop:(self:any
)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown:(self:any)->()}export type Lockable={Lock:(self:any,
reason:string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->boolean}export type Button=Moveable&Lockable&{}export
type Toggle=Moveable&Lockable&{value:boolean,Set:(self:Toggle,value:boolean,skipCallback:boolean?)->()}export type
Slider=Moveable&Lockable&{value:number,Set:(self:Slider,value:number,skipCallback:boolean?)->()}export type Dropdown=
Moveable&Lockable&{value:{string},Set:(self:Dropdown,value:string|{string},skipCallback:boolean?)->(),Refresh:(self:
Dropdown,options:{string})->(),Add:(self:Dropdown,option:string)->(),Remove:(self:Dropdown,option:string)->()}export
type Input=Moveable&Lockable&{value:string,Set:(self:Input,value:string,skipCallback:boolean?)->()}export type Keybind=
Moveable&Lockable&{value:EnumItem,Set:(self:Keybind,value:EnumItem|string,skipChanged:boolean?)->()}export type
ColorPicker=Moveable&Lockable&{value:Color3,alpha:number,Set:(self:ColorPicker,value:Color3|string,skipCallback:boolean?
)->(),SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?)->()}export type Stat=Moveable&{value:number,Set:(
self:Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->()}export type Progress=Moveable&{value:number,Set:
(self:Progress,value:number)->(),Get:(self:Progress)->number,GetPercentage:(self:Progress)->number,SetRange:(self:
Progress,min:number,max:number)->(),SetText:(self:Progress,text:string?)->(),SetIndeterminate:(self:Progress,state:
boolean)->(),Remove:(self:Progress)->()}export type Chat=Moveable&{Send:(self:Chat,text:string)->(boolean,string?),
Refresh:(self:Chat)->boolean,SetChannel:(self:Chat,channel:string,endpoint:string?)->(),Clear:(self:Chat)->(),Remove:(
self:Chat)->()}export type Console=Moveable&{Set:(self:Console,text:string)->(),Append:(self:Console,line:string)->(),
Clear:(self:Console)->(),Get:(self:Console)->string,Copy:(self:Console)->boolean,SetHeight:(self:Console,height:number
)->(),Remove:(self:Console)->()}export type Section=Moveable&{}export type TabSection={Remove:(self:TabSection)->()}
export type Text=Moveable&{name:string,text:string,Set:(self:Text,text:string)->(),SetTitle:(self:Text,title:string)->()
}export type Divider=Moveable&{text:string,Set:(self:Divider,text:string?)->()}export type Tag={Set:(self:Tag,props:
TagProps)->(),SetColor:(self:Tag,color:Color3)->(),SetText:(self:Tag,text:string?)->(),SetIcon:(self:Tag,icon:(string|
number)?)->(),Remove:(self:Tag)->()}export type Popup={Close:(self:Popup)->()}export type Group=Moveable&{CreateButton:(
self:Group,props:ButtonProps)->Button,CreateToggle:(self:Group,props:ToggleProps)->Toggle,CreateSwitch:(self:Group,props
:ToggleProps)->Toggle,CreateStat:(self:Group,props:StatProps)->Stat,CreateSlider:(self:Group,props:SliderProps)->Slider,
CreateDropdown:(self:Group,props:DropdownProps)->Dropdown?,CreateSection:(self:Group,props:SectionProps)->Section?,
CreateText:(self:Group,props:TextProps)->Text?,CreateDivider:(self:Group,props:DividerProps?)->Divider?,CreateGroup:(
self:Group,props:GroupProps?)->Group}export type Column={CreateButton:(self:Column,props:ButtonProps)->Button,
CreateToggle:(self:Column,props:ToggleProps)->Toggle,CreateSwitch:(self:Column,props:ToggleProps)->Toggle,CreateSlider:(
self:Column,props:SliderProps)->Slider,CreateDropdown:(self:Column,props:DropdownProps)->Dropdown,CreateInput:(self:
Column,props:InputProps)->Input,CreateKeybind:(self:Column,props:KeybindProps)->Keybind,CreateColorPicker:(self:Column,
props:ColorPickerProps)->ColorPicker,CreateStat:(self:Column,props:StatProps)->Stat,CreateProgress:(self:Column,props:
ProgressProps)->Progress,CreateConsole:(self:Column,props:ConsoleProps)->Console,CreateChat:(self:Column,props:ChatProps
)->Chat,CreateSection:(self:Column,props:SectionProps)->Section,CreateText:(self:Column,props:TextProps)->Text,
CreateDivider:(self:Column,props:DividerProps?)->Divider,CreateGroup:(self:Column,props:GroupProps?)->Group}export type
Tab={Left:Column,Right:Column,left:Column,right:Column,GetColumn:(self:Tab,side:ColumnSide?)->Column,Select:(self:Tab,
noAnimation:boolean?)->(),Deselect:(self:Tab,noAnimation:boolean?)->(),Remove:(self:Tab)->(),CreateButton:(self:Tab,
props:ButtonProps)->Button,CreateToggle:(self:Tab,props:ToggleProps)->Toggle,CreateSwitch:(self:Tab,props:ToggleProps)->
Toggle,CreateSlider:(self:Tab,props:SliderProps)->Slider,CreateDropdown:(self:Tab,props:DropdownProps)->Dropdown,
CreateInput:(self:Tab,props:InputProps)->Input,CreateKeybind:(self:Tab,props:KeybindProps)->Keybind,CreateColorPicker:(
self:Tab,props:ColorPickerProps)->ColorPicker,CreateStat:(self:Tab,props:StatProps)->Stat,CreateProgress:(self:Tab,props
:ProgressProps)->Progress,CreateConsole:(self:Tab,props:ConsoleProps)->Console,CreateChat:(self:Tab,props:ChatProps)->
Chat,CreateSection:(self:Tab,props:SectionProps)->Section,CreateText:(self:Tab,props:TextProps)->Text,CreateDivider:(
self:Tab,props:DividerProps?)->Divider,CreateGroup:(self:Tab,props:GroupProps?)->Group}export type Window={unloaded:
boolean,Flags:{[string]:any},CreateTab:(self:Window,props:TabProps)->Tab,CreateSection:(self:Window,props:SectionProps
)->TabSection,CreateTag:(self:Window,props:TagProps)->Tag,Notify:(self:Window,props:NotifyProps)->(),Toast:(self:Window,
props:ToastProps)->(),CreateNameplate:(self:Window,props:NameplateProps?)->Nameplate,Popup:(self:Window,props:PopupProps
)->Popup?,Show:(self:Window)->(),Hide:(self:Window)->(),ToggleHide:(self:Window)->(),ToggleMinimise:(self:Window)->(),
Navigate:(self:Window,tab:string|Tab)->(),ChangeTheme:(self:Window,theme:Theme)->(),SetLocale:(self:Window,localeId:
string)->(),SetTranslator:(self:Window,translator:Translator?)->(),RegisterTranslations:(self:Window,translations:
Translations)->(),Save:(self:Window,name:string?)->boolean,Load:(self:Window,name:string?)->boolean,ListConfigs:(self:
Window)->{string},DeleteConfig:(self:Window,name:string)->boolean,GetPath:(self:Window)->(string,string),Get:(self:
Window,flag:string)->any,Set:(self:Window,flag:string,value:any)->boolean,Unload:(self:Window)->()}export type Rayfield=
{CreateWindow:(self:Rayfield,props:WindowProps)->Window}return{}end)()end,[43]=function()local aa,ab,ac=a(43)local ad
return(function(...)local ae,af=ac(ab.Parent.variables),{}af.enabled=false type HapticTypes={click:Enum.HapticEffectType
?,notify:Enum.HapticEffectType?}local ag:HapticTypes,ah,ai={},pcall(function()Instance.new'HapticEffect':Destroy()return
{click=Enum.HapticEffectType.UIHover,notify=Enum.HapticEffectType.UIClick}end)if ah then ag=ai end local aj:{[Enum.
HapticEffectType]:Instance},ak:Instance?={}function af.setContainer(al:Instance?)ak=al end function af.releaseContainer(
al:Instance?)if al==nil or ak==al then ak=nil end end local function al():Instance if ak and ak.Parent then return ak
end return ae.guiContainer end local function am(an:Enum.HapticEffectType):Instance?local ao=aj[an]if ao and ao.Parent
then return ao end local ap,aq=pcall(Instance.new,'HapticEffect')if not ap then return nil end local ar=aq::any ar.Type=
an local as=pcall(function()aq.Parent=al()end)if not as then aq:Destroy()return nil end aj[an]=aq return aq end
local function an(ao:Enum.HapticEffectType?)if not ao or not af.enabled then return end local ap=am(ao)if ap then local
aq=ap::any pcall(aq.Play,ap)end end function af.click()an(ag.click)end function af.notify()an(ag.notify)end function af.
setEnabled(ao:boolean?)af.enabled=ao and true or false if not af.enabled then af.teardown()end end function af.teardown(
)for ao,ap in aj do pcall(ap.Destroy,ap)aj[ao]=nil end end return af end)()end,[44]=function()local aa,ab,ac=a(44)local
ad return(function(...)local ae={}function ae.isAnimated(af):boolean if not af then return false end if af.sheet then
return(af.sheet.frames or 1)>1 and(af.sheet.fps or 0)>0 end return af.list~=nil and#af.list>1 and(af.fps or 0)>0 end
function ae.apply(af,ag)if not ag then af.Image=''af.ImageRectSize=Vector2.zero af.ImageRectOffset=Vector2.zero return
end if ag.list then af.Image=ag.list[1]or''af.ImageRectSize=Vector2.zero af.ImageRectOffset=Vector2.zero return end af.
Image=ag.uri or''local ah=ag.sheet if ah then af.ImageRectSize=Vector2.new(ah.frameWidth,ah.frameHeight)af.
ImageRectOffset=Vector2.zero else af.ImageRectSize=Vector2.zero af.ImageRectOffset=Vector2.zero end end function ae.
frameAt(af,ag:number):number if not ae.isAnimated(af)then return 0 end local ah,ai=if af.sheet then af.sheet.frames else
#af.list,if af.sheet then af.sheet.fps else af.fps return math.floor(ag*ai)%ah end function ae.step(af,ag,ah:number,ai)
if not ae.isAnimated(ag)then return end local aj=ae.frameAt(ag,ah)if ai and ai.frame==aj then return end if ai then ai.
frame=aj end if ag.sheet then local ak=ag.sheet local al,am=aj%ak.columns,aj//ak.columns af.ImageRectOffset=Vector2.new(
al*ak.frameWidth,am*ak.frameHeight)else af.Image=ag.list[aj+1]end end return ae end)()end,[45]=function()local aa,ab,ac=
a(45)local ad return(function(...)local ae,af=ac(ab.Parent.network),ac(ab.Parent.log)export type AssetId=number|string
export type AssetDownloadUrl=string export type CacheKey=AssetId export type ResolvedAsset=AssetId export type
AssetRequestPayload={Url:string,Method:string}local ag={Enum={AssetDownloadUrl={RobloxDownloadUrl=
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
return tonumber(au)end return nil end function an.__index(au:FontManagerState,av:unknown):unknown local b=(an::any)[av]
if b~=nil then return b end local c=at(av)if not c then return nil end local d=au.fontCache if d then local e=d[c]if e
then local f=as(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local g=e.variants and e.variants[f]if g then return g end
for h,i in pairs(e.variants or{})do return i end end end return nil end function an.new(au:string,av:boolean?,b:boolean?
,c:ai.AssetDownloadUrl?,d:FontResolverOptions?):FontManager local e=d or{saveToDisk=true,skipCache=not b or false,
fallbackFont=Font.fromEnum(Enum.Font.SourceSans)}local f=setmetatable({rootFolder=au,fontCache=if b then{}::FontCache
else nil,assetResolver=ai.new(b,c),defaultOptions=e,_debug=av or ag:IsStudio()or false,_pendingLoads={}}::
FontManagerState,an)::any pcall(ah.ensureFolder,au)return f end local function au(av:FontManager,b:number,c:Enum.
FontWeight,d:Enum.FontStyle,e:string):Font?local f=av.rootFolder..'/'..b..'.json'if typeof(ah.isfile)~='function'then
return av.defaultOptions.fallbackFont end local g,h:string?=false if ag:IsStudio()and av._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]h=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(f)then local i,j=pcall(ah.readfile,f)h=i and j or nil else h=av.assetResolver:getAssetContentFromId(b,
false)g=h~=nil end local i:FontManifest?if h then local j,k=pcall(am,h)if j and k then i=ao(k)else if av._debug then aj.
warn('Failed to parse font manifest for font id: '..tostring(b)..'. Error: '..tostring(k))end end else return av.
defaultOptions.fallbackFont end if not i then if av._debug then aj.warn('Font manifest is nil for font id: '..tostring(b
))end pcall(ah.delfile,f)return av.defaultOptions.fallbackFont end if g and h then pcall(ah.writefile,f,h)end local j,k=
av.rootFolder..'/'..i.name,true if not pcall(ah.ensureFolder,j)then return av.defaultOptions.fallbackFont end for l,m in
ipairs(i.faces)do local n=j..'/'..m.name:gsub(' ','-')..'.ttf'if ah.isfile(n)then local o,p=pcall(ah.readfile,n)if not o
or type(p)~='string'or not aq(p)then pcall(ah.delfile,n)end end if not ah.isfile(n)then local o=av.assetResolver:
resolve(m.assetId)local p=if o~=nil then av.assetResolver:getAssetContentFromId(o,false)else nil if not p or not aq(p)
then k=false if av._debug then aj.warn('Font face content is missing or not a font for font id: '..tostring(b)..
', face: '..m.name)end continue end pcall(ah.writefile,n,p)end local o,p=pcall(ar.getcustomasset,n)if o and type(p)==
'string'then i.faces[l].assetId=p if av._debug then aj.print('Loaded font face for id: '..tostring(b)..', face: '..m.
name)end else k=false if av._debug then aj.warn('Failed to load font face for id: '..tostring(b)..', face: '..m.name)end
end end if not k then return av.defaultOptions.fallbackFont end local l=al(i)if not l or not pcall(ah.writefile,j..
'/manifest.json',l)then return av.defaultOptions.fallbackFont end local m,n=pcall(ar.getcustomasset,j..'/manifest.json')
if not m or not n then if av._debug then aj.warn('Failed to load font manifest for id: '..tostring(b))end return av.
defaultOptions.fallbackFont end local o,p=pcall(Font.new,n::any,c,d)if not o or not p then if av._debug then aj.warn(
'Failed to load font for id: '..tostring(b))end return av.defaultOptions.fallbackFont end local q=av.fontCache if q then
q[b]={customId=n,manifest=i,loadedFromDisk=true,variants={[e]=p}}if av._debug then aj.print('Cached font for id: '..
tostring(b))end end return p end function an.loadFont(av:FontManager,b:(number|string)?,c:Enum.FontWeight?,d:Enum.
FontStyle?,e:boolean?,f:boolean?):Font?if e==nil then e=av.defaultOptions.saveToDisk end if f==nil then f=av.
defaultOptions.skipCache end local g,h=c or Enum.FontWeight.Regular,d or Enum.FontStyle.Normal local i,j=as(g,h),av.
assetResolver:resolve(b)local k=at(j)if not k then aj.warn('Invalid font id: '..tostring(b))return av.defaultOptions.
fallbackFont end local l=av.fontCache if l and not f then local m=l[k]if m then local n=m.variants and m.variants[i]if n
then if av._debug then aj.print('Loaded font from cache for id: '..tostring(k))end return n end local o,p=pcall(Font.new
,m.customId::any,g,h)if o and p then m.variants=m.variants or{}m.variants[i]=p if av._debug then aj.print(
'Loaded font variant from cache for id: '..tostring(k))end return p else if av._debug then aj.warn(
'Failed to load font from cache for id: '..tostring(k))end l[k]=nil return av.defaultOptions.fallbackFont end end end if
not e then if av._debug then aj.warn[[Font loading without saving to disk can be detected by Anti-cheats.]]end return av
.defaultOptions.fallbackFont end local m,n=av._pendingLoads,tostring(k)..'|'..i local o=m[n]if o then table.insert(o,
coroutine.running())return coroutine.yield()end m[n]={}local p,q=pcall(au,av,k,g,h,i)local r=if p then q else av.
defaultOptions.fallbackFont o=m[n]m[n]=nil if o then for s,t in o do coroutine.resume(t,r)end end return r end function
an.resolve(av:FontManager,b:number|string):Font?local c=at(b)if not c then return nil end local d=av.fontCache if d then
local e=d[c]if e then if av._debug then aj.print('Resolved font for id: '..tostring(c))end for f,g in pairs(e.variants
or{})do return g end end end return nil end function an.getFontFromId(av:FontManager,b:number|string):Font?return av:
resolve(b)end return an end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local ae,af,ag,ah={},
ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.flagNames)ae.textWidth=af.textWidth ae.textHeight=af.
textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae.contrastColor=ag.contrastColor ae.toColorSequence=ag.
toColorSequence ae.contrastText=ag.contrastText return ae end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(
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
'rbxassetid://'..al end if type(al)=='string'then return al end return ak(al)end return ag end)()end,[56]=function()
local aa,ab,ac=a(56)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),ac(ab.
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
string.sub(av,1,8)~=ar then return nil end if not pcall(ae.writefile,at,av)then return nil end end local av,b=pcall(
getfenv().getcustomasset,at)return if av and type(b)=='string'then b else nil end local function at(au:number):string
return af.join(ak,'avatar_'..tostring(au)..'.png')end local function au(av:string):string?local b,c=pcall(function()
return ag.httpService:JSONDecode(av)end)if not b or type(c)~='table'then return nil end local d=(c::ThumbnailResponse).
data if type(d)~='table'then return nil end local e=d[1]if type(e)~='table'then return nil end local f=e::ThumbnailEntry
if f.state=='Completed'and type(f.imageUrl)=='string'then return f.imageUrl end return nil end local function av(b:
number):string?local c:string?for d=1,4 do local e=al:getAssetContentFromUrl(string.format(ao,b,an,an),'avatar:'..
tostring(b),d>1)if e then local f=au(e)if f then c=f break end end if d<4 then task.wait(0.3)end end if not c then
return nil end return as(at(b),c)end local b:{[number]:{AvatarCallback}},c:{[number]:boolean}={},{}function ai.preload(d
:PreloadCallback?):(boolean,number)local e=getfenv()if type(e.getcustomasset)~='function'or typeof(ae.isfile)~=
'function'then if d then task.defer(d,aq)end return false,aq end local f=ai.rewrites table.clear(f)local function g()if
not d then return end local h=0 for i in ap do if not f[i]then h+=1 end end d(h)end local h,i,j=0,0,true for k,l in ap
do local m,n:string?=(af.join(ak,tostring(k)..'.png'))if ae.isfile(m)then local o,p=pcall(e.getcustomasset,m)n=if o and
type(p)=='string'then p else nil end if n then f[k]=n else i+=1 h+=1 task.spawn(function()local o=as(m,l)if o then f[k]=
o if ai.onCached then pcall(ai.onCached,k)end end h-=1 if h==0 and not j then g()end end)end end j=false if h==0 then g(
)end return i==0,i end function ai.avatar(d:unknown,e:AvatarCallback?):string if type(d)~='number'then return''end if
typeof(ae.isfile)~='function'then return''end local f=at(d)if ae.isfile(f)then local g,h=pcall(getfenv().getcustomasset,
f)if g and type(h)=='string'then return h end end if c[d]then return''end local g=b[d]if g then if e then table.insert(g
,e)end return''end if e then b[d]={e}task.spawn(function()local h,i=av(d),b[d]b[d]=nil if not h then c[d]=true return
end if i then for j,k in i do pcall(k,h)end end end)end return''end function ai.remote(d:string):string?if not string.
match(d,'^[%w%-_]+%.png$')then return nil end local e,f=pcall(as,af.join(ak,d),am..d)return if e then f else nil end
function ai.url(d:string,e:string):string?if not string.match(e,'^[%w%-_]+%.png$')then return nil end local f,g=pcall(as
,af.join(ak,e),d)return if f then g else nil end return ai end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(
function(...)local ae,af={},64 local ag,ah,ai=af+7,38,3 export type Mode='top'|'sidebar'export type Layout={mode:Mode,
topbarHeight:number,chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize:UDim2,fadeTransparency:NumberSequence,
fadeCorners:{string}?,tabStripTop:number?,tabStripHeight:number?,railWidth:number?,railCollapsedWidth:number?,
railCollapseBelow:number?,rowHeight:number?,rowCornerRadius:number?,rowSpacing:number?,railPadding:number?,rowInset:
number?,rowPadding:number?,rowContentSpacing:number?,rowIconSize:number?,footerHeight:number?,avatarSize:number?,
cardTransparency:number?,cardStrokeRotation:number?,cardStrokeTransparency:NumberSequence?,cardCorners:{string}?}ae.top=
{mode='top'::Mode,topbarHeight=af,chromeHeight=ag+ah+ai,tabStripTop=ag,tabStripHeight=ah,pageDirection=Enum.
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
end return al end return ae end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)local ae,af,ag=ac(
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
and aj~=''then return string.lower(aj)end return'en'end return ag end)()end,[59]=function()local aa,ab,ac=a(59)local ad
return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.Lock(ah,ai:string?)ah.window:
_setElementLocked(ah,true,ai)end function ag.Unlock(ah)ah.window:_setElementLocked(ah,false)end function ag.IsLocked(ah)
:boolean return ah.locked==true end return af end return ae end)()end,[60]=function()local aa,ab,ac=a(60)local ad return
(function(...)local ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean local function ag():boolean return
ae.secureMode end local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.setSecureModeSource(aj:
SuppressPredicate?)ah=if type(aj)=='function'then aj else ag end function af.setSuppressPredicate(aj:SuppressPredicate?)
ai=if type(aj)=='function'then aj else nil end local function aj():boolean if ai and ai()then return true end return ah(
)end function af.warn(...)if aj()then return end warn(...)end function af.print(...)if aj()then return end print(...)end
return af end)()end,[61]=function()local aa,ab,ac=a(61)local ad return(function(...)local function ae<T>(af:T):T local
ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:_moveElement(ah,ai)end function ag.MoveToTop(ah)ah.tab:_moveElement(ah
,1)end function ag.MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab.elements)end function ag.MoveUp(ah)local ai=table.
find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai-1)end end function ag.MoveDown(ah)local ai=table.find(ah.
tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai+1)end end return af end return ae end)()end,[62]=function()local aa
,ab,ac=a(62)local ad return(function(...)local ae={}ae.__index=ae export type RequestFn=(...any)->any function ae.
getRequestFn(af:any?):RequestFn?af=af or getfenv()return af.request or af.http_request or(af.http and af.http.request)or
(af.syn and af.syn.request)or(af.fluxus and af.fluxus.request)end return ae end)()end,[63]=function()local aa,ab,ac=a(63
)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag=ae.textService,{}ag.__index=ag local ah=20
local function ai(aj,ak,al)local am=Instance.new'GetTextBoundsParams'am.Text=al am.Font=aj am.Size=ak am.Width=math.huge
local an,ao=pcall(af.GetTextBoundsAsync,af,am)return if an then ao else Vector2.new(ak*0.6,ak)end local aj={}
local function ak(al,am)local an=tostring(al.Family)..'|'..tostring(al.Weight)..'|'..tostring(al.Style)..'|'..tostring(
am)local ao=aj[an]if ao then return ao end local ap,aq={},0 for ar=0,9 do local as=math.ceil(ai(al,am,tostring(ar)).X)ap
[ar]=as if as>aq then aq=as end end ao={advance=ap,maxWidth=aq}aj[an]=ao return ao end function ag.new(al,am,an)an=an or
{}local ao=setmetatable({window=al,container=am,textSize=an.textSize or 16,transparency=an.transparency or 1,duration=an
.duration or 0.55,slots={},length=0},ag)ao.roll=TweenInfo.new(ao.duration,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out)ao.zIndex=math.max(am.ZIndex+1,6)ao.height=math.ceil(ao.textSize)local ap=ak(al.theme.Font,ao.textSize)ao.advance=ap
.advance ao.maxWidth=ap.maxWidth al:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment
=Enum.VerticalAlignment.Center,HorizontalAlignment=an.alignment or Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=am})return ao end function ag._reel(al,am)local an=al.slots[am]if an.
reel then return an.reel end local ao=al.window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(al.maxWidth,al.height)
,BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=al.zIndex,Parent=al.container})local ap=al.
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
target)end local aq=an.digit if aq==ao then return end local ar,as if ap then ar=aq as=aq+(ao-aq)%10 else ar=aq+10 as=ar
-(aq-ao)%10 end an.strip.Position=UDim2.new(0.5,0,0,-ar*am.height)an.target=ao local at,au=ae.tweenService:Create(an.
strip,am.roll,{Position=UDim2.new(0.5,0,0,-as*am.height)}),ae.tweenService:Create(an.cell,am.roll,{Size=UDim2.
fromOffset(am.advance[ao],am.height)})an.stripTween=at an.sizeTween=au at.Completed:Connect(function(av)if av==Enum.
PlaybackState.Completed and an.stripTween==at then am:_reelSnap(an,ao)end end)at:Play()au:Play()an.digit=ao end function
ag._putDigit(am,an,ao,ap,aq)local ar=am:_reel(an)local as=not ar.cell.Visible ar.cell.Visible=true ar.cell.LayoutOrder=-
an if am.slots[an].static then am.slots[an].static.Visible=false end if aq and not as then am:_reelRoll(ar,ao,ap)else am
:_reelSnap(ar,ao)end end function ag._putStatic(am,an,ao)local ap=am:_static(an)if not ap.Visible then ap.
TextTransparency=am.transparency end ap.Text=ao ap.Visible=true ap.LayoutOrder=-an if am.slots[an].reel then am.slots[an
].reel.cell.Visible=false end end function ag._hide(am,an)local ao=am.slots[an]if not ao then return end if ao.reel then
ao.reel.cell.Visible=false end if ao.static then ao.static.Visible=false end end function ag._render(am,an,ao,ap)an=
tostring(an)if an==am._lastText then return end am._lastText=an local aq={}for ar,as in utf8.codes(an)do table.insert(aq
,utf8.char(as))end local ar=#aq for as=0,math.max(ar,am.length)-1 do am.slots[as]=am.slots[as]or{}if as<ar then local at
=aq[ar-as]if at:match'%d'then am:_putDigit(as,tonumber(at),ap,ao)else am:_putStatic(as,at)end else am:_hide(as)end end
am.length=ar end function ag.to(am,an,ao)am:_render(an,true,ao)end function ag.snap(am,an)am:_render(an,false,true)end
function ag.reveal(am,an,ao,ap)am.transparency=an for aq,ar in am.slots do if ar.static and ar.static.Visible then am.
window:_reveal(ar.static,{TextTransparency=an},ao,ap)end if ar.reel then for as,at in ar.reel.strip:GetChildren()do if
at:IsA'TextLabel'then am.window:_reveal(at,{TextTransparency=an},ao,ap)end end end end end return ag end)()end,[64]=
function()local aa,ab,ac=a(64)local ad return(function(...)type OrderedElement={main:GuiObject,descriptor:{main:
GuiObject}?}local function ae(af:OrderedElement,ag:number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.
main.LayoutOrder=ag+1 end end return ae end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(function(...)local
ae={}function ae.join(af:string,ag:string?):string if not ag or ag==''then return af end return af..'/'..ag end
local function af(ag:string):string local ah repeat ah=ag ag=ag:gsub('%.%.','')until ag==ah return ag end function ae.
sanitizeFolder(ag:unknown):string local ah=tostring(ag):gsub('\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')
return(ah:gsub('^/+',''))end function ae.sanitizeFile(ag:unknown):string local ah=tostring(ag):gsub('[/\\]',''):gsub(
'[:<>"|?*%c]','')return af(ah)end function ae.basename(ag:unknown):string return tostring(ag):match'[^/\\]+$'or
tostring(ag)end function ae.stripExtension(ag:unknown,ah:string?):string if ah and ah~=''then local ai=tostring(ag)if ai
:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end return ai end local ai=tostring(ag):match'^(.+)%.%w+$'return ai or
tostring(ag)end return ae end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(function(...)local ae,af,ag={},
ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.getPath=af.getPath ae.save=af.save ae.load=af.load
ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.getSettingsPath=ag.getSettingsPath ae.saveSettings=ag.
saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(
function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.log),ac(ab.Parent.
path),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),{}type PersistedControl={value:unknown,flag:string?,
_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,_deserialize:((PersistedControl,unknown)->())?,Set:(
PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:PersistedControl},configuration:{fileName:string?,
customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[string]:unknown}?,_loadedConfigPath:string?}function
ak.getPath(al:ConfigWindow,am:unknown?):(string?,string?)return ai.getConfigPath(al,am)end function ak.save(al:
ConfigWindow,am:unknown?):boolean local an,ao=ak.getPath(al,am)if not an or not ao then ag.warn(
"Rayfield: configuration name '"..tostring(am).."' has no usable characters")return false end if typeof(af.writefile)~=
'function'then return false end local ap:{[string]:unknown}={}for aq,ar in al.controls do local as,at=pcall(function()
local as=ar._serialize if as then return as(ar)end return ar.value end)if as then ap[aq]=at else ag.warn(
"Rayfield: Failed to serialize flag '"..tostring(aq).."' - "..tostring(at))end end local aq=al._loadedConfig if aq and
al._loadedConfigPath==ao then for ar,as in aq do if al.controls[ar]==nil then ap[ar]=as end end end local ar,as=pcall(ae
.httpService.JSONEncode,ae.httpService,ap)if not ar then ag.warn('Rayfield: Failed to encode configuration - '..
tostring(as))return false end local at,au=pcall(function()aj.write(an,ao,as)end)if not at then ag.warn(
'Rayfield: Failed to save configuration - '..tostring(au))return false end if al._loadedConfigPath==nil or al.
_loadedConfigPath==ao then al._loadedConfig=ap al._loadedConfigPath=ao end return true end local function al(am:string):
({[string]:unknown}?,string?)if not af.isfile(am)then return nil,nil end local an,ao=pcall(af.readfile,am)if not an or
type(ao)~='string'then ag.warn'Rayfield: Failed to read configuration file'return nil,nil end local ap,aq=pcall(ae.
httpService.JSONDecode,ae.httpService,ao)if not ap or type(aq)~='table'then return nil,ao end return aq::{[string]:
unknown},ao end local function am(an:string):string local ao=ah.stripExtension(an,'.rfld')local ap,aq=ao..
' (Incorrect Format).rfld',2 while aq<=100 and af.isfile(ap)do ap=ao..' (Incorrect Format '..aq..').rfld'aq+=1 end
return ap end function ak.load(an:ConfigWindow,ao:unknown?):boolean local ap,aq=ak.getPath(an,ao)if not ap or not aq
then ag.warn("Rayfield: configuration name '"..tostring(ao).."' has no usable characters")return false end if typeof(af.
isfile)~='function'then return false end local ar,as=al(aq)if not ar and af.isfile(aq)then local at,au=al(aj.
tempPathFor(aq))if at and au then ar=at pcall(aj.write,ap,aq,au)end end if not ar then if as then ag.warn
[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local at=am(aq)pcall(function()af.
ensureDir(ap)af.writefile(at,as)af.delfile(aq)end)end return false end local at,au=ar::{[string]:unknown},an._loading an
._loading=true local av,b=pcall(function()for av,b in an.controls do ak.applyTo(b,at[av])end end)an._loading=au if not
av then ag.warn('Rayfield: Failed to apply configuration - '..tostring(b))end an._loadedConfig=at an._loadedConfigPath=
aq return true end function ak.applyTo(an:PersistedControl,ao:unknown)if ao==nil and not an._canBeNil then return end
local ap,aq=pcall(function()local ap=an._deserialize if ap then ap(an,ao)else an:Set(ao)end end)if not ap then ag.warn(
"Rayfield: Failed to restore flag '"..tostring(an.flag).."' - "..tostring(aq))end end function ak.list(an:ConfigWindow):
{string}local ao,ap:{string}=ak.getPath(an),{}if not ao then return ap end local aq,ar=pcall(af.listfiles,ao)if not aq
or type(ar)~='table'then return ap end for as,at in ar do local au=ah.basename(at)if au:sub(-5)=='.rfld'then local av=ah
.stripExtension(au,'.rfld')if av and av~=''and not av:find' %(Incorrect Format[^%)]*%)$'then table.insert(ap,av)end end
end table.sort(ap)return ap end function ak.delete(an:ConfigWindow,ao:unknown):boolean if type(ao)~='string'or ao==''
then return false end local ap,aq=ak.getPath(an,ao)if not aq then return false end if typeof(af.isfile)~='function'or
not af.isfile(aq)then return false end pcall(af.delfile,aj.tempPathFor(aq))return(pcall(af.delfile,aq))end return ak end
)()end,[68]=function()local aa,ab,ac=a(68)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.
Parent.path),{}type ConfigWindow={configuration:{fileName:string?,customFolder:string?},name:string}function ag.
getConfigPath(ah:ConfigWindow,ai:unknown?):(string?,string?)local aj=ae.fileSystemManager:getPath'Configurations'if ah.
configuration.customFolder then aj=af.join(aj,af.sanitizeFolder(ah.configuration.customFolder))end if ai~=nil then local
ak=af.sanitizeFile(ai)if ak==''then return nil,nil end return aj,af.join(aj,ak..'.rfld')end local ak=af.sanitizeFile(ah.
configuration.fileName or ah.name)if ak==''then ak=af.sanitizeFile(ah.name)end if ak==''then ak='Configuration'end
return aj,af.join(aj,ak..'.rfld')end function ag.getSettingsPath():(string,string)local ah=ae.fileSystemManager:getPath
'Settings'return ah,af.join(ah,'rayfield.rfld')end return ag end)()end,[69]=function()local aa,ab,ac=a(69)local ad
return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.
persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),ac(ab.Parent.constants),{}type SettingsWindow={
settings:{toggleKeybind:EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean,
showProfile:boolean,theme:string?}}type DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,
keepOnScreen:unknown?,welcomeToast:unknown?,haptics:unknown?,showProfile:unknown?,theme:unknown?}function ak.
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
theme)then am.settings.theme=ap.theme end return true end return ak end)()end,[70]=function()local aa,ab,ac=a(70)local
ad return(function(...)local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string
return ah..ag end function af.write(ah:string,ai:string,aj:string)local ak=af.tempPathFor(ai)ae.ensureDir(ah)ae.
writefile(ak,aj)if ae.readfile(ak)~=aj then error'parked copy did not write cleanly'end ae.writefile(ai,aj)pcall(ae.
delfile,ak)end return af end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae,af,ag=ac(ab.
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
nil end local ai=ah:gsub('/+$','')return ai end return ag end)()end,[72]=function()local aa,ab,ac=a(72)local ad return(
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
end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae={}function ae.getService(af)local ag=
game:GetService(af)return if cloneref then cloneref(ag)else ag end return ae end)()end,[74]=function()local aa,ab,ac=a(
74)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{}
,{},0,1024 local function ak(al:GetTextBoundsParams):unknown local am,an=pcall(function()return af:GetTextBoundsAsync(al
)end)return if am then an else nil end local function al(am:unknown,an:'X'|'Y'):number?if typeof(am)=='Vector2'then
return if an=='X'then am.X else am.Y end if type(am)=='table'and type((am::any)[an])=='number'then return(am::any)[an]
end return nil end function ag.textWidth(am:Font,an:number,ao:any):number ao=tostring(ao)local ap=tostring(am.Family)..
'|'..tostring(am.Weight)..'|'..tostring(am.Style)..'|'..tostring(an)..'|'..ao local aq=ah[ap]if aq then return aq end
local ar=Instance.new'GetTextBoundsParams'ar.Text=ao ar.Font=am ar.Size=an ar.Width=math.huge local as=al(ak(ar),'X')if
not as then local at=utf8.len(ao)or#ao return math.ceil(an*0.55*at)end local at=math.ceil(as)if ai>=aj then ah={}ai=0
end ah[ap]=at ai+=1 return at end function ag.textHeight(am:Font,an:number,ao:any,ap:number):number local aq=Instance.
new'GetTextBoundsParams'aq.Text=tostring(ao)aq.Font=am aq.Size=an aq.Width=ap local ar=al(ak(aq),'Y')return if ar then
math.ceil(ar)else an end return ag end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae,af
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
,[76]=function()local aa,ab,ac=a(76)local ad return(function(...)local ae,af=ac(ab.Parent.layouts),{}export type Profile
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
ao.Y)if aq.minAspectRatio then return al(aq,ar,as)end return ak(aq,ar,as)end return af end)()end},{{1,2,{'Rayfield'},{{2
,1,{'components'},{{26,2,{'tab'}},{3,2,{'action'}},{4,2,{'button'}},{25,2,{'stat'}},{20,2,{'progress'}},{32,2,{'toggle'}
},{6,2,{'chrome'}},{33,2,{'window'}},{9,2,{'console'}},{30,2,{'text'}},{7,2,{'colorpicker'}},{13,2,{'dropdown'}},{10,2,{
'descriptor'}},{5,2,{'chat'}},{27,2,{'tabSection'}},{24,2,{'slider'}},{12,2,{'drag'}},{28,2,{'tabSelector'}},{17,2,{
'nameplate'}},{11,2,{'divider'}},{21,2,{'search'}},{19,2,{'popup'}},{14,2,{'group'}},{31,2,{'toast'}},{23,2,{'sidebar'}}
,{22,2,{'section'}},{16,2,{'keybind'}},{8,2,{'column'}},{18,2,{'notification'}},{15,2,{'input'}},{29,2,{'tag'}}}},{42,1,
{'utility'},{{76,2,{'windowSizing'}},{66,2,{'persistence'}},{58,2,{'locale'}},{46,2,{'colors'}},{75,2,{'variables'}},{68
,2,{'persistencePaths'}},{69,2,{'persistenceSettings'}},{64,2,{'ordering'}},{51,2,{'filesystemManager'}},{62,2,{
'network'}},{61,2,{'moveable'}},{48,2,{'constants'}},{47,2,{'columns'}},{53,2,{'fontManager'}},{65,2,{'path'}},{72,2,{
'runtime'}},{52,2,{'flagNames'}},{50,2,{'filesystem'}},{70,2,{'persistenceWrite'}},{71,2,{'relayClient'}},{57,2,{
'layouts'}},{43,2,{'HapticEngine'}},{74,2,{'textMetrics'}},{63,2,{'odometer'}},{54,2,{'functions'}},{55,2,{'image'}},{60
,2,{'log'}},{44,2,{'animatedImage'}},{45,2,{'assetResolver'}},{59,2,{'lockable'}},{73,2,{'services'}},{67,2,{
'persistenceConfig'}},{49,2,{'enums'}},{56,2,{'imageCache'}}}},{41,2,{'types'}},{34,1,{'themes'},{{38,2,{'ember'}},{39,2
,{'frost'}},{40,2,{'rose'}},{35,2,{'amethyst'}},{37,2,{'default'}},{36,2,{'cobalt'}}}}}}},'0.4.1','Rayfield',string,task
,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,xpcall,tostring,tonumber,_VERSION local av,b,c
,d,e,f,g=aj.insert,aj.remove,aj.freeze or function(av)return av end,al.wrap,ae.sub,ae.match,ae.gmatch if at and e(at,1,4
)=='Lune'then local h,i=ap(ao,'@lune/task')if h and i then af=i end end local h=af and af.defer local i,j,k,l,m,n,o,p,q=
h or function(i,...)d(i)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{
},{},{},{},{},{}local r,s={GetFullName={{},function(r)local s,t=r.Name,r.Parent while t do s=t.Name..'.'..s t=t.Parent
end return s end},GetChildren={{},function(r)local s={}for t in ai,q[r]do av(s,t)end return s end},GetDescendants={{},
function(r)local s={}for t in ai,q[r]do av(s,t)for u,v in ai,t:GetDescendants()do av(s,v)end end return s end},
FindFirstChild={{'string','boolean?'},function(r,s,t)local u=q[r]for v in ai,u do if v.Name==s then return v end end if
t then for v in ai,u do return v:FindFirstChild(s,true)end end end},FindFirstAncestor={{'string'},function(r,s)local t=r
.Parent while t do if t.Name==s then return t end t=t.Parent end end},WaitForChild={{'string','number?'},function(r,s)
return r:FindFirstChild(s)end}},{}for t,u in ai,r do local v,w,x=u[1],u[2],{}for y,z in ai,v do local A,B=f(z,
'^([^%?]+)(%??)')x[y]={A,B}end s[t]=function(y,...)if not q[y]then ah("Expected ':' not '.' calling member function "..t
,2)end local z={...}for A,B in ai,x do local C=z[A]local D,E,F=an(C),B[1],B[2]if C==nil and not F then ah('Argument '..C
..' missing or nil',3)end if E~='any'and D~=E and not(D=='nil'and F)then ah('Argument '..A..' expects type "'..E..
'", got "'..D..'"',2)end end return w(y,...)end end local function t(u,v,w)local x,y=(ag({},{__mode='k'}))local function
z(A)ah(A..' is not a valid (virtual) member of '..u..' "'..v..'"',3)end local function A(B)ah(
'Unable to assign (virtual) property '..B..'. Property is read only',3)end local B,C={},{}C.__metatable=false C.__index=
function(D,E)if E=='ClassName'then return u elseif E=='Name'then return v elseif E=='Parent'then return w elseif u==
'StringValue'and E=='Value'then return y else local F=s[E]if F then return F end end for F in ai,x do if F.Name==E then
return F end end z(E)end C.__newindex=function(D,E,F)if E=='ClassName'then A(E)elseif E=='Name'then v=F elseif E==
'Parent'then if F==B then return end if w~=nil then q[w][B]=nil end w=F if F~=nil then q[F][B]=true end elseif u==
'StringValue'and E=='Value'then y=F else z(E)end end C.__tostring=function()return v end ag(B,C)q[B]=x if w~=nil then q[
w][B]=true end return B end local function u(v,w)local x,y,z,A=v[1],v[2],v[3],v[4]local B=j[y]local C=z and b(z,1)or B
local D=t(B,C,w)k[x]=D if z then for E,F in ai,z do D[E]=F end end if A then for E,F in ai,A do u(F,D)end end return D
end local v=t('Folder','['..ad..']')for w,x in ai,ab do u(x,v)end for w,x in ai,aa do local y=k[w]l[y]=x m[y]=w local z=
y.ClassName if z=='LocalScript'or z=='Script'then av(o,y)end end local function w(x)local y,z=x.ClassName,n[x]if z and y
=='ModuleScript'then return ak(z)end local A=l[x]local function B(C)local D,E,F=nil,ap(function()return debug.traceback(
nil,2)end)if E then D=F end return{Message=C,Traceback=D}end local function C(D)local E,F=ar(D.Message),x:GetFullName()
local G,H=f(E,'[^:]+:(%d+): (.+)')local I if not G or not au then I=F..':*: '..(H or E)else G=as(G)local J=m[x]local K=
au[J]local L=G-K+1 if L<0 then L='?'end I=F..':'..L..': '..H end local J=D.Traceback if J and J~=''then I=I..'\n'..J end
return I end if y=='LocalScript'or y=='Script'then local D,E=aq(A,B)if not D then ah(C(E),0)end else local D={aq(A,B)}
local E=b(D,1)if not E then local F=b(D,1)ah(C(F),0)end n[x]=D return ak(D)end end function a(x)local y=k[x]
local function z(A,...)local B={ap(A,...)}local C=b(B,1)if not C then ah(B[1],3)end return ak(B)end local A=c(ag({},{
__index=p,__newindex=function(A,B,C)p[B]=C end,__len=function()return#p end,__iter=function()return ai,p end}))local B,C
=c{version=ac,envname=ad,shared=A,script=am,require=ao},y local function D(E,...)local F,G,H=an(E),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if F=='table'and q[E]then if E.
ClassName~='ModuleScript'then ah(G,2)elseif E==y then ah(H,2)end return w(E)elseif F=='string'and e(E,1,1)~='@'then if#E
==0 then ah('Attempted to call require with empty string',2)end local I=y if e(E,1,1)=='/'then I=v elseif e(E,1,2)=='./'
then E=e(E,3)end local J for K in g(E,'([^/]*)/?')do local L=K if K=='..'then L='Parent'end if L~=''then local M=I:
FindFirstChild(L)if not M then local N=I.Parent if N then M=N:FindFirstChild(L)end end if M then I=M elseif K~=J and K~=
'init'and K~='init.server'and K~='init.client'then ah('Virtual script path "'..E..'" not found',2)end end J=K end if I.
ClassName~='ModuleScript'then ah(G,2)elseif I==y then ah(H,2)end return w(I)end return z(ao,E,...)end return B,C,D end
for x,y in ai,o do i(w,y)end return w(v:GetChildren()[1])