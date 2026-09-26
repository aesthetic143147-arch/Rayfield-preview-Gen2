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
local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,i={function()local b,c,d=a(1)local e return(function(
...)local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.types)
export type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
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
type Nameplate=j.Nameplate export type NameplateProps=j.NameplateProps export type Section=j.Section export type
TabSection=j.TabSection export type Text=j.Text export type Divider=j.Divider export type Tag=j.Tag export type Popup=j.
Popup export type Rayfield=j.Rayfield type WindowModule={new:(j.WindowProps)->j.Window}local k={}::Rayfield function k.
CreateWindow(l,m:j.WindowProps):j.Window local n:j.Window?,o:(()->())?if f.secureMode then g.preload(function(p)if p<=0
then return end local function q()if not n or n.unloaded then return end n:Notify{title=h.resolve'Secure mode',content=
if p==1 then h.resolve"An asset couldn't be cached and won't appear."else h.resolve
"Some assets couldn't be cached and won't appear."}end if n then q()else o=q end end)end local p=(d(c.components.window)
::WindowModule).new(m)n=p if o then task.spawn(o)o=nil end if f.secureMode then task.spawn(function()local q,r=f.
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
.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m,n=ac(af.variables),ac(af.services),ac(af.relayClient),ac(af.imageCache),
Color3.fromRGB(59,130,246),UDim2.fromScale(5.6,1.35),2.5,0.08,1.8,0.7,0.35,6.5,1.1,3,100,20 local function o(p)return
math.clamp(p,0,1)end local function p(q)return 1-(1-q)^3 end local function q(r)local s,t=1.5,2.5 return 1+t*(r-1)^3+s*(
r-1)^2 end local function r(s)return-(math.cos(math.pi*s)-1)/2 end local function s(t:string):string return(t:gsub('&',
'&amp;'):gsub('<','&lt;'):gsub('>','&gt;'))end function ae.new(t,u)u=if typeof(u)=='table'then u else{}local v=
setmetatable({window=t,title=u.title or u.Title or string.upper(tostring(t.name or'Rayfield')),subtitle=u.subtitle or u.
Subtitle,accent=u.accent or u.Accent or c,logo=u.logo or u.Logo,backdrop=u.backdrop or u.Backdrop,badge=u.badge or u.
Badge,endpoint=ai.base(u.endpoint or u.Endpoint),key=u.key or u.Key,transport=u.transport or u.Transport,showSelf=u.
showSelf~=false and u.ShowSelf~=false,hideDefaultName=u.hideDefaultName~=false and u.HideDefaultName~=false,maxDistance=
tonumber(u.maxDistance or u.MaxDistance)or m,lift=tonumber(u.lift or u.Lift)or e,checkInInterval=math.max(tonumber(u.
checkInInterval)or n,5),autoCheckIn=u.autoCheckIn~=false,enabled=true,plates={},users={},_alive=true,_images={}},ae)v.
players=ah.getService'Players'v.folder=t:Create('Folder',{Name=ag.httpService:GenerateGUID(false),Parent=ag.guiContainer
})v:_loadImages()local w=ag.localPlayer if w and v.showSelf then v.users[w.UserId]={badge=v.badge}end if v.players and v
.players.PlayerAdded then t:Connect(v.players.PlayerAdded,function(x)v:_reconcile(x)end)t:Connect(v.players.
PlayerRemoving,function(x)v:_drop(x)end)end v.stepConnection=t:Connect(ag.runService.RenderStepped,function()v:_step(os.
clock())end)v:_reconcileAll()if(v.endpoint or v.transport)and v.autoCheckIn then v:_startCheckIns()end return v end
function ae._loadImages(t)local function u(v,w)if v==false then return nil elseif v==nil then return{file=w}elseif type(
v)=='number'or(type(v)=='string'and v:match'^%d+$')then return{uri='rbxassetid://'..tostring(v)}end return{uri=tostring(
v)}end local v={logo=u(t.logo,'nameplate-mark.png'),backdrop=u(t.backdrop,'nameplate-backdrop.png')}for w,x in v do if x
.uri then t._images[w]=x.uri elseif x.file then task.spawn(function()local y=b.remote(x.file)if y and t._alive then t.
_images[w]=y for z,A in t.plates do t:_applyImages(A)end end end)end end end function ae._applyImages(t,u)local v,w=t.
_images.logo,t._images.backdrop if v then u.logo.Image=v u.logo.Visible=true u.monogram.Visible=false end if w then u.
backdrop.Image=w u.backdrop.Visible=true end end function ae._listPlayers(t)if t.players and t.players.GetPlayers then
return t.players:GetPlayers()end return{ag.localPlayer}end function ae._wants(t,u)return u~=nil and t.users[u.UserId]~=
nil end function ae._reconcileAll(t)for u,v in t:_listPlayers()do t:_reconcile(v)end for u in t.plates do if not t:
_wants(u)then t:_drop(u)end end end function ae._reconcile(t,u)if not t:_wants(u)then t:_drop(u)return end local v=t.
plates[u]if not v then v={player=u}t.plates[u]=v if u.CharacterAdded then v.characterConnection=t.window:Connect(u.
CharacterAdded,function(w)t:_attach(u,w)end)end if u.Character then t:_attach(u,u.Character)end elseif v.subtitle then v
.subtitle.Text=t:_subtitleFor(u)end end function ae._drop(t,u)local v=t.plates[u]if not v then return end t.plates[u]=
nil if v.characterConnection then t.window:Disconnect(v.characterConnection)end t:_vanish(v)end function ae._subtitleFor
(t,u)local v,w=if type(t.subtitle)=='function'then tostring(t.subtitle(u))elseif type(t.subtitle)=='string'then t.
subtitle else'@'..u.Name,t.users[u.UserId]local x=w and w.badge if x then local y=t.accent:ToHex()v=s(v)..`  <font color="#{
y}">\226\128\162  {s(string.upper(tostring(x)))}</font>`return v end return s(v)end function ae._attach(t,u,v)local w=t.
plates[u]if not w or not v then return end if w.gui then t:_vanish(table.clone(w))w.gui=nil end local x=v:FindFirstChild
'Head'if not x and v.WaitForChild then x=v:WaitForChild('Head',5)end if not x or not t.plates[u]then return end local y,
z=t.window,t.accent local A,B=z:Lerp(Color3.new(1,1,1),0.65),y:Create('BillboardGui',{Name='Nameplate',Adornee=x,Size=d,
StudsOffset=Vector3.new(0,t.lift,0),MaxDistance=t.maxDistance,AlwaysOnTop=false,LightInfluence=0,ResetOnSpawn=false,
Enabled=t.enabled,Parent=t.folder})local C=y:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=B
})local D,E=y:Create('UIScale',{Scale=0.8,Parent=C}),y:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=
1,Parent=C})y:Create('UICorner',{CornerRadius=UDim.new(0.3,0),Parent=E})local F,G=y:Create('UIStroke',{Color=z,Thickness
=4,Transparency=1,Parent=E}),y:Create('CanvasGroup',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(6,9,18),
BackgroundTransparency=0.1,GroupTransparency=1,BorderSizePixel=0,Parent=C})y:Create('UICorner',{CornerRadius=UDim.new(
0.3,0),Parent=G})local H,I=y:Create('ImageLabel',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ScaleType=Enum.
ScaleType.Crop,ImageTransparency=0.15,Visible=false,ZIndex=1,Parent=G}),y:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(3,5,10),BorderSizePixel=0,ZIndex=2,Parent=G})y:Create('UIGradient',{Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.15),NumberSequenceKeypoint.new(0.5,0.5),NumberSequenceKeypoint.new(1,
0.9)},Parent=I})local J=y:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromScale(0.22,2.4),Position=UDim2
.fromScale(-0.4,0.5),Rotation=18,BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,ZIndex=3,Parent=G})y:Create(
'UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0.86),
NumberSequenceKeypoint.new(1,1)},Parent=J})local K=y:Create('Frame',{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.
fromScale(0.5,0.03),Size=UDim2.new(0.84,0,0,1),BackgroundColor3=A,BorderSizePixel=0,ZIndex=4,Parent=G})y:Create(
'UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0.55),
NumberSequenceKeypoint.new(1,1)},Parent=K})local L,M,N,O,P=y:Create('ImageLabel',{AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.fromScale(0.05,0.5),Size=UDim2.fromScale(0.64,0.64),SizeConstraint=Enum.SizeConstraint.RelativeYY,
BackgroundTransparency=1,Visible=false,ZIndex=5,Parent=G}),y:Create('TextLabel',{AnchorPoint=Vector2.new(0,0.5),Position
=UDim2.fromScale(0.05,0.5),Size=UDim2.fromScale(0.64,0.64),SizeConstraint=Enum.SizeConstraint.RelativeYY,
BackgroundTransparency=1,Text=string.sub(t.title,1,1),TextScaled=true,TextColor3=A,FontFace=ag.brandFont(Enum.FontWeight
.Heavy),ZIndex=5,Parent=G}),y:Create('TextLabel',{Position=UDim2.fromScale(0.27,0.17),Size=UDim2.fromScale(0.68,0.38),
BackgroundTransparency=1,Text=t.title,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.fromRGB(
248,250,252),FontFace=ag.brandFont(Enum.FontWeight.Heavy),ZIndex=5,Parent=G}),y:Create('TextLabel',{Position=UDim2.
fromScale(0.27,0.58),Size=UDim2.fromScale(0.68,0.24),BackgroundTransparency=1,Text=t:_subtitleFor(u),RichText=true,
TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.fromRGB(165,180,205),FontFace=ag.brandFont(
Enum.FontWeight.SemiBold),ZIndex=5,Parent=G}),y:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,
Parent=C})y:Create('UICorner',{CornerRadius=UDim.new(0.3,0),Parent=P})local Q=y:Create('UIStroke',{Color=Color3.new(1,1,
1),Thickness=1.6,Transparency=1,Parent=P})local R,S,T=y:Create('UIGradient',{Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,z),ColorSequenceKeypoint.new(0.5,A),ColorSequenceKeypoint.new(1,z)},Parent=Q}),(v:
FindFirstChild'Humanoid')if S and t.hideDefaultName then T=S.DisplayDistanceType or Enum.HumanoidDisplayDistanceType.
Viewer S.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None end w.gui=B w.head=x w.humanoid=S w.nameType=T w.
subtitle=O w.born=os.clock()w.phase=(u.UserId%97)/97*10 w.parts={shell=C,scale=D,card=G,glowStroke=F,borderStroke=Q,
borderGradient=R,sweep=J,logo=L,title=N}w.logo=L w.monogram=M w.backdrop=H t:_applyImages(w)t:_step(os.clock())end
function ae._vanish(t,u)if not u.gui then return end if u.humanoid and u.nameType and u.humanoid.Parent then u.humanoid.
DisplayDistanceType=u.nameType end u.diedAt=os.clock()t._dying=t._dying or{}table.insert(t._dying,u)u.humanoid=nil end
local function t(u,v,w,x)local y=v.parts if not y then return end local z=o((w-v.born)/h)local A,B=p(z)*x,0.8+0.2*q(z)if
v.diedAt then local C=o((w-v.diedAt)/i)A*=1-C B*=1-0.08*C if C>=1 then return true end end local C=ag.workspace.
CurrentCamera if C and v.head and v.head.Parent then local D=(C.CFrame.Position-v.head.Position).Magnitude local E,F=o((
D-u.maxDistance*0.6)/(u.maxDistance*0.4)),o((D-l)/2)A*=(1-E)*F end y.card.GroupTransparency=1-A y.borderStroke.
Transparency=1-A*0.8 y.glowStroke.Transparency=1-A*0.1 y.scale.Scale=B local D=w+v.phase v.gui.StudsOffset=Vector3.new(0
,u.lift+math.sin(D*g)*f,0)y.borderGradient.Rotation=(D*45)%360 y.logo.Rotation=math.sin(D*0.7)*5 local E=(D%j)/k y.sweep
.Position=UDim2.fromScale(if E<1 then-0.3+1.6*r(E)else-0.4,0.5)return false end function ae._step(u,v)local w=if u.
enabled then 1 else 0 for x,y in u.plates do if y.gui then t(u,y,v,w)end end local x=u._dying if x then for y=#x,1,-1 do
local z=x[y]if t(u,z,v,w)then table.remove(x,y)u.window:DestroySubtree(z.gui)end end end end function ae._identity(u)
local v=ag.localPlayer return{user={id=if v then v.UserId else 0,name=if v then v.Name else'Player'},jobId=tostring(game
.JobId~=nil and game.JobId~=''and game.JobId or'studio')}end function ae.CheckIn(u):boolean if not u._alive then return
false end local v,w=ai.request(u,'POST','/v1/presence',u:_identity())if not v or type(w)~='table'or type(w.users)~=
'table'then return false end local x={}for y,z in w.users do local A=tonumber(type(z)=='table'and z.id)if A then x[A]={
badge=if type(z.badge)=='string'then z.badge else nil}end end local y=ag.localPlayer if y then if u.showSelf then x[y.
UserId]=x[y.UserId]or{}x[y.UserId].badge=x[y.UserId].badge or u.badge else x[y.UserId]=nil end end u.users=x u:
_reconcileAll()return true end function ae._startCheckIns(u)task.spawn(function()while u._alive and not u.window.
unloaded do u:CheckIn()task.wait(u.checkInInterval)end if u.endpoint or u.transport then ai.request(u,'DELETE',
'/v1/presence',u:_identity())end end)end function ae.SetEnabled(u,v:boolean)u.enabled=v~=false for w,x in u.plates do if
x.gui then x.gui.Enabled=true end end end function ae.SetTitle(u,v:string)u.title=tostring(v)for w,x in u.plates do if x
.parts then x.parts.title.Text=u.title end end end function ae.Add(u,v,w:string?)if typeof(v)~='Instance'and type(v)~=
'table'then return end u.users[v.UserId]={badge=w}u:_reconcile(v)end function ae.Remove(u,v)if v then u.users[v.UserId]=
nil u:_drop(v)end end function ae.Destroy(u)if not u._alive then return end u._alive=false for v in u.plates do u:_drop(
v)end task.delay(i+0.05,function()if u.stepConnection then u.window:Disconnect(u.stepConnection)end if u.folder then u.
window:DestroySubtree(u.folder)end end)end return ae end)()end,[18]=function()local aa,ab,ac=a(18)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='Notification'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f
,g,h,i,j,k=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo
.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.new(0.5,360,0.5,0),
UDim2.new(0.5,0,0.5,0),6,8 local function l(m)return math.clamp(#m*0.06+3,3,9)end function ae.new(m,n)n=if typeof(n)==
'table'then n else{}local o=setmetatable({window=assert(m,'Missing argument #1 (Window expected)'),title=n.title or n.
Title or'Notification',content=n.content or n.Content or'',icon=n.icon or n.Icon,_hovered=false,_dismissed=false},ae)o.
duration=n.duration or n.Duration or l(o.content)local p=o.icon~=nil and o.icon~=0 and o.icon~=''o.main=o.window:Create(
'Frame',{Name='Notification',BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.
notification,Parent=o.window.notifications})o.window:Create('UIPadding',{PaddingTop=UDim.new(0,k),Parent=o.main})o.body=
o.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=h,AnchorPoint=
Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.notification,BackgroundTransparency=1,Parent=o.main}
)o.window:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=o.body},{Color={'WindowColor',ah.
toColorSequence}})o.window:Create('UICorner',{Parent=o.body},{CornerRadius='CornerRoundness'})o.stroke=o.window:Create(
'UIStroke',{Transparency=1,Parent=o.body},{Color='SurfaceStroke'})o.shadow=o.window:CreateGlow(o.body,'ShadowColor',20,1
)o.window:Create('UIPadding',{PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=o.body})o.window:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=o.
body})if p then o.iconLabel=o.window:Create('ImageLabel',{Image=o.icon,Size=UDim2.fromOffset(24,24),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.notification,ImageTransparency=1,Parent=o.body
},{ImageColor3='ContentColor'})end o.container=o.window:Create('Frame',{Size=UDim2.fromOffset(p and 222 or 260,0),
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.
notification,Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=o.container})o.titleLabel=o.window:Create('TextLabel',{Text=o.title,
Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=16,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=o.
container},{TextColor3='ContentColor',FontFace='TitleFont'})if o.content~=''then o.descriptionLabel=o.window:Create(
'TextLabel',{Text=o.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize
=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex
=ai.zIndex.notification,TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='Font'})end o.window.
_notificationCount=(o.window._notificationCount or 0)+1 o.main.LayoutOrder=o.window._notificationCount local q=o.window.
_liveNotifications if not q then q={}o.window._liveNotifications=q end table.insert(q,o)while#q>j do local r=table.
remove(q,1)if r and r~=o then task.spawn(r._dismiss,r)end end o._connections={o.window:Connect(o.body.MouseEnter,
function()o._hovered=true end),o.window:Connect(o.body.MouseLeave,function()o._hovered=false end),o.window:Connect(o.
body.InputBegan,function(r)if r.UserInputType==Enum.UserInputType.MouseButton1 or r.UserInputType==Enum.UserInputType.
Touch then o:_dismiss()end end)}task.spawn(function()o:_show()end)return o end function ae._measure(m)local n=m.
iconLabel and 222 or 260 local o=ah.textHeight(m.window.theme.TitleFont,16,m.title,n)if m.descriptionLabel then o=o+4+ah
.textHeight(m.window.theme.Font,15,m.content,n)end return math.max(o,m.iconLabel and 24 or 0)+28 end function ae._show(m
)local n=m:_measure()+k if m._dismissed or not m.main.Parent then return end b.notify()ag.tweenService:Create(m.main,c,{
Size=UDim2.new(1,0,0,n)}):Play()ag.tweenService:Create(m.body,f,{Position=i}):Play()ag.tweenService:Create(m.body,d,{
BackgroundTransparency=0}):Play()ag.tweenService:Create(m.titleLabel,e,{TextTransparency=0}):Play()ag.tweenService:
Create(m.stroke,d,{Transparency=0.95}):Play()ag.tweenService:Create(m.shadow,e,{Transparency=0.6}):Play()task.wait(0.05)
if m._dismissed or not m.main.Parent then return end if m.iconLabel then ag.tweenService:Create(m.iconLabel,e,{
ImageTransparency=0}):Play()end task.wait(0.05)if m._dismissed or not m.main.Parent then return end if m.
descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e,{TextTransparency=0.35}):Play()end local o=0 while o<m
.duration and not m._dismissed and m.main.Parent do local p=task.wait()if not m._hovered then o+=p end end m:_dismiss()
end function ae._dismiss(m)if m._dismissed then return end m._dismissed=true local n=m.window._liveNotifications local o
=n and table.find(n,m)if n and o then table.remove(n,o)end if not m.main.Parent then return end ag.tweenService:Create(m
.body,d,{BackgroundTransparency=1}):Play()ag.tweenService:Create(m.stroke,d,{Transparency=1}):Play()ag.tweenService:
Create(m.shadow,e,{Transparency=1}):Play()ag.tweenService:Create(m.titleLabel,e,{TextTransparency=1}):Play()if m.
descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e,{TextTransparency=1}):Play()end if m.iconLabel then ag
.tweenService:Create(m.iconLabel,e,{ImageTransparency=1}):Play()end ag.tweenService:Create(m.body,g,{Size=UDim2.new(1,-
90,1,0)}):Play()local p=ag.tweenService:Create(m.main,g,{Size=UDim2.new(1,0,0,0)})p:Play()p.Completed:Wait()if not m.
main.Parent then return end for q,r in m._connections do m.window:Disconnect(r)end m.window:DestroySubtree(m.main)end
return ae end)()end,[19]=function()local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.__index=ae ae.__type=
'Popup'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m=ac(af.variables),ac(af.functions),ac(af.
constants),ac(af.locale),ac(af.log),ac(af.HapticEngine),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),400,22,24,22,16 local n,o,p,q,r,s,t,u=i-j*2,18,14,15,16,12,300,4 local v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K=n-u*2,16,13,
20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}local function L()for M=#J,1,-1 do local N=J[M]if N._closed or not N.
screenGui.Parent then table.remove(J,M)end end end local function M(N)L()return J[#J]==N end function ae.new(N,O)O=if
typeof(O)=='table'then O else{}local P=setmetatable({window=assert(N,'Missing argument #1 (Window expected)'),title=O.
title or O.Title or'Popup',subtitle=O.subtitle or O.Subtitle,content=O.content or O.Content,icon=O.icon or O.Icon,boxes=
O.boxes or O.Boxes,options=O.options or O.Options,dismissable=if O.dismissable~=nil then O.dismissable elseif O.
Dismissable~=nil then O.Dismissable else true,_reveal={},_connections={},_closed=false},ae)if not P.options or#P.options
==0 then P.options={{text='Okay'}}end P:_build()L()table.insert(J,P)task.spawn(function()P:_show()end)return P end
function ae._fade(N,O,P,Q)table.insert(N._reveal,{instance=O,prop=P,to=Q})return O end function ae._build(N)local O,P=N.
window,N.icon~=nil and N.icon~=0 and N.icon~=''N.screenGui=O:Create('ScreenGui',{Name=ag.httpService:GenerateGUID(false)
,IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.popup,ZIndexBehavior=Enum.
ZIndexBehavior.Global,Parent=ag.guiContainer})N.backdrop=O:Create('Frame',{Name='Backdrop',BackgroundColor3=Color3.
fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),Active=true,BackgroundTransparency=1,Parent=N.screenGui})N:
_fade(N.backdrop,'BackgroundTransparency',I)N.card=O:Create('Frame',{Name='Card',BackgroundColor3=Color3.fromRGB(255,255
,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,14),Size=UDim2.fromOffset(i,0),AutomaticSize=Enum.
AutomaticSize.Y,Active=true,BorderSizePixel=0,BackgroundTransparency=1,Parent=N.screenGui})N:_fade(N.card,
'BackgroundTransparency',0)O:_scaleSurface(N.card)O:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=
N.card},{Color={'WindowColor',ah.toColorSequence}})O:Create('UICorner',{Parent=N.card},{CornerRadius='CornerRoundness'})
N.cardStroke=O:Create('UIStroke',{Transparency=1,Parent=N.card},{Color='SurfaceStroke'})N:_fade(N.cardStroke,
'Transparency',0.95)N.cardShadow=O:CreateGlow(N.card,'ShadowColor',26,1)N:_fade(N.cardShadow,'Transparency',0.55)O:
Create('UIPadding',{PaddingLeft=UDim.new(0,j),PaddingRight=UDim.new(0,j),PaddingTop=UDim.new(0,k),PaddingBottom=UDim.
new(0,l),Parent=N.card})O:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,m),Parent=N.card})local Q=N:
_measureHeader(P)N:_buildHeader(P,Q)local R=N:_buildContent()N:_buildFooter()local S=2+(R>0 and 1 or 0)local T=k+Q+R+E+l
+m*(S-1)N.card.Size=UDim2.fromOffset(i,T)N.card.AutomaticSize=Enum.AutomaticSize.None if N.dismissable then table.
insert(N._connections,O:Connect(N.backdrop.InputBegan,function(U)if U.UserInputType==Enum.UserInputType.MouseButton1 or
U.UserInputType==Enum.UserInputType.Touch then N:Close()end end))table.insert(N._connections,O:Connect(ag.
userInputService.InputBegan,function(U,V)if not V and U.KeyCode==Enum.KeyCode.Escape and M(N)then if U==K then return
end K=U N:Close()end end))end end function ae._buildHeader(N,O,P)local Q=N.window local R=Q:Create('Frame',{Name=
'Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,P),LayoutOrder=1,Parent=N.card})Q:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,s),Parent=R})if O then N:_fade(Q:
Create('ImageLabel',{Image=N.icon,Size=UDim2.fromOffset(r,r),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,
ImageTransparency=1,Parent=R},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end local S=Q:Create('Frame',{Name=
'Text',BackgroundTransparency=1,Size=UDim2.new(1,O and-(r+s)or 0,0,N._columnH),LayoutOrder=2,Parent=R})Q:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),
Parent=S})N:_fade(Q:Create('TextLabel',{Text=b.t(N.title),Size=UDim2.new(1,0,0,N._titleH),BackgroundTransparency=1,
TextSize=o,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=S},{
TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if N.subtitle and N.subtitle~=''then N:_fade(Q:Create(
'TextLabel',{Text=b.t(N.subtitle),Size=UDim2.new(1,0,0,N._subH),BackgroundTransparency=1,TextSize=p,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=S},{TextColor3='TitlingColor',FontFace=
'Font'}),'TextTransparency',0.55)end end function ae._buildContent(N)if(not N.content or N.content=='')and(not N.boxes
or#N.boxes==0)then return 0 end local O,P=N.window,if N.boxes and#N.boxes>0 then N:_measureBoxes()else N:_measureText()
local Q=math.min(P,t)+u*2 local R=O:Create('ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,
Size=UDim2.new(1,0,0,Q),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,
ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,
ScrollBarImageTransparency=1,Parent=N.card})N:_fade(R,'ScrollBarImageTransparency',0.8)O:Create('UIPadding',{PaddingLeft
=UDim.new(0,u),PaddingRight=UDim.new(0,u),PaddingTop=UDim.new(0,u),PaddingBottom=UDim.new(0,u),Parent=R})if N.boxes and#
N.boxes>0 then O:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,C),Parent=R})for S,T in N.boxes do N:
_buildBox(R,T,S)end else N:_fade(O:Create('TextLabel',{Text=b.t(N.content),Size=UDim2.new(1,0,0,P),
BackgroundTransparency=1,TextSize=q,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,TextTransparency=1,Parent=R},{TextColor3='ContentColor',FontFace='Font'}),'TextTransparency',0.5)end
return Q end function ae._buildBox(N,O,P,Q)local R=N.window P=if typeof(P)=='table'then P else{title=tostring(P)}local S
,T,U,V,W=P.icon~=nil and P.icon~=0 and P.icon~='',N:_measureBox(P)local X=R:Create('Frame',{Name='Box',BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-D,0,T),LayoutOrder=Q,BackgroundTransparency=1,Parent=O})
N:_fade(X,'BackgroundTransparency',0)local Y=R:StyleElementPanel(X)N:_fade(Y,'Transparency',R.theme.
ElementStrokeTransparency)R:Create('UIPadding',{PaddingLeft=UDim.new(0,w),PaddingRight=UDim.new(0,w),PaddingTop=UDim.
new(0,x),PaddingBottom=UDim.new(0,x),Parent=X})R:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,z),Parent=X})if S then N:_fade(R:Create('ImageLabel',{Image=P.icon,Size=UDim2.
fromOffset(y,y),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=X},{ImageColor3=
'ContentColor'}),'ImageTransparency',0)end local Z=R:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,S and-(y+
z)or 0,0,W),LayoutOrder=2,Parent=X})R:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=Z})N:_fade(R:Create('TextLabel',{Text=b.t(P.title or P.Title or''),
Size=UDim2.new(1,0,0,U),BackgroundTransparency=1,TextSize=A,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=Z},{TextColor3='ContentColor',FontFace='TitleFont'}),'TextTransparency',0)local
_=P.description or P.Description if _ and _~=''then N:_fade(R:Create('TextLabel',{Text=b.t(_),Size=UDim2.new(1,0,0,V),
BackgroundTransparency=1,TextSize=B,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=Z},{TextColor3='ContentColor',FontFace='Font'}),
'TextTransparency',0.65)end end function ae._buildFooter(N)local O=N.window local P=O:Create('Frame',{Name='Footer',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,E),LayoutOrder=3,Parent=N.card})O:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,F),Parent=P})for Q,R in N.options do N:_buildButton(P,R,Q)end end function ae._buildButton(N,O,P,Q)local R=N.
window P=if typeof(P)=='table'then P else{text=tostring(P)}local S,T,U,V,W,X,Y=P.style or P.Style or'neutral',P.text or
P.Text or P.name or P.Name or'Okay',P.callback or P.Callback if S=='primary'then V,W,X,Y=R.theme.AccentColor,R.theme.
AccentStroke,R.theme.AccentStroke,0.1 elseif S=='danger'then V,W,X,Y=R.theme.ErrorColor,R.theme.ErrorStrokeColor,R.theme
.ErrorStrokeColor,0 else V,W,X,Y=R.theme.NeutralButton,R.theme.NeutralButtonHover,R.theme.NeutralButtonStroke,0.85 end
local Z=R:Create('Frame',{Name='Button',BackgroundColor3=V,BorderSizePixel=0,Size=UDim2.new(0,0,0,E),LayoutOrder=Q,
BackgroundTransparency=1,Parent=O})N:_fade(Z,'BackgroundTransparency',0)R:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=Z})R:Create('UICorner',{CornerRadius=G,Parent=Z})local _=R:Create('UIStroke',{Color=X,Transparency=1,Parent=
Z})N:_fade(_,'Transparency',Y)N:_fade(R:Create('TextLabel',{Text=b.t(T),Size=UDim2.fromScale(1,1),BackgroundTransparency
=1,TextSize=H,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,TextColor3=ah.contrastText(
V),TextTransparency=1,Parent=Z},{FontFace='Font'}),'TextTransparency',0)local aj,ak=R:Create('TextButton',{Text='',
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=Z}),TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(N._connections,R:Connect(aj.MouseEnter,function()if N._closed
then return end ag.tweenService:Create(Z,ak,{BackgroundColor3=W}):Play()end))table.insert(N._connections,R:Connect(aj.
MouseLeave,function()ag.tweenService:Create(Z,ak,{BackgroundColor3=V}):Play()end))table.insert(N._connections,R:Connect(
aj.MouseButton1Click,function()if N._closed then return end d.click()ag.tweenService:Create(_,ak,{Transparency=1}):Play(
)if U then task.spawn(function()local al,am=pcall(U)if not al then c.warn("Rayfield: popup button '"..T..
"' callback errored:")c.print(am)end end)end N:Close()end))end function ae._measureHeader(aj,ak)local al=n-(if ak then r
+s else 0)aj._titleH=ah.textHeight(aj.window.theme.Font,o,b.resolve(aj.title),al)aj._subH=if aj.subtitle and aj.subtitle
~=''then ah.textHeight(aj.window.theme.Font,p,b.resolve(aj.subtitle),al)else 0 aj._columnH=aj._titleH+(if aj._subH>0
then 3+aj._subH else 0)return math.max(aj._columnH,if ak then r else 0)end function ae._measureText(aj)return ah.
textHeight(aj.window.theme.Font,q,b.resolve(aj.content),v)end function ae._measureBox(aj,ak)ak=if typeof(ak)=='table'
then ak else{title=tostring(ak)}local al=ak.icon~=nil and ak.icon~=0 and ak.icon~=''local am=v-D-w*2-(if al then y+z
else 0)local N,O,P=ah.textHeight(aj.window.theme.TitleFont,A,b.resolve(ak.title or ak.Title or''),am),0,ak.description
or ak.Description if P and P~=''then O=ah.textHeight(aj.window.theme.Font,B,b.resolve(P),am)end local Q=N+(if O>0 then 3
+O else 0)local R=math.max(Q,if al then y else 0)+x*2 return R,N,O,Q end function ae._measureBoxes(aj)local ak=0 for al,
am in aj.boxes do ak+=(aj:_measureBox(am))if al<#aj.boxes then ak+=C end end return ak end function ae._show(aj)if not
aj.screenGui.Parent then return end d.notify()ag.tweenService:Create(aj.card,e,{Position=UDim2.new(0.5,0,0.5,0)}):Play()
for ak,al in aj._reveal do local am=if al.instance==aj.backdrop then h else f ag.tweenService:Create(al.instance,am,{[al
.prop]=al.to}):Play()end end function ae.Close(aj)if aj._closed then return end aj._closed=true local ak=table.find(J,aj
)if ak then table.remove(J,ak)end for al,am in aj._connections do aj.window:Disconnect(am)end aj._connections={}if not
aj.screenGui.Parent then return end ag.tweenService:Create(aj.card,g,{Position=UDim2.new(0.5,0,0.5,10)}):Play()for al,am
in aj._reveal do ag.tweenService:Create(am.instance,g,{[am.prop]=1}):Play()end task.delay(g.Time,function()aj.window:
DestroySubtree(aj.screenGui)end)end return ae end)()end,[20]=function()local aa,ab,ac=a(20)local ad return(function(...)
local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,
i=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.locale),60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint
.new(1,0)},0.9 local j=TweenInfo.new(i,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut,-1,true)local function k(l:
unknown):number?local m=tonumber(l)if m==nil or m~=m or math.abs(m)==math.huge then return nil end return m end function
ae.new(l,m)m=if typeof(m)=='table'then m else{}local n=k(m.steps or m.Steps)n=if n and n>=2 then math.floor(n)else nil
local o=m.range or m.Range local p,q=k(o and o[1])or 0,k(o and o[2])or n or 1 if p>q then p,q=q,p end local r=
setmetatable({tab=assert(l,'Missing argument #1 (Tab expected)'),window=l.window,name=m.name or m.Name or'Progress',icon
=m.icon or m.Icon,description=m.description or m.Description,min=p,max=q,steps=n,value=0,text=m.text or m.Text,format=m.
format or m.Format,showValue=if m.showValue==nil then true else m.showValue==true,indeterminate=m.indeterminate or m.
Indeterminate or false},ae)r.value=r:_clamp(k(m.value or m.Value)or p)r:_build()if r.description then r.descriptor=ac(ab
.Parent.descriptor).new(r.tab,{description=r.description})end return r end function ae._clamp(l,m:number):number return
math.clamp(k(m)or l.min,l.min,l.max)end function ae._ratio(l):number local m=l.max-l.min if m<=0 then return 1 end
return(l.value-l.min)/m end function ae._filledSteps(l):number local m=l.steps::number return math.clamp(math.round(l:
_ratio()*m),0,m)end function ae._readout(l):string if l.text then return aj.resolve(l.text)end if l.format then local m,
n=pcall(l.format,l.value,l.min,l.max)if m and type(n)=='string'then return n end end if l.steps then return string.
format('%d/%d',l:_filledSteps(),l.steps)end return string.format('%d%%',math.round(l:_ratio()*100))end function ae.
_build(l)l.main=l.window:Create('Frame',{Size=UDim2.new(1,-20,0,ak),BorderSizePixel=0,Name=l.name,BackgroundColor3=
Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=l.tab.tabPage},{BackgroundTransparency='ElementTransparency'
})l.stroke=l.window:StyleElementBody(l.main)l.container=l.window:Create('Frame',{Size=UDim2.new(0,170,0,d),Position=
UDim2.new(0,am,0,20),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=l.main})l.window:
Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=l
.container})if l.icon then l.iconLabel=l.window:Create('ImageLabel',{Image=l.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=l.container},{ImageColor3='ContentColor'})end l.
title=l.window:Create('TextLabel',{Text=aj.t(l.name),Size=UDim2.fromOffset(250,d),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=d,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=l.container},{TextColor3='ContentColor',FontFace='Font'})l.
readout=l.window:Create('TextLabel',{Text=l:_readout(),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-am,0,20),
Size=UDim2.fromOffset(50,e),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=e,
TextXAlignment=Enum.TextXAlignment.Right,Visible=l.showValue,TextTransparency=1,Parent=l.main},{TextColor3=
'ContentColor',FontFace='Font'})if l.steps then l:_buildSteps()return end l.track=l.window:Create('Frame',{AnchorPoint=
Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.new(1,-am*2,0,al),BorderSizePixel=0,BackgroundTransparency
=1,Parent=l.main},{BackgroundColor3='SliderBackground'})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=l.
track})l.fill=l.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.
fromScale(if l.indeterminate then 0 else l:_ratio(),1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
ZIndex=2,BackgroundTransparency=1,Parent=l.track})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=l.fill})
l.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=h,Parent=l.fill},{Color={
'SliderProgress',ah.toColorSequence}})l.fillGlow=l.window:CreateGlow(l.fill,'AccentColor',20,1)if l.indeterminate then l
:_startSweep()end end function ae._buildSteps(l)local m=l.steps::number l.track=l.window:Create('Frame',{AnchorPoint=
Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2.new(1,-am*2,0,b),BackgroundTransparency=1,BorderSizePixel=
0,Parent=l.main})l.window:Create('UIListLayout',{Padding=UDim.new(0,c),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=l.track})l.stepFrames={}for n=1,m do local o=l.window:Create('Frame',{Size=UDim2.new(1/m,-(
c*(m-1))/m,1,0),BorderSizePixel=0,LayoutOrder=n,BackgroundTransparency=1,Parent=l.track},{BackgroundColor3=
'SliderBackground'})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=o})local p=l.window:Create('Frame',{
Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency
=1,Parent=o})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=p})l.window:Create('UIGradient',{Rotation=90,
Parent=p},{Color={'SliderProgress',ah.toColorSequence}})table.insert(l.stepFrames,{segment=o,fill=p})end end function ae
._startSweep(l)if l._sweep or l.steps then return end l.fill.AnchorPoint=Vector2.new(0,0.5)l.fill.Position=UDim2.
fromScale(0,0.5)l.fill.Size=UDim2.fromScale(0,1)l._sweep=ag.tweenService:Create(l.fill,j,{Size=UDim2.fromScale(1,1)})l.
_sweep:Play()end function ae._stopSweep(l)if not l._sweep then return end l._sweep:Cancel()l._sweep=nil l.fill.
AnchorPoint=Vector2.new(0,0.5)l.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(l,m:boolean?)l.readout.Text=
l:_readout()if l.steps then if not l._shown then return end local n=l:_filledSteps()for o,p in l.stepFrames do local q=
if o<=n then 0 else 1 if m==false then p.fill.BackgroundTransparency=q else ag.tweenService:Create(p.fill,g,{
BackgroundTransparency=q}):Play()end end return end local n=UDim2.fromScale(l:_ratio(),1)if m==false then l.fill.Size=n
else ag.tweenService:Create(l.fill,g,{Size=n}):Play()end end function ae.Set(l,m)l.value=l:_clamp(m)if l.indeterminate
then l.indeterminate=false l:_stopSweep()end l:_render()end function ae.Get(l):number return l.value end function ae.
GetPercentage(l):number return l:_ratio()end function ae.SetRange(l,m,n)m=k(m)or l.min n=k(n)or l.max if m>n then m,n=n,
m end l.min,l.max=m,n l.value=l:_clamp(l.value)l:_render()end function ae.SetText(l,m)l.text=m l.readout.Text=l:
_readout()end function ae.SetIndeterminate(l,m)m=m==true if m==l.indeterminate then return end l.indeterminate=m if m
then l:_startSweep()else l:_stopSweep()l:_render(false)end end function ae._setShown(l,m,n)local o=l.window l._shown=m o
:_reveal(l.readout,{TextTransparency=if m then f else 1},n)if m then o:_revealCommon(l,n)else o:_hideCommon(l,n)end if l
.steps then local p=l:_filledSteps()for q,r in l.stepFrames do o:_reveal(r.segment,{BackgroundTransparency=if m then 0
else 1},n)o:_reveal(r.fill,{BackgroundTransparency=if m and q<=p then 0 else 1},n)end return end o:_reveal(l.track,{
BackgroundTransparency=if m then 0 else 1},n)o:_reveal(l.fill,{BackgroundTransparency=if m then 0 else 1},n)o:_reveal(l.
fillGlow,{Transparency=if m then o.theme.AccentGlow else 1},n)end function ae.Remove(l)l:_stopSweep()if l.descriptor
then l.descriptor:Remove()end if l.tab._forget then l.tab:_forget(l)end l.window:DestroySubtree(l.main)end ai(ae)return
ae end)()end,[21]=function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,
ag,ah,ai,aj,ak,al,am=ac(ae.variables),ac(ae.constants),ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),0.6,0.2 local function b(c)if c.__type=='Group'then local d={}local function
e(f)for g,h in f.elements do if h.__type=='Group'then e(h)elseif h.name then table.insert(d,h.name)end end end e(c)
return table.concat(d,'\n')end return c.name or''end local function c(d)local e={}for f,g in d.tabs do if g.
neglectSelector then continue end for h,i in g.elements do if i.__type~='Section'then table.insert(e,i)end end end
return e end local function d(e,f,g)af.tweenService:Create(e.searchPill,g,{BackgroundTransparency=if f then 0.9 else 1})
:Play()af.tweenService:Create(e.searchStroke,g,{Transparency=if f then 0.85 else 1}):Play()af.tweenService:Create(e.
searchShadow,g,{Transparency=if f then 0.92 else 1}):Play()af.tweenService:Create(e.searchIcon,g,{ImageTransparency=if f
then 0.65 else 1}):Play()af.tweenService:Create(e.searchInput,g,{TextTransparency=if f then 0.2 else 1}):Play()end
local function e(f,g,h)if f.layout.mode=='sidebar'then return end for i,j in f.tabs do if not j.neglectSelector and j.
topbarItem then j:_applyVisual(if g then(if f.selectedTab==j then'selected'else'unselected')else'hidden',h)end end end
local function f(g,h)h=string.lower(h or'')local i=false for j,k in g._searchUnits do local l=h==''or string.find(k.text
,h,1,true)~=nil k.unit.main.Visible=l if k.unit.descriptor then k.unit.descriptor.main.Visible=l end i=i or l end g.
searchEmpty.Visible=not i and h~=''end local function g(h)h._searchUnits={}local i=0 for j,k in c(h)do i+=1 local l=k.
main table.insert(h._searchUnits,{unit=k,text=string.lower(b(k)),homeParent=l.Parent,homeOrder=l.LayoutOrder,descOrder=k
.descriptor and k.descriptor.main.LayoutOrder})l.LayoutOrder=i*10 l.Parent=h.searchPage l.Visible=true if k.descriptor
then k.descriptor.main.LayoutOrder=i*10+1 k.descriptor.main.Parent=h.searchPage k.descriptor.main.Visible=true end end
end local function h(i)for j,k in i._searchUnits do local l=k.unit if l.main and l.main.Parent then l.main.LayoutOrder=k
.homeOrder l.main.Parent=k.homeParent l.main.Visible=true end if l.descriptor and l.descriptor.main and l.descriptor.
main.Parent then l.descriptor.main.LayoutOrder=k.descOrder l.descriptor.main.Parent=k.homeParent l.descriptor.main.
Visible=true end end i._searchUnits={}end function aj.open(i)if i._searching or i.minimised or not i:_interactive()then
return end i._searching=true g(i)f(i,'')i:_jumpTo(i.searchPage)e(i,false,ak)task.delay(ak.Time,function()if i._searching
and i.layout.mode~='sidebar'then i.tabList.Visible=false end end)i.searchPill.Visible=true d(i,true,ak)i.searchInput:
CaptureFocus()af.tweenService:Create(i.searchAction.iconLabel,ak,{ImageTransparency=am}):Play()end function aj.close(i,j
)if not i._searching then return end j=j or{}i._searching=false i.searchInput.Text=''i.searchInput:ReleaseFocus()i.
searchEmpty.Visible=false h(i)local k=if j.jumpTo==nil then i.selectedTab and i.selectedTab.tabPage else j.jumpTo if k
then i:_jumpTo(k)end d(i,false,ak)task.delay(ak.Time,function()if not i._searching then i.searchPill.Visible=false end
end)if j.showTabs then i.tabList.Visible=true e(i,true,ak)end af.tweenService:Create(i.searchAction.iconLabel,ak,{
ImageTransparency=al}):Play()end function aj.toggle(i)if i._searching then aj.close(i,{showTabs=true})else aj.open(i)end
end function aj.railWidth(i,j)if i.searchPill then i.searchPill.Size=UDim2.new(1,-(j+30),0,35)end end function aj.build(
i)i._searching=false i.searchPage=i:Create('ScrollingFrame',{Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(
0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.
AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=ag.pageScrollbar.thickness,ScrollBarImageTransparency=
ag.pageScrollbar.transparency,VerticalScrollBarInset=Enum.ScrollBarInset.None,ScrollingDirection=Enum.ScrollingDirection
.Y,LayoutOrder=2000,Parent=i.elements},{ScrollBarImageColor3='ContentColor'})i:Create('UIListLayout',{Padding=UDim.new(0
,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=i.searchPage})i:Create('UIPadding',{PaddingTop=
UDim.new(0,if i.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),Parent=i.searchPage})i.searchEmpty=i
:Create('TextLabel',{Name='NoResults',Text=ah.t'No results',FontFace=af.brandFont(Enum.FontWeight.Medium),TextSize=15,
TextTransparency=0.6,BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.55,0),Size=
UDim2.fromOffset(200,20),Visible=false,ZIndex=3,Parent=i.main},{TextColor3='ContentColor',FontFace='Font'})local j=i.
layout.mode=='sidebar'local k=if j then i.layout.chromeHeight+8 else i.layout.tabStripTop+1 i.searchPill=i:Create(
'Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if j then 1 else 0.5,0),Position=UDim2.new(if j then 1 else 0.5,if j
then-15 else 0,0,k),Size=UDim2.new(1,if j then-(i.layout.railWidth+30)else-35,0,35),BackgroundColor3=Color3.fromRGB(255,
255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=i.main})i:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=i.searchPill})i.searchStroke=i:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Thickness=1,Transparency=1,Parent=i.searchPill})i.searchShadow=i:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=
Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=i.searchPill})i.searchIcon=i:Create('ImageLabel',{Image=
'rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,15,0.5,1),Size=UDim2.
fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=i.searchPill},{ImageColor3=
'ContentColor'})i.searchInput=i:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,TextTransparency=1,Parent
=i.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})i:Connect(i.searchInput:
GetPropertyChangedSignal'Text',function()if i._searching then f(i,i.searchInput.Text)end end)i.searchAction=ai.new(i,{
name='Search',icon=ag.icons.search,order=4,callback=function()aj.toggle(i)end})i.searchAction.isLit=function()return i.
_searching end end return aj end)()end,[22]=function()local aa,ab,ac=a(22)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale)
function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{}local aj=setmetatable({tab=assert(ah,
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
ac=a(23)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,b,c=ac(ae.variables
),ac(ae.image),ac(ae.locale),ac(ab.Parent.tabSelector),ac(ab.Parent.search),{},0,0.7,0.95,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)local function d(e)return e.layout.mode=='sidebar'and e.profile~=nil and e.
settings.showProfile and af.localPlayer~=nil end local function e(f,g)local h=af.localPlayer if not h then return end f.
profile=f:Create('Frame',{Name='Profile',AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1
,0,0,g.footerHeight),BackgroundTransparency=1,Parent=f.sidebar})f.profileContainer=f:Create('Frame',{AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.new(0,g.rowInset,0.5,0),Size=UDim2.new(1,-g.rowInset,1,0),BackgroundTransparency=1,Parent=f.
profile})f.profileLayout=f:Create('UIListLayout',{Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=f.profileContainer})f.profileAvatar=f:Create('ImageLabel',{Name='Avatar',Image=ag.avatar(h.
UserId,function(i)if f.profileAvatar and not f.unloaded then ag.assign(f.profileAvatar,'Image',i)end end),Size=UDim2.
fromOffset(g.avatarSize,g.avatarSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=f.profileContainer})f:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=f.profileAvatar})f.profileLabels=f:Create('Frame',{Size=UDim2.fromOffset(50,g.avatarSize),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=f.profileContainer})f:Create('UIListLayout',{Padding=UDim.
new(0,2),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=
Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f.profileLabels})f.profileName=f:Create(
'TextLabel',{Text=h.DisplayName,Size=UDim2.fromOffset(50,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1
,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=f.profileLabels},{TextColor3=
'TitlingColor',FontFace='Font'})f.profileSubtitle=f:Create('TextLabel',{Text='',Size=UDim2.fromOffset(50,14),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,Visible=false,TextTransparency=1,Parent=f.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})end
function ak.build(f,g)f.sidebar=f:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0
,1),Size=UDim2.new(0,g.railWidth,1,-g.chromeHeight),BackgroundTransparency=1,Visible=false,Parent=f.main})f.tabList=f:
Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1
,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,Parent=f.sidebar})f:Create('UIPadding',{PaddingTop=
UDim.new(0,g.railPadding),PaddingBottom=UDim.new(0,g.railPadding),Parent=f.tabList})f.tabListLayout=f:Create(
'UIListLayout',{Padding=UDim.new(0,g.rowSpacing),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f.
tabList})e(f,g)ak.reflowProfile(f)end function ak.reflowProfile(f)local g,h=f.layout,d(f)if f.profile then f.profile.
Visible=h end f.tabList.Size=UDim2.new(1,0,1,if h then-g.footerHeight else 0)end function ak.applyWidth(f,g)local h=f.
layout f.sidebar.Size=UDim2.new(0,g,1,-h.chromeHeight)f.elements.Size=UDim2.new(1,-g,1,-h.chromeHeight)f.bottomFade.Size
=UDim2.new(1,-g,h.fadeSize.Y.Scale,h.fadeSize.Y.Offset)aj.railWidth(f,g)local i=g<(h.railWidth::number)for j,k in f.tabs
do if not k.neglectSelector then ai.setRowCollapsed(k,i,h)end end if f.profileContainer then f.profileContainer.Position
=UDim2.new(0,if i then 0 else h.rowInset,0.5,0)f.profileContainer.Size=UDim2.new(1,if i then 0 else-h.rowInset,1,0)f.
profileLayout.HorizontalAlignment=if i then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left f.
profileLabels.Visible=not i end end function ak.setProfileShown(f,g,h)if not f.profile or not f.profile.Visible then
return end local i={[f.profileAvatar]={ImageTransparency=if g then 0 else 1,BackgroundTransparency=if g then b else 1},[
f.profileName]={TextTransparency=if g then al else 1},[f.profileSubtitle]={TextTransparency=if g then am else 1}}for j,k
in i do if h then af.tweenService:Create(j,h,k):Play()else for l,m in k do j[l]=m end end end end function ak.
setProfileEnabled(f,g)if not f.profile then f.settings.showProfile=g return end if g then f.settings.showProfile=true ak
.reflowProfile(f)ak.setProfileShown(f,true,c)return end ak.setProfileShown(f,false,c)task.delay(c.Time,function()if f.
unloaded or f.settings.showProfile then return end ak.reflowProfile(f)end)f.settings.showProfile=false end function ak.
setSubtitle(f,g)if not f.profileSubtitle then return end local h=if type(g)=='string'and g~=''then ah.resolve(g)else nil
f.profileSubtitle.Text=h or''f.profileSubtitle.Visible=h~=nil end return ak end)()end,[24]=function()local aa,ab,ac=a(24
)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.Parent.Parent.utility local ag,ah,
ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.
HapticEngine)local function b(c)local d=0 while d<6 do local e=c*10^d if math.abs(e-math.round(e))<1e-9 then break end d
+=1 end return d end local function c(d,e,f)local g=d[1]+math.round((f-d[1])/e)*e return math.clamp(g,d[1],d[2])end
local d,e,f,g,h,i=TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),440
,Vector2.new(35,20),Vector2.new(41,22)local j=math.ceil(h.X/2)local function k(l:number):UDim2 return UDim2.new(l,math.
round(j*(1-2*l)),1,0)end local function l():UDim2 return UDim2.new(1,0,0.5,0)end local function m(n:number,o:number,p:
number):number return math.clamp((n-o)/p,0,1)end function ae.new(n,o)o=if typeof(o)=='table'then o else{}local p=
setmetatable({tab=assert(n,'Missing argument #1 (Tab expected)'),window=n.window,name=o.name or o.Name or'Slider',icon=o
.icon or o.Icon,description=o.description or o.Description,forgetState=o.forgetState or o.ForgetState or n.forgetState,
range=o.range or o.Range or{0,100},increment=o.increment or o.Increment or 1,suffix=o.suffix or o.Suffix or'',callback=o
.callback or o.Callback or function()end,dragging=false,minimal=o.minimal or o.Minimal or false,_handleWidth=h.X},ae)
assert(typeof(p.range)=='table'and typeof(p.range[1])=='number'and typeof(p.range[2])=='number',
'A slider range needs two numbers, like { 0, 100 }.')if p.range[1]>p.range[2]then p.range={p.range[2],p.range[1]}end if
p.increment<=0 then p.increment=1 end p.value=if(o.value or o.Value)~=nil then(o.value or o.Value)elseif(o.currentValue
or o.CurrentValue)~=nil then(o.currentValue or o.CurrentValue)else p.range[1]p.value=c(p.range,p.increment,p.value)p.
_decimals=b(p.increment)p.flag=o.flag or o.Flag or(not p.forgetState and ah.deriveFlagFromName(p.name)or nil)p.window:
_registerControl(p)p.main=p.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=p.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=p.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})p.stroke=p.window:StyleElementBody(p.main)p._lastValue=p.value if not p.minimal then p:
_buildLabel()end p.track=p.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3='SliderBackground'}
)p.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=p.track})p.progress=p.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=p.track})p.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=p.progress})p.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=p.progress},{Color={
'SliderProgress',ah.toColorSequence}})p.progressGlow=p.window:CreateGlow(p.progress,'AccentColor',20,1)p.handle=p.window
:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=l(),Size=UDim2.fromOffset(h.X,h.Y),BorderSizePixel=0,ZIndex=
50,BackgroundTransparency=1,Parent=p.progress},{BackgroundColor3='SliderHandle'})p.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=p.handle})p.handleGlow=p.window:CreateGlow(p.handle,Color3.fromRGB(255,255,255),10,1)p
.handleStroke=p.window:Create('UIStroke',{Transparency=1,Parent=p.handle},{Color='SliderStroke'})p.interact=p.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=p.
track})p.window:ConnectFor(p,p.main.MouseEnter,function()if not p.window:_interactive()then return end ag.tweenService:
Create(p.track,d,{BackgroundColor3=p.window.theme.SliderBackgroundHover}):Play()end)p.window:ConnectFor(p,p.main.
MouseLeave,function()ag.tweenService:Create(p.track,d,{BackgroundColor3=p.window.theme.SliderBackground}):Play()end)p.
window:ConnectFor(p,p.interact.InputBegan,function(q)if q.UserInputType==Enum.UserInputType.MouseButton1 or q.
UserInputType==Enum.UserInputType.Touch then am.click()p.dragging=true p:_setHeld(true)p:_updateFromMouse()if p.
_dragConnection then p._dragConnection:Disconnect()p._dragConnection=nil end p._dragConnection=ag.runService.
RenderStepped:Connect(function()if p.window.unloaded or not p.dragging then if p._dragConnection then p._dragConnection:
Disconnect()p._dragConnection=nil end return end p:_updateFromMouse()end)end end)p.window:ConnectFor(p,ag.
userInputService.InputEnded,function(q)if q.UserInputType==Enum.UserInputType.MouseButton1 or q.UserInputType==Enum.
UserInputType.Touch then p:_endDrag()end end)p.window:ConnectFor(p,ag.userInputService.WindowFocusReleased,function()p:
_endDrag()end)if p.description and not p.minimal then p.descriptor=ac(ab.Parent.descriptor).new(p.tab,{description=p.
description})end p.window:ConnectFor(p,p.main:GetPropertyChangedSignal'AbsoluteSize',function()if p.window.animating or(
p.window.hidden and p.window.hasShownOnce)then return end p:_applyLayout()end)p:_applyLayout()if p.minimal then p.main.
Size=UDim2.new(1,-20,0,41)p.track.AnchorPoint=Vector2.new(0.5,0.5)p.track.Position=UDim2.new(0.5,0,0.5,0)p.track.Size=
UDim2.new(1,-30,0,14)end p:_renderProgress()return p end function ae._buildLabel(n)n.container=n.window:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=n.main})n.containerLayout=n.window:Create('UIListLayout',{Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=n.container})n.
titleContainer=n.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,
Parent=n.container})n.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=n.titleContainer})n.
titleFlex=n.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=n.titleContainer})if n.icon then n.
iconLabel=n.window:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=n.titleContainer},{ImageColor3='ContentColor'})end n.title=
n.window:Create('TextLabel',{Text=al.t(n.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=n.titleContainer},{TextColor3='ContentColor',FontFace='Font'})n.window:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=n.title})n.valueHost=n.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=n.container})n.valueOdo=ai.new(n.window,n.
valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})n.valueOdo:snap(n:_format(n
.value))end function ae._setMainHeight(n,o)if n._widthManaged then n.main.Size=UDim2.new(n.main.Size.X.Scale,n.main.Size
.X.Offset,0,o)else n.main.Size=UDim2.new(1,-20,0,o)end end function ae._applyLayout(n)if n.minimal then return end local
o=n.main.AbsoluteSize.X local p=if o>0 and o<g then'narrow'else'wide'if n._layoutMode==p then return end n._layoutMode=p
if p=='narrow'then n:_setMainHeight(70)n.container.AnchorPoint=Vector2.new(0,0)n.container.Position=UDim2.new(0,20,0,14)
n.container.Size=UDim2.new(1,-40,0,16)n.containerLayout.FillDirection=Enum.FillDirection.Horizontal n.titleFlex.FlexMode
=Enum.UIFlexMode.Fill n.valueHost.AutomaticSize=Enum.AutomaticSize.X n.valueHost.Size=UDim2.new(0,0,0,16)n.track.
AnchorPoint=Vector2.new(0.5,1)n.track.Position=UDim2.new(0.5,0,1,-14)n.track.Size=UDim2.new(1,-30,0,14)else n:
_setMainHeight(65)n.container.AnchorPoint=Vector2.new(0,0.5)n.container.Position=UDim2.new(0,20,0.5,0)n.container.Size=
UDim2.new(0,170,0,33)n.containerLayout.FillDirection=Enum.FillDirection.Vertical n.titleFlex.FlexMode=Enum.UIFlexMode.
None n.valueHost.AutomaticSize=Enum.AutomaticSize.None n.valueHost.Size=UDim2.new(1,0,0,16)n.track.AnchorPoint=Vector2.
new(1,0.5)n.track.Position=UDim2.new(1,-15,0.5,0)n.track.Size=UDim2.new(0,222,0,14)end end function ae._format(n,o)local
p=string.format('%.'..n._decimals..'f',o)if n.suffix~=''then return p..' '..n.suffix end return p end function ae.
_pillTravel(n)return math.max(n.track.AbsoluteSize.X-j*2,0)end function ae._renderProgress(n,o)local p=n.range[2]-n.
range[1]local q=if p~=0 then math.clamp((n.value-n.range[1])/p,0,1)else 0 local r=k(q)if o then ag.tweenService:Create(n
.progress,o,{Size=r}):Play()else n.progress.Size=r end end function ae._updateFromMouse(n)local o=n:_pillTravel()if o<=0
then return end local p=m(ag.userInputService:GetMouseLocation().X,n.track.AbsolutePosition.X+j,o)local q=c(n.range,n.
increment,n.range[1]+p*(n.range[2]-n.range[1]))if q~=n.value then n.value=q if n.valueOdo then n.valueOdo:snap(n:
_format(q))end n._lastValue=q n:_renderProgress(f)n:_fireCallback(q)end end function ae._endDrag(n)if not n.dragging
then return end n.dragging=false n:_setHeld(false)if n._dragConnection then n._dragConnection:Disconnect()n.
_dragConnection=nil end n.window:_persist(n)end function ae._setHeld(n,o)if not o then n:_fireCallback(n.value)end local
p=if o then i else h n._handleWidth=p.X ag.tweenService:Create(n.handle,e,{Size=UDim2.fromOffset(p.X,p.Y),
BackgroundTransparency=if o then 0.7 else 0}):Play()ag.tweenService:Create(n.handleStroke,e,{Transparency=if o then 0.6
else 1}):Play()n:_renderProgress(e)end function ae._fireCallback(n,o)n.window:_runGuarded(n,n.callback,o,n.dragging==
true)end function ae.Set(n,o,p)o=c(n.range,n.increment,o)n.value=o if n.valueOdo then n.valueOdo:to(n:_format(o),o>=(n.
_lastValue or o))end n._lastValue=o n:_renderProgress(d)if not p then n:_fireCallback(o)n.window:_persist(n)end end
local n=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(o,p,q
)local r=o.window if p then r:_revealCommon(o,q)r:_reveal(o.track,{BackgroundTransparency=0},q)r:_reveal(o.progress,{
BackgroundTransparency=0},q)r:_reveal(o.handle,{BackgroundTransparency=0},q)if o.valueOdo then o.valueOdo:reveal(0.3,q)
end r:_reveal(o.progressGlow,{Transparency=math.max(0.55,r.theme.AccentGlow)},q,n)r:_reveal(o.handleGlow,{Transparency=
0.8},q,n)else r:_hideCommon(o,q)r:_reveal(o.track,{BackgroundTransparency=1},q)r:_reveal(o.progress,{
BackgroundTransparency=1},q)r:_reveal(o.handle,{BackgroundTransparency=1},q)if o.valueOdo then o.valueOdo:reveal(1,q)end
r:_reveal(o.progressGlow,{Transparency=1},q,n)r:_reveal(o.handleGlow,{Transparency=1},q,n)end end function ae.
_refreshTheme(o)ag.tweenService:Create(o.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
,{Transparency=math.max(0.55,o.window.theme.AccentGlow)}):Play()end function ae._minWidth(o)if o.minimal then return 100
end local p=40 if o.icon then p+=22 end p+=ah.textWidth(o.window.theme.Font,16,al.resolve(o.name))p+=12 p+=ah.textWidth(
o.window.theme.Font,15,o:_format(o.value))return math.max(p,160)end aj(ae)ak(ae)return ae end)()end,[25]=function()local
aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.constants),
ac(af.locale),ac(af.log)local b,c,d,e=ak.statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function f(g)return g.fill.
Keypoints[1].Value end local function g(h)if h>0 then return string.format('+%.1f%%',h)elseif h<0 then return string.
format('%.1f%%',h)else return'0%'end end local function h(i)if typeof(i)~='number'then return tostring(i)end local j=
math.round(math.abs(i))local k=string.format('%.0f',j)local l=k:reverse():gsub('%d%d%d','%0,'):reverse()if l:sub(1,1)==
','then l=l:sub(2)end return if i<0 and j~=0 then'-'..l else l end local function i(j)local k=math.round(j)if k>0 then
return'+'..h(k)elseif k<0 then return h(k)else return'0'end end function ae.new(j,k)k=if typeof(k)=='table'then k else{}
local l=setmetatable({tab=assert(j,'Missing argument #1 (Tab expected)'),window=j.window,name=k.name or k.Name or
'Statistic',icon=k.icon or k.Icon,description=k.description or k.Description,value=if(k.value or k.Value)~=nil then(k.
value or k.Value)else 0,_hasValue=(k.value or k.Value)~=nil,numberEasing=if(k.numberEasing~=nil)then k.numberEasing
elseif k.NumberEasing~=nil then k.NumberEasing else true,changeMode=k.changeMode or k.ChangeMode or'percentage',
changeBaseline=k.changeBaseline or k.ChangeBaseline or'previous',prefix=k.prefix or k.Prefix or'',suffix=k.suffix or k.
Suffix or'',compact=k.compact or k.Compact or j.compact or false,display=(k.display or k.Display or'value'),
_initialValue=if(k.value or k.Value)~=nil then(k.value or k.Value)else nil,_lastChange=0},ae)if l.compact then l:
_buildCompact()else l:_buildFull()end if l.description then if l.compact then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
l.name}'.`)else l.descriptor=ac(ab.Parent.descriptor).new(l.tab,{description=l.description})end end return l end
function ae._buildFull(j)local k=j.window j.main=k:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=j.
name,ZIndex=5,BackgroundTransparency=1,Parent=j.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})k:Create('UICorner',{Parent=j.main},{CornerRadius='ElementCornerRadius'})j.stroke=k:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=j.main},{Transparency='ElementStrokeTransparency'})j
.strokeGradient=k:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=b.neutral.stroke,Transparency=c,Parent
=j.stroke})j.titleContainer=k:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=j.main})j.gradientContainer=k:Create('Frame',{
Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,BackgroundColor3=
Color3.fromRGB(255,255,255),ZIndex=5,Parent=j.main})j.glow=k:CreateGlow(j.main,f(b.neutral),13,1)j.title=k:Create(
'TextLabel',{Text=al.t(j.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=j.
titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})j.mainGradient=k:Create('UIGradient',{Rotation=2,Offset
=Vector2.new(0,0.5),Color=b.neutral.fill,Transparency=c,Parent=j.gradientContainer})k:Create('UICorner',{Parent=j.
gradientContainer},{CornerRadius='ElementCornerRadius'})if j.icon then j.iconLabel=k:Create('ImageLabel',{Image=j.icon,
Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=j.
titleContainer},{ImageColor3='ContentColor'})end j.containerLayout=k:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=j.titleContainer})j.valueHost=k:Create('Frame',{
AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=j.main})j.changeHost=k:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.
new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=j.main})j.
valueOdo=ai.new(k,j.valueHost,{textSize=20,alignment=Enum.HorizontalAlignment.Left,transparency=1})j.valueOdo:snap(j:
_formatValue(j.value))j.changeOdo=ai.new(k,j.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})j.changeOdo:snap(j:_formatChange(0))j._accentGradients={j.strokeGradient,j.mainGradient}end function ae.
_buildCompact(j)local k,l=j.window,j.tab.compact or false j.main=k:Create('Frame',{Name=j.name,Size=if l then UDim2.
fromOffset(0,d)else UDim2.new(1,-20,0,d),AutomaticSize=if l then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=j.tab.tabPage},{BackgroundColor3=
'StatBackground',BackgroundTransparency='ElementTransparency'})k:Create('UICorner',{Parent=j.main},{CornerRadius=
'ElementCornerRadius'})j.stroke=k:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=j.main},{
Transparency='ElementStrokeTransparency'})j.strokeGradient=k:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),
Color=b.neutral.stroke,Transparency=c,Parent=j.stroke})if l then k:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=j.main})end k:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=j.main})j.card=k:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,d),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=j.main})k:Create('UICorner',{Parent=j.card},{CornerRadius='ElementCornerRadius'})j.
mainGradient=k:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=b.neutral.fill,Transparency=c,Parent=j.
card})k:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=j.card})k:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=j.card})j.titleContainer=k:Create('Frame'
,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=
0,ZIndex=6,Parent=j.card})k:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=j.titleContainer})k:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=j
.titleContainer})if j.icon then j.iconLabel=k:Create('ImageLabel',{Image=j.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=j.titleContainer},{
ImageColor3='ContentColor'})end j.title=k:Create('TextLabel',{Text=al.t(j.name),Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=j.
titleContainer},{TextColor3='ContentColor',FontFace='Font'})k:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=j.title})j.readoutHost=k:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=j.card})j.readoutOdo=ai.new(k,j.readoutHost,{
textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})j.readoutOdo:snap(j.display=='change'and j:
_formatChange(0)or j:_formatValue(j.value))j._accentGradients={j.strokeGradient,j.mainGradient}end function ae.
_setAccent(j,k,l)local m=b[k]j.strokeGradient.Color=m.stroke j.mainGradient.Color=m.fill if j.glow then j.glow.Color=f(m
)end local n,o=if l==1 then 14 elseif l==-1 then-10 else 2,if l==1 then Vector2.new(0.04,0.5)elseif l==-1 then Vector2.
new(-4E-2,0.5)else Vector2.new(0,0.5)for p,q in j._accentGradients do ag.tweenService:Create(q,e,{Rotation=n,Offset=o}):
Play()end end function ae._formatValue(j,k)return j.prefix..h(k)..j.suffix end function ae._formatChange(j,k)if j.
changeMode=='absolute'then return i(k)else return g(k)end end function ae._showValue(j,k,l,m,n)if j.numberEasing and not
n then k:to(j:_formatValue(l),l>=m)else k:snap(j:_formatValue(l))end end function ae._updateFullReadouts(j,k,l,m,n,o,p)j
:_showValue(j.valueOdo,k,l,p)if o then j.changeOdo:snap(o)j._lastChange=0 elseif j.numberEasing and not n then j.
changeOdo:to(j:_formatChange(m),m>=j._lastChange)j._lastChange=m else j.changeOdo:snap(j:_formatChange(m or 0))j.
_lastChange=m or 0 end end function ae._updateCompactReadout(j,k,l,m,n,o,p)if j.display=='change'then if o then j.
readoutOdo:snap(o)j._lastChange=0 elseif j.numberEasing and not n then j.readoutOdo:to(j:_formatChange(m),m>=j.
_lastChange)j._lastChange=m else j.readoutOdo:snap(j:_formatChange(m or 0))j._lastChange=m or 0 end else j:_showValue(j.
readoutOdo,k,l,p)end end function ae.Set(j,k)assert(typeof(k)=='number','Statistic:Set() - value must be a number, got '
..typeof(k))local l,m=j.value,not j._hasValue j.value=k j._hasValue=true if m then j._initialValue=k end local n=if j.
changeBaseline=='initial'then j._initialValue else l local o,p,q,r,s=m or n==k if o then p=0 r='neutral's=0 elseif n==0
then local t,u=if k>0 then'+'else'-',if j.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'q=t..u r=if k>0 then
'positive'else'negative's=if k>0 then 1 else-1 elseif j.changeMode=='percentage'then p=((k-n)/math.abs(n))*100 s=if p>0
then 1 elseif p<0 then-1 else 0 r=if s==1 then'positive'elseif s==-1 then'negative'else'neutral'else p=k-n s=if p>0 then
1 elseif p<0 then-1 else 0 r=if s==1 then'positive'elseif s==-1 then'negative'else'neutral'end j:_setAccent(r,s)if j.
compact then j:_updateCompactReadout(k,l,p,o,q,m)else j:_updateFullReadouts(k,l,p,o,q,m)end end function ae.
ResetBaseline(j,k)local l,m,n=j.value,not j._hasValue,if typeof(k)=='number'then k else j.value j._initialValue=n j.
value=n j._hasValue=true j._lastChange=0 if j.compact then if j.display=='change'then j.readoutOdo:snap(j:_formatChange(
0))else j:_showValue(j.readoutOdo,n,l,m)end else j.changeOdo:snap(j:_formatChange(0))j:_showValue(j.valueOdo,n,l,m)end j
:_setAccent('neutral',0)end function ae._setShown(j,k,l)local m=j.window if j.compact then m:_reveal(j.main,{
BackgroundTransparency=if k then(j.window.theme.ElementTransparency or 0)else 1},l)m:_reveal(j.stroke,{Transparency=if k
then j.window.theme.ElementStrokeTransparency else 1},l)m:_reveal(j.card,{BackgroundTransparency=if k then 0 else 1},l)m
:_reveal(j.title,{TextTransparency=if k then 0 else 1},l)if j.iconLabel then m:_reveal(j.iconLabel,{ImageTransparency=if
k then 0 else 1},l)end j.readoutOdo:reveal(if k then 0 else 1,l)return end if k then m:_revealCommon(j,l)m:_reveal(j.
gradientContainer,{BackgroundTransparency=0},l)m:_reveal(j.glow,{Transparency=0.82},l)j.valueOdo:reveal(0,l)j.changeOdo:
reveal(0,l)else m:_hideCommon(j,l)m:_reveal(j.gradientContainer,{BackgroundTransparency=1},l)m:_reveal(j.glow,{
Transparency=1},l)j.valueOdo:reveal(1,l)j.changeOdo:reveal(1,l)end end function ae._minWidth(j)local k=40 if j.icon then
k+=26 end k+=ah.textWidth(j.window.theme.Font,16,al.resolve(j.name))local l=if j.display=='change'then j:_formatChange(0
)else j:_formatValue(j.value)k+=ah.textWidth(j.window.theme.Font,17,l)return k end aj(ae)return ae end)()end,[26]=
function()local aa,ab,ac=a(26)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak,al,am,b=ac(af.variables),ac(af.constants),ac(af.HapticEngine),ac(af.log),ac(af.
columns),ac(ab.Parent.search),ac(ab.Parent.tabSelector),ac(ab.Parent.column)local function c(d,e)for f,g in e do if g.
__type=='Group'then c(d,g.elements)else d:_unregisterControl(g)end if g.connections then for h,i in g.connections do d:
Disconnect(i)end g.connections=nil end if g._dragConnection then g._dragConnection:Disconnect()g._dragConnection=nil end
if d._recordingKeybind==g then d._recordingKeybind=nil end if g._outsideClickConn then d:Disconnect(g._outsideClickConn)
g._outsideClickConn=nil end end end local d,e=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(f,g)g=if typeof(g)=='table'then g
else{}local h=setmetatable({window=assert(f,'Missing argument #1 (Window expected)'),name=g.name or g.Name,icon=g.icon
or g.Icon,neglectSelector=g.neglectSelector or g.NeglectSelector or false,customOrder=g.customOrder or g.CustomOrder or
0,forgetState=g.forgetState or g.ForgetState or false,elements={},connections={}},ae)assert(h.name or h.icon,
'A tab needs a name or an icon.')if not h.neglectSelector then am.build(h,h.window.layout)end h.tabPage=h.window:Create(
'ScrollingFrame',{Name=h.name,Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),
BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=ah.pageScrollbar.thickness,ScrollBarImageTransparency=ah.pageScrollbar.transparency,
VerticalScrollBarInset=Enum.ScrollBarInset.None,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=h.customOrder
or 0,Parent=h.window.elements},{ScrollBarImageColor3='ContentColor'})h.tabPageLayout=h.window:Create('UIListLayout',{
Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=h.tabPage})h.window:
Create('UIPadding',{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=h.tabPage})h.columnsRow=h.window:
Create('Frame',{Name='Columns',BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.
fromScale(1,0),Parent=h.tabPage})h.columnsLayout=h.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum
.SortOrder.LayoutOrder,Parent=h.columnsRow})h.Left=b.new(h,'Left')h.Right=b.new(h,'Right')h.left=h.Left h.right=h.Right
h:_layoutColumns()if not h.neglectSelector then table.insert(h.connections,h.window:Connect(h.topbarItemInteract.
MouseButton1Click,function()ai.click()h:Select()end))table.insert(h.connections,h.window:Connect(h.topbarItemInteract.
MouseEnter,function()if not h.window:_interactive()then return end if h.window.selectedTab~=h then h:_applyVisual(
'hover',e)h:_spinGradients()end end))table.insert(h.connections,h.window:Connect(h.topbarItemInteract.MouseLeave,
function()if h.window.selectedTab~=h then h:_applyVisual('unselected',e)end end))end return h end function ae.
_applyVisual(f,g,h)if f.neglectSelector or not f.topbarItem then return end local i=am.states[f.window.layout.mode][g]if
not i then return end am.applyVisual(f,i,h)end function ae._spinGradients(f)if f.neglectSelector then return end local g
=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)for h,i in{f.topbarItemGradient,f.
topbarItemStrokeGradient}do i.Rotation=-270 ag.tweenService:Create(i,g,{Rotation=90}):Play()end end function ae.Select(f
,g)if f.window._searching then al.close(f.window,{showTabs=true,jumpTo=false})end f.window.selectedTab=f f.window:
_jumpTo(f.tabPage)local h=g or not f.window:_interactive()if not f.neglectSelector and not h then f:_applyVisual(
'selected',d)end for i,j in f.window.tabs do if j~=f.window.selectedTab then j:Deselect(h)end end if f~=f.window.
rfSettings and f.window.settingsAction and not h then ag.tweenService:Create(f.window.settingsAction.iconLabel,TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end function ae.Deselect(f
,g)if not f.neglectSelector and not g then f:_applyVisual('unselected',d)end end function ae.GetColumn(f,g)local h=ak.
resolveSide(g)if not h then aj.warn(`Rayfield: unknown column '{tostring(g)}', using the left one. Use "Left" or "Right".`
)h='Left'end return if h=='Right'then f.Right else f.Left end function ae._columnFor(f,g)if typeof(g)~='table'then
return f.Left end return f:GetColumn(g.side or g.Side or g.column or g.Column)end function ae._layoutColumns(f)local g,h
=f.Left,f.Right if not g or not h or not f.columnsRow then return end local i=f.window local j=if i.size then ak.
pageWidth(i.size.X.Offset,i.layout)else 0 local k,l,m=ak.shouldStack(j),#g.elements>0,#h.elements>0 g.main.Visible=l h.
main.Visible=m f.stacked=k if k or not(l and m)then f.columnsLayout.FillDirection=Enum.FillDirection.Vertical f.
columnsLayout.Padding=UDim.new(0,if l and m then 20 else 0)g.main.Size=UDim2.fromScale(1,0)h.main.Size=UDim2.fromScale(1
,0)else f.columnsLayout.FillDirection=Enum.FillDirection.Horizontal f.columnsLayout.Padding=UDim.new(0,-ak.overlap)g.
main.Size=UDim2.new(0.5,ak.overlap/2,0,0)h.main.Size=UDim2.new(0.5,ak.overlap/2,0,0)end end function ae.CreateButton(f,g
)return f:_columnFor(g):CreateButton(g)end function ae.CreateToggle(f,g)return f:_columnFor(g):CreateToggle(g)end
function ae.CreateSwitch(f,g)return f:CreateToggle(g)end function ae.CreateSection(f,g)return f:_columnFor(g):
CreateSection(g)end function ae.CreateText(f,g)return f:_columnFor(g):CreateText(g)end function ae.CreateDivider(f,g)
return f:_columnFor(g):CreateDivider(g)end function ae.CreateProgress(f,g)return f:_columnFor(g):CreateProgress(g)end
function ae.CreateConsole(f,g)return f:_columnFor(g):CreateConsole(g)end function ae.CreateChat(f,g)return f:_columnFor(
g):CreateChat(g)end function ae.CreateStat(f,g)return f:_columnFor(g):CreateStat(g)end function ae.CreateSlider(f,g)
return f:_columnFor(g):CreateSlider(g)end function ae.CreateDropdown(f,g)return f:_columnFor(g):CreateDropdown(g)end
function ae.CreateInput(f,g)return f:_columnFor(g):CreateInput(g)end function ae.CreateKeybind(f,g)return f:_columnFor(g
):CreateKeybind(g)end function ae.CreateColorPicker(f,g)return f:_columnFor(g):CreateColorPicker(g)end function ae.
CreateGroup(f,g)return f:_columnFor(g):CreateGroup(g)end function ae.Remove(f)local g=f.window if g._searching then al.
close(g,{showTabs=true,jumpTo=g.selectedTab and g.selectedTab.tabPage})end local h=table.find(g.tabs,f)if h then table.
remove(g.tabs,h)end if g.selectedTab==f then g.selectedTab=nil for i,j in ipairs(g.tabs)do if not j.neglectSelector then
j:Select()break end end end c(g,f.elements)for i,j in f.connections do g:Disconnect(j)end f.connections={}if f.
topbarItem then g:DestroySubtree(f.topbarItem)end if f.tabPage then g:DestroySubtree(f.tabPage)end f.topbarItem=nil f.
tabPage=nil f.columnsRow=nil f.elements={}for i,j in{f.Left,f.Right}do j.elements={}end end return ae end)()end,[27]=
function()local aa,ab,ac=a(27)local ad return(function(...)local ae={}ae.__index=ae ae.__type='TabSection'local af,ag,ah
,ai,aj=ac(ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.utility.log),20,6,3 local function ak(al)for am,b in al.
tabs do if not b.neglectSelector then return true end end return#al.tabSections>0 end function ae.new(al,am)am=if
typeof(am)=='table'then am else{}local b=setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),name=am
.name or am.Name or'Section',icon=am.icon or am.Icon},ae)if al.layout.mode~='sidebar'then if not al._warnedTabSection
then al._warnedTabSection=true ag.warn
[[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]end b.inert=true return b
end b.main=al:Create('Frame',{Name=b.name,Size=UDim2.new(1,-ah*2,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=al.tabList})b.padding=al:Create('UIPadding',{PaddingTop=
UDim.new(0,if ak(al)then ai else 0),PaddingBottom=UDim.new(0,aj),Parent=b.main})al:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=b.main})if b.icon then b.iconLabel=al:
Create('ImageLabel',{Image=b.icon,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,
ImageTransparency=1,Parent=b.main},{ImageColor3='ContentColor'})end b.title=al:Create('TextLabel',{Text=af.t(b.name),
Size=UDim2.fromOffset(0,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Bottom,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=b.main},{TextColor3='ContentColor',FontFace='Font'})return b end function ae._setShown(al,am,b
)if not al.main then return end local c=al.window c:_reveal(al.title,{TextTransparency=if am then 0.6 else 1},b)if al.
iconLabel then c:_reveal(al.iconLabel,{ImageTransparency=if am then 0.65 else 1},b)end end function ae._setVisible(al,am
)if al.main then al.main.Visible=am end end function ae.Remove(al)local am=table.find(al.window.tabSections,al)if am
then table.remove(al.window.tabSections,am)end al.window:DestroySubtree(al.main)al.main=nil end return ae end)()end,[28]
=function()local aa,ab,ac=a(28)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai=ac(ae.
variables),ac(ae.functions),ac(ae.locale),{}local function aj(ak:string?):string if type(ak)~='string'or ak==''then
return'?'end local al=utf8.offset(ak,2)local am=if al then string.sub(ak,1,al-1)else ak return string.upper(am)end ai.
states={top={selected={background=0,stroke=0,content=0},hover={background=0.4,stroke=0.3,content=0.3},unselected={
background=0.8,stroke=0.65,content=0.5},hidden={background=1,stroke=1,content=1}},sidebar={selected={background=0.4,
stroke=0.5,content=0,shadow=0.8},hover={background=0.7,stroke=0.8,content=0.3,shadow=1},unselected={background=1,stroke=
1,content=0.5,shadow=1},hidden={background=1,stroke=1,content=1,shadow=1}}}local function ak(al,am,b)al.
topbarItemGradient=al.window:Create('UIGradient',{Rotation=90,Parent=am},{Color={'TabBackground',ag.toColorSequence}})al
.topbarItemStrokeGradient=al.window:Create('UIGradient',{Rotation=90,Parent=b},{Color={'TabStroke',ag.toColorSequence}})
end local function al(am,b,c)if c and not am.icon then am.topbarItemInitial=am.window:Create('TextLabel',{Text=aj(am.
name),Size=UDim2.fromOffset(b,b),BorderSizePixel=0,BackgroundTransparency=1,TextSize=b-4,TextXAlignment=Enum.
TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Visible=false,TextTransparency=1,Parent=am.
topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end if am.icon then am.topbarItemIcon=am.window:Create(
'ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(b,b),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,
Parent=am.topbarItemContainer},{ImageColor3='TabColor'})end if am.name then am.topbarItemTitle=am.window:Create(
'TextLabel',{Text=ah.t(am.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
AutomaticSize=Enum.AutomaticSize.XY,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end end local function am(b)b.
topbarItem=b.window:Create('Frame',{Name=b.name,Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=false,LayoutOrder=b.
customOrder or 0,Parent=b.window.tabList})b.topbarItemInteract=b.window:Create('TextButton',{Active=false,
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=b.topbarItem})b.
window:Create('UICorner',{Parent=b.topbarItem},{CornerRadius='PillCornerRadius'})b.topbarItemStroke=b.window:Create(
'UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=b.
topbarItem})ak(b,b.topbarItem,b.topbarItemStroke)b.topbarItemContainer=b.window:Create('Frame',{Size=UDim2.fromOffset(0,
34),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,Parent=b.topbarItem})b.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,13),PaddingRight=UDim.new(0,14),Parent=b.topbarItemContainer})b.topbarItemLayout=b.
window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent
=b.topbarItemContainer})al(b,16,false)end local function b(c,d)c.topbarItem=c.window:Create('Frame',{Name=c.name,Size=
UDim2.new(1,-d.rowInset*2,0,d.rowHeight),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,Visible=false,LayoutOrder=c.customOrder or 0,Parent=c.window.tabList})c.topbarItemInteract=c.
window:Create('TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',
TextTransparency=1,Parent=c.topbarItem})c.window:Create('UICorner',{CornerRadius=UDim.new(0,d.rowCornerRadius),Parent=c.
topbarItem})c.topbarItemStroke=c.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.
fromRGB(255,255,255),Transparency=1,Parent=c.topbarItem})ak(c,c.topbarItem,c.topbarItemStroke)c.topbarItemShadow=c.
window:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,255),Offset=UDim2.new(0,0,0,-15),Spread
=UDim2.new(0,10,0,-30),ZIndex=-1,Transparency=1,Parent=c.topbarItem})c.topbarItemContainer=c.window:Create('Frame',{Size
=UDim2.new(1,-d.rowPadding,0,24),Position=UDim2.new(0,d.rowPadding,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,BorderSizePixel=0,Parent=c.topbarItem})c.topbarItemLayout=c.window:Create('UIListLayout',{
Padding=UDim.new(0,d.rowContentSpacing),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=c
.topbarItemContainer})al(c,d.rowIconSize,true)end function ai.build(c,d)if d.mode=='sidebar'then b(c,d)else am(c)end end
function ai.setRowCollapsed(c,d,e)if e.mode~='sidebar'or not c.topbarItem then return end if c.topbarItemTitle then c.
topbarItemTitle.Visible=not d end if c.topbarItemInitial then c.topbarItemInitial.Visible=d end local f=if d then 0 else
e.rowPadding c.topbarItemContainer.Size=UDim2.new(1,-f,0,24)c.topbarItemContainer.Position=UDim2.new(0,f,0.5,0)c.
topbarItemLayout.HorizontalAlignment=if d then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end
function ai.applyVisual(c,d,e)local f={[c.topbarItem]={BackgroundTransparency=d.background},[c.topbarItemStroke]={
Transparency=d.stroke}}if c.topbarItemIcon then f[c.topbarItemIcon]={ImageTransparency=d.content}end if c.
topbarItemTitle then f[c.topbarItemTitle]={TextTransparency=d.content}end if c.topbarItemInitial then f[c.
topbarItemInitial]={TextTransparency=d.content}end if c.topbarItemShadow and d.shadow then f[c.topbarItemShadow]={
Transparency=d.shadow}end for g,h in f do if e then af.tweenService:Create(g,e,h):Play()else for i,j in h do g[i]=j end
end end end return ai end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae={}ae.__index=ae
ae.__type='Tag'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=ac(af.variables),ac(af.functions),ac(af.image),
Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(al,am)am=
if typeof(am)=='table'then am else{}local b=setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),text
=am.text or am.Text or am.title or am.Title,icon=am.icon or am.Icon,color=am.color or am.Color or aj},ae)assert(b.icon
or(b.text and b.text~=''),'A Tag requires an icon, text, or both.')b.main=b.window:Create('Frame',{Name='Tag',Size=UDim2
.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=b.color,BorderSizePixel=0,LayoutOrder=am.order or
am.Order or 0,BackgroundTransparency=1,Parent=b.window.tagContainer})b.window:Create('UICorner',{CornerRadius=UDim.new(1
,0),Parent=b.main})b.window:Create('UIPadding',{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=b.main})b.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.main})local c=ah.contrastColor(b.color)b.
iconLabel=b.window:Create('ImageLabel',{Name='Icon',Image=b.icon or'',ImageColor3=c,Size=UDim2.fromOffset(16,16),
BackgroundTransparency=1,Visible=b.icon~=nil,ZIndex=5,ImageTransparency=1,Parent=b.main})b.title=b.window:Create(
'TextLabel',{Name='Title',AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10,15),AutomaticSize=Enum.AutomaticSize.X
,BackgroundTransparency=1,Text=b.text or'',TextColor3=c,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=
true,RichText=true,Visible=b.text~=nil and b.text~='',LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=b.main},{FontFace
='Font'})b.window.tagContainer.Visible=true if not b.window.hidden then b:_setShown(true,ak)end return b end function ae
._setShown(al,am,b)local c,d=if am then 0 else 1,if typeof(b)=='TweenInfo'then b elseif b then ak else nil if d then ag.
tweenService:Create(al.main,d,{BackgroundTransparency=c}):Play()ag.tweenService:Create(al.iconLabel,d,{ImageTransparency
=c}):Play()ag.tweenService:Create(al.title,d,{TextTransparency=c}):Play()else al.main.BackgroundTransparency=c al.
iconLabel.ImageTransparency=c al.title.TextTransparency=c end end function ae.SetColor(al,am)al.color=am local b=ah.
contrastColor(am)ag.tweenService:Create(al.main,ak,{BackgroundColor3=am}):Play()ag.tweenService:Create(al.iconLabel,ak,{
ImageColor3=b}):Play()ag.tweenService:Create(al.title,ak,{TextColor3=b}):Play()end function ae.SetText(al,am)al.text=am
al.title.Text=am or''al.title.Visible=am~=nil and am~=''end function ae.SetIcon(al,am)al.icon=am ai.assign(al.iconLabel,
'Image',am)al.iconLabel.Visible=am~=nil end function ae.Set(al,am)if am.color or am.Color then al:SetColor(am.color or
am.Color)end if am.text or am.Text or am.title or am.Title then al:SetText(am.text or am.Text or am.title or am.Title)
end if am.icon~=nil or am.Icon~=nil then al:SetIcon(am.icon or am.Icon)end end function ae.Remove(al)al.window:
DestroySubtree(al.main)local am=table.find(al.window.tags,al)if am then table.remove(al.window.tags,am)end if#al.window.
tags==0 then al.window.tagContainer.Visible=false end end return ae end)()end,[30]=function()local aa,ab,ac=a(30)local
ad return(function(...)local ae={}ae.__index=ae ae.__type='Text'local af,ag,ah,ai,aj=ac(ab.Parent.Parent.utility.
moveable),ac(ab.Parent.Parent.utility.locale),16,14,0.45 function ae.new(ak,al)al=if typeof(al)=='table'then al else{}
local am=setmetatable({tab=assert(ak,'Missing argument #1 (Tab expected)'),window=ak.window,name=tostring(al.name or al.
Name or''),text=tostring(al.text or al.Text or''),icon=al.icon or al.Icon},ae)am.main=am.window:Create('Frame',{Size=
UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name=if am.name~=''then am.name else'Text',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})am.stroke=am.window:StyleElementBody(am.main)am.window:Create('UIPadding',{PaddingTop=UDim.new(0,
14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=am.main})am.window:
Create('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=am.main})am.titleRow=am.window:
Create('Frame',{Name='Title',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,LayoutOrder=1,Parent=am.main})am.window:Create('UIListLayout',{FillDirection=Enum.FillDirection
.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,
Parent=am.titleRow})if am.icon then am.iconLabel=am.window:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=am.titleRow},{ImageColor3='ContentColor'})end
am.title=am.window:Create('TextLabel',{Text=ag.t(am.name),Size=UDim2.new(1,if am.icon then-22 else 0,0,0),AutomaticSize=
Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ah,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,TextTransparency=1,Parent=am.titleRow},{TextColor3='TitlingColor',
FontFace='Font'})am.body=am.window:Create('TextLabel',{Text=ag.t(am.text),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ai,TextWrapped=true,TextXAlignment=
Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=am.main},{TextColor3='ContentColor',FontFace='Font'})am
:_applyPresence()return am end function ae._applyPresence(ak)ak.titleRow.Visible=ak.name~=''or ak.icon~=nil ak.body.
Visible=ak.text~=''end function ae.Set(ak,al)ak.text=tostring(al)ak.window:_bindLocale(ak.body,'Text',ak.text)ak:
_applyPresence()end function ae.SetTitle(ak,al)ak.name=tostring(al)ak.window:_bindLocale(ak.title,'Text',ak.name)ak:
_applyPresence()end function ae._setShown(ak,al,am)if al then ak.window:_revealCommon(ak,am)else ak.window:_hideCommon(
ak,am)end ak.window:_reveal(ak.body,{TextTransparency=if al then aj else 1},am)end af(ae)return ae end)()end,[31]=
function()local aa,ab,ac=a(31)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r=ac(af.variables),ac(af.functions),ac(af.
constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.new(0.5,0,0.5,-180),UDim2.
new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function s(t)return math.clamp(#t*0.06+3,3,9)end local function t(u)if
type(u)=='number'then return'rbxassetid://'..tostring(u)end return u end function ae.new(u,v,w)v=if typeof(v)=='table'
then v else{}local x=setmetatable({window=assert(u,'Missing argument #1 (Window expected)'),title=v.title or v.Title or
'',subtitle=v.subtitle or v.Subtitle,icon=v.icon or v.Icon,avatar=v.avatar or v.Avatar,minWidth=v.minWidth or v.MinWidth
,subtitleAbove=v.subtitleAbove or v.SubtitleAbove or false,position=v.position or'Top',_hovered=false,_dismissed=false},
ae)x.duration=v.duration or v.Duration or s(x.title..(x.subtitle or''))local y=x.avatar~=nil and x.avatar~=0 local z=y
or(x.icon~=nil and x.icon~=0 and x.icon~='')x._iconImage=if y then aj.avatar(x.avatar,function(A)if x.iconLabel and not
x._dismissed and x.main.Parent then aj.assign(x.iconLabel,'Image',A)end end)elseif z then t(x.icon)else nil x._iconSize=
if y then f else e x._leftPad=if y then i else g x._rightPad=if y then j else h x._minWidth=math.clamp(x.minWidth or 0,m
,n)local A=x.subtitle~=nil and x.subtitle~=''x.main=x.window:Create('Frame',{Name='Toast',BackgroundTransparency=1,Size=
UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=w or x.window.toasts})x.window:Create('UIPadding',{
PaddingTop=UDim.new(0,l),Parent=x.main})x.body=x.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),
Size=UDim2.new(1,0,1,0),Position=if x.position=='Bottom'then q else p,AnchorPoint=Vector2.new(0.5,0.5),Active=true,
BorderSizePixel=0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=x.main})x.window:Create('UIGradient',{Rotation=
270,Offset=Vector2.new(0,-0.1),Parent=x.body},{Color={'WindowColor',ah.toColorSequence}})x.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=x.body})x.stroke=x.window:Create('UIStroke',{Transparency=1,Parent=x.body},{Color=
'SurfaceStroke'})x.shadow=x.window:CreateGlow(x.body,'ShadowColor',20,1)x.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,x._leftPad),PaddingRight=UDim.new(0,x._rightPad),Parent=x.body})x.window:Create('UIListLayout',{FillDirection=Enum
.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,k),Parent=x.body})if z then x.iconLabel=x.window:Create(
'ImageLabel',{Image=x._iconImage,Size=UDim2.fromOffset(x._iconSize,x._iconSize),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,BackgroundTransparency=1,ImageTransparency=1,Parent=x
.body},if y then nil else{ImageColor3='ContentColor'})x.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=x.
iconLabel})end x.container=x.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,A and 32
or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.toastContent,Parent=x.body})x.window:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=x.container})x.titleLabel=x.window:Create('TextLabel',
{Text=x.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if x.subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,
TextTransparency=1,Parent=x.container},{TextColor3='ContentColor',FontFace='TitleFont'})if A then x.subtitleLabel=x.
window:Create('TextLabel',{Text=x.subtitle,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if x.subtitleAbove then 1 else
2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=x.container},{TextColor3='ContentColor',FontFace='Font'})end x
.window._toastCount=(x.window._toastCount or 0)+1 x.main.LayoutOrder=-x.window._toastCount local B=x.window._liveToasts
if not B then B={}x.window._liveToasts=B end local C=B[x.main.Parent]if not C then C={}B[x.main.Parent]=C end x._live=C
table.insert(C,x)while#C>o do local D=table.remove(C,1)if D and D~=x then task.spawn(D._dismiss,D)end end x._connections
={x.window:Connect(x.body.MouseEnter,function()x._hovered=true end),x.window:Connect(x.body.MouseLeave,function()x.
_hovered=false end),x.window:Connect(x.body.InputBegan,function(D)if D.UserInputType==Enum.UserInputType.MouseButton1 or
D.UserInputType==Enum.UserInputType.Touch then x:_dismiss()end end)}task.spawn(function()x:_show()end)return x end
function ae._measure(u)local v,w=ah.textWidth(u.window.theme.TitleFont,16,u.title),if u.subtitleLabel then ah.textWidth(
u.window.theme.Font,14,u.subtitle)else 0 local x,y=math.max(v,w),if u.iconLabel then u._leftPad+u._iconSize+k else u.
_leftPad local z=math.clamp(y+x+u._rightPad,u._minWidth,n)if y+x+u._rightPad>n then local A=n-y-u._rightPad for B,C in{u
.titleLabel,u.subtitleLabel}do if C then C.AutomaticSize=Enum.AutomaticSize.None C.TextTruncate=Enum.TextTruncate.AtEnd
C.Size=UDim2.fromOffset(A,C.Size.Y.Offset)end end end local A=if u.subtitleLabel then 31 else 16 local B=math.max(A,if u
.iconLabel then u._iconSize else 0)+18 return z,B end function ae._show(u)if not u.main.Parent then return end ak.
notify()local v,w=u:_measure()if u._dismissed or not u.main.Parent then return end u.main.Size=UDim2.new(0,v,0,0)ag.
tweenService:Create(u.main,am,{Size=UDim2.new(0,v,0,w+l)}):Play()ag.tweenService:Create(u.body,al,{Position=r}):Play()ag
.tweenService:Create(u.body,b,{BackgroundTransparency=0}):Play()ag.tweenService:Create(u.stroke,b,{Transparency=0.9}):
Play()ag.tweenService:Create(u.shadow,c,{Transparency=0.6}):Play()ag.tweenService:Create(u.titleLabel,c,{
TextTransparency=0}):Play()task.wait(0.05)if u._dismissed or not u.main.Parent then return end if u.iconLabel then ag.
tweenService:Create(u.iconLabel,c,{BackgroundTransparency=0.95}):Play()ag.tweenService:Create(u.iconLabel,c,{
ImageTransparency=0}):Play()end task.wait(0.05)if u._dismissed or not u.main.Parent then return end if u.subtitleLabel
then ag.tweenService:Create(u.subtitleLabel,c,{TextTransparency=0.5}):Play()end local x=0 while x<u.duration and not u.
_dismissed and u.main.Parent do local y=task.wait()if not u._hovered then x+=y end end u:_dismiss()end function ae.
_dismiss(u)if u._dismissed then return end u._dismissed=true local v=u._live local w=v and table.find(v,u)if v and w
then table.remove(v,w)end if not u.main.Parent then return end ag.tweenService:Create(u.body,b,{BackgroundTransparency=1
}):Play()ag.tweenService:Create(u.stroke,b,{Transparency=1}):Play()ag.tweenService:Create(u.shadow,c,{Transparency=1}):
Play()ag.tweenService:Create(u.titleLabel,c,{TextTransparency=1}):Play()if u.subtitleLabel then ag.tweenService:Create(u
.subtitleLabel,c,{TextTransparency=1}):Play()end if u.iconLabel then ag.tweenService:Create(u.iconLabel,c,{
ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(u.body,d,{Size=UDim2.new(1,-60,1,0)}):
Play()local x=ag.tweenService:Create(u.main,d,{Size=UDim2.new(0,u.main.Size.X.Offset,0,0)})x:Play()x.Completed:Wait()if
not u.main.Parent then return end for y,z in u._connections do u.window:Disconnect(z)end u.window:DestroySubtree(u.main)
end return ae end)()end,[32]=function()local aa,ab,ac=a(32)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al=ac(af.variables),ac(af.functions),ac(af.
moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(am,b)b=if typeof(b)=='table'then b else{}
local c=setmetatable({tab=assert(am,'Missing argument #1 (Tab expected)'),window=am.window,name=b.name or b.Name or
'Switch',icon=b.icon or b.Icon,description=b.description or b.Description,forgetState=b.forgetState or b.ForgetState or
am.forgetState,compact=am.compact or false,flag=b.flag or b.Flag or(not(b.forgetState or b.ForgetState or am.forgetState
)and ah.deriveFlagFromName(b.name or b.Name or'Switch')or nil),callback=b.callback or b.Callback or function()end,value=
if(b.value or b.Value)~=nil then(b.value or b.Value)else false},ae)c.window:_registerControl(c)if c.compact then c:
_buildCompact()else c:_buildFull()end if c.description and not c.compact then c.descriptor=ac(ab.Parent.descriptor).new(
c.tab,{description=c.description})end return c end function ae._buildSwitch(am,b)local c=am.window am.functionContainer=
c:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(50,21),BackgroundTransparency=1,Parent=b},{BackgroundColor3=
'ToggleTrack'})c:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=am.functionContainer})am.containerStroke=c:
Create('UIStroke',{Transparency=1,Parent=am.functionContainer},{Color='SurfaceStroke'})am.indicator=c:Create('Frame',{
BorderSizePixel=0,Size=UDim2.fromOffset(25,17),Position=am.value and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),
AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=am.value and am.window.theme.AccentColor or am.window.theme.
ToggleKnobOff,BackgroundTransparency=1,Parent=am.functionContainer})c:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=am.indicator})am.indicatorStroke=c:Create('UIStroke',{Color=am.value and am.window.theme.AccentStroke or Color3.
fromRGB(255,255,255),Transparency=1,Parent=am.indicator})am.indicatorGlow=c:CreateGlow(am.indicator,'AccentColor',20,1)
am.overlay=c:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=
Vector2.new(0,0),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.functionContainer},{
Visible='DarkToggleOverlay'})c:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=am.overlay})am.overlayGradient=c:
Create('UIGradient',{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0.35)},Parent=am.overlay})return am.functionContainer end function ae._performToggle(am)al.
click()am.value=not am.value am:_animateIndicator()am.window:_runGuarded(am,am.callback,am.value)am.window:_persist(am)
end function ae._buildFull(am)local b=am.window am.main=b:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,
Name=am.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})am.stroke=b:StyleElementBody(am.main)am.hoverOverlay=b:CreateHoverOverlay(
am.main)am.container=b:Create('Frame',{BorderSizePixel=0,Parent=am.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,
20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})am.containerLayout=b:Create('UIListLayout',{Padding=
UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=am.container})if am.icon then am.iconLabel=b:Create(
'ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,
Parent=am.container},{ImageColor3='ContentColor'})end am.title=b:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.
fromOffset(250,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.container},{
TextColor3='ContentColor',FontFace='Font'})am.interact=b:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,
0,1,0),BorderSizePixel=0,Position=UDim2.fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,ZIndex=10,
Parent=am.main})am:_buildSwitch(am.main)am.functionContainer.Position=UDim2.new(1,-15,0,20)am.functionContainer.
AnchorPoint=Vector2.new(1,0.5)am.window:_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,
function()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=1}):Play()ag.tweenService:Create(am.main,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Size=UDim2.new(1,-26,0,41)}):Play()am:_performToggle()task.wait(0.11)ag.tweenService:Create(am.
main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()ag.
tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=am.
window.theme.ElementStrokeTransparency}):Play()end)end function ae._buildCompact(am)local b=am.window am.main,am.stroke,
am.interact=b:_buildCompactRow(am.tab,am.name,10)am.hoverOverlay=am.interact b:Create('UIPadding',{PaddingLeft=UDim.new(
0,15),PaddingRight=UDim.new(0,15),Parent=am.interact})b:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim
.new(0,10),Parent=am.interact})am.container=b:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0
,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,Parent=am.interact})b:Create('UIFlexItem',{FlexMode=Enum.
UIFlexMode.Shrink,Parent=am.container})b:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=am.
container})if am.icon then am.iconLabel=b:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=am.container},{ImageColor3=
'ContentColor'})end am.title=b:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=am.container},{TextColor3='ContentColor',
FontFace='Font'})b:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.title})am:_buildSwitch(am.interact)am.
functionContainer.LayoutOrder=1 am.window:_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,
function()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=1}):Play()am:_performToggle()task.wait(0.11)ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=am.window.theme.ElementStrokeTransparency}):Play()end)end
function ae._animateIndicator(am)local b=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if am.
indicatorGlow then ag.tweenService:Create(am.indicatorGlow,b,{Transparency=am.value and am.window.theme.AccentGlow or 1}
):Play()end if am.value then ag.tweenService:Create(am.indicator,b,{Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=am.
window.theme.AccentColor,BackgroundTransparency=0}):Play()ag.tweenService:Create(am.indicatorStroke,b,{Color=am.window.
theme.AccentStroke,Transparency=0}):Play()else ag.tweenService:Create(am.indicator,b,{Position=UDim2.new(1,-47,0.5,0),
BackgroundColor3=am.window.theme.ToggleKnobOff,BackgroundTransparency=am.window.theme.ToggleKnobOffTransparency}):Play()
ag.tweenService:Create(am.indicatorStroke,b,{Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local am
,b=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(c,d,e)local f=c.window if d then f:
_revealCommon(c,e)f:_reveal(c.indicator,{BackgroundColor3=c.value and f.theme.AccentColor or f.theme.ToggleKnobOff,
BackgroundTransparency=c.value and 0 or f.theme.ToggleKnobOffTransparency},e,am)f:_reveal(c.indicatorStroke,{Color=c.
value and f.theme.AccentStroke or Color3.fromRGB(255,255,255),Transparency=c.value and 0 or 0.7},e,am)f:_reveal(c.
indicatorGlow,{Transparency=c.value and f.theme.AccentGlow or 1},e,b)f:_reveal(c.overlay,{BackgroundTransparency=0},e,am
)f:_reveal(c.containerStroke,{Transparency=0.85},e,am)f:_reveal(c.functionContainer,{BackgroundTransparency=f.theme.
ToggleTrackTransparency},e,am)else f:_hideCommon(c,e)f:_reveal(c.indicator,{BackgroundTransparency=1},e,am)f:_reveal(c.
indicatorStroke,{Transparency=1},e,am)f:_reveal(c.indicatorGlow,{Transparency=1},e,b)f:_reveal(c.overlay,{
BackgroundTransparency=1},e,am)f:_reveal(c.containerStroke,{Transparency=1},e,am)f:_reveal(c.functionContainer,{
BackgroundTransparency=1},e,am)end end function ae._refreshTheme(c)local d,e,f=c.window.theme,TweenInfo.new(0.5,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService f:Create(c.functionContainer,e,{BackgroundTransparency=d.
ToggleTrackTransparency}):Play()f:Create(c.indicator,e,{BackgroundColor3=c.value and d.AccentColor or d.ToggleKnobOff,
BackgroundTransparency=c.value and 0 or d.ToggleKnobOffTransparency}):Play()f:Create(c.indicatorStroke,e,{Color=c.value
and d.AccentStroke or Color3.fromRGB(255,255,255)}):Play()if c.indicatorGlow then f:Create(c.indicatorGlow,e,{
Transparency=c.value and d.AccentGlow or 1}):Play()end end function ae._minWidth(c)local d=90 if c.icon then d+=21 end d
+=ah.textWidth(c.window.theme.Font,16,ak.resolve(c.name))return d end ai(ae)aj(ae)function ae.Set(c,d,e)local f=c.value
~=d c.value=d if f then c:_animateIndicator()end if not e then c.window:_runGuarded(c,c.callback,c.value)c.window:
_persist(c)end end return ae end)()end,[33]=function()local aa,ab,ac=a(33)local ad return(function(...)local ae=ab.
Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h=ac(ae.image),ac(ae.functions),ac(ae.persistence),ac(ae
.constants),ac(ae.locale),ac(ae.log),ac(ae.HapticEngine),ac(ae.windowSizing),ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.
Parent.search),ac(ab.Parent.sidebar),ac(ae.variables),ab.Parent.Parent.themes,{}h.__index=h local i,j,k,l,m=TweenInfo.
new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.
new(0.5,0,0,20),UDim2.new(0.5,0,0,12)local n,o,p,q,r,s,t,u,v=UDim2.new(0.5,0,0,l.Y.Offset+j.Y.Offset+12),TweenInfo.new(
0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2 local function w(x,y):(UDim2,number)local
z=f.workspace.CurrentCamera local A=z and z.ViewportSize local B=y or am.scaleFor(A,x)return am.fit(if A then A/B else
nil,x),B end local x,y={'TopLeftRadius','TopRightRadius','BottomLeftRadius','BottomRightRadius'},(function()return(
pcall(function()local x=Instance.new'UICorner'x.TopLeftRadius=UDim.new(0,1)x:Destroy()end))end)()local function z(A)
return if A then b.sidebar else b.top end local A={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,
TabBackground=true,TabStroke=true,SliderProgress=true}local function B(C,D)if A[C]and typeof(D)=='Color3'then return
ColorSequence.new(D)end return D end local function C(D)return if typeof(D)=='ColorSequence'then D.Keypoints[1].Value
else D end local function D(E,F)local G=E._toastsTop if not G then return end local H=if E._collapsedShown then n else m
if not F or G.Position==H then G.Position=H return end f.tweenService:Create(G,o,{Position=H}):Play()end local function
E(F,G)local H=0.299*F.R+0.587*F.G+0.114*F.B local I=if H>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return F:Lerp(I
,G)end local function F(G,H)if H.ElementGradient then local I=C(G.ElementGradient)if H.ElementStroke==nil then G.
ElementStroke=E(I,0.28)end if H.ElementStrokeGradient==nil then G.ElementStrokeGradient=ColorSequence.new(E(I,0.4))end
if H.ElementStrokeHover==nil then G.ElementStrokeHover=E(I,0.52)end end if H.TabBackground and H.TabStroke==nil then G.
TabStroke=ColorSequence.new(E(C(G.TabBackground),0.4))end end local function G(H)if typeof(H)~='string'then return nil
end for I,J in ai.builtInThemes do if string.lower(J)==string.lower(H)then return J end end return nil end
local function H(I)if typeof(I)=='table'then return I elseif typeof(I)=='string'then local J=g:FindFirstChild(string.
lower(I))if J then return ac(J)end ak.warn("Rayfield: unknown theme '"..I.."', using default")elseif I~=nil then ak.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(g.default)end
local function I(J)local K,L=table.clone(ac(g.default)),H(J)for M,N in L do K[M]=B(M,N)end if typeof(J)=='table'then F(K
,L)end local M=if typeof(J)=='table'then J else nil if not(M and(M.Font or M.font))then K.Font=f.brandFont(Enum.
FontWeight.Medium)end if not(M and(M.TitleFont or M.titleFont))then K.TitleFont=f.brandFont(Enum.FontWeight.SemiBold)end
return K end function h.new(J)J=if typeof(J)=='table'then J else{}if J.translations or J.Translations then aj.register(J
.translations or J.Translations)end if J.translator or J.Translator then aj.translator=J.translator or J.Translator end
aj.setActive(J.locale or J.Locale or aj.detect())local K=J.fallbackFont or J.FallbackFont if K then f.setFallbackFont(K)
end local L,M=z(J.sidebarLayout or J.SidebarLayout),J.scale or J.Scale if M~=nil and(typeof(M)~='number'or M<=0)then ak.
warn[[Rayfield: scale must be a number above 0, using automatic scaling]]M=nil end local N,O=w(L.mode,M)local P=
setmetatable({name=J.name or J.Name or'Rayfield Window',subheading=J.subtitle or J.Subtitle,layout=L,size=N,scale=O,
fixedScale=M,instances={},connections={},icon=J.icon or J.Icon,showName=J.showName or J.ShowName or'Rayfield',showIcon=J
.showIcon or J.ShowIcon or ai.icons.rayfield,showIconOnly=J.showIconOnly or J.ShowIconOnly or false,profileText=J.
profile or J.Profile,themeProperties={},_scaledSurfaces={},actions={},localeProperties={},tabs={},tabSections={},tags={}
,selectedTab=nil,theme=I(J.theme or J.Theme),themeName=G(J.theme or J.Theme)or'Default',controls={},configuration=(
function()local P=J.configuration or J.Configuration if not P then return{}end return{autoSave=P.autoSave or P.AutoSave,
autoLoad=P.autoLoad or P.AutoLoad,fileName=P.fileName or P.FileName,customFolder=P.customFolder or P.CustomFolder}end)()
},h)P.Flags=setmetatable({},{__index=function(Q,R)local S=P.controls[R]return S and S.value end,__newindex=function(Q,R,
S)local T=P.controls[R]if not T then ak.warn("Rayfield: no flag '"..tostring(R).."' to set")return end T:Set(S)end,
__iter=function()local Q return function()local R Q,R=next(P.controls,Q)if Q then return Q,R.value end return nil end
end})P.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast=true,haptics=true,
showProfile=true,theme=nil}P.screenGui=P:Create('ScreenGui',{Name=f.httpService:GenerateGUID(false),IgnoreGuiInset=true,
ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=f.
guiContainer})P.main=P:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name=P.name,ZIndex=1,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((P.size.X.Offset-50),0),
BackgroundTransparency=1,Visible=false,Parent=P.screenGui})P.uiScale=P:Create('UIScale',{Scale=P.scale,Parent=P.main})P.
drag=ac(ab.Parent.drag).new(P)P.windowCorner=P:Create('UICorner',{Parent=P.main},{CornerRadius='CornerRoundness'})P.
windowStroke=P:Create('UIStroke',{Transparency=1,Parent=P.main},{Color='SurfaceStroke'})P.windowGradient=P:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=P.main},{Color={'WindowColor',ag.toColorSequence}})P.
bottomFade=P:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,AnchorPoint=Vector2.new(1,1)
,Position=UDim2.fromScale(1,1),Size=P.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,BackgroundTransparency=1,Parent=P.main
})P.bottomFadeCorner=P:_roundCorners(P.bottomFade,P.layout.fadeCorners)P.bottomFadeGradient=P:Create('UIGradient',{
Rotation=270,Offset=Vector2.new(0,0.2),Transparency=P.layout.fadeTransparency,Parent=P.bottomFade},{Color={'WindowColor'
,function(Q)return ColorSequence.new(ag.toColorSequence(Q).Keypoints[1].Value)end}})P.topbar=P:Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,P.layout.topbarHeight),Active=true,Parent=P.main})P.topContainer=P:Create(
'Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,Parent=P.topbar})P.topContainerLayout=P:Create('UIListLayout',{Padding=UDim.
new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment
=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=P.topContainer})P.titleContainer=P:Create(
'Frame',{Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=P.topContainer})P.titleContainerLayout=P:Create(
'UIListLayout',{Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=P.titleContainer})if P.name then P.title=P:Create('TextLabel',{Text=
aj.t(P.name),FontFace=f.brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.
X,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,
Parent=P.titleContainer},{FontFace='Font',TextColor3='TitlingColor'})end if P.icon then P.topbarIcon=P:Create(
'ImageLabel',{Image=P.icon,BackgroundTransparency=1,Size=UDim2.fromOffset(32,32),ImageTransparency=1,Parent=P.
topContainer},{ImageColor3='TitlingColor'})end if P.subheading then P.subtitle=P:Create('TextLabel',{Text=aj.t(P.
subheading),Size=UDim2.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=P.titleContainer},{TextColor3=
'TitlingColor',FontFace='Font'})end P.tagContainer=P:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0
,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,LayoutOrder=2,
Visible=false,Parent=P.topContainer})P.tagContainerLayout=P:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Parent=P.tagContainer})P.windowShadow=P:CreateGlow(P.main,'ShadowColor',20,1)P.elements=P:Create('Frame',{Size=UDim2.
new(1,0,1,-P.layout.chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,Parent=P.main})if P.layout.mode==
'sidebar'then P.elementsCorner=P:_roundCorners(P.elements,P.layout.cardCorners)P.elementsStroke=P:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=P.elements},{Color='SurfaceStroke'})P:Create(
'UIGradient',{Rotation=P.layout.cardStrokeRotation,Transparency=P.layout.cardStrokeTransparency,Parent=P.elementsStroke}
)end P.elementsLayout=P:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=P.layout.pageDirection,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.
EasingStyle.Exponential,TweenTime=0.4,Parent=P.elements})if P.layout.mode=='sidebar'then e.build(P,P.layout)e.
applyWidth(P,b.railWidthFor(P.layout,P.size.X.Offset))else P.tabList=P:Create('ScrollingFrame',{Name='Tabs',Active=true,
Size=UDim2.new(1,0,0,P.layout.tabStripHeight),Position=UDim2.new(0.5,0,0,P.layout.tabStripTop),AnchorPoint=Vector2.new(
0.5,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=P.main})P.
tabListLayout=P:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=P.tabList})P:Create('UIPadding',{PaddingLeft=UDim.new(0,22),PaddingRight=UDim.new(0,10),
Parent=P.tabList})end P.actionContainer=P:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,Parent=P.topbar})P.
actionsListLayout=P:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=P.actionContainer})P.rfSettings=P:CreateTab{name='Rayfield Settings',customOrder=1000,
neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(P,{name='Close',icon=ai.icons.close,order=1,callback=
function()P:ToggleHide()end})P.minimiseAction=ac(ab.Parent.action).new(P,{name='Minimise',icon=ai.icons.minimise,order=2
,callback=function()P:ToggleMinimise()end})P.settingsAction=ac(ab.Parent.action).new(P,{name='Settings',icon=ai.icons.
settings,order=3,linkedTab=P.rfSettings,callback=function()P.rfSettings:Select()end})d.build(P)P:_applyRailWidth()P.
unloaded=false P.minimised=false P.hidden=true P.animating=false P._revealing=false P.hasShownOnce=false P.
_collapsedShown=false P:LoadSettings()if P.settings.theme then P:ChangeTheme(P.settings.theme)end if P.layout.mode==
'sidebar'then e.reflowProfile(P)e.setSubtitle(P,P.profileText)end al.setContainer(P.screenGui)al.setEnabled(P.settings.
haptics)c.buildCollapsedFace(P)P:_bindKeybind()P:_bindMouseOverride()P:_bindTopbarDrag()P:_watchViewport()P:
_buildSettingsUI()P:_syncLiveAnimation()return P end function h._syncLiveAnimation(J)if not J.theme.LiveAnimation then J
._liveAnimating=false return end if J._liveAnimating then return end J._liveAnimating=true J._liveGeneration=(J.
_liveGeneration or 0)+1 local K=J._liveGeneration task.spawn(function()local L,M=true,TweenInfo.new(10,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)while J._liveGeneration==K and J._liveAnimating and not J.unloaded do local N=f.
tweenService:Create(J.windowGradient,M,{Offset=Vector2.new(if L then 0.4 else-0.2,0),Rotation=(if L then 220 else 280)})
J._liveTween=N N:Play()N.Completed:Wait()L=not L end if J._liveGeneration==K then J._liveAnimating=false J._liveTween=
nil end end)end function h._builtInThemeName(J)return J.themeName end function h.ChangeTheme(J,K)J.themeName=G(K)local L
=if typeof(K)=='table'then K else I(K)for M,N in L do J.theme[M]=B(M,N)end if typeof(K)=='table'then F(J.theme,L)end for
M,N in J.themeProperties do for O,P in N do local Q=if typeof(P)=='table'then P[2](J.theme[P[1] ])else J.theme[P]if
typeof(Q)=='Color3'or typeof(Q)=='number'then f.tweenService:Create(M,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[O]=Q}):Play()else M[O]=Q end end end if J.hidden then J._themeRefreshPending=true else J:
_refreshElementThemes()end J:_syncLiveAnimation()end function h._refreshElementThemes(J)for K,L in J.tabs do for M,N in
L.elements do if N._refreshTheme then N:_refreshTheme()end end end end function h.CreateTab(J,K)assert(not J.unloaded,
'Cannot create a tab on an unloaded window.')local L=ac(ab.Parent.tab).new(J,K)table.insert(J.tabs,L)if not L.
neglectSelector then local M=true for N,O in J.tabs do if O~=L and not O.neglectSelector then M=false break end end if M
then L:Select(true)end if not J.hidden and not J.minimised then L.topbarItem.Visible=true L:_applyVisual(if J.
selectedTab==L then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end
return L end function h.CreateSection(J,K)assert(not J.unloaded,'Cannot create a section on an unloaded window.')local L
=ac(ab.Parent.tabSection).new(J,K)table.insert(J.tabSections,L)if not L.inert and not J.hidden and not J.minimised then
L:_setVisible(true)L:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return L end
function h._setTabSectionsShown(J,K,L)for M,N in J.tabSections do N:_setShown(K,L)end end function h.
_setTabSectionsVisible(J,K)for L,M in J.tabSections do M:_setVisible(K)end end function h.CreateTag(J,K)assert(not J.
unloaded,'Cannot create a tag on an unloaded window.')local L=ac(ab.Parent.tag).new(J,K)table.insert(J.tags,L)return L
end function h._registerControl(J,K)if not K.flag or K.flag==''or K.forgetState then return end local L=K.flag if J.
controls[L]then local M=2 while J.controls[L..M]do M+=1 end L=L..M ak.warn("Rayfield: duplicate config flag '"..K.flag..
"', saving this one as '"..L.."'. Set a unique flag to keep it stable across sessions.")end K.flag=L J.controls[L]=K
return L end function h._restoreLate(J,K)if not J._loadedConfig or not K.flag or K.forgetState then return end local L=J
._loading J._loading=true ah.applyTo(K,J._loadedConfig[K.flag])J._loading=L end function h._persist(J,K)if K.flag and
not K.forgetState and J.configuration.autoSave and not J._loading then task.spawn(J.Save,J)end end function h.
_unregisterControl(J,K)if K.flag and J.controls[K.flag]==K then J.controls[K.flag]=nil end end function h._keybindUsing(
J,K,L)if typeof(K)~='EnumItem'or K==Enum.KeyCode.Unknown then return nil end for M,N in J.tabs do for O,P in N.elements
do if P~=L and P.__type=='Keybind'and P.value==K then return P end end end return nil end function h.Notify(J,K)if J.
unloaded then return end if not J.notifications then J.notifications=J:Create('Frame',{Name='Notifications',Size=UDim2.
new(0,300,0,800),Position=UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=J.
screenGui})J:_scaleSurface(J.notifications)J:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=J.notifications})end return ac(ab.Parent.notification).new(J,K)end
function h.CreateNameplate(J,K)assert(not J.unloaded,'Cannot create nameplates on an unloaded window.')local L=ac(ab.
Parent.nameplate).new(J,K)J._nameplates=J._nameplates or{}table.insert(J._nameplates,L)return L end function h.Toast(J,K
)if J.unloaded then return end K=if typeof(K)=='table'then K else{}local L=K.position or K.Position or'Top'local M=
typeof(L)~='string'or L:lower()~='bottom'K.position=if M then'Top'else'Bottom'local N=if M then'_toastsTop'else
'_toastsBottom'local O=J[N]if not O then O=J:Create('Frame',{Name='Toasts',Size=UDim2.new(0,p,1,-24),Position=if M then
m else UDim2.new(0.5,0,1,-12),AnchorPoint=if M then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,
ZIndex=ai.zIndex.toast,Parent=J.screenGui})J:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=if M then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=O})J[N]=O J:_scaleSurface(O
)if M then D(J,false)end end return ac(ab.Parent.toast).new(J,K,O)end function h.Popup(J,K)if J.unloaded then return end
return ac(ab.Parent.popup).new(J,K)end function h.Hide(J)if J.animating or J.hidden then return end if J._searching then
d.close(J,{showTabs=false,jumpTo=J.selectedTab and J.selectedTab.tabPage})end if J._recordingKeybind then J.
_recordingKeybind:_stopRecording()end J.animating=true J._revealing=true J.hidden=true J.collapsedInteract.Visible=false
if J.minimised then J.minimised=false J.minimiseAction:_setIcon(ai.icons.minimise)end J._restorePosition=J.main.Position
local K,L=J:_collapsedRect()local M,N,O,P=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.
new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)f.tweenService:Create(J.drag.
dragCosmetic,M,{Size=UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not J.hidden
then return end J.drag.drag.Visible=false end)J:_fadeSurfaces(false,M)if J.title then f.tweenService:Create(J.title,M,{
TextTransparency=1}):Play()end if J.subtitle then f.tweenService:Create(J.subtitle,M,{TextTransparency=1}):Play()end if
J.topbarIcon then f.tweenService:Create(J.topbarIcon,M,{ImageTransparency=1}):Play()end for Q,R in ipairs(J.
actionContainer:GetChildren())do if R:IsA'Frame'then f.tweenService:Create(R.ImageLabel,M,{ImageTransparency=1}):Play()
end end for Q,R in J.tags do R:_setShown(false,M)end for Q,R in pairs(J.tabs)do if not R.neglectSelector and R.
topbarItem then R:_applyVisual('hidden',M)end end J:_setTabSectionsShown(false,M)J:_fadeSelectedElementsOut()local Q=f.
tweenService:Create(J.main,N,{Size=L,Position=K})Q.Completed:Connect(function()if J.unloaded or not J.hidden then return
end J._collapsedShown=true D(J,true)J.collapsedInteract.Visible=true J.animating=false J._revealing=false end)Q:Play()f.
tweenService:Create(J.windowCorner,O,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()if not J.hidden then
return end J.topbar.Visible=false J:_setContentVisible(false)c.setCollapsedShown(J,true,P)end)end function h.ToggleHide(
J)if J.animating then return end if J.hidden then J:Show()else J:Hide()end end function h.ToggleMinimise(J)if J.
animating or J.hidden then return end if J._searching then d.close(J,{showTabs=true})end J.animating=true local K,L=
TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out)if J.minimised then J.minimised=false J.minimiseAction:_setIcon(ai.icons.minimise)f.
tweenService:Create(J.main,K,{Size=J.size}):Play()J:_fadeSurfaces(true,L)f.tweenService:Create(J.drag.drag,K,{Position=
UDim2.new(J.main.Position.X.Scale,J.main.Position.X.Offset,J.main.Position.Y.Scale,J.main.Position.Y.Offset+J:_hang(J.
size.Y.Offset))}):Play()task.delay(0.2,function()if J.minimised or J.hidden then return end J:_setContentVisible(true)
for M,N in pairs(J.tabs)do if not N.neglectSelector and N.topbarItem then N.topbarItem.Visible=true N:_applyVisual(if J.
selectedTab==N then'selected'else'unselected',L)end end J:_setTabSectionsVisible(true)J:_setTabSectionsShown(true,L)J:
_revealElements(0.035,0.4)end)task.delay(0.5,function()J.animating=false end)else J.minimised=true J.minimiseAction:
_setIcon(ai.icons.maximise)J:_fadeSelectedElementsOut()for M,N in pairs(J.tabs)do if not N.neglectSelector and N.
topbarItem then N:_applyVisual('hidden',L)end end J:_setTabSectionsShown(false,L)task.delay(0.3,function()if not J.
minimised then return end J:_setContentVisible(false)for M,N in pairs(J.tabs)do if not N.neglectSelector and N.
topbarItem then N.topbarItem.Visible=false end end J:_setTabSectionsVisible(false)end)J:_fadeSurfaces(false,L)f.
tweenService:Create(J.main,K,{Size=UDim2.fromOffset(J.size.X.Offset,J.layout.topbarHeight)}):Play()f.tweenService:
Create(J.drag.drag,K,{Position=UDim2.new(J.main.Position.X.Scale,J.main.Position.X.Offset,J.main.Position.Y.Scale,J.main
.Position.Y.Offset+J:_hang(J.layout.topbarHeight))}):Play()task.delay(0.5,function()J.animating=false end)end end
function h._syncDragBar(J)local K=J.drag and J.drag.drag if not K then return end local L,M=J.main.Position,J:_hang(J.
size.Y.Offset)K.Position=UDim2.new(L.X.Scale,L.X.Offset,L.Y.Scale,L.Y.Offset+M)end function h._clampedPosition(J,K:UDim2
):UDim2 if not J.settings or not J.settings.keepOnScreen then return K end if K.X.Scale~=0 or K.Y.Scale~=0 then return K
end local L,M,N,O=J.screenGui.AbsoluteSize,J.size.X.Offset*J.scale/2,J.size.Y.Offset*J.scale/2,8 local P,Q=math.clamp(K.
X.Offset,M+O,math.max(M+O,L.X-M-O)),math.clamp(K.Y.Offset,N+O,math.max(N+O,L.Y-N-O))if P==K.X.Offset and Q==K.Y.Offset
then return K end return UDim2.fromOffset(P,Q)end function h._clampToScreen(J)J.main.Position=J:_clampedPosition(J.main.
Position)end function h._applyWindowSize(J)if J.unloaded then return end local K,L=w(J.layout.mode,J.fixedScale)local M=
K~=J.size or L~=J.scale J.size=K J.scale=L J.uiScale.Scale=L J:_rescaleSurfaces()for N,O in J.actions do O:_fit()end J:
_applyRailWidth()if M then J:_layoutColumns()end if J.hidden or J.minimised or J.animating or J._revealing then J.
_pendingResize=J._pendingResize or M return end if not M and not J._pendingResize then return end J._pendingResize=false
J.main.Size=K J:_clampToScreen()J:_syncDragBar()end function h._layoutColumns(J)for K,L in J.tabs do L:_layoutColumns()
end end function h._applyRailWidth(J)if J.layout.mode~='sidebar'then return end e.applyWidth(J,b.railWidthFor(J.layout,J
.size.X.Offset))end function h._watchViewport(J)local K,L:RBXScriptConnection?=false local function M()if K then return
end K=true task.defer(function()K=false J:_applyWindowSize()end)end local function N()if L then J:Disconnect(L)L=nil end
local O=f.workspace.CurrentCamera if O then L=J:Connect(O:GetPropertyChangedSignal'ViewportSize',M)end M()end J:Connect(
f.workspace:GetPropertyChangedSignal'CurrentCamera',N)N()local O=0 J:Connect(f.runService.Heartbeat,function(P:number)O
+=P if O<v then return end O=0 J:_applyWindowSize()end)end function h._bindKeybind(J)J:Connect(f.userInputService.
InputBegan,function(K,L)if L or J._recordingKeybind then return end if K.KeyCode==J.settings.toggleKeybind or K.
UserInputType==J.settings.toggleKeybind then J:ToggleHide()end end)end function h._bindMouseOverride(J)local K=f.
userInputService local function L()return J.settings.mouseOverride and not J.hidden and not J.minimised end
local function M()if not L()then return end if K:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)then return end if
K.MouseBehavior~=Enum.MouseBehavior.Default then K.MouseBehavior=Enum.MouseBehavior.Default end if not K.
MouseIconEnabled then K.MouseIconEnabled=true end end J:Connect(K:GetPropertyChangedSignal'MouseBehavior',M)J:Connect(K:
GetPropertyChangedSignal'MouseIconEnabled',M)J:Connect(K.InputEnded,function(N)if N.UserInputType==Enum.UserInputType.
MouseButton2 then M()end end)J._freeMouse=M end function h._bindTopbarDrag(J)local K,L,M,N=f.userInputService,false,
Vector2.zero,Vector2.zero if J.screenGui and J.screenGui.IgnoreGuiInset then N=f.guiService:GetGuiInset()end
local function O()local P=K:GetMouseLocation()+M+N local Q,R=P.X,P.Y if J.settings and J.settings.keepOnScreen then
local S,T,U=J.main.AbsoluteSize,J.screenGui.AbsoluteSize,8 local V,W=S.X/2,S.Y/2 Q=math.clamp(Q,V+U,math.max(V+U,T.X-V-U
))R=math.clamp(R,W+U,math.max(W+U,T.Y-W-U))end return UDim2.fromOffset(Q,R)end local function P(Q,R)for S,T in{J.tabList
,J.actionContainer}do local U,V=T.AbsolutePosition,T.AbsoluteSize if Q>=U.X and Q<=U.X+V.X and R>=U.Y and R<=U.Y+V.Y
then return true end end return false end J:Connect(J.topbar.InputBegan,function(Q,R)if R then return end local S=Q.
UserInputType.Name if S~='MouseButton1'and S~='Touch'then return end if P(Q.Position.X,Q.Position.Y)then return end if
not J:_interactive()then return end L=true if J.screenGui and J.screenGui.IgnoreGuiInset then N=f.guiService:
GetGuiInset()end M=J.main.AbsolutePosition+J.main.AbsoluteSize*J.main.AnchorPoint-K:GetMouseLocation()end)J:Connect(K.
InputEnded,function(Q)local R=Q.UserInputType.Name if R=='MouseButton1'or R=='Touch'then L=false end end)J:Connect(K.
WindowFocusReleased,function()L=false end)J:Connect(f.runService.RenderStepped,function()if not L then return end if not
J:_interactive()then L=false return end J.main.Position=O()if J.drag and J.drag.drag then local Q=J.main.Position J.drag
.drag.Position=UDim2.new(Q.X.Scale,Q.X.Offset,Q.Y.Scale,Q.Y.Offset+J:_hang(J.main.Size.Y.Offset))end end)end function h.
_buildSettingsUI(J)J.rfSettings:CreateSection{name='General'}J.rfSettings:CreateKeybind{name='Toggle Keybind',icon=ai.
icons.search,value=J.settings.toggleKeybind,isMenuToggle=true,onChanged=function(K)J.settings.toggleKeybind=K J:
SaveSettings()end}J.rfSettings:CreateToggle{name='Unlock cursor while open',description=
[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=J.settings.
mouseOverride,callback=function(K)J.settings.mouseOverride=K J:SaveSettings()end}J.rfSettings:CreateToggle{name=
'Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=J.
settings.welcomeToast,callback=function(K)J.settings.welcomeToast=K J:SaveSettings()end}J.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=J.settings.haptics,
callback=function(K)J.settings.haptics=K al.setEnabled(K)J:SaveSettings()end}J.rfSettings:CreateSection{name='Window'}J.
rfSettings:CreateDropdown{name='Theme',description=
[[Changes the colours of this menu. Your choice is remembered next time.]],options=ai.builtInThemes,value=J.settings.
theme or J:_builtInThemeName()or ai.builtInThemes[1],callback=function(K)if typeof(K)~='string'or K==''then return end J
.settings.theme=K J:ChangeTheme(K)J:SaveSettings()end}if J.layout.mode=='sidebar'and J.profile then J.rfSettings:
CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=J.settings.showProfile,callback=function(K)e.setProfileEnabled(J,K)J:SaveSettings()end}end J.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=J.settings.keepOnScreen,callback=function(
K)J.settings.keepOnScreen=K J:SaveSettings()end}J.rfSettings:CreateButton{name='Reset Window Position',callback=function
()f.tweenService:Create(J.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.
new(0.5,0,0.5,0)}):Play()f.tweenService:Create(J.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,J:_hang(J.size.Y.Offset))}):Play()end}if next(J.configuration)~=nil
then J.rfSettings:CreateSection{name='Configurations'}local K,L,M=(J:ListConfigs()[1])local function N()local O=J:
ListConfigs()L:Refresh(O)if K and not table.find(O,K)then K=O[1]end if K then L:Set(K,true)end end L=J.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=J:ListConfigs(),value=K,placeholder=
'No saved configurations',callback=function(O)K=O end}M=J.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local O=J.rfSettings:CreateGroup()O:CreateButton{name='Save',icon=ai.icons.config,callback=function()local P=M.
value if P==''then P=K end if not P or P==''then J:Toast{title=aj.resolve'Name your configuration first'}return end if J
:Save(P)then M:Set''K=P N()J:Toast{title=aj.resolve'Saved configuration',subtitle=P,icon=ai.icons.config}else J:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=P}end end}O:CreateButton{name='Load',callback=function()if not K
or K==''then J:Toast{title=aj.resolve'Pick a configuration to load'}return end if J:_applyNamedConfig(K)then J:Toast{
title=aj.resolve'Loaded configuration',subtitle=K}else J:Toast{title=aj.resolve"Couldn't load configuration",subtitle=K}
end end}O:CreateButton{name='Delete',callback=function()local P=K if not P or P==''then J:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if J:DeleteConfig(P)then N()J:Toast{title=aj.resolve'Deleted configuration',
subtitle=P}else J:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=P}end end}end end function h.SetProfile
(J,K)J.profileText=K e.setSubtitle(J,K)end function h.SaveSettings(J)return ah.saveSettings(J)end function h.
LoadSettings(J)return ah.loadSettings(J)end function h._roundCorners(J,K,L)if not L or not y then return J:Create(
'UICorner',{Parent=K},{CornerRadius='CornerRoundness'})end local M,N={Parent=K},{}for O,P in x do M[P]=UDim.new(0,0)end
for O,P in L do M[P]=nil N[P]='CornerRoundness'end return J:Create('UICorner',M,N)end function h._setElementLocked(J,K,L
,M)L=L==true local N=K.locked==true if N==L and not(L and M)then return end K.locked=L if not K.lockScrim then J:
_buildLockScrim(K)end local O=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if L then K.lockScrim.
Visible=true end f.tweenService:Create(K.lockScrim,O,{BackgroundTransparency=if L then r else 1}):Play()if not L then
task.delay(O.Time,function()if not K.locked and K.lockScrim then K.lockScrim.Visible=false end end)end local P=K.
descriptor if not P then return end if L then K._descriptionBefore=K._descriptionBefore or P.titleLabel.Text P.
titleLabel.Text=aj.resolve(M or'This element is locked.')elseif K._descriptionBefore then P.titleLabel.Text=K.
_descriptionBefore K._descriptionBefore=nil end f.tweenService:Create(P.titleLabel,O,{TextTransparency=if L then s else
0.7}):Play()end function h._buildLockScrim(J,K)K.lockScrim=J:Create('TextButton',{Name='ElementLock',Active=true,
AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=K.main},{BackgroundColor3={'WindowColor',C}})J:Create(
'UICorner',{Parent=K.lockScrim},{CornerRadius='ElementCornerRadius'})end function h._setContentVisible(J,K)J.elements.
Visible=K J.tabList.Visible=K if J.sidebar then J.sidebar.Visible=K end end function h._fadeSurfaces(J,K,L)local M={[J.
windowShadow]={Transparency=if K then 0.6 else 1},[J.windowStroke]={Transparency=if K then 0.95 else 1},[J.bottomFade]={
BackgroundTransparency=if K then 0 else 1}}if J.elementsStroke then M[J.elements]={BackgroundTransparency=if K then J.
layout.cardTransparency else 1}M[J.elementsStroke]={Transparency=if K then 0 else 1}end for N,O in M do if L then f.
tweenService:Create(N,L,O):Play()else for P,Q in O do N[P]=Q end end end e.setProfileShown(J,K,L)end function h.
_fadeSelectedElementsOut(J)if J.selectedTab then for K,L in ipairs(J.selectedTab.elements)do L:_setShown(false,true)end
end end function h._revealElements(J,K,L)for M,N in pairs(J.tabs)do if N~=J.selectedTab then for O,P in ipairs(N.
elements)do P:_setShown(true,false)end end end local M=J.selectedTab if not M then return end local N=M.tabPage local O=
N.AbsolutePosition.Y local P,Q,R=O+N.AbsoluteWindowSize.Y,table.clone(M.elements),{}for S,T in Q do R[T]=S end table.
sort(Q,function(S,T)local U,V=S.main.AbsolutePosition,T.main.AbsolutePosition if U.Y~=V.Y then return U.Y<V.Y end if U.X
~=V.X then return U.X<V.X end return R[S]<R[T]end)local S,T=math.floor(L/K),0 for U,V in Q do local W=V.main.
AbsolutePosition.Y local X=(W+V.main.AbsoluteSize.Y)>O and W<P if X then V:_setShown(true,true)T+=1 if T<=S then task.
wait(K)end else V:_setShown(true,false)end end end function h.Show(J)if J.animating or not J.hidden then return end J.
animating=true J._revealing=true if J.configuration.autoLoad and not J._autoLoaded then J._autoLoaded=true local K,L=
pcall(J.Load,J)if not K then ak.warn('Rayfield: Failed to load configuration - '..tostring(L))end end J.hidden=false J.
minimised=false if J._themeRefreshPending then J._themeRefreshPending=false J:_refreshElementThemes()end J.
collapsedInteract.Visible=false if J._freeMouse then J._freeMouse()end if J.hasShownOnce then J:_quickRestore()else J.
hasShownOnce=true J:_firstShow()end end function h._quickRestore(J)local K=J:_clampedPosition(J._restorePosition or
UDim2.new(0.5,0,0.5,0))J._restorePosition=K local L,M,N=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)c.setCollapsedShown(J,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local O=f.tweenService:Create(J.main,L,{Size=J.size,Position=K})O.Completed:Connect(
function()if J.hidden or J.unloaded then return end J._collapsedShown=false D(J,true)end)O:Play()f.tweenService:Create(J
.windowCorner,M,{CornerRadius=J.theme.CornerRoundness}):Play()task.delay(0.22,function()J.topbar.Visible=true J:
_setContentVisible(true)J:_fadeSurfaces(true,N)if J.topbarIcon then f.tweenService:Create(J.topbarIcon,N,{
ImageTransparency=0}):Play()end if J.title then f.tweenService:Create(J.title,N,{TextTransparency=0}):Play()end if J.
subtitle then f.tweenService:Create(J.subtitle,N,{TextTransparency=0.7}):Play()end for P,Q in ipairs(J.actionContainer:
GetChildren())do if Q:IsA'Frame'then f.tweenService:Create(Q.ImageLabel,N,{ImageTransparency=0.6}):Play()end end if J.
settingsAction and J.selectedTab==J.rfSettings then f.tweenService:Create(J.settingsAction.iconLabel,N,{
ImageTransparency=0.2}):Play()end for P,Q in J.tags do Q:_setShown(true,N)end for P,Q in pairs(J.tabs)do if not Q.
neglectSelector and Q.topbarItem then Q.topbarItem.Visible=true Q:_applyVisual(if J.selectedTab==Q then'selected'else
'unselected',N)end end J:_setTabSectionsVisible(true)J:_setTabSectionsShown(true,N)J:_revealElements(0.035,0.4)end)task.
delay(0.22,function()J.drag.drag.Position=UDim2.new(K.X.Scale,K.X.Offset,K.Y.Scale,K.Y.Offset+J:_hang(J.size.Y.Offset))J
.drag.dragCosmetic.Size=UDim2.fromOffset(0,4)J.drag.dragCosmetic.BackgroundTransparency=1 J.drag.drag.Visible=true f.
tweenService:Create(J.drag.dragCosmetic,L,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()J.animating=false J._revealing=false end)end function h._firstShow(J)J:_setContentVisible(true)J.
drag.drag.Visible=false J.main.Visible=true f.tweenService:Create(J.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=J.size}):Play()task.wait(0.85)J:_fadeSurfaces(true,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if J.icon then f.tweenService:Create(J.
topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if
J.title then f.tweenService:Create(J.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if J.subtitle then f.tweenService:Create(J.subtitle,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for K,L in ipairs(J.actionContainer:
GetChildren())do if L:IsA'Frame'then task.wait(0.02)f.tweenService:Create(L.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for K,L in J.tags do L:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()local K=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)J:_setTabSectionsVisible(true)J:
_setTabSectionsShown(true,K)local L=0 for M,N in pairs(J.tabs)do if not N.neglectSelector then N.topbarItem.Visible=true
N:_applyVisual(if J.selectedTab==N then'selected'else'unselected',K)N:_spinGradients()L+=1 if L<=u then task.wait(t)end
end end end)J:_revealElements(0.03,2)task.wait(1)J:_syncDragBar()J.drag.drag.Visible=true f.tweenService:Create(J.drag.
dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):
Play()f.tweenService:Create(J.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=UDim2.fromOffset(100,4)}):Play()J.animating=false J._revealing=false local K=f.localPlayer if K and J.settings.
welcomeToast and c.isNewUser()then J:Toast{title=K.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,
avatar=K.UserId,minWidth=220}end end function h.GetPath(J)return ah.getPath(J)end function h.Save(J,K)if K~=nil and(
type(K)~='string'or K=='')then return false end return ah.save(J,K)end function h.Load(J,K)if K~=nil and(type(K)~=
'string'or K=='')then return false end return ah.load(J,K)end function h._applyNamedConfig(J,K)if not J:Load(K)then
return false end local L,M=ah.getPath(J)J._loadedConfigPath=M J:Save()return true end function h.ListConfigs(J)return ah
.list(J)end function h.DeleteConfig(J,K)return ah.delete(J,K)end function h.Get(J,K)local L=J.controls[K]return L and L.
value end function h.Set(J,K,L)local M=J.controls[K]if not M then return false end M:Set(L)return true end function h.
_jumpTo(J,K)if K then J.elementsLayout:JumpTo(K)end end function h.Navigate(J,K)if K==nil then return end local L for M,
N in J.tabs do if N==K or N.name==K or N.tabPage==K then L=N break end end if not L then return end L:Select()end
function h.Create(J,K,L,M)assert(typeof(K)=='string','Invalid argument #1 (string expected)')local N=Instance.new(K)if M
and J.theme then for O,P in M do N[O]=(if typeof(P)=='table'then P[2](J.theme[P[1] ])else J.theme[P])end J.
themeProperties[N]=M end if L then for O,P in L do if aj.isToken(P)then J:_bindLocale(N,O,aj.sourceOf(P))else af.assign(
N,O,P)end end end table.insert(J.instances,N)return N end function h._bindLocale(J,K,L,M)K[L]=aj.resolve(M)local N=J.
localeProperties[K]if not N then N={}J.localeProperties[K]=N end N[L]=M end function h.SetLocale(J,K)aj.setActive(K)for
L,M in J.localeProperties do for N,O in M do L[N]=aj.resolve(O)end end end function h.SetTranslator(J,K)aj.translator=K
end function h.RegisterTranslations(J,K)aj.register(K)J:SetLocale(aj.current)end function h.CreateGlow(J,K,L,M,N)local O
={BlurRadius=UDim.new(0,M),Transparency=N,ZIndex=-1,Parent=K}if typeof(L)=='string'then return J:Create('UIShadow',O,{
Color={L,function(P)return if typeof(P)=='ColorSequence'then P.Keypoints[1].Value else P end}})end O.Color=L return J:
Create('UIShadow',O)end function h._flashResult(J,K,L)local M=K.box if not M then return end local N,O,P,Q,R,S=K.glow,K.
boxStroke,L and ai.accent.on or J.theme.ErrorColor,L and ai.accent.onStroke or J.theme.ErrorStrokeColor,TweenInfo.new(
0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
f.tweenService:Create(M,R,{BackgroundColor3=P}):Play()if O then f.tweenService:Create(O,R,{Color=Q,Transparency=0.4}):
Play()end if N then f.tweenService:Create(N,R,{Color=Q,Transparency=0.6}):Play()end K._flashToken=(K._flashToken or 0)+1
local T=K._flashToken task.delay(0.22,function()if K._flashToken~=T then return end f.tweenService:Create(M,S,{
BackgroundColor3=J.theme.FieldBackground}):Play()if O then f.tweenService:Create(O,S,{Color=J.theme.SurfaceStroke,
Transparency=0.85}):Play()end if N then f.tweenService:Create(N,S,{Color=J.theme.FieldGlow,Transparency=K._glowIdle or 1
}):Play()end end)end function h.CreateHoverOverlay(J,K)local L=J:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=1,Parent=K})J:Create('UICorner',{
Parent=L},{CornerRadius='ElementCornerRadius'})return L end function h._wireElementHover(J,K)local L,M=TweenInfo.new(
0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),J.theme J:ConnectFor(K,K.main.MouseEnter,function()if not J:
_interactive()then return end f.tweenService:Create(K.stroke,L,{Transparency=M.ElementStrokeHoverTransparency,Color=M.
ElementStrokeHover}):Play()f.tweenService:Create(K.title,L,{TextColor3=M.ElementTextHoverColor}):Play()if K.hoverOverlay
then f.tweenService:Create(K.hoverOverlay,L,{BackgroundTransparency=0.97}):Play()end end)J:ConnectFor(K,K.main.
MouseLeave,function()f.tweenService:Create(K.stroke,L,{Transparency=M.ElementStrokeTransparency,Color=M.ElementStroke}):
Play()f.tweenService:Create(K.title,L,{TextColor3=M.ContentColor}):Play()if K.hoverOverlay then f.tweenService:Create(K.
hoverOverlay,L,{BackgroundTransparency=1}):Play()end end)end function h._runGuarded(J,K,L,...)if K.locked then return
end local M=table.pack(...)task.spawn(function()local N,O=pcall(function()return L(table.unpack(M,1,M.n))end)if N or K.
_errored then return end K._errored=true local P,Q=K.flashTarget or K.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out)f.tweenService:Create(P,Q,{BackgroundColor3=J.theme.ErrorColor}):Play()f.tweenService:Create(K.
stroke,Q,{Color=J.theme.ErrorStrokeColor}):Play()if K.title then K.title.Text=aj.resolve
'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {K.__type} component named '{
K.name}':`)ak.print(O)task.wait(1)if K.title then K.title.Text=aj.resolve(K.name)end f.tweenService:Create(P,TweenInfo.
new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()f.
tweenService:Create(K.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Color=J.theme.
ElementStroke}):Play()K._errored=false end)end function h.StyleElementBody(J,K)J:Create('UIGradient',{Rotation=270,
Parent=K},{Color='ElementGradient'})J:Create('UICorner',{Parent=K},{CornerRadius='ElementCornerRadius'})return J:Create(
'UIStroke',{Transparency=1,Parent=K},{Color='ElementStroke',Transparency='ElementStrokeTransparency'})end function h.
_buildCompactRow(J,K,L,M)local N=J:Create('Frame',{Name=L,Size=UDim2.fromOffset(0,q),AutomaticSize=Enum.AutomaticSize.X,
ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Parent=K.
tabPage},{BackgroundTransparency='ElementTransparency'})local O=J:StyleElementBody(N)J:Create('UIFlexItem',{FlexMode=
Enum.UIFlexMode.Fill,Parent=N})J:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=N})local P=J:Create('TextButton',{Text='',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,q),BorderSizePixel=0,TextTransparency=1,ZIndex=M or 1,Parent=N})J:Create('UICorner',{Parent=P},{
CornerRadius='ElementCornerRadius'})return N,O,P end function h.StyleElementPanel(J,K)J:Create('UIGradient',{Rotation=
270,Parent=K},{Color='ElementGradient'})J:Create('UICorner',{Parent=K},{CornerRadius='ElementCornerRadius'})local L=J:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=K})J:Create('UIGradient',{Rotation=270,Parent
=L},{Color='ElementStrokeGradient'})return L end function h._reveal(J,K,L,M,N)if not K then return end if M then f.
tweenService:Create(K,N or i,L):Play()else for O,P in L do K[O]=P end end end function h._revealCommon(J,K,L)J:_reveal(K
.stroke,{Transparency=J.theme.ElementStrokeTransparency},L)J:_reveal(K.title,{TextTransparency=0},L)J:_reveal(K.main,{
BackgroundTransparency=J.theme.ElementTransparency or 0},L)if K.iconLabel then J:_reveal(K.iconLabel,{ImageTransparency=
0},L)end if K.descriptor then J:_reveal(K.descriptor.titleLabel,{TextTransparency=0.7},L)end end function h._hideCommon(
J,K,L)J:_reveal(K.stroke,{Transparency=1},L)J:_reveal(K.title,{TextTransparency=1},L)J:_reveal(K.main,{
BackgroundTransparency=1},L)if K.iconLabel then J:_reveal(K.iconLabel,{ImageTransparency=1},L)end if K.descriptor then J
:_reveal(K.descriptor.titleLabel,{TextTransparency=1},L)end end function h._collapsedRect(J)local K=if J.showIconOnly
then k else j if J._collapsedPosition then return J._collapsedPosition,K end local L=UDim2.new(l.X.Scale,l.X.Offset,l.Y.
Scale,l.Y.Offset+K.Y.Offset*J.scale/2)return L,K end function h._scaleSurface(J,K)local L=J:Create('UIScale',{Scale=J.
scale,Parent=K})table.insert(J._scaledSurfaces,L)return L end function h._rescaleSurfaces(J)for K=#J._scaledSurfaces,1,-
1 do local L=J._scaledSurfaces[K]if L.Parent then L.Scale=J.scale else table.remove(J._scaledSurfaces,K)end end end
function h._hang(J,K:number):number return K*J.scale/2+15 end function h._interactive(J)return not J.animating and not J
.hidden end function h._settled(J)return not J.hidden and not J._revealing end function h.Connect(J,K,L)local M=K:
Connect(L)table.insert(J.connections,M)return M end function h.ConnectFor(J,K,L,M)local N=J:Connect(L,M)K.connections=K.
connections or{}table.insert(K.connections,N)return N end function h.Disconnect(J,K)if not K then return end local L=
table.find(J.connections,K)if L then table.remove(J.connections,L)end K:Disconnect()end function h.DestroySubtree(J,K)if
not K then return end local L={[K]=true}for M,N in K:GetDescendants()do L[N]=true end for M=#J.instances,1,-1 do local N
=J.instances[M]if L[N]then table.remove(J.instances,M)J.themeProperties[N]=nil J.localeProperties[N]=nil end end K:
Destroy()end function h.DisconnectMany(J,K,L)if not L or#L==0 then return end local M={}for N,O in L do M[O]=true O:
Disconnect()end local function N(O)if not O then return end local P=0 for Q=1,#O do local R=O[Q]if not M[R]then P+=1 O[P
]=R end end for Q=#O,P+1,-1 do O[Q]=nil end end N(J.connections)if K and K~=J then N(K.connections)end end function h.
DestroySubtrees(J,K)if not K or#K==0 then return end local L={}for M,N in K do L[N]=true for O,P in N:GetDescendants()do
L[P]=true end end local M=0 for N=1,#J.instances do local O=J.instances[N]if L[O]then J.themeProperties[O]=nil J.
localeProperties[O]=nil else M+=1 J.instances[M]=O end end for N=#J.instances,M+1,-1 do J.instances[N]=nil end for N,O
in K do O:Destroy()end end function h.Unload(J)J.unloaded=true for K,L in J._nameplates or{}do L._alive=false end al.
teardown()al.releaseContainer(J.screenGui)if J._liveTween then J._liveTween:Cancel()J._liveTween=nil end for K=#J.
connections,1,-1 do J.connections[K]:Disconnect()end for K=#J.instances,1,-1 do J.instances[K]:Destroy()end table.clear(
J.connections)table.clear(J.instances)table.clear(J.themeProperties)table.clear(J.localeProperties)table.clear(J.
controls)table.clear(J.tabs)table.clear(J._scaledSurfaces)end return h end)()end,[35]=function()local aa,ab,ac=a(35)
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
placeholder:string?,emojis:{string}?,onMessage:((message:ChatMessage)->())?}export type NameplateProps={title:string?,
subtitle:(string|((player:Player)->string))?,accent:Color3?,logo:(number|string|boolean)?,backdrop:(number|string|
boolean)?,badge:string?,endpoint:string?,key:string?,transport:ChatTransport?,showSelf:boolean?,hideDefaultName:boolean?
,maxDistance:number?,lift:number?,checkInInterval:number?,autoCheckIn:boolean?}export type Nameplate={SetEnabled:(self:
Nameplate,enabled:boolean)->(),SetTitle:(self:Nameplate,title:string)->(),Add:(self:Nameplate,player:Player,badge:string
?)->(),Remove:(self:Nameplate,player:Player)->(),CheckIn:(self:Nameplate)->boolean,Destroy:(self:Nameplate)->()}export
type NotifyProps={title:string?,content:string?,icon:(string|number)?,duration:number?}export type ToastProps={title:
string?,subtitle:string?,subtitleAbove:boolean?,icon:(string|number)?,avatar:number?,minWidth:number?,duration:number?,
position:'Top'|'Bottom'?}export type PopupBox={title:string?,description:string?,icon:(string|number)?}export type
PopupOption={text:string?,style:string?,callback:(()->())?}export type PopupProps={title:string?,subtitle:string?,icon:(
string|number)?,content:string?,boxes:{PopupBox}?,options:{PopupOption}?,dismissable:boolean?}export type Moveable={
MoveTo:(self:any,index:number)->(),MoveToTop:(self:any)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown:(
self:any)->()}export type Lockable={Lock:(self:any,reason:string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->
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
local function am(b:Enum.HapticEffectType):Instance?local c=aj[b]if c and c.Parent then return c end local d,e=pcall(
Instance.new,'HapticEffect')if not d then return nil end local f=e::any f.Type=b local g=pcall(function()e.Parent=al()
end)if not g then e:Destroy()return nil end aj[b]=e return e end local function b(c:Enum.HapticEffectType?)if not c or
not af.enabled then return end local d=am(c)if d then local e=d::any pcall(e.Play,d)end end function af.click()b(ag.
click)end function af.notify()b(ag.notify)end function af.setEnabled(c:boolean?)af.enabled=c and true or false if not af
.enabled then af.teardown()end end function af.teardown()for c,d in aj do pcall(d.Destroy,d)aj[c]=nil end end return af
end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(...)local ae,af=ac(ab.Parent.network),ac(ab.Parent
.log)export type AssetId=number|string export type AssetDownloadUrl=string export type CacheKey=AssetId export type
ResolvedAsset=AssetId export type AssetRequestPayload={Url:string,Method:string}local ag={Enum={AssetDownloadUrl={
RobloxDownloadUrl='https://assetdelivery.roblox.com/v1/asset/?id=%d'::AssetDownloadUrl,RoProxyDownloadUrl=
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
getAssetContentFromUrl(aj:AssetResolver,ak:string,al:CacheKey?,am:boolean?):string?local b=aj.contentCache if al~=nil
and b and not am then local c=b[al]if c then return c end end local c=aj.pendingRequests if al~=nil then local d=c[al]if
d then table.insert(d,coroutine.running())return coroutine.yield()end c[al]={}end local d,e:string?=(ae.getRequestFn())
if not d then af.warn'No request function available to download asset content.'else local f,g=pcall(d,{Url=ak,Method=
'GET'}::AssetRequestPayload)if f and ai(g)then local h=(g::{Body:string}).Body e=h if al~=nil and b then local i=aj.
contentCacheOrder if i and b[al]==nil then table.insert(i,al)local j=if#i>ah then table.remove(i,1)else nil if j~=nil
then b[j]=nil end end b[al]=h end elseif not am then af.warn('Failed to download asset content for url: '..tostring(ak))
end end if al~=nil then local f=c[al]c[al]=nil if f then for g,h in f do coroutine.resume(h,e)end end end return e end
function ag.getAssetContentFromId(aj:AssetResolver,ak:AssetId,al:boolean?):string?local am=aj:resolve(ak)if not am or
type(am)~='number'then af.warn('Invalid asset id: '..tostring(am))return nil end local b=string.format(aj.
contentDownloadUrl,am)return aj:getAssetContentFromUrl(b,am,al)end return ag end)()end,[45]=function()local aa,ab,ac=a(
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
,am)end return al end local function ak(al:{string},am:boolean):Instance?local b:Instance=ai for c=1,#al-1 do local d=b:
FindFirstChild(al[c])if not d then if not am then return nil end local e=Instance.new'Folder'e.Name=al[c]e.Parent=b d=e
end b=d::Instance end return b end local function al(am:Instance?):StringValue?if am and am:IsA'StringValue'then return
am end return nil end function af.writefile(am:string,b:string)local c=aj(am)assert(#c>0,'Invalid path')local d=ak(c,
true)assert(d,'Invalid path')local e=c[#c]local f=d:FindFirstChild(e)local g=al(f)if g then g.Value=b else if f then f:
Destroy()end local h=Instance.new'StringValue'h.Name=e h.Value=b h.Parent=d end end function af.readfile(am:string):
string local b=aj(am)assert(#b>0,'Invalid path')local c=ak(b,false)assert(c,'File not found: '..am)local d=c:
FindFirstChild(b[#b])local e=al(d)assert(e,'File not found: '..am)return e.Value end function af.isfile(am:string):
boolean local b=aj(am)if#b==0 then return false end local c=ak(b,false)if not c then return false end return al(c:
FindFirstChild(b[#b]))~=nil end function af.listfiles(am:string):{string}local b,c:Instance=aj(am),ai for d,e in b do
local f=c:FindFirstChild(e)if not f or not f:IsA'Folder'then error('Folder not found: '..am)end c=f end local d:{string}
={}for e,f in c:GetChildren()do table.insert(d,am..'/'..f.Name)end return d end function af.delfile(am:string)local b=
aj(am)assert(#b>0,'Invalid path')local c=ak(b,false)assert(c,'File not found: '..am)local d=c:FindFirstChild(b[#b])local
e=al(d)assert(e,'File not found: '..am)e:Destroy()end function af.makefolder(am:string)local b=aj(am)if#b==0 then return
end local c:Instance=ai for d,e in b do local f=c:FindFirstChild(e)if not f then local g=Instance.new'Folder'g.Name=e g.
Parent=c f=g end c=f::Instance end end function af.isfolder(am:string):boolean local b=aj(am)if#b==0 then return false
end local c:Instance=ai for d,e in b do local f=c:FindFirstChild(e)if not f or not f:IsA'Folder'then return false end c=
f end return true end function af.delfolder(am:string)local b=aj(am)assert(#b>0,'Invalid path')local c=ak(b,false)
assert(c,'Folder not found: '..am)local d=c:FindFirstChild(b[#b])assert(d and d:IsA'Folder','Folder not found: '..am)d:
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
string?local b,c=pcall(function()return af:JSONEncode(am)end)if b and type(c)=='string'then return c else aj.warn(
'Failed to encode JSON:',c)return nil end end local function am(b:string):unknown?local c,d=pcall(function()return af:
JSONDecode(b)end)if c then return d else aj.warn('Failed to decode JSON:',d)return nil end end local b={}b.__type=
'fontManager'export type FontFace={name:string,family:string,weight:number,style:string,assetId:string}export type
FontManifest={name:string,faces:{FontFace}}export type CachedFont={customId:number|string,manifest:FontManifest,
loadedFromDisk:boolean,variants:{[string]:Font}}export type FontCache={[number]:CachedFont}export type
FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,skipCache:boolean?}type FontManagerState={_debug:boolean,
_pendingLoads:{[string]:{thread}},rootFolder:string,assetResolver:ai.AssetResolver,defaultOptions:FontResolverOptions,
fontCache:FontCache?}export type FontManager=FontManagerState&{resolve:(self:FontManager,id:number|string)->Font?,
loadFont:(self:FontManager,id:(number|string)?,fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,saveToDisk:boolean?
,skipCache:boolean?)->Font?,getFontFromId:(self:FontManager,id:number|string)->Font?}export type fontManager=FontManager
local function c(d:unknown):FontManifest?local e=d::any if type(e)~='table'or type(e.name)~='string'or type(e.faces)~=
'table'then return nil end e.name=ak.sanitizeFile(e.name)if#e.name==0 or#e.faces==0 then return nil end for f,g in e.
faces do if type(g)~='table'or type(g.name)~='string'or type(g.assetId)~='string'then return nil end g.name=ak.
sanitizeFile(g.name)if#g.name==0 then return nil end end return e::FontManifest end local d={'\0\1\0\0','OTTO','true',
'ttcf','wOFF','wOF2'}local function e(f:string):boolean for g,h in d do if string.sub(f,1,#h)==h then return true end
end return false end local f=getfenv()local function g(h:Enum.FontWeight,i:Enum.FontStyle):string return tostring(h)..
'|'..tostring(i)end local function h(i:unknown):number?if type(i)=='number'then return i end if type(i)=='string'then
return tonumber(i)end return nil end function b.__index(i:FontManagerState,j:unknown):unknown local k=(b::any)[j]if k~=
nil then return k end local l=h(j)if not l then return nil end local m=i.fontCache if m then local n=m[l]if n then local
o=g(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local p=n.variants and n.variants[o]if p then return p end for q,r in
pairs(n.variants or{})do return r end end end return nil end function b.new(i:string,j:boolean?,k:boolean?,l:ai.
AssetDownloadUrl?,m:FontResolverOptions?):FontManager local n=m or{saveToDisk=true,skipCache=not k or false,fallbackFont
=Font.fromEnum(Enum.Font.SourceSans)}local o=setmetatable({rootFolder=i,fontCache=if k then{}::FontCache else nil,
assetResolver=ai.new(k,l),defaultOptions=n,_debug=j or ag:IsStudio()or false,_pendingLoads={}}::FontManagerState,b)::any
pcall(ah.ensureFolder,i)return o end local function i(j:FontManager,k:number,l:Enum.FontWeight,m:Enum.FontStyle,n:string
):Font?local o=j.rootFolder..'/'..k..'.json'if typeof(ah.isfile)~='function'then return j.defaultOptions.fallbackFont
end local p,q:string?=false if ag:IsStudio()and j._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]q=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(o)then local r,s=pcall(ah.readfile,o)q=r and s or nil else q=j.assetResolver:getAssetContentFromId(k,
false)p=q~=nil end local r:FontManifest?if q then local s,t=pcall(am,q)if s and t then r=c(t)else if j._debug then aj.
warn('Failed to parse font manifest for font id: '..tostring(k)..'. Error: '..tostring(t))end end else return j.
defaultOptions.fallbackFont end if not r then if j._debug then aj.warn('Font manifest is nil for font id: '..tostring(k)
)end pcall(ah.delfile,o)return j.defaultOptions.fallbackFont end if p and q then pcall(ah.writefile,o,q)end local s,t=j.
rootFolder..'/'..r.name,true if not pcall(ah.ensureFolder,s)then return j.defaultOptions.fallbackFont end for u,v in
ipairs(r.faces)do local w=s..'/'..v.name:gsub(' ','-')..'.ttf'if ah.isfile(w)then local x,y=pcall(ah.readfile,w)if not x
or type(y)~='string'or not e(y)then pcall(ah.delfile,w)end end if not ah.isfile(w)then local x=j.assetResolver:resolve(v
.assetId)local y=if x~=nil then j.assetResolver:getAssetContentFromId(x,false)else nil if not y or not e(y)then t=false
if j._debug then aj.warn('Font face content is missing or not a font for font id: '..tostring(k)..', face: '..v.name)end
continue end pcall(ah.writefile,w,y)end local x,y=pcall(f.getcustomasset,w)if x and type(y)=='string'then r.faces[u].
assetId=y if j._debug then aj.print('Loaded font face for id: '..tostring(k)..', face: '..v.name)end else t=false if j.
_debug then aj.warn('Failed to load font face for id: '..tostring(k)..', face: '..v.name)end end end if not t then
return j.defaultOptions.fallbackFont end local u=al(r)if not u or not pcall(ah.writefile,s..'/manifest.json',u)then
return j.defaultOptions.fallbackFont end local v,w=pcall(f.getcustomasset,s..'/manifest.json')if not v or not w then if
j._debug then aj.warn('Failed to load font manifest for id: '..tostring(k))end return j.defaultOptions.fallbackFont end
local x,y=pcall(Font.new,w::any,l,m)if not x or not y then if j._debug then aj.warn('Failed to load font for id: '..
tostring(k))end return j.defaultOptions.fallbackFont end local z=j.fontCache if z then z[k]={customId=w,manifest=r,
loadedFromDisk=true,variants={[n]=y}}if j._debug then aj.print('Cached font for id: '..tostring(k))end end return y end
function b.loadFont(j:FontManager,k:(number|string)?,l:Enum.FontWeight?,m:Enum.FontStyle?,n:boolean?,o:boolean?):Font?if
n==nil then n=j.defaultOptions.saveToDisk end if o==nil then o=j.defaultOptions.skipCache end local p,q=l or Enum.
FontWeight.Regular,m or Enum.FontStyle.Normal local r,s=g(p,q),j.assetResolver:resolve(k)local t=h(s)if not t then aj.
warn('Invalid font id: '..tostring(k))return j.defaultOptions.fallbackFont end local u=j.fontCache if u and not o then
local v=u[t]if v then local w=v.variants and v.variants[r]if w then if j._debug then aj.print(
'Loaded font from cache for id: '..tostring(t))end return w end local x,y=pcall(Font.new,v.customId::any,p,q)if x and y
then v.variants=v.variants or{}v.variants[r]=y if j._debug then aj.print('Loaded font variant from cache for id: '..
tostring(t))end return y else if j._debug then aj.warn('Failed to load font from cache for id: '..tostring(t))end u[t]=
nil return j.defaultOptions.fallbackFont end end end if not n then if j._debug then aj.warn
[[Font loading without saving to disk can be detected by Anti-cheats.]]end return j.defaultOptions.fallbackFont end
local v,w=j._pendingLoads,tostring(t)..'|'..r local x=v[w]if x then table.insert(x,coroutine.running())return coroutine.
yield()end v[w]={}local y,z=pcall(i,j,t,p,q,r)local A=if y then z else j.defaultOptions.fallbackFont x=v[w]v[w]=nil if x
then for B,C in x do coroutine.resume(C,A)end end return A end function b.resolve(j:FontManager,k:number|string):Font?
local l=h(k)if not l then return nil end local m=j.fontCache if m then local n=m[l]if n then if j._debug then aj.print(
'Resolved font for id: '..tostring(l))end for o,p in pairs(n.variants or{})do return p end end end return nil end
function b.getFontFromId(j:FontManager,k:number|string):Font?return j:resolve(k)end return b end)()end,[53]=function()
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
assign(al:Instance,am:string,b:unknown)local c=al::any if not ai[am]then c[am]=b return end c[am]=ag.resolve(b)if af.
secureMode and not ah then local d=aj(b)if d and not ag.rewrites[d]then local e=ag.pending[d]if not e then e=
setmetatable({},{__mode='k'})::any ag.pending[d]=e end local f=e[al]if not f then f={}e[al]=f end f[am]=true end end end
ae.onCached=function(al:number)local am=ag.pending[al]if not am then return end local b=ag.rewrites[al]if b then for c,d
in am do if c.Parent then local e=c::any for f in d do e[f]=b end end end end ag.pending[al]=nil end function ag.resolve
(al:unknown):string if al==nil or al==0 or al==''then return''end if type(al)=='string'then if string.sub(al,1,11)==
'rbxasset://'then return al end if string.sub(al,1,11)=='rbxthumb://'then return if af.secureMode then ak(al)else al end
end local am:number?if type(al)=='number'then am=al elseif type(al)=='string'then am=tonumber(string.match(al,
'^rbxassetid://(%d+)$'))end local b=if am then ag.rewrites[am]else nil if b then return b end if af.secureMode then
return ak(al)end if type(al)=='number'then return'rbxassetid://'..al end if type(al)=='string'then return al end return
ak(al)end return ag end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local ae,af,ag,ah=ac(ab.
Parent.filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.constants)export type RewriteMap={[number]:
string}export type CacheSettledCallback=(failed:number)->()export type PreloadCallback=CacheSettledCallback export type
AvatarCallback=(uri:string)->()export type OnCachedCallback=(id:number)->()export type ThumbnailEntry={state:string?,
imageUrl:string?}export type ThumbnailResponse={data:{ThumbnailEntry}?}local ai,aj,ak,al,am,b,c,d:{[number]:string}={},
ag.fileSystemManager:getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/aesthetic143147-arch/Rayfield-preview-Gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for e,f
in ah.icons do local g=f::number d[g]=am..tostring(g)..'.png'end local e=0 for f in d do e+=1 end ai.rewrites={}::
RewriteMap ai.onCached=nil::OnCachedCallback?local f='\137PNG\r\n\26\n'local function g(h:string,i:string):string?if
type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(h)then
pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local j=al:getAssetContentFromUrl(i,h,false)if not j or string.sub(j,1
,8)~=f then return nil end if not pcall(ae.writefile,h,j)then return nil end end local j,k=pcall(getfenv().
getcustomasset,h)return if j and type(k)=='string'then k else nil end local function h(i:number):string return af.join(
ak,'avatar_'..tostring(i)..'.png')end local function i(j:string):string?local k,l=pcall(function()return ag.httpService:
JSONDecode(j)end)if not k or type(l)~='table'then return nil end local m=(l::ThumbnailResponse).data if type(m)~='table'
then return nil end local n=m[1]if type(n)~='table'then return nil end local o=n::ThumbnailEntry if o.state=='Completed'
and type(o.imageUrl)=='string'then return o.imageUrl end return nil end local function j(k:number):string?local l:string
?for m=1,4 do local n=al:getAssetContentFromUrl(string.format(c,k,b,b),'avatar:'..tostring(k),m>1)if n then local o=i(n)
if o then l=o break end end if m<4 then task.wait(0.3)end end if not l then return nil end return g(h(k),l)end local k:{
[number]:{AvatarCallback}},l:{[number]:boolean}={},{}function ai.preload(m:PreloadCallback?):(boolean,number)local n=
getfenv()if type(n.getcustomasset)~='function'or typeof(ae.isfile)~='function'then if m then task.defer(m,e)end return
false,e end local o=ai.rewrites table.clear(o)local function p()if not m then return end local q=0 for r in d do if not
o[r]then q+=1 end end m(q)end local q,r,s=0,0,true for t,u in d do local v,w:string?=(af.join(ak,tostring(t)..'.png'))if
ae.isfile(v)then local x,y=pcall(n.getcustomasset,v)w=if x and type(y)=='string'then y else nil end if w then o[t]=w
else r+=1 q+=1 task.spawn(function()local x=g(v,u)if x then o[t]=x if ai.onCached then pcall(ai.onCached,t)end end q-=1
if q==0 and not s then p()end end)end end s=false if q==0 then p()end return r==0,r end function ai.avatar(m:unknown,n:
AvatarCallback?):string if type(m)~='number'then return''end if typeof(ae.isfile)~='function'then return''end local o=h(
m)if ae.isfile(o)then local p,q=pcall(getfenv().getcustomasset,o)if p and type(q)=='string'then return q end end if l[m]
then return''end local p=k[m]if p then if n then table.insert(p,n)end return''end if n then k[m]={n}task.spawn(function(
)local q,r=j(m),k[m]k[m]=nil if not q then l[m]=true return end if r then for s,t in r do pcall(t,q)end end end)end
return''end function ai.remote(m:string):string?if not string.match(m,'^[%w%-_]+%.png$')then return nil end local n,o=
pcall(g,af.join(ak,m),am..m)return if n then o else nil end return ai end)()end,[56]=function()local aa,ab,ac=a(56)local
ad return(function(...)local ae,af={},64 local ag,ah,ai=af+7,38,3 export type Mode='top'|'sidebar'export type Layout={
mode:Mode,topbarHeight:number,chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize:UDim2,fadeTransparency:
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
ag.strings[ak]if not am then am={}ag.strings[ak]=am end for b,c in al do if type(b)=='string'and type(c)=='string'then
am[b]=c else af.warn(`Rayfield: skipping a '{ak}' translation, entries must be string to string.`)end end end end end
function ag.setActive(aj:string?):string ag.current=if type(aj)=='string'and aj~=''then string.lower(aj)else'en'return
ag.current end function ag.detect():string local aj=ae.localizationService.RobloxLocaleId if type(aj)=='string'and aj~=
''then return string.lower(aj)end return'en'end return ag end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(
function(...)local function ae<T>(af:T):T local ag=af::any function ag.Lock(ah,ai:string?)ah.window:_setElementLocked(ah
,true,ai)end function ag.Unlock(ah)ah.window:_setElementLocked(ah,false)end function ag.IsLocked(ah):boolean return ah.
locked==true end return af end return ae end)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)local
ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean local function ag():boolean return ae.secureMode end
local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.setSecureModeSource(aj:SuppressPredicate?)ah=if type(aj)
=='function'then aj else ag end function af.setSuppressPredicate(aj:SuppressPredicate?)ai=if type(aj)=='function'then aj
else nil end local function aj():boolean if ai and ai()then return true end return ah()end function af.warn(...)if aj()
then return end warn(...)end function af.print(...)if aj()then return end print(...)end return af end)()end,[60]=
function()local aa,ab,ac=a(60)local ad return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.
MoveTo(ah,ai:number)ah.tab:_moveElement(ah,ai)end function ag.MoveToTop(ah)ah.tab:_moveElement(ah,1)end function ag.
MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab.elements)end function ag.MoveUp(ah)local ai=table.find(ah.tab.elements,ah
)if ai then ah.tab:_moveElement(ah,ai-1)end end function ag.MoveDown(ah)local ai=table.find(ah.tab.elements,ah)if ai
then ah.tab:_moveElement(ah,ai+1)end end return af end return ae end)()end,[61]=function()local aa,ab,ac=a(61)local ad
return(function(...)local ae={}ae.__index=ae export type RequestFn=(...any)->any function ae.getRequestFn(af:any?):
RequestFn?af=af or getfenv()return af.request or af.http_request or(af.http and af.http.request)or(af.syn and af.syn.
request)or(af.fluxus and af.fluxus.request)end return ae end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(
function(...)local ae=ac(ab.Parent.variables)local af,ag=ae.textService,{}ag.__index=ag local ah=20 local function ai(aj
,ak,al)local am=Instance.new'GetTextBoundsParams'am.Text=al am.Font=aj am.Size=ak am.Width=math.huge local b,c=pcall(af.
GetTextBoundsAsync,af,am)return if b then c else Vector2.new(ak*0.6,ak)end local aj={}local function ak(al,am)local b=
tostring(al.Family)..'|'..tostring(al.Weight)..'|'..tostring(al.Style)..'|'..tostring(am)local c=aj[b]if c then return c
end local d,e={},0 for f=0,9 do local g=math.ceil(ai(al,am,tostring(f)).X)d[f]=g if g>e then e=g end end c={advance=d,
maxWidth=e}aj[b]=c return c end function ag.new(al,am,b)b=b or{}local c=setmetatable({window=al,container=am,textSize=b.
textSize or 16,transparency=b.transparency or 1,duration=b.duration or 0.55,slots={},length=0},ag)c.roll=TweenInfo.new(c
.duration,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)c.zIndex=math.max(am.ZIndex+1,6)c.height=math.ceil(c.textSize)
local d=ak(al.theme.Font,c.textSize)c.advance=d.advance c.maxWidth=d.maxWidth al:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=b.alignment or Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=am})return c end function ag.
_reel(al,am)local b=al.slots[am]if b.reel then return b.reel end local c=al.window:Create('Frame',{Name='Reel',Size=
UDim2.fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=al.
zIndex,Parent=al.container})local d=al.window:Create('Frame',{Size=UDim2.fromOffset(al.maxWidth,al.height),AnchorPoint=
Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=al.zIndex,Parent=c})
for e=0,ah-1 do al.window:Create('TextLabel',{Text=tostring(e%10),Position=UDim2.fromOffset(0,e*al.height),Size=UDim2.
fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.
TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent
=d},{TextColor3='ContentColor',FontFace='Font'})end local e={cell=c,strip=d,digit=0,target=0,stripTween=nil,sizeTween=
nil}b.reel=e return e end function ag._static(al,am)local b=al.slots[am]if b.static then return b.static end local c=al.
window:Create('TextLabel',{Name='Static',Size=UDim2.fromOffset(0,al.height),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment
=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=al.container},{TextColor3=
'ContentColor',FontFace='Font'})b.static=c return c end local function al(am)if am.stripTween then am.stripTween:Cancel(
)am.stripTween=nil end if am.sizeTween then am.sizeTween:Cancel()am.sizeTween=nil end end function ag._reelSnap(am,b,c)
al(b)b.cell.Size=UDim2.fromOffset(am.advance[c],am.height)b.strip.Position=UDim2.new(0.5,0,0,-c*am.height)b.digit=c b.
target=c end function ag._reelRoll(am,b,c,d)if b.stripTween or b.sizeTween then am:_reelSnap(b,b.target)end local e=b.
digit if e==c then return end local f,g if d then f=e g=e+(c-e)%10 else f=e+10 g=f-(e-c)%10 end b.strip.Position=UDim2.
new(0.5,0,0,-f*am.height)b.target=c local h,i=ae.tweenService:Create(b.strip,am.roll,{Position=UDim2.new(0.5,0,0,-g*am.
height)}),ae.tweenService:Create(b.cell,am.roll,{Size=UDim2.fromOffset(am.advance[c],am.height)})b.stripTween=h b.
sizeTween=i h.Completed:Connect(function(j)if j==Enum.PlaybackState.Completed and b.stripTween==h then am:_reelSnap(b,c)
end end)h:Play()i:Play()b.digit=c end function ag._putDigit(am,b,c,d,e)local f=am:_reel(b)local g=not f.cell.Visible f.
cell.Visible=true f.cell.LayoutOrder=-b if am.slots[b].static then am.slots[b].static.Visible=false end if e and not g
then am:_reelRoll(f,c,d)else am:_reelSnap(f,c)end end function ag._putStatic(am,b,c)local d=am:_static(b)if not d.
Visible then d.TextTransparency=am.transparency end d.Text=c d.Visible=true d.LayoutOrder=-b if am.slots[b].reel then am
.slots[b].reel.cell.Visible=false end end function ag._hide(am,b)local c=am.slots[b]if not c then return end if c.reel
then c.reel.cell.Visible=false end if c.static then c.static.Visible=false end end function ag._render(am,b,c,d)b=
tostring(b)if b==am._lastText then return end am._lastText=b local e={}for f,g in utf8.codes(b)do table.insert(e,utf8.
char(g))end local f=#e for g=0,math.max(f,am.length)-1 do am.slots[g]=am.slots[g]or{}if g<f then local h=e[f-g]if h:
match'%d'then am:_putDigit(g,tonumber(h),d,c)else am:_putStatic(g,h)end else am:_hide(g)end end am.length=f end function
ag.to(am,b,c)am:_render(b,true,c)end function ag.snap(am,b)am:_render(b,false,true)end function ag.reveal(am,b,c,d)am.
transparency=b for e,f in am.slots do if f.static and f.static.Visible then am.window:_reveal(f.static,{TextTransparency
=b},c,d)end if f.reel then for g,h in f.reel.strip:GetChildren()do if h:IsA'TextLabel'then am.window:_reveal(h,{
TextTransparency=b},c,d)end end end end end return ag end)()end,[63]=function()local aa,ab,ac=a(63)local ad return(
function(...)type OrderedElement={main:GuiObject,descriptor:{main:GuiObject}?}local function ae(af:OrderedElement,ag:
number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.main.LayoutOrder=ag+1 end end return ae end)()end,[64]
=function()local aa,ab,ac=a(64)local ad return(function(...)local ae={}function ae.join(af:string,ag:string?):string if
not ag or ag==''then return af end return af..'/'..ag end local function af(ag:string):string local ah repeat ah=ag ag=
ag:gsub('%.%.','')until ag==ah return ag end function ae.sanitizeFolder(ag:unknown):string local ah=tostring(ag):gsub(
'\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')return(ah:gsub('^/+',''))end function ae.sanitizeFile(ag:unknown
):string local ah=tostring(ag):gsub('[/\\]',''):gsub('[:<>"|?*%c]','')return af(ah)end function ae.basename(ag:unknown):
string return tostring(ag):match'[^/\\]+$'or tostring(ag)end function ae.stripExtension(ag:unknown,ah:string?):string if
ah and ah~=''then local ai=tostring(ag)if ai:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end return ai end local ai=
tostring(ag):match'^(.+)%.%w+$'return ai or tostring(ag)end return ae end)()end,[65]=function()local aa,ab,ac=a(65)local
ad return(function(...)local ae,af,ag={},ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.getPath=af.
getPath ae.save=af.save ae.load=af.load ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.getSettingsPath=ag.
getSettingsPath ae.saveSettings=ag.saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[66]=function()local
aa,ab,ac=a(66)local ad return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),
ac(ab.Parent.log),ac(ab.Parent.path),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),{}type
PersistedControl={value:unknown,flag:string?,_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,_deserialize:(
(PersistedControl,unknown)->())?,Set:(PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:
PersistedControl},configuration:{fileName:string?,customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[
string]:unknown}?,_loadedConfigPath:string?}function ak.getPath(al:ConfigWindow,am:unknown?):(string?,string?)return ai.
getConfigPath(al,am)end function ak.save(al:ConfigWindow,am:unknown?):boolean local b,c=ak.getPath(al,am)if not b or not
c then ag.warn("Rayfield: configuration name '"..tostring(am).."' has no usable characters")return false end if typeof(
af.writefile)~='function'then return false end local d:{[string]:unknown}={}for e,f in al.controls do local g,h=pcall(
function()local g=f._serialize if g then return g(f)end return f.value end)if g then d[e]=h else ag.warn(
"Rayfield: Failed to serialize flag '"..tostring(e).."' - "..tostring(h))end end local e=al._loadedConfig if e and al.
_loadedConfigPath==c then for f,g in e do if al.controls[f]==nil then d[f]=g end end end local f,g=pcall(ae.httpService.
JSONEncode,ae.httpService,d)if not f then ag.warn('Rayfield: Failed to encode configuration - '..tostring(g))return
false end local h,i=pcall(function()aj.write(b,c,g)end)if not h then ag.warn('Rayfield: Failed to save configuration - '
..tostring(i))return false end if al._loadedConfigPath==nil or al._loadedConfigPath==c then al._loadedConfig=d al.
_loadedConfigPath=c end return true end local function al(am:string):({[string]:unknown}?,string?)if not af.isfile(am)
then return nil,nil end local b,c=pcall(af.readfile,am)if not b or type(c)~='string'then ag.warn
'Rayfield: Failed to read configuration file'return nil,nil end local d,e=pcall(ae.httpService.JSONDecode,ae.httpService
,c)if not d or type(e)~='table'then return nil,c end return e::{[string]:unknown},c end local function am(b:string):
string local c=ah.stripExtension(b,'.rfld')local d,e=c..' (Incorrect Format).rfld',2 while e<=100 and af.isfile(d)do d=c
..' (Incorrect Format '..e..').rfld'e+=1 end return d end function ak.load(b:ConfigWindow,c:unknown?):boolean local d,e=
ak.getPath(b,c)if not d or not e then ag.warn("Rayfield: configuration name '"..tostring(c)..
"' has no usable characters")return false end if typeof(af.isfile)~='function'then return false end local f,g=al(e)if
not f and af.isfile(e)then local h,i=al(aj.tempPathFor(e))if h and i then f=h pcall(aj.write,d,e,i)end end if not f then
if g then ag.warn[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local h=am(e)pcall(
function()af.ensureDir(d)af.writefile(h,g)af.delfile(e)end)end return false end local h,i=f::{[string]:unknown},b.
_loading b._loading=true local j,k=pcall(function()for j,k in b.controls do ak.applyTo(k,h[j])end end)b._loading=i if
not j then ag.warn('Rayfield: Failed to apply configuration - '..tostring(k))end b._loadedConfig=h b._loadedConfigPath=e
return true end function ak.applyTo(b:PersistedControl,c:unknown)if c==nil and not b._canBeNil then return end local d,e
=pcall(function()local d=b._deserialize if d then d(b,c)else b:Set(c)end end)if not d then ag.warn(
"Rayfield: Failed to restore flag '"..tostring(b.flag).."' - "..tostring(e))end end function ak.list(b:ConfigWindow):{
string}local c,d:{string}=ak.getPath(b),{}if not c then return d end local e,f=pcall(af.listfiles,c)if not e or type(f)
~='table'then return d end for g,h in f do local i=ah.basename(h)if i:sub(-5)=='.rfld'then local j=ah.stripExtension(i,
'.rfld')if j and j~=''and not j:find' %(Incorrect Format[^%)]*%)$'then table.insert(d,j)end end end table.sort(d)return
d end function ak.delete(b:ConfigWindow,c:unknown):boolean if type(c)~='string'or c==''then return false end local d,e=
ak.getPath(b,c)if not e then return false end if typeof(af.isfile)~='function'or not af.isfile(e)then return false end
pcall(af.delfile,aj.tempPathFor(e))return(pcall(af.delfile,e))end return ak end)()end,[67]=function()local aa,ab,ac=a(67
)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.Parent.path),{}type ConfigWindow={
configuration:{fileName:string?,customFolder:string?},name:string}function ag.getConfigPath(ah:ConfigWindow,ai:unknown?)
:(string?,string?)local aj=ae.fileSystemManager:getPath'Configurations'if ah.configuration.customFolder then aj=af.join(
aj,af.sanitizeFolder(ah.configuration.customFolder))end if ai~=nil then local ak=af.sanitizeFile(ai)if ak==''then return
nil,nil end return aj,af.join(aj,ak..'.rfld')end local ak=af.sanitizeFile(ah.configuration.fileName or ah.name)if ak==''
then ak=af.sanitizeFile(ah.name)end if ak==''then ak='Configuration'end return aj,af.join(aj,ak..'.rfld')end function ag
.getSettingsPath():(string,string)local ah=ae.fileSystemManager:getPath'Settings'return ah,af.join(ah,'rayfield.rfld')
end return ag end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab
.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.
enums),ac(ab.Parent.constants),{}type SettingsWindow={settings:{toggleKeybind:EnumItem,mouseOverride:boolean,
keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean,showProfile:boolean,theme:string?}}type DecodedSettings={
toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,keepOnScreen:unknown?,welcomeToast:unknown?,haptics:unknown?,
showProfile:unknown?,theme:unknown?}function ak.getSettingsPath():(string,string)return ag.getSettingsPath()end function
ak.saveSettings(al:SettingsWindow):boolean local am,b=ak.getSettingsPath()local c:{[string]:unknown}={toggleKeybind={
tostring(al.settings.toggleKeybind.EnumType),al.settings.toggleKeybind.Value}::{unknown},mouseOverride=al.settings.
mouseOverride,keepOnScreen=al.settings.keepOnScreen,welcomeToast=al.settings.welcomeToast,haptics=al.settings.haptics,
showProfile=al.settings.showProfile,theme=al.settings.theme}local d,e=pcall(ae.httpService.JSONEncode,ae.httpService,c)
if not d then return false end local f=pcall(ah.write,am,b,e)if not f then return false end return true end
local function al(am:string):(DecodedSettings?,string?)local b=false pcall(function()b=af.isfile(am)end)if not b then
return nil,nil end local c,d=pcall(af.readfile,am)if not c or type(d)~='string'then return nil,nil end local e,f=pcall(
ae.httpService.JSONDecode,ae.httpService,d)if not e or type(f)~='table'then return nil,d end return f::DecodedSettings,d
end function ak.loadSettings(am:SettingsWindow):boolean local b,c=ak.getSettingsPath()local d=al(c)if not d then local e
,f=al(ah.tempPathFor(c))if e and f then d=e pcall(ah.write,b,c,f)end end if not d then return false end if d.
toggleKeybind then pcall(function()local e=tostring(d.toggleKeybind[1]):gsub('^Enum%.','')local f=(Enum::any)[e]if f
then local g=ai.itemFromValue(f,d.toggleKeybind[2])if g then am.settings.toggleKeybind=g end end end)end if type(d.
mouseOverride)=='boolean'then am.settings.mouseOverride=d.mouseOverride end if type(d.keepOnScreen)=='boolean'then am.
settings.keepOnScreen=d.keepOnScreen end if type(d.welcomeToast)=='boolean'then am.settings.welcomeToast=d.welcomeToast
end if type(d.haptics)=='boolean'then am.settings.haptics=d.haptics end if type(d.showProfile)=='boolean'then am.
settings.showProfile=d.showProfile end if type(d.theme)=='string'and table.find(aj.builtInThemes,d.theme)then am.
settings.theme=d.theme end return true end return ak end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(
function(...)local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string return ah..ag
end function af.write(ah:string,ai:string,aj:string)local ak=af.tempPathFor(ai)ae.ensureDir(ah)ae.writefile(ak,aj)if ae.
readfile(ak)~=aj then error'parked copy did not write cleanly'end ae.writefile(ai,aj)pcall(ae.delfile,ak)end return af
end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.
Parent.network),{}function ag.request(ah,ai:string,aj:string,ak:any?):(boolean,any)if ah.transport then local al,am,b=
pcall(ah.transport,ai,aj,ak)if not al then return false,{error=tostring(am)}end return am,b end if type(ah.endpoint)~=
'string'then return false,{error='No relay address.'}end local al=af.getRequestFn()if not al then return false,{error=
"This executor can't make web requests."}end local am={['Content-Type']='application/json'}if ah.key then am[
'X-Chat-Key']=tostring(ah.key)end local b,c=pcall(al,{Url=ah.endpoint..aj,Method=ai,Headers=am,Body=if ak~=nil then ae.
httpService:JSONEncode(ak)else nil})if not b or type(c)~='table'then return false,{error='No response from the relay.'}
end local d if type(c.Body)=='string'and c.Body~=''then local e,f=pcall(ae.httpService.JSONDecode,ae.httpService,c.Body)
d=if e then f else nil end local e=tonumber(c.StatusCode)or 0 return e>=200 and e<300,d or{}end function ag.segment(ah):
string local ai=tostring(ah):gsub('[^%w%-_%.~]',function(ai)return string.format('%%%02X',string.byte(ai))end)return ai
end function ag.base(ah):string?if type(ah)~='string'then return nil end local ai=ah:gsub('/+$','')return ai end return
ag end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae=ac(ab.Parent.services)export type
RuntimeState={secureMode:boolean,coreGui:CoreGui,workspace:Workspace,runService:RunService,userInputService:
UserInputService,guiService:GuiService,localPlayer:Player?,tweenService:TweenService,httpService:HttpService,textService
:TextService,replicatedStorage:ReplicatedStorage,localizationService:LocalizationService,guiContainer:Instance}local af=
{}::RuntimeState af.secureMode=(function()if typeof(getgenv)~='function'then return false end local ag,ah=pcall(function
()return getgenv().RAYFIELD_SECURE end)return ag and ah==true end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.
workspace=ae.getService'Workspace'::Workspace af.runService=ae.getService'RunService'::RunService af.userInputService=ae
.getService'UserInputService'::UserInputService af.guiService=ae.getService'GuiService'::GuiService af.localPlayer=(ae.
getService'Players'::Players).LocalPlayer af.tweenService=ae.getService'TweenService'::TweenService af.httpService=ae.
getService'HttpService'::HttpService af.textService=ae.getService'TextService'::TextService af.replicatedStorage=ae.
getService'ReplicatedStorage'::ReplicatedStorage af.localizationService=ae.getService'LocalizationService'::
LocalizationService af.guiContainer=(function():Instance if af.runService:IsStudio()then local ag=af.localPlayer if ag
then return ag.PlayerGui end return af.coreGui end if typeof(gethui)=='function'then local ag,ah=pcall(gethui)if ag and
ah then return ah end end return af.coreGui end)()return af end)()end,[72]=function()local aa,ab,ac=a(72)local ad return
(function(...)local ae={}function ae.getService(af)local ag=game:GetService(af)return if cloneref then cloneref(ag)else
ag end return ae end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae=ac(ab.Parent.
variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{},{},0,1024 local function ak(al:GetTextBoundsParams):
unknown local am,b=pcall(function()return af:GetTextBoundsAsync(al)end)return if am then b else nil end local function
al(am:unknown,b:'X'|'Y'):number?if typeof(am)=='Vector2'then return if b=='X'then am.X else am.Y end if type(am)==
'table'and type((am::any)[b])=='number'then return(am::any)[b]end return nil end function ag.textWidth(am:Font,b:number,
c:any):number c=tostring(c)local d=tostring(am.Family)..'|'..tostring(am.Weight)..'|'..tostring(am.Style)..'|'..
tostring(b)..'|'..c local e=ah[d]if e then return e end local f=Instance.new'GetTextBoundsParams'f.Text=c f.Font=am f.
Size=b f.Width=math.huge local g=al(ak(f),'X')if not g then local h=utf8.len(c)or#c return math.ceil(b*0.55*h)end local
h=math.ceil(g)if ai>=aj then ah={}ai=0 end ah[d]=h ai+=1 return h end function ag.textHeight(am:Font,b:number,c:any,d:
number):number local e=Instance.new'GetTextBoundsParams'e.Text=tostring(c)e.Font=am e.Size=b e.Width=d local f=al(ak(e),
'Y')return if f then math.ceil(f)else b end return ag end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(
function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.runtime),ac(ab.Parent.constants),ac(ab.Parent.log),ac(ab.Parent.
filesystemManager),ac(ab.Parent.assetResolver),ac(ab.Parent.fontManager)type RuntimeState=ae.RuntimeState type
FileSystemManager=ah.FileSystemManager type AssetResolver=ai.AssetResolver type FontManager=aj.FontManager export type
VariablesState=RuntimeState&{fallbackFont:Font,fileSystemManager:FileSystemManager,assetResolver:AssetResolver,
fontManager:FontManager,setFallbackFont:(font:Enum.Font|Font)->(),brandFont:(weight:Enum.FontWeight?)->Font}local ak=
table.clone(ae)::VariablesState ag.setSecureModeSource(function()return ak.secureMode end)ak.fallbackFont=Font.fromEnum(
Enum.Font.BuilderSans)ak.fileSystemManager=ah.new()ak.assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.
RoProxyDownloadUrl)::AssetResolver ak.fontManager=aj.new(ak.fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.
AssetDownloadUrl.RoProxyDownloadUrl,{saveToDisk=true,skipCache=false,fallbackFont=ak.fallbackFont})::FontManager
function ak.setFallbackFont(al:Enum.Font|Font)if typeof(al)=='EnumItem'then al=Font.fromEnum(al)end if typeof(al)==
'Font'then ak.fallbackFont=al ak.fontManager.defaultOptions.fallbackFont=al end end function ak.brandFont(al:Enum.
FontWeight?):Font if ak.secureMode then return Font.new(ak.fallbackFont.Family,al)end return Font.new(af.fontAsset,al)
end return ak end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae,af=ac(ab.Parent.layouts
),{}export type Profile={defaultSize:Vector2,minSize:Vector2,maxOccupancyX:number,maxOccupancyY:number?,marginFloorX:
number,marginFloorY:number,topbarClearance:number?,maxAspectRatio:number,minAspectRatio:number?,widthCompensation:number
?,chromeHeight:number}local ag,ah=200,{top={defaultSize=Vector2.new(760,520),minSize=Vector2.new(320,285),maxOccupancyX=
0.9,topbarClearance=36,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.6,widthCompensation=0,chromeHeight=ae.top.
chromeHeight}::Profile,sidebar={defaultSize=Vector2.new(900,540),minSize=Vector2.new(560,350),maxOccupancyX=0.92,
maxOccupancyY=0.8,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.6,minAspectRatio=1.2,chromeHeight=ae.sidebar.
chromeHeight}::Profile}function af.profile(ai:ae.Mode?):Profile if ai=='sidebar'then return ah.sidebar end return ah.top
end function af.pageHeight(ai:number?,aj:ae.Mode?):number local ak=af.profile(aj)local al=if ai and ai>0 then ai else ak
.minSize.Y return math.max(al-ak.chromeHeight,0)end local function ai(aj:Profile,ak:number):number local al=ak-aj.
marginFloorY if aj.topbarClearance then al=math.min(al,ak-aj.topbarClearance*2)end if aj.maxOccupancyY then al=math.min(
al,ak*aj.maxOccupancyY)end return al end local function aj(ak:number,al:number,am:number):number return math.clamp((al-
ak)/(al-am),0,1)end local function ak(al:Profile,am:number,b:number):UDim2 local c=math.floor(math.min(math.clamp(b,al.
minSize.Y,al.defaultSize.Y),b))local d=aj(c,al.defaultSize.Y,al.minSize.Y)local e=math.max(al.defaultSize.X+(al.
widthCompensation::number)*d,al.minSize.X)return UDim2.fromOffset(math.floor(math.min(e,am,c*al.maxAspectRatio)),c)end
local function al(am:Profile,b:number,c:number):UDim2 local d,e=math.min(math.clamp(b,am.minSize.X,am.defaultSize.X),b),
math.min(math.clamp(c,am.minSize.Y,am.defaultSize.Y),c)e=math.floor(math.min(e,d/(am.minAspectRatio::number)))d=math.
floor(math.min(d,e*am.maxAspectRatio))return UDim2.fromOffset(d,e)end af.minScale=0.7 local am,b=0.9,0.88 function af.
scaleFor(c:Vector2?,d:ae.Mode?):number if not c or c.X<ag or c.Y<ag then return 1 end local e=af.profile(d)local f=math.
min(c.X*am/e.defaultSize.X,c.Y*b/e.defaultSize.Y)return math.floor(math.clamp(f,af.minScale,1)*100)/100 end function af.
fit(c:Vector2?,d:ae.Mode?):UDim2 local e=af.profile(d)if not c or c.X<ag or c.Y<ag then return UDim2.fromOffset(e.
defaultSize.X,e.defaultSize.Y)end local f,g=math.min(c.X*e.maxOccupancyX,c.X-e.marginFloorX),ai(e,c.Y)if e.
minAspectRatio then return al(e,f,g)end return ak(e,f,g)end return af end)()end},{{1,2,{'Rayfield'},{{42,1,{'utility'},{
{61,2,{'network'}},{71,2,{'runtime'}},{65,2,{'persistence'}},{44,2,{'assetResolver'}},{68,2,{'persistenceSettings'}},{53
,2,{'functions'}},{66,2,{'persistenceConfig'}},{74,2,{'variables'}},{67,2,{'persistencePaths'}},{52,2,{'fontManager'}},{
46,2,{'columns'}},{55,2,{'imageCache'}},{64,2,{'path'}},{63,2,{'ordering'}},{58,2,{'lockable'}},{51,2,{'flagNames'}},{45
,2,{'colors'}},{57,2,{'locale'}},{59,2,{'log'}},{69,2,{'persistenceWrite'}},{62,2,{'odometer'}},{60,2,{'moveable'}},{75,
2,{'windowSizing'}},{48,2,{'enums'}},{73,2,{'textMetrics'}},{50,2,{'filesystemManager'}},{72,2,{'services'}},{47,2,{
'constants'}},{70,2,{'relayClient'}},{49,2,{'filesystem'}},{54,2,{'image'}},{43,2,{'HapticEngine'}},{56,2,{'layouts'}}}}
,{34,1,{'themes'},{{36,2,{'cobalt'}},{38,2,{'ember'}},{35,2,{'amethyst'}},{37,2,{'default'}},{40,2,{'rose'}},{39,2,{
'frost'}}}},{41,2,{'types'}},{2,1,{'components'},{{9,2,{'console'}},{28,2,{'tabSelector'}},{6,2,{'chrome'}},{11,2,{
'divider'}},{13,2,{'dropdown'}},{32,2,{'toggle'}},{20,2,{'progress'}},{7,2,{'colorpicker'}},{4,2,{'button'}},{30,2,{
'text'}},{10,2,{'descriptor'}},{31,2,{'toast'}},{33,2,{'window'}},{18,2,{'notification'}},{19,2,{'popup'}},{23,2,{
'sidebar'}},{8,2,{'column'}},{16,2,{'keybind'}},{3,2,{'action'}},{26,2,{'tab'}},{12,2,{'drag'}},{14,2,{'group'}},{25,2,{
'stat'}},{17,2,{'nameplate'}},{27,2,{'tabSection'}},{21,2,{'search'}},{22,2,{'section'}},{24,2,{'slider'}},{15,2,{
'input'}},{5,2,{'chat'}},{29,2,{'tag'}}}}}}},'0.4.1','Rayfield',string,task,setmetatable,error,next,table,unpack,
coroutine,script,type,require,pcall,xpcall,tostring,tonumber,_VERSION local j,k,l,m,n,o,p=aj.insert,aj.remove,aj.freeze
or function(j)return j end,al.wrap,ae.sub,ae.match,ae.gmatch if h and n(h,1,4)=='Lune'then local q,r=d(c,'@lune/task')if
q and r then af=r end end local q=af and af.defer local r,s,t,u,v,w,x,y,z=q or function(r,...)m(r)(...)end,{[1]='Folder'
,[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local A,B={GetFullName={{},
function(A)local B,C=A.Name,A.Parent while C do B=C.Name..'.'..B C=C.Parent end return B end},GetChildren={{},function(A
)local B={}for C in ai,z[A]do j(B,C)end return B end},GetDescendants={{},function(A)local B={}for C in ai,z[A]do j(B,C)
for D,E in ai,C:GetDescendants()do j(B,E)end end return B end},FindFirstChild={{'string','boolean?'},function(A,B,C)
local D=z[A]for E in ai,D do if E.Name==B then return E end end if C then for E in ai,D do return E:FindFirstChild(B,
true)end end end},FindFirstAncestor={{'string'},function(A,B)local C=A.Parent while C do if C.Name==B then return C end
C=C.Parent end end},WaitForChild={{'string','number?'},function(A,B)return A:FindFirstChild(B)end}},{}for C,D in ai,A do
local E,F,G=D[1],D[2],{}for H,I in ai,E do local J,K=o(I,'^([^%?]+)(%??)')G[H]={J,K}end B[C]=function(H,...)if not z[H]
then ah("Expected ':' not '.' calling member function "..C,2)end local I={...}for J,K in ai,G do local L=I[J]local M,N,O
=b(L),K[1],K[2]if L==nil and not O then ah('Argument '..L..' missing or nil',3)end if N~='any'and M~=N and not(M=='nil'
and O)then ah('Argument '..J..' expects type "'..N..'", got "'..M..'"',2)end end return F(H,...)end end local function C
(D,E,F)local G,H=(ag({},{__mode='k'}))local function I(J)ah(J..' is not a valid (virtual) member of '..D..' "'..E..'"',3
)end local function J(K)ah('Unable to assign (virtual) property '..K..'. Property is read only',3)end local K,L={},{}L.
__metatable=false L.__index=function(M,N)if N=='ClassName'then return D elseif N=='Name'then return E elseif N=='Parent'
then return F elseif D=='StringValue'and N=='Value'then return H else local O=B[N]if O then return O end end for O in ai
,G do if O.Name==N then return O end end I(N)end L.__newindex=function(M,N,O)if N=='ClassName'then J(N)elseif N=='Name'
then E=O elseif N=='Parent'then if O==K then return end if F~=nil then z[F][K]=nil end F=O if O~=nil then z[O][K]=true
end elseif D=='StringValue'and N=='Value'then H=O else I(N)end end L.__tostring=function()return E end ag(K,L)z[K]=G if
F~=nil then z[F][K]=true end return K end local function D(E,F)local G,H,I,J=E[1],E[2],E[3],E[4]local K=s[H]local L=I
and k(I,1)or K local M=C(K,L,F)t[G]=M if I then for N,O in ai,I do M[N]=O end end if J then for N,O in ai,J do D(O,M)end
end return M end local E=C('Folder','['..ad..']')for F,G in ai,ab do D(G,E)end for F,G in ai,aa do local H=t[F]u[H]=G v[
H]=F local I=H.ClassName if I=='LocalScript'or I=='Script'then j(x,H)end end local function F(G)local H,I=G.ClassName,w[
G]if I and H=='ModuleScript'then return ak(I)end local J=u[G]local function K(L)local M,N,O=nil,d(function()return debug
.traceback(nil,2)end)if N then M=O end return{Message=L,Traceback=M}end local function L(M)local N,O=f(M.Message),G:
GetFullName()local P,Q=o(N,'[^:]+:(%d+): (.+)')local R if not P or not i then R=O..':*: '..(Q or N)else P=g(P)local S=v[
G]local T=i[S]local U=P-T+1 if U<0 then U='?'end R=O..':'..U..': '..Q end local S=M.Traceback if S and S~=''then R=R..
'\n'..S end return R end if H=='LocalScript'or H=='Script'then local M,N=e(J,K)if not M then ah(L(N),0)end else local M=
{e(J,K)}local N=k(M,1)if not N then local O=k(M,1)ah(L(O),0)end w[G]=M return ak(M)end end function a(G)local H=t[G]
local function I(J,...)local K={d(J,...)}local L=k(K,1)if not L then ah(K[1],3)end return ak(K)end local J=l(ag({},{
__index=y,__newindex=function(J,K,L)y[K]=L end,__len=function()return#y end,__iter=function()return ai,y end}))local K,L
=l{version=ac,envname=ad,shared=J,script=am,require=c},H local function M(N,...)local O,P,Q=b(N),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if O=='table'and z[N]then if N.
ClassName~='ModuleScript'then ah(P,2)elseif N==H then ah(Q,2)end return F(N)elseif O=='string'and n(N,1,1)~='@'then if#N
==0 then ah('Attempted to call require with empty string',2)end local R=H if n(N,1,1)=='/'then R=E elseif n(N,1,2)=='./'
then N=n(N,3)end local S for T in p(N,'([^/]*)/?')do local U=T if T=='..'then U='Parent'end if U~=''then local V=R:
FindFirstChild(U)if not V then local W=R.Parent if W then V=W:FindFirstChild(U)end end if V then R=V elseif T~=S and T~=
'init'and T~='init.server'and T~='init.client'then ah('Virtual script path "'..N..'" not found',2)end end S=T end if R.
ClassName~='ModuleScript'then ah(P,2)elseif R==H then ah(Q,2)end return F(R)end return I(c,N,...)end return K,L,M end
for G,H in ai,x do r(F,H)end return F(E:GetChildren()[1])