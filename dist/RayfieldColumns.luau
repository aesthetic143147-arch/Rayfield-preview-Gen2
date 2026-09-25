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
type ProgressProps=j.ProgressProps export type ConsoleProps=j.ConsoleProps export type TextProps=j.TextProps export type
DividerProps=j.DividerProps export type NotifyProps=j.NotifyProps export type ToastProps=j.ToastProps export type
PopupBox=j.PopupBox export type PopupOption=j.PopupOption export type PopupProps=j.PopupProps export type Moveable=j.
Moveable export type Lockable=j.Lockable export type Window=j.Window export type Tab=j.Tab export type Column=j.Column
export type Group=j.Group export type Button=j.Button export type Toggle=j.Toggle export type Slider=j.Slider export
type Dropdown=j.Dropdown export type Input=j.Input export type Keybind=j.Keybind export type ColorPicker=j.ColorPicker
export type Stat=j.Stat export type Progress=j.Progress export type Console=j.Console export type Section=j.Section
export type TabSection=j.TabSection export type Text=j.Text export type Divider=j.Divider export type Tag=j.Tag export
type Popup=j.Popup export type Rayfield=j.Rayfield type WindowModule={new:(j.WindowProps)->j.Window}local k={}::Rayfield
local function l()local m=Instance.new'ScreenGui'm.Name=f.httpService:GenerateGUID(false)m.ClipToDeviceSafeArea=false m.
DisplayOrder=i.displayOrder.banner m.IgnoreGuiInset=true m.ResetOnSpawn=false m.Enabled=true m.SafeAreaCompatibility=
Enum.SafeAreaCompatibility.None m.ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets m.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling m.Parent=f.guiContainer local n=Instance.new'ImageLabel'n.Name='Banner'n.AnchorPoint=Vector2.new(0.5,0.5)n.
BackgroundColor3=Color3.fromRGB(255,255,255)n.BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.
BorderSizePixel=0 n.Image=g.resolve(i.icons.banner)n.Position=UDim2.fromScale(0.5,0.5)n.Size=UDim2.fromOffset(262,60)n.
Parent=m return m end function k.CreateWindow(m,n:j.WindowProps):j.Window local o,p:j.Window?,q:(()->())?=(l())if f.
secureMode then g.preload(function(r)if r<=0 then return end local function s()if not p or p.unloaded then return end p:
Notify{title=h.resolve'Secure mode',content=if r==1 then h.resolve"An asset couldn't be cached and won't appear."else h.
resolve"Some assets couldn't be cached and won't appear."}end if p then s()else q=s end end)end local r,s=pcall(function
()return(d(c.components.window)::WindowModule).new(n)end)if not r then o:Destroy()error(s,0)end local t=s::j.Window p=t
if q then task.spawn(q)q=nil end if f.secureMode then task.spawn(function()local u,v=f.fontManager:loadFont(i.fontAsset,
Enum.FontWeight.Medium),f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.SemiBold)if not t.unloaded and u and v and u
~=f.fallbackFont and v~=f.fallbackFont then t:ChangeTheme{Font=u,TitleFont=v}end end)end task.spawn(function()task.wait(
0.5)o:Destroy()task.wait(0.5)if not t.unloaded then t:Show()end end)return t end return k end)()end,[59]=function()local
b,c,d=a(59)local e return(function(...)local f,g,h,i,j,k,l=d(c.Parent.variables),d(c.Parent.filesystem),d(c.Parent.log),
d(c.Parent.path),d(c.Parent.persistencePaths),d(c.Parent.persistenceWrite),{}type PersistedControl={value:unknown,flag:
string?,_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,_deserialize:((PersistedControl,unknown)->())?,Set:
(PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:PersistedControl},configuration:{fileName:string?,
customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[string]:unknown}?,_loadedConfigPath:string?}function
l.getPath(m:ConfigWindow,n:unknown?):(string?,string?)return j.getConfigPath(m,n)end function l.save(m:ConfigWindow,n:
unknown?):boolean local o,p=l.getPath(m,n)if not o or not p then h.warn("Rayfield: configuration name '"..tostring(n)..
"' has no usable characters")return false end if typeof(g.writefile)~='function'then return false end local q:{[string]:
unknown}={}for r,s in m.controls do local t,u=pcall(function()local t=s._serialize if t then return t(s)end return s.
value end)if t then q[r]=u else h.warn("Rayfield: Failed to serialize flag '"..tostring(r).."' - "..tostring(u))end end
local r=m._loadedConfig if r and m._loadedConfigPath==p then for s,t in r do if m.controls[s]==nil then q[s]=t end end
end local s,t=pcall(f.httpService.JSONEncode,f.httpService,q)if not s then h.warn(
'Rayfield: Failed to encode configuration - '..tostring(t))return false end local u,v=pcall(function()k.write(o,p,t)end)
if not u then h.warn('Rayfield: Failed to save configuration - '..tostring(v))return false end if m._loadedConfigPath==
nil or m._loadedConfigPath==p then m._loadedConfig=q m._loadedConfigPath=p end return true end local function m(n:string
):({[string]:unknown}?,string?)if not g.isfile(n)then return nil,nil end local o,p=pcall(g.readfile,n)if not o or type(p
)~='string'then h.warn'Rayfield: Failed to read configuration file'return nil,nil end local q,r=pcall(f.httpService.
JSONDecode,f.httpService,p)if not q or type(r)~='table'then return nil,p end return r::{[string]:unknown},p end
local function n(o:string):string local p=i.stripExtension(o,'.rfld')local q,r=p..' (Incorrect Format).rfld',2 while r<=
100 and g.isfile(q)do q=p..' (Incorrect Format '..r..').rfld'r+=1 end return q end function l.load(o:ConfigWindow,p:
unknown?):boolean local q,r=l.getPath(o,p)if not q or not r then h.warn("Rayfield: configuration name '"..tostring(p)..
"' has no usable characters")return false end if typeof(g.isfile)~='function'then return false end local s,t=m(r)if not
s and g.isfile(r)then local u,v=m(k.tempPathFor(r))if u and v then s=u pcall(k.write,q,r,v)end end if not s then if t
then h.warn[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local u=n(r)pcall(function()g
.ensureDir(q)g.writefile(u,t)g.delfile(r)end)end return false end local u,v=s::{[string]:unknown},o._loading o._loading=
true local w,x=pcall(function()for w,x in o.controls do l.applyTo(x,u[w])end end)o._loading=v if not w then h.warn(
'Rayfield: Failed to apply configuration - '..tostring(x))end o._loadedConfig=u o._loadedConfigPath=r return true end
function l.applyTo(o:PersistedControl,p:unknown)if p==nil and not o._canBeNil then return end local q,r=pcall(function()
local q=o._deserialize if q then q(o,p)else o:Set(p)end end)if not q then h.warn("Rayfield: Failed to restore flag '"..
tostring(o.flag).."' - "..tostring(r))end end function l.list(o:ConfigWindow):{string}local p,q:{string}=l.getPath(o),{}
if not p then return q end local r,s=pcall(g.listfiles,p)if not r or type(s)~='table'then return q end for t,u in s do
local v=i.basename(u)if v:sub(-5)=='.rfld'then local w=i.stripExtension(v,'.rfld')if w and w~=''and not w:find
' %(Incorrect Format[^%)]*%)$'then table.insert(q,w)end end end table.sort(q)return q end function l.delete(o:
ConfigWindow,p:unknown):boolean if type(p)~='string'or p==''then return false end local q,r=l.getPath(o,p)if not r then
return false end if typeof(g.isfile)~='function'or not g.isfile(r)then return false end pcall(g.delfile,k.tempPathFor(r)
)return(pcall(g.delfile,r))end return l end)()end,[33]=function()local b,c,d=a(33)local e return(function(...)local f=d(
c.Parent.Parent.utility.variables)return{CornerRoundness=UDim.new(0,20),WindowColor=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(25,25,25)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ShadowColor=Color3.fromRGB(20,20,20),ElementStroke=Color3.
fromRGB(35,35,35),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,255,
255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50),Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(
Color3.fromRGB(95,95,95),Color3.fromRGB(50,50,50)),SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=
Color3.fromRGB(60,60,60),SliderProgress=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),
SliderStroke=Color3.fromRGB(255,255,255),ActionColor=Color3.fromRGB(255,255,255),TitleFont=f.brandFont(Enum.FontWeight.
SemiBold),Font=f.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(255,255,255),LiveAnimation=false,
DarkToggleOverlay=true,ElementTransparency=0,ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,
ElementStrokeHover=Color3.fromRGB(50,50,50),ElementCornerRadius=UDim.new(0,12),ElementTextHoverColor=Color3.fromRGB(255,
255,255),TitlingColor=Color3.fromRGB(255,255,255),DropdownHighlight=Color3.fromRGB(255,255,255),AccentColor=Color3.
fromRGB(23,153,110),AccentStroke=Color3.fromRGB(32,201,144),AccentGlow=0.4,StatBackground=Color3.fromRGB(25,25,25),
SliderHandle=Color3.fromRGB(255,255,255),PillCornerRadius=UDim.new(1,0),ToggleTrack=Color3.fromRGB(0,0,0),
ToggleTrackTransparency=0.9,ToggleKnobOff=Color3.fromRGB(255,255,255),ToggleKnobOffTransparency=0.8,FieldBackground=
Color3.fromRGB(255,255,255),FieldTransparency=0.9,FieldGlow=Color3.fromRGB(255,255,255),PlaceholderColor=Color3.fromRGB(
178,178,178),SurfaceStroke=Color3.fromRGB(255,255,255),NeutralButton=Color3.fromRGB(38,38,38),NeutralButtonHover=Color3.
fromRGB(54,54,54),NeutralButtonStroke=Color3.fromRGB(255,255,255),ErrorColor=Color3.fromRGB(185,50,50),ErrorStrokeColor=
Color3.fromRGB(240,75,75)}end)()end,[23]=function()local b,c,d=a(23)local e return(function(...)local f={}f.__index=f f.
__type='Statistic'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n=d(g.variables),d(g.functions),d(g.odometer),d(g.
moveable),d(g.constants),d(g.locale),d(g.log)local o,p,q,r=l.statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0
,0.85),NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function s(t)return t.
fill.Keypoints[1].Value end local function t(u)if u>0 then return string.format('+%.1f%%',u)elseif u<0 then return
string.format('%.1f%%',u)else return'0%'end end local function u(v)if typeof(v)~='number'then return tostring(v)end
local w=math.round(math.abs(v))local x=string.format('%.0f',w)local y=x:reverse():gsub('%d%d%d','%0,'):reverse()if y:
sub(1,1)==','then y=y:sub(2)end return if v<0 and w~=0 then'-'..y else y end local function v(w)local x=math.round(w)if
x>0 then return'+'..u(x)elseif x<0 then return u(x)else return'0'end end function f.new(w,x)x=if typeof(x)=='table'then
x else{}local y=setmetatable({tab=assert(w,'Missing argument #1 (Tab expected)'),window=w.window,name=x.name or x.Name
or'Statistic',icon=x.icon or x.Icon,description=x.description or x.Description,value=if(x.value or x.Value)~=nil then(x.
value or x.Value)else 0,_hasValue=(x.value or x.Value)~=nil,numberEasing=if(x.numberEasing~=nil)then x.numberEasing
elseif x.NumberEasing~=nil then x.NumberEasing else true,changeMode=x.changeMode or x.ChangeMode or'percentage',
changeBaseline=x.changeBaseline or x.ChangeBaseline or'previous',prefix=x.prefix or x.Prefix or'',suffix=x.suffix or x.
Suffix or'',compact=x.compact or x.Compact or w.compact or false,display=(x.display or x.Display or'value'),
_initialValue=if(x.value or x.Value)~=nil then(x.value or x.Value)else nil,_lastChange=0},f)if y.compact then y:
_buildCompact()else y:_buildFull()end if y.description then if y.compact then n.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
y.name}'.`)else y.descriptor=d(c.Parent.descriptor).new(y.tab,{description=y.description})end end return y end function
f._buildFull(w)local x=w.window w.main=x:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=w.name,ZIndex
=5,BackgroundTransparency=1,Parent=w.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})x:Create('UICorner',{Parent=w.main},{CornerRadius='ElementCornerRadius'})w.stroke=x:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=w.main},{Transparency='ElementStrokeTransparency'})w
.strokeGradient=x:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=o.neutral.stroke,Transparency=p,Parent
=w.stroke})w.titleContainer=x:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=w.main})w.gradientContainer=x:Create('Frame',{
Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,BackgroundColor3=
Color3.fromRGB(255,255,255),ZIndex=5,Parent=w.main})w.glow=x:CreateGlow(w.main,s(o.neutral),13,1)w.title=x:Create(
'TextLabel',{Text=m.t(w.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=w.
titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})w.mainGradient=x:Create('UIGradient',{Rotation=2,Offset
=Vector2.new(0,0.5),Color=o.neutral.fill,Transparency=p,Parent=w.gradientContainer})x:Create('UICorner',{Parent=w.
gradientContainer},{CornerRadius='ElementCornerRadius'})if w.icon then w.iconLabel=x:Create('ImageLabel',{Image=w.icon,
Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=w.
titleContainer},{ImageColor3='ContentColor'})end w.containerLayout=x:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=w.titleContainer})w.valueHost=x:Create('Frame',{
AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=w.main})w.changeHost=x:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.
new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=w.main})w.
valueOdo=j.new(x,w.valueHost,{textSize=20,alignment=Enum.HorizontalAlignment.Left,transparency=1})w.valueOdo:snap(w:
_formatValue(w.value))w.changeOdo=j.new(x,w.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})w.changeOdo:snap(w:_formatChange(0))w._accentGradients={w.strokeGradient,w.mainGradient}end function f.
_buildCompact(w)local x,y=w.window,w.tab.compact or false w.main=x:Create('Frame',{Name=w.name,Size=if y then UDim2.
fromOffset(0,q)else UDim2.new(1,-20,0,q),AutomaticSize=if y then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=w.tab.tabPage},{BackgroundColor3=
'StatBackground',BackgroundTransparency='ElementTransparency'})x:Create('UICorner',{Parent=w.main},{CornerRadius=
'ElementCornerRadius'})w.stroke=x:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=w.main},{
Transparency='ElementStrokeTransparency'})w.strokeGradient=x:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),
Color=o.neutral.stroke,Transparency=p,Parent=w.stroke})if y then x:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=w.main})end x:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=w.main})w.card=x:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,q),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=w.main})x:Create('UICorner',{Parent=w.card},{CornerRadius='ElementCornerRadius'})w.
mainGradient=x:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=o.neutral.fill,Transparency=p,Parent=w.
card})x:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=w.card})x:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=w.card})w.titleContainer=x:Create('Frame'
,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=
0,ZIndex=6,Parent=w.card})x:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=w.titleContainer})x:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=w
.titleContainer})if w.icon then w.iconLabel=x:Create('ImageLabel',{Image=w.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=w.titleContainer},{
ImageColor3='ContentColor'})end w.title=x:Create('TextLabel',{Text=m.t(w.name),Size=UDim2.fromOffset(0,16),AutomaticSize
=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=w.titleContainer},{TextColor3=
'ContentColor',FontFace='Font'})x:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=w.title})w.readoutHost=x:
Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),BackgroundTransparency=1,BorderSizePixel=
0,LayoutOrder=1,ZIndex=6,Parent=w.card})w.readoutOdo=j.new(x,w.readoutHost,{textSize=17,alignment=Enum.
HorizontalAlignment.Right,transparency=1})w.readoutOdo:snap(w.display=='change'and w:_formatChange(0)or w:_formatValue(w
.value))w._accentGradients={w.strokeGradient,w.mainGradient}end function f._setAccent(w,x,y)local z=o[x]w.strokeGradient
.Color=z.stroke w.mainGradient.Color=z.fill if w.glow then w.glow.Color=s(z)end local A,B=if y==1 then 14 elseif y==-1
then-10 else 2,if y==1 then Vector2.new(0.04,0.5)elseif y==-1 then Vector2.new(-4E-2,0.5)else Vector2.new(0,0.5)for C,D
in w._accentGradients do h.tweenService:Create(D,r,{Rotation=A,Offset=B}):Play()end end function f._formatValue(w,x)
return w.prefix..u(x)..w.suffix end function f._formatChange(w,x)if w.changeMode=='absolute'then return v(x)else return
t(x)end end function f._showValue(w,x,y,z,A)if w.numberEasing and not A then x:to(w:_formatValue(y),y>=z)else x:snap(w:
_formatValue(y))end end function f._updateFullReadouts(w,x,y,z,A,B,C)w:_showValue(w.valueOdo,x,y,C)if B then w.changeOdo
:snap(B)w._lastChange=0 elseif w.numberEasing and not A then w.changeOdo:to(w:_formatChange(z),z>=w._lastChange)w.
_lastChange=z else w.changeOdo:snap(w:_formatChange(z or 0))w._lastChange=z or 0 end end function f.
_updateCompactReadout(w,x,y,z,A,B,C)if w.display=='change'then if B then w.readoutOdo:snap(B)w._lastChange=0 elseif w.
numberEasing and not A then w.readoutOdo:to(w:_formatChange(z),z>=w._lastChange)w._lastChange=z else w.readoutOdo:snap(w
:_formatChange(z or 0))w._lastChange=z or 0 end else w:_showValue(w.readoutOdo,x,y,C)end end function f.Set(w,x)assert(
typeof(x)=='number','Statistic:Set() - value must be a number, got '..typeof(x))local y,z=w.value,not w._hasValue w.
value=x w._hasValue=true if z then w._initialValue=x end local A=if w.changeBaseline=='initial'then w._initialValue else
y local B,C,D,E,F=z or A==x if B then C=0 E='neutral'F=0 elseif A==0 then local G,H=if x>0 then'+'else'-',if w.
changeMode=='percentage'then'\u{221e}%'else'\u{221e}'D=G..H E=if x>0 then'positive'else'negative'F=if x>0 then 1 else-1
elseif w.changeMode=='percentage'then C=((x-A)/math.abs(A))*100 F=if C>0 then 1 elseif C<0 then-1 else 0 E=if F==1 then
'positive'elseif F==-1 then'negative'else'neutral'else C=x-A F=if C>0 then 1 elseif C<0 then-1 else 0 E=if F==1 then
'positive'elseif F==-1 then'negative'else'neutral'end w:_setAccent(E,F)if w.compact then w:_updateCompactReadout(x,y,C,B
,D,z)else w:_updateFullReadouts(x,y,C,B,D,z)end end function f.ResetBaseline(w,x)local y,z,A=w.value,not w._hasValue,if
typeof(x)=='number'then x else w.value w._initialValue=A w.value=A w._hasValue=true w._lastChange=0 if w.compact then if
w.display=='change'then w.readoutOdo:snap(w:_formatChange(0))else w:_showValue(w.readoutOdo,A,y,z)end else w.changeOdo:
snap(w:_formatChange(0))w:_showValue(w.valueOdo,A,y,z)end w:_setAccent('neutral',0)end function f._setShown(w,x,y)local
z=w.window if w.compact then z:_reveal(w.main,{BackgroundTransparency=if x then(w.window.theme.ElementTransparency or 0)
else 1},y)z:_reveal(w.stroke,{Transparency=if x then w.window.theme.ElementStrokeTransparency else 1},y)z:_reveal(w.card
,{BackgroundTransparency=if x then 0 else 1},y)z:_reveal(w.title,{TextTransparency=if x then 0 else 1},y)if w.iconLabel
then z:_reveal(w.iconLabel,{ImageTransparency=if x then 0 else 1},y)end w.readoutOdo:reveal(if x then 0 else 1,y)return
end if x then z:_revealCommon(w,y)z:_reveal(w.gradientContainer,{BackgroundTransparency=0},y)z:_reveal(w.glow,{
Transparency=0.82},y)w.valueOdo:reveal(0,y)w.changeOdo:reveal(0,y)else z:_hideCommon(w,y)z:_reveal(w.gradientContainer,{
BackgroundTransparency=1},y)z:_reveal(w.glow,{Transparency=1},y)w.valueOdo:reveal(1,y)w.changeOdo:reveal(1,y)end end
function f._minWidth(w)local x=40 if w.icon then x+=26 end x+=i.textWidth(w.window.theme.Font,16,m.resolve(w.name))local
y=if w.display=='change'then w:_formatChange(0)else w:_formatValue(w.value)x+=i.textWidth(w.window.theme.Font,17,y)
return x end k(f)return f end)()end,[21]=function()local b,c,d=a(21)local e return(function(...)local f=c.Parent.Parent.
utility local g,h,i,j,k,l,m,n,o,p=d(f.variables),d(f.image),d(f.locale),d(c.Parent.tabSelector),d(c.Parent.search),{},0,
0.7,0.95,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function q(r)return r.layout.mode==
'sidebar'and r.profile~=nil and r.settings.showProfile and g.localPlayer~=nil end local function r(s,t)local u=g.
localPlayer if not u then return end s.profile=s:Create('Frame',{Name='Profile',AnchorPoint=Vector2.new(0.5,1),Position=
UDim2.fromScale(0.5,1),Size=UDim2.new(1,0,0,t.footerHeight),BackgroundTransparency=1,Parent=s.sidebar})s.
profileContainer=s:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,t.rowInset,0.5,0),Size=UDim2.new(
1,-t.rowInset,1,0),BackgroundTransparency=1,Parent=s.profile})s.profileLayout=s:Create('UIListLayout',{Padding=UDim.new(
0,10),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=
Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=s.profileContainer})s.profileAvatar=s:Create(
'ImageLabel',{Name='Avatar',Image=h.avatar(u.UserId,function(v)if s.profileAvatar and not s.unloaded then h.assign(s.
profileAvatar,'Image',v)end end),Size=UDim2.fromOffset(t.avatarSize,t.avatarSize),BackgroundColor3=Color3.fromRGB(255,
255,255),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=s.profileContainer})s:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=s.profileAvatar})s.profileLabels=s:Create('Frame',{Size=UDim2.fromOffset(50,t.
avatarSize),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=s.profileContainer})s:
Create('UIListLayout',{Padding=UDim.new(0,2),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=s
.profileLabels})s.profileName=s:Create('TextLabel',{Text=u.DisplayName,Size=UDim2.fromOffset(50,16),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=s
.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})s.profileSubtitle=s:Create('TextLabel',{Text='',Size=UDim2.
fromOffset(50,14),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,Visible=false,TextTransparency=1,Parent=s.profileLabels},{TextColor3='TitlingColor',
FontFace='Font'})end function l.build(s,t)s.sidebar=s:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),
Position=UDim2.fromScale(0,1),Size=UDim2.new(0,t.railWidth,1,-t.chromeHeight),BackgroundTransparency=1,Visible=false,
Parent=s.main})s.tabList=s:Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,BorderSizePixel=0,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,
Parent=s.sidebar})s:Create('UIPadding',{PaddingTop=UDim.new(0,t.railPadding),PaddingBottom=UDim.new(0,t.railPadding),
Parent=s.tabList})s.tabListLayout=s:Create('UIListLayout',{Padding=UDim.new(0,t.rowSpacing),FillDirection=Enum.
FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=s.tabList})r(s,t)l.reflowProfile(s)end function l.reflowProfile(s)local t,u=
s.layout,q(s)if s.profile then s.profile.Visible=u end s.tabList.Size=UDim2.new(1,0,1,if u then-t.footerHeight else 0)
end function l.applyWidth(s,t)local u=s.layout s.sidebar.Size=UDim2.new(0,t,1,-u.chromeHeight)s.elements.Size=UDim2.new(
1,-t,1,-u.chromeHeight)s.bottomFade.Size=UDim2.new(1,-t,u.fadeSize.Y.Scale,u.fadeSize.Y.Offset)k.railWidth(s,t)local v=t
<(u.railWidth::number)for w,x in s.tabs do if not x.neglectSelector then j.setRowCollapsed(x,v,u)end end if s.
profileContainer then s.profileContainer.Position=UDim2.new(0,if v then 0 else u.rowInset,0.5,0)s.profileContainer.Size=
UDim2.new(1,if v then 0 else-u.rowInset,1,0)s.profileLayout.HorizontalAlignment=if v then Enum.HorizontalAlignment.
Center else Enum.HorizontalAlignment.Left s.profileLabels.Visible=not v end end function l.setProfileShown(s,t,u)if not
s.profile or not s.profile.Visible then return end local v={[s.profileAvatar]={ImageTransparency=if t then 0 else 1,
BackgroundTransparency=if t then o else 1},[s.profileName]={TextTransparency=if t then m else 1},[s.profileSubtitle]={
TextTransparency=if t then n else 1}}for w,x in v do if u then g.tweenService:Create(w,u,x):Play()else for y,z in x do w
[y]=z end end end end function l.setProfileEnabled(s,t)if not s.profile then s.settings.showProfile=t return end if t
then s.settings.showProfile=true l.reflowProfile(s)l.setProfileShown(s,true,p)return end l.setProfileShown(s,false,p)
task.delay(p.Time,function()if s.unloaded or s.settings.showProfile then return end l.reflowProfile(s)end)s.settings.
showProfile=false end function l.setSubtitle(s,t)if not s.profileSubtitle then return end local u=if type(t)=='string'
and t~=''then i.resolve(t)else nil s.profileSubtitle.Text=u or''s.profileSubtitle.Visible=u~=nil end return l end)()end,
[20]=function()local b,c,d=a(20)local e return(function(...)local f={}f.__index=f f.__type='Section'local g,h=d(c.Parent
.Parent.utility.moveable),d(c.Parent.Parent.utility.locale)function f.new(i,j)j=if typeof(j)=='table'then j else{}local
k=setmetatable({tab=assert(i,'Missing argument #1 (Tab expected)'),window=i.window,name=j.name or j.Name or'Section',
icon=j.icon or j.Icon},f)local l=if#k.tab.elements==0 then 0 else 13 k.main=k.window:Create('Frame',{Size=UDim2.new(1,-
40,0,20+l),BorderSizePixel=0,Name=k.name,BackgroundTransparency=1,Parent=k.tab.tabPage})if l>0 then k.window:Create(
'UIPadding',{PaddingTop=UDim.new(0,l),Parent=k.main})end k.window:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.
VerticalAlignment.Top,Parent=k.main})if k.icon then k.iconLabel=k.window:Create('ImageLabel',{Image=k.icon,Size=UDim2.
fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=k.main},{ImageColor3=
'ContentColor'})end k.title=k.window:Create('TextLabel',{Text=h.t(k.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=15,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=k.main},{TextColor3='ContentColor',FontFace='Font'})return k
end function f._setShown(i,j,k)local l=i.window l:_reveal(i.title,{TextTransparency=if j then 0.6 else 1},k)if i.
iconLabel then l:_reveal(i.iconLabel,{ImageTransparency=if j then 0.65 else 1},k)end end g(f)return f end)()end,[49]=
function()local b,c,d=a(49)local e return(function(...)local f,g={},64 local h,i,j=g-1,38,3 export type Mode='top'|
'sidebar'export type Layout={mode:Mode,topbarHeight:number,chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize
:UDim2,fadeTransparency:NumberSequence,fadeCorners:{string}?,tabStripTop:number?,tabStripHeight:number?,railWidth:number
?,railCollapsedWidth:number?,railCollapseBelow:number?,rowHeight:number?,rowCornerRadius:number?,rowSpacing:number?,
railPadding:number?,rowInset:number?,rowPadding:number?,rowContentSpacing:number?,rowIconSize:number?,footerHeight:
number?,avatarSize:number?,cardTransparency:number?,cardStrokeRotation:number?,cardStrokeTransparency:NumberSequence?,
cardCorners:{string}?}f.top={mode='top'::Mode,topbarHeight=g,chromeHeight=h+i+j,tabStripTop=h,tabStripHeight=i,
pageDirection=Enum.FillDirection.Horizontal,fadeSize=UDim2.new(1,0,-9.3E-2,100),fadeTransparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4414,0),NumberSequenceKeypoint.new(0.7007,0.631),
NumberSequenceKeypoint.new(1,1)}}::Layout f.sidebar={mode='sidebar'::Mode,topbarHeight=g,chromeHeight=g,railWidth=219,
railCollapsedWidth=64,railCollapseBelow=589,rowHeight=38,rowCornerRadius=14,rowSpacing=4,railPadding=17,rowInset=15,
rowPadding=10,rowContentSpacing=6,rowIconSize=20,footerHeight=60,avatarSize=34,pageDirection=Enum.FillDirection.Vertical
,cardTransparency=0.98,cardStrokeRotation=55,cardCorners={'TopLeftRadius','BottomRightRadius'},cardStrokeTransparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.new(0.128,0.95),NumberSequenceKeypoint.new(
0.414,0.985),NumberSequenceKeypoint.new(1,1)},fadeSize=UDim2.new(1,0,0,55),fadeTransparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.377,0),NumberSequenceKeypoint.new(1,1)},fadeCorners={
'BottomRightRadius'}}::Layout function f.get(k:unknown):Layout?if k=='sidebar'then return f.sidebar elseif k=='top'then
return f.top end return nil end function f.railWidthFor(k:Layout,l:number):number if k.mode~='sidebar'then return 0 end
local m=k.railWidth::number if l<(k.railCollapseBelow::number)then return k.railCollapsedWidth::number end return m end
return f end)()end,[8]=function()local b,c,d=a(8)local e return(function(...)local f={}f.__index=f f.__type='Console'
local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r=d(g.moveable),d(g.locale),120,48,24,17,12,12,1.25,200,Font.
fromEnum(Enum.Font.Code)function f.new(s,t)t=if typeof(t)=='table'then t else{}local u=setmetatable({tab=assert(s,
'Missing argument #1 (Tab expected)'),window=s.window,name=t.name or t.Name,description=t.description or t.Description,
height=math.max(tonumber(t.height or t.Height)or j,k),follow=t.follow or t.Follow or false,maxLines=math.max(tonumber(t.
maxLines or t.MaxLines)or q,1),lines={},lineLabels={},head=1,nextOrder=1,textDirty=true},f)u:_build()u:_setLines(t.text
or t.Text or'')if u.description then u.descriptor=d(c.Parent.descriptor).new(u.tab,{description=u.description})end
return u end function f.Get(s):string if s.textDirty then s.text=table.concat(s.lines,'\n')s.textDirty=false end return
s.text end function f._setLines(s,t)t=if type(t)=='string'then t else tostring(t)table.clear(s.lines)if t~=''then for u
in string.gmatch(t..'\n','([^\n]*)\n')do table.insert(s.lines,u)end end s:_trim()s:_flush()end function f._trim(s)local
t=#s.lines-s.maxLines if t<=0 then return end table.move(s.lines,t+1,#s.lines,1)for u=#s.lines,#s.lines-t+1,-1 do s.
lines[u]=nil end end function f._makeLabel(s)return s.window:Create('TextLabel',{Size=UDim2.new(1,0,0,0),AutomaticSize=
Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,FontFace=r,TextSize=o,TextXAlignment=Enum.TextXAlignment
.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,LineHeight=p,RichText=false,TextTransparency=s.
_textTransparency or 1,Parent=s.scroll},{TextColor3='ContentColor'})end local function s(t:string):string return if t==
''then' 'else t end function f._flush(t)t.textDirty=true for u,v in t.lines do local w=t.lineLabels[u]if not w then w=t:
_makeLabel()t.lineLabels[u]=w end w.LayoutOrder=u w.Text=s(v)w.Visible=true end for u=#t.lines+1,#t.lineLabels do t.
lineLabels[u].Visible=false end t.head=1 t.nextOrder=#t.lines+1 t:_follow()end function f._pushLine(t,u:string)t.
textDirty=true if#t.lines<t.maxLines then table.insert(t.lines,u)local v=#t.lines local w=t.lineLabels[v]if not w then w
=t:_makeLabel()t.lineLabels[v]=w end w.LayoutOrder=t.nextOrder w.Text=s(u)w.Visible=true t.nextOrder+=1 return end table
.move(t.lines,2,#t.lines,1)t.lines[#t.lines]=u local v=t.lineLabels[t.head]v.LayoutOrder=t.nextOrder v.Text=s(u)v.
Visible=true t.nextOrder+=1 t.head=(t.head%#t.lineLabels)+1 end function f._build(t)local u=if t.name then l else 0 t.
main=t.window:Create('Frame',{Size=UDim2.new(1,-20,0,t.height+u+m*2),BorderSizePixel=0,Name=t.name or'Console',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=t.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})t.stroke=t.window:StyleElementBody(t.main)if t.name then t.container=t.window:Create('Frame',{
Size=UDim2.new(1,-m*2,0,16),Position=UDim2.new(0,m,0,m),BackgroundTransparency=1,BorderSizePixel=0,Parent=t.main})t.
title=t.window:Create('TextLabel',{Text=i.t(t.name),Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundTransparency=1
,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=t.container},{TextColor3='ContentColor',
FontFace='Font'})end t.panel=t.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-m),Size
=UDim2.new(1,-m*2,0,t.height),BorderSizePixel=0,ClipsDescendants=true,BackgroundTransparency=1,Parent=t.main},{
BackgroundColor3='StatBackground'})t.window:Create('UICorner',{Parent=t.panel},{CornerRadius='ElementCornerRadius'})t.
panelStroke=t.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=t.panel},{
Color='SurfaceStroke'})t.scroll=t.window:Create('ScrollingFrame',{Size=UDim2.new(1,-n*2,1,-n*2),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,AutomaticCanvasSize=Enum.
AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,Parent=t
.panel})t.scrollLayout=t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,SortOrder=Enum.SortOrder.LayoutOrder,Parent=t
.scroll})t:_watchCanvas()end function f._pin(t)local u=t.scroll if not u or not u.Parent then return end u.
CanvasPosition=Vector2.new(0,u.AbsoluteCanvasSize.Y)end function f._follow(t)if not t.follow then return end t:_pin()
task.defer(function()t:_pin()end)end function f._watchCanvas(t)t.window:ConnectFor(t,t.scrollLayout:
GetPropertyChangedSignal'AbsoluteContentSize',function()if t.follow then t:_pin()end end)end function f.Set(t,u)t:
_setLines(u)end function f.Append(t,u)u=if type(u)=='string'then u else tostring(u)for v in string.gmatch(u..'\n',
'([^\n]*)\n')do t:_pushLine(v)end t:_follow()end function f.Clear(t)table.clear(t.lines)t:_flush()end function f.Copy(t)
:boolean local u=(getgenv and getgenv().setclipboard)or setclipboard if typeof(u)~='function'then return false end
return(pcall(u,t:Get()))end function f.SetHeight(t,u)t.height=math.max(tonumber(u)or j,k)local v=if t.name then l else 0
t.panel.Size=UDim2.new(1,-m*2,0,t.height)t.main.Size=UDim2.new(1,-20,0,t.height+v+m*2)end function f._setShown(t,u,v)
local w=t.window w:_reveal(t.main,{BackgroundTransparency=if u then w.theme.ElementTransparency or 0 else 1},v)w:
_reveal(t.stroke,{Transparency=if u then w.theme.ElementStrokeTransparency else 1},v)w:_reveal(t.panel,{
BackgroundTransparency=if u then 0 else 1},v)w:_reveal(t.panelStroke,{Transparency=if u then 0.9 else 1},v)t.
_textTransparency=if u then 0.15 else 1 for x,y in t.lineLabels do w:_reveal(y,{TextTransparency=t._textTransparency},v)
end if t.title then w:_reveal(t.title,{TextTransparency=if u then 0 else 1},v)end if t.descriptor then w:_reveal(t.
descriptor.titleLabel,{TextTransparency=if u then 0.7 else 1},v)end end function f.Remove(t)if t.descriptor then t.
descriptor:Remove()end if t.tab._forget then t.tab:_forget(t)end t.window:DestroySubtree(t.main)end h(f)return f end)()
end,[43]=function()local b,c,d=a(43)local e return(function(...)local f,g,h,i=d(c.Parent.filesystem),d(c.Parent.path),
'RayfieldColumns',{}i.__index=i export type FileSystemManager={root:string,assets:string,getPath:(self:FileSystemManager
,subpath:string?)->string,getAssetsFolder:(self:FileSystemManager,subfolder:string?)->string,getRootFolder:(self:
FileSystemManager)->string}function i.new(j:string?):FileSystemManager local k=j or h local l=setmetatable({root=k,
assets=k..'/Assets'},i)::any pcall(f.ensureFolder,l.root)pcall(f.ensureFolder,l.assets)return l end function i.getPath(j
,k:string?):string return g.join(j.root,k)end function i.getAssetsFolder(j,k:string?):string if k then local l=g.join(j.
assets,k)pcall(f.ensureFolder,l)return l end return j.assets end function i.getRootFolder(j):string return j.root end
return i end)()end,[60]=function()local b,c,d=a(60)local e return(function(...)local f,g,h=d(c.Parent.variables),d(c.
Parent.path),{}type ConfigWindow={configuration:{fileName:string?,customFolder:string?},name:string}function h.
getConfigPath(i:ConfigWindow,j:unknown?):(string?,string?)local k=f.fileSystemManager:getPath'Configurations'if i.
configuration.customFolder then k=g.join(k,g.sanitizeFolder(i.configuration.customFolder))end if j~=nil then local l=g.
sanitizeFile(j)if l==''then return nil,nil end return k,g.join(k,l..'.rfld')end local l=g.sanitizeFile(i.configuration.
fileName or i.name)if l==''then l=g.sanitizeFile(i.name)end if l==''then l='Configuration'end return k,g.join(k,l..
'.rfld')end function h.getSettingsPath():(string,string)local i=f.fileSystemManager:getPath'Settings'return i,g.join(i,
'rayfield.rfld')end return h end)()end,[53]=function()local b,c,d=a(53)local e return(function(...)local function f<T>(g
:T):T local h=g::any function h.MoveTo(i,j:number)i.tab:_moveElement(i,j)end function h.MoveToTop(i)i.tab:_moveElement(i
,1)end function h.MoveToBottom(i)i.tab:_moveElement(i,#i.tab.elements)end function h.MoveUp(i)local j=table.find(i.tab.
elements,i)if j then i.tab:_moveElement(i,j-1)end end function h.MoveDown(i)local j=table.find(i.tab.elements,i)if j
then i.tab:_moveElement(i,j+1)end end return g end return f end)()end,[54]=function()local b,c,d=a(54)local e return(
function(...)local f={}f.__index=f export type RequestFn=(...any)->any function f.getRequestFn(g:any?):RequestFn?g=g or
getfenv()return g.request or g.http_request or(g.http and g.http.request)or(g.syn and g.syn.request)or(g.fluxus and g.
fluxus.request)end return f end)()end,[66]=function()local b,c,d=a(66)local e return(function(...)local f,g,h,i,j,k=d(c.
Parent.runtime),d(c.Parent.constants),d(c.Parent.log),d(c.Parent.filesystemManager),d(c.Parent.assetResolver),d(c.Parent
.fontManager)type RuntimeState=f.RuntimeState type FileSystemManager=i.FileSystemManager type AssetResolver=j.
AssetResolver type FontManager=k.FontManager export type VariablesState=RuntimeState&{fallbackFont:Font,
fileSystemManager:FileSystemManager,assetResolver:AssetResolver,fontManager:FontManager,setFallbackFont:(font:Enum.Font|
Font)->(),brandFont:(weight:Enum.FontWeight?)->Font}local l=table.clone(f)::VariablesState h.setSecureModeSource(
function()return l.secureMode end)l.fallbackFont=Font.fromEnum(Enum.Font.BuilderSans)l.fileSystemManager=i.new()l.
assetResolver=j.new(true,j.Enum.AssetDownloadUrl.RoProxyDownloadUrl)::AssetResolver l.fontManager=k.new(l.
fileSystemManager:getAssetsFolder'fonts',false,true,j.Enum.AssetDownloadUrl.RoProxyDownloadUrl,{saveToDisk=true,
skipCache=false,fallbackFont=l.fallbackFont})::FontManager function l.setFallbackFont(m:Enum.Font|Font)if typeof(m)==
'EnumItem'then m=Font.fromEnum(m)end if typeof(m)=='Font'then l.fallbackFont=m l.fontManager.defaultOptions.fallbackFont
=m end end function l.brandFont(m:Enum.FontWeight?):Font if l.secureMode then return Font.new(l.fallbackFont.Family,m)
end return Font.new(g.fontAsset,m)end return l end)()end,[50]=function()local b,c,d=a(50)local e return(function(...)
local f,g,h=d(c.Parent.variables),d(c.Parent.log),{}export type LocaleToken={[any]:string}export type Translator=(source
:string,localeId:string)->string?export type TranslationTables={[string]:{[string]:string}}h.strings={}::
TranslationTables h.current='en'h.translator=nil::Translator?local i={}local function j(k:string):string return string.
match(k,'^(%a+)')or k end function h.t(k:unknown):unknown if type(k)~='string'or k==''then return k end return{[i]=k}end
function h.isToken(k:unknown):boolean return type(k)=='table'and type((k::{[any]:unknown})[i])=='string'end function h.
sourceOf(k:LocaleToken):string return k[i]end function h.resolve(k:unknown):any if type(k)~='string'then return k end if
h.translator then local l,m=pcall(h.translator,k,h.current)if l and type(m)=='string'and m~=''then return m end end
local l=h.strings[h.current]if l and l[k]then return l[k]end local m=h.strings[j(h.current)]if m and m[k]then return m[k
]end return k end function h.register(k:TranslationTables?)if type(k)~='table'then return end for l,m in k do if type(l)
=='string'and type(m)=='table'then l=string.lower(l)local n=h.strings[l]if not n then n={}h.strings[l]=n end for o,p in
m do if type(o)=='string'and type(p)=='string'then n[o]=p else g.warn(`Rayfield: skipping a '{l}' translation, entries must be string to string.`
)end end end end end function h.setActive(k:string?):string h.current=if type(k)=='string'and k~=''then string.lower(k)
else'en'return h.current end function h.detect():string local k=f.localizationService.RobloxLocaleId if type(k)==
'string'and k~=''then return string.lower(k)end return'en'end return h end)()end,[41]=function()local b,c,d=a(41)local e
return(function(...)local f={}function f.itemFromValue(g,h)local i,j=pcall(function()return g:FromValue(h)end)if i and j
then return j end local k,l=pcall(function()return g:GetEnumItems()end)if not k then return nil end for m,n in l do if n
.Value==h then return n end end return nil end return f end)()end,[5]=function()local b,c,d=a(5)local e return(function(
...)local f=c.Parent.Parent.utility local g,h,i,j,k,l,m=d(f.variables),d(f.filesystem),d(f.constants),d(f.locale),d(f.
HapticEngine),{},5 function l.buildCollapsedFace(n)local o=n.showIconOnly n.collapsedIcon=n:Create('ImageLabel',{Name=
'CollapsedIcon',AnchorPoint=if o then Vector2.new(0.5,0.5)else Vector2.new(0,0.5),Position=if o then UDim2.fromScale(0.5
,0.5)else UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Image=n.showIcon,ZIndex=i.zIndex.
restoreContent,ImageTransparency=1,Parent=n.main},{ImageColor3='TitlingColor'})n:Create('UICorner',{Parent=n.
collapsedIcon},{CornerRadius='PillCornerRadius'})local p=n:Create('Frame',{Name='CollapsedText',Visible=not o,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,0,32),BackgroundTransparency=1,ZIndex
=i.zIndex.restoreContent,Parent=n.main})n:Create('UIListLayout',{Padding=UDim.new(0,1),VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=p})n.collapsedTitle=n:Create('TextLabel',{Name=
'Title',Text=n.showName,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=g.brandFont(Enum.FontWeight.Medium),
RichText=true,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=i.zIndex.
restoreContent,TextTransparency=1,Parent=p},{TextColor3='TitlingColor'})n.collapsedSubtitle=n:Create('TextLabel',{Name=
'Subtitle',Text=j.t'Tap to show',Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,FontFace=g.brandFont(Enum.FontWeight.
Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=i.zIndex.restoreContent,
TextTransparency=1,Parent=p},{TextColor3='TitlingColor'})n.collapsedInteract=n:Create('TextButton',{Name=
'CollapsedInteract',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,Visible=false,ZIndex=i
.zIndex.restoreInteract,Parent=n.main})l.bindCollapsedDrag(n)end function l.bindCollapsedDrag(n)local o,p,q,r,s=g.
userInputService,false,false,Vector2.zero,Vector2.zero local function t()if n.screenGui and n.screenGui.IgnoreGuiInset
then return g.guiService:GetGuiInset()end return Vector2.zero end n:Connect(n.collapsedInteract.InputBegan,function(u,v)
if v or not n.hidden or n.animating then return end local w=u.UserInputType.Name if w~='MouseButton1'and w~='Touch'then
return end p,q=true,false s=o:GetMouseLocation()r=n.main.AbsolutePosition+n.main.AbsoluteSize*n.main.AnchorPoint-s end)n
:Connect(o.InputEnded,function(u)local v=u.UserInputType.Name if v~='MouseButton1'and v~='Touch'then return end if not p
then return end p=false if q then n._collapsedPosition=n.main.Position return end k.click()n:ToggleHide()end)n:Connect(o
.WindowFocusReleased,function()p=false end)n:Connect(g.runService.RenderStepped,function()if not p then return end if
not n.hidden or n.animating then p=false return end local u=o:GetMouseLocation()if not q and(u-s).Magnitude<m then
return end q=true local v=u+r+t()n.main.Position=UDim2.fromOffset(v.X,v.Y)end)end function l.isNewUser()local n=g.
localPlayer if not n then return false end if typeof(h.isfile)~='function'or typeof(h.writefile)~='function'then return
true end local o,p,q=g.fileSystemManager:getPath'lastuser.txt',tostring(n.UserId),true pcall(function()if h.isfile(o)
then q=h.readfile(o)~=p end end)pcall(function()h.writefile(o,p)end)return q end function l.setCollapsedShown(n,o,p)
local q={[n.collapsedIcon]={ImageTransparency=if o then 0 else 1}}if not n.showIconOnly then q[n.collapsedTitle]={
TextTransparency=if o then 0 else 1}q[n.collapsedSubtitle]={TextTransparency=if o then 0.5 else 1}end for r,s in q do if
p then g.tweenService:Create(r,p,s):Play()else for t,u in s do r[t]=u end end end end return l end)()end,[12]=function()
local b,c,d=a(12)local e return(function(...)local f={}f.__index=f f.__type='Dropdown'local g=c.Parent.Parent.utility
local h,i,j,k,l,m,n,o=d(g.variables),d(g.functions),d(g.image),d(g.constants),d(g.locale),d(g.HapticEngine),d(g.
windowSizing),d(g.lockable)local p,q,r,s,t,u,v,w,x,y,z,A,B,C,D=k.icons.chevron,k.icons.check,k.icons.dot,k.icons.search,
UDim.new(0,12),UDim.new(0,7),30,38,38,5,2,41,6,7,6 local E,F,G,H,I,J,K=C+D,4,22,TweenInfo.new(0.2,Enum.EasingStyle.Quint
,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.4,TweenInfo.new(0.35,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)local function L(M)local N,O={},{}for P,Q in M do if typeof(Q)==
'string'and not N[Q]then N[Q]=true table.insert(O,Q)end end return O end local function M(N,O)if N==nil then return{}end
if typeof(N)=='string'then return{N}end if typeof(N)=='table'then local P=L(N)if not O and#P>1 then return{P[1]}end
return P end return{}end local function N(O,P)local Q={}for R,S in O do if table.find(P,S)then table.insert(Q,S)end end
return Q end local function O(P,Q)if#P~=#Q then return false end for R,S in P do if not table.find(Q,S)then return false
end end return true end function f.new(P,Q)Q=if typeof(Q)=='table'then Q else{}local R,S=Q.options or Q.Options or{},Q.
multiSelect or Q.MultiSelect or Q.MultipleOptions or false local T=setmetatable({tab=assert(P,
'Missing argument #1 (Tab expected)'),window=P.window,name=Q.name or Q.Name or'Dropdown',icon=Q.icon or Q.Icon,
description=Q.description or Q.Description,forgetState=Q.forgetState or Q.ForgetState or P.forgetState,flag=Q.flag or Q.
Flag or(not(Q.forgetState or Q.ForgetState or P.forgetState)and i.deriveFlagFromName(Q.name or Q.Name or'Dropdown')or
nil),callback=Q.callback or Q.Callback or function()end,options=L(R),multiSelect=S,placeholderText=l.resolve(Q.
placeholder or Q.Placeholder or'None'),value=M(Q.value or Q.Value or Q.currentOption or Q.CurrentOption,S),_isOpen=false
,_optionFrames={}},f)T._desiredValue=T.value T.value=N(T.value,T.options)T.window:_registerControl(T)T.main=T.window:
Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=T.name,BackgroundTransparency=1,Parent=T.tab.tabPage})
T.top=T.window:Create('Frame',{Size=UDim2.new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,BackgroundColor3
=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ZIndex=1,Parent=T.main},{BackgroundTransparency=
'ElementTransparency'})T.stroke=T.window:StyleElementBody(T.top)T.hoverOverlay=T.window:CreateHoverOverlay(T.top)T.
flashTarget=T.top T.container=T.window:Create('Frame',{BorderSizePixel=0,Parent=T.top,Size=UDim2.new(0,170,0,16),
Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,ZIndex=5})T.containerLayout=T.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=T.container})if T.icon then T.
iconLabel=T.window:Create('ImageLabel',{Image=T.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=T.container},{ImageColor3='ContentColor'})end T.title=T.
window:Create('TextLabel',{Text=l.t(T.name),Size=UDim2.fromOffset(150,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=T.container},{TextColor3='ContentColor',FontFace='Font'})T.selectedLabel=T.window:
Create('TextLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-41,0.5,0),Size=UDim2.new(0.5,-41,0,15),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,TextXAlignment=Enum.TextXAlignment.Right,TextTruncate=Enum.
TextTruncate.AtEnd,TextTransparency=1,ZIndex=5,Parent=T.top},{TextColor3='ContentColor',FontFace='Font'})T.window:
Create('UISizeConstraint',{MaxSize=Vector2.new(168,15),Parent=T.selectedLabel})T.chevron=T.window:Create('ImageLabel',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,0.5,0),Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,Image='rbxassetid://'..tostring(p),Rotation=180,ImageTransparency=1,ZIndex=5,Parent=T.top},{
ImageColor3='ContentColor'})T.interact=T.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,41),
Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=10,AutoButtonColor=false,Parent=T.main
})T.panel=T.window:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),Size=UDim2.new(1,0,1,-(A+B))
,BorderSizePixel=0,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=1,BackgroundTransparency=1,
Parent=T.main})T.panelStroke=T.window:StyleElementPanel(T.panel)T.window:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=T.panel})T.window:Create('UIPadding',{PaddingTop=
UDim.new(0,C),PaddingBottom=UDim.new(0,D),Parent=T.panel})T:_buildSearch()T:_buildActions()T.list=T.window:Create(
'ScrollingFrame',{Active=true,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),ScrollBarImageColor3=Color3.fromRGB(240,240,240),
ScrollBarThickness=3,ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=3,ZIndex=1,
Parent=T.panel})T.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=T.list})T.window:ConnectFor(T,T.list:
GetPropertyChangedSignal'CanvasPosition',function()T:_syncScrollHint()end)T.window:ConnectFor(T,T.list:
GetPropertyChangedSignal'AbsoluteCanvasSize',function()T:_syncScrollHint()end)T.window:ConnectFor(T,T.list:
GetPropertyChangedSignal'AbsoluteWindowSize',function()T:_syncScrollHint()end)T.listLayout=T.window:Create(
'UIListLayout',{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.
Center,Parent=T.list})T.window:Create('UIPadding',{PaddingTop=UDim.new(0,z),PaddingBottom=UDim.new(0,z),Parent=T.list})T
.emptyLabel=T.window:Create('TextLabel',{Name='Empty',Size=UDim2.new(1,-12,0,x),BackgroundTransparency=1,Text=l.t
'No matches',TextSize=14,TextTransparency=0.55,Visible=false,LayoutOrder=1,Parent=T.list},{TextColor3='ContentColor',
FontFace='Font'})local function U(V)return table.find(T.value,V)~=nil end local function V(W,X)local Y=U(W.name)local Z,
_,aa,ab=if T._isOpen then(Y and 0.9 or 0.95)else 1,if T._isOpen then(Y and 0 or 0.3)else 1,if T._isOpen then(Y and 0 or
0.7)else 1,if T._isOpen then(Y and 0.85 or 0.93)else 1 j.assign(W.checkIcon,'Image',if Y then q else r)if X then local
ac=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)h.tweenService:Create(W.frame,ac,{
BackgroundTransparency=Z}):Play()h.tweenService:Create(W.title,ac,{TextTransparency=_}):Play()h.tweenService:Create(W.
checkIcon,ac,{ImageTransparency=aa}):Play()h.tweenService:Create(W.stroke,ac,{Transparency=ab}):Play()else W.frame.
BackgroundTransparency=Z W.title.TextTransparency=_ W.checkIcon.ImageTransparency=aa W.stroke.Transparency=ab end end
local function aa()if T.multiSelect then local ab=#T.value if ab==0 then T.selectedLabel.Text=T.placeholderText elseif
ab==1 then T.selectedLabel.Text=T.value[1]else T.selectedLabel.Text=l.resolve'Various'end else T.selectedLabel.Text=T.
value[1]or T.placeholderText end end T._renderOptionState=V T._updateSelectedLabel=aa local function ab(ac)local W=T.
window:Create('Frame',{Size=UDim2.new(1,-12,0,x),BorderSizePixel=0,LayoutOrder=#T._optionFrames+1,BackgroundTransparency
=1,Parent=T.list},{BackgroundColor3='DropdownHighlight'})local X,Y,Z,_=T.window:Create('UICorner',{CornerRadius=u,Parent
=W}),T.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=W}),T.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=50,Parent=W}),T.
window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,0.5,0),Size=UDim2.fromOffset(170,16),
BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,Parent=W})T.window:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Parent=_})local ad,ae=T.window:Create('ImageLabel',{Image='rbxassetid://'..tostring(q),Size=UDim2.
fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=_},{ImageColor3=
'ContentColor'}),T.window:Create('TextLabel',{Text=ac,Size=UDim2.fromOffset(170,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=_},{TextColor3='ContentColor',FontFace='Font'})local af={name=ac,frame=W,interact=Z,
title=ae,checkIcon=ad,container=_,stroke=Y,corner=X,connections={}}table.insert(af.connections,T.window:ConnectFor(T,W.
MouseEnter,function()if not T._isOpen or not T.window:_interactive()then return end if U(af.name)then return end h.
tweenService:Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.9}):
Play()h.tweenService:Create(ae,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.15
}):Play()end))table.insert(af.connections,T.window:ConnectFor(T,W.MouseLeave,function()if not T._isOpen then return end
if U(af.name)then return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{BackgroundTransparency=0.95}):Play()h.tweenService:Create(ae,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{TextTransparency=0.3}):Play()end))table.insert(af.connections,T.window:ConnectFor(T,Z.
MouseButton1Click,function()if not T._isOpen then return end m.click()local ag=U(af.name)if not T.multiSelect then if ag
then T:_close()return end table.clear(T.value)table.insert(T.value,af.name)else if ag then local ah=table.find(T.value,
af.name)if ah then table.remove(T.value,ah)end else table.insert(T.value,af.name)end end T._desiredValue=table.clone(T.
value)for ah,ai in T._optionFrames do V(ai,true)end aa()T.window:_runGuarded(T,T.callback,T:_callbackValue())T.window:
_persist(T)if not T.multiSelect then task.wait(0.1)T:_close()end end))return af end T._buildOption=ab for ac,ad in T.
options do local ae=ab(ad)table.insert(T._optionFrames,ae)end aa()T:_updateCorners()T.window:ConnectFor(T,T.interact.
MouseButton1Click,function()m.click()if T._isOpen then T:_close()else T:_open()end end)T.window:ConnectFor(T,T.main.
MouseEnter,function()if T._isOpen or not T.window:_interactive()then return end h.tweenService:Create(T.title,I,{
TextColor3=T.window.theme.ElementTextHoverColor}):Play()h.tweenService:Create(T.hoverOverlay,I,{BackgroundTransparency=
0.97}):Play()h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.ElementStrokeHoverTransparency,Color=T.window
.theme.ElementStrokeHover}):Play()end)T.window:ConnectFor(T,T.main.MouseLeave,function()h.tweenService:Create(T.title,I,
{TextColor3=T.window.theme.ContentColor}):Play()h.tweenService:Create(T.hoverOverlay,I,{BackgroundTransparency=1}):Play(
)h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.ElementStrokeTransparency,Color=T.window.theme.
ElementStroke}):Play()end)if T.description then T.descriptor=d(c.Parent.descriptor).new(T.tab,{description=T.description
})end return T end function f._callbackValue(aa)if aa.multiSelect then return table.clone(aa.value)end return aa.value[1
]end function f._buildSearch(aa)aa._searchOpen=false aa.searchbar=aa.window:Create('Frame',{Name='Search',Size=UDim2.
new(1,-12,0,v),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,LayoutOrder=1,
ClipsDescendants=false,ZIndex=1,Parent=aa.panel})aa.window:Create('UICorner',{CornerRadius=UDim.new(0,12),Parent=aa.
searchbar})aa.searchStroke=aa.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=aa.
searchbar})aa.searchShadow=aa.window:CreateGlow(aa.searchbar,Color3.fromRGB(255,255,255),20,1)aa.searchToggle=aa.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=51,Parent=aa.
searchbar})aa.searchInput=aa.window:Create('TextBox',{Text='',PlaceholderText=l.t'Search...',Size=UDim2.new(1,-58,0,16),
Position=UDim2.new(0,44,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,ClearTextOnFocus=false,TextEditable=false,Interactable=false,ZIndex=52,TextTransparency=1,Parent=aa.
searchbar},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})aa.searchIcon=aa.window:
Create('ImageButton',{Image='rbxassetid://'..tostring(s),Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,24,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,ZIndex=53,
ImageTransparency=1,Parent=aa.searchbar},{ImageColor3='ContentColor'})aa.window:ConnectFor(aa,aa.searchToggle.
MouseButton1Click,function()if not aa._searchOpen then aa:_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchIcon.
MouseButton1Click,function()if aa._searchOpen then aa:_collapseSearch()else aa:_expandSearch()end end)aa.window:
ConnectFor(aa,aa.searchInput:GetPropertyChangedSignal'Text',function()aa:_applyFilter(aa.searchInput.Text)end)aa.window:
ConnectFor(aa,aa.searchInput.FocusLost,function()if aa.searchInput.Text==''then aa:_collapseSearch()end end)end function
f._expandSearch(aa)if aa._searchOpen then return end aa._searchOpen=true aa.searchInput.TextEditable=true aa.searchInput
.Interactable=true h.tweenService:Create(aa.searchbar,K,{Size=UDim2.new(1,-12,0,w),BackgroundTransparency=0.92}):Play()h
.tweenService:Create(aa.searchStroke,K,{Transparency=0.86}):Play()h.tweenService:Create(aa.searchShadow,K,{Transparency=
0.92}):Play()h.tweenService:Create(aa.searchInput,K,{TextTransparency=0.3}):Play()aa:_resizeToOptions()aa.searchInput:
CaptureFocus()end function f._collapseSearch(aa)if not aa._searchOpen then return end aa._searchOpen=false aa.
searchInput.TextEditable=false aa.searchInput.Interactable=false aa.searchInput:ReleaseFocus()aa.searchInput.Text=''h.
tweenService:Create(aa.searchbar,K,{Size=UDim2.new(1,-12,0,v),BackgroundTransparency=1}):Play()h.tweenService:Create(aa.
searchStroke,K,{Transparency=1}):Play()h.tweenService:Create(aa.searchShadow,K,{Transparency=1}):Play()h.tweenService:
Create(aa.searchInput,K,{TextTransparency=1}):Play()aa:_resizeToOptions()end function f._applyFilter(aa,ab)ab=string.
lower(ab or'')local ac=0 for ad,ae in aa._optionFrames do local af=ab==''or string.find(string.lower(ae.name),ab,1,true)
~=nil ae.frame.Visible=af if af then ac+=1 end end aa.emptyLabel.Visible=ac==0 and ab~=''aa:_updateCorners()aa:
_resizeToOptions()aa:_syncScrollHint()end function f._syncScrollHint(aa)local ab,ac,ad=aa.list.AbsoluteCanvasSize,aa.
list.AbsoluteWindowSize,aa.list.CanvasPosition if not ab or not ac or not ad then return end local ae=aa._isOpen and ac.
Y>0 and ab.Y-(ad.Y+ac.Y)>1 h.tweenService:Create(aa.list,H,{ScrollBarImageTransparency=if ae then J else 1}):Play()end
function f._visibleOptions(aa):{string}local ab={}for ac,ad in aa._optionFrames do if ad.frame.Visible then table.
insert(ab,ad.name)end end return ab end function f._buildActions(aa)if not aa.multiSelect then return end aa.actions=aa.
window:Create('Frame',{Name='Actions',Size=UDim2.new(1,-12,0,G),BackgroundTransparency=1,LayoutOrder=2,Parent=aa.panel})
aa.window:Create('UIListLayout',{Padding=UDim.new(0,12),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=aa.actions})local function ab(ac:string,ad:
number,ae:()->())local af=aa.window:Create('TextButton',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,G),
BackgroundTransparency=1,Text=l.t(ac),TextSize=13,TextTransparency=0.45,LayoutOrder=ad,Parent=aa.actions},{TextColor3=
'ContentColor',FontFace='Font'})aa.window:ConnectFor(aa,af.MouseEnter,function()h.tweenService:Create(af,H,{
TextTransparency=0.15}):Play()end)aa.window:ConnectFor(aa,af.MouseLeave,function()h.tweenService:Create(af,H,{
TextTransparency=0.45}):Play()end)aa.window:ConnectFor(aa,af.MouseButton1Click,function()ae()aa:_afterBulkChange()end)
return af end ab('Select all',1,function()local ac=aa:_visibleOptions()for ad,ae in ac do if not table.find(aa.value,ae)
then table.insert(aa.value,ae)end end end)ab('Clear',2,function()local ac=aa:_visibleOptions()for ad=#aa.value,1,-1 do
if table.find(ac,aa.value[ad])then table.remove(aa.value,ad)end end end)end function f._afterBulkChange(aa)aa.
_desiredValue=table.clone(aa.value)for ab,ac in aa._optionFrames do aa._renderOptionState(ac,true)end aa:
_updateSelectedLabel()aa:_updateCorners()aa.window:_runGuarded(aa,aa.callback,aa:_callbackValue())aa.window:_persist(aa)
m.click()end function f._resizeToOptions(aa)if not aa._isOpen then return end h.tweenService:Create(aa.main,K,{Size=
UDim2.new(1,-20,0,aa:_openHeight())}):Play()end function f._updateCorners(aa)local ab={}for ac,ad in aa._optionFrames do
if ad.frame.Visible then table.insert(ab,ad)end end for ac,ad in ab do local ae,af=if ac==1 then t else u,if ac==#ab
then t else u ad.corner.TopLeftRadius=ae ad.corner.TopRightRadius=ae ad.corner.BottomLeftRadius=af ad.corner.
BottomRightRadius=af end end local function aa(ab:number):number return ab*x+math.max(0,ab-1)*y+z*2 end local function
ab(ac:number):number return math.max(math.floor((ac-z*2+y)/(x+y)),1)end function f._pageHeight(ac):number local ad=ac.
window.size return n.pageHeight(ad and ad.Y.Offset,ac.window.layout.mode)end function f._openHeight(ac)local ad=0 for ae
,af in ac._optionFrames do if af.frame.Visible then ad+=1 end end local ae=if ac._searchOpen then w else v local af,ag=A
+B+E+ae+y+(if ac.actions then G+y else 0),ac:_pageHeight()local ah=math.min(math.max(ad,1),F,ab(ag-af))return math.min(
af+aa(ah),ag)end function f._open(ac)if ac._isOpen then return end ac._isOpen=true if ac._outsideClickConn then ac.
window:Disconnect(ac._outsideClickConn)end ac._outsideClickConn=ac.window:Connect(h.userInputService.InputBegan,function
(ad)if ad.UserInputType~=Enum.UserInputType.MouseButton1 and ad.UserInputType~=Enum.UserInputType.Touch then return end
local ae,af,ag=ad.Position,ac.main.AbsolutePosition,ac.main.AbsoluteSize if ae.X<af.X or ae.X>af.X+ag.X or ae.Y<af.Y or
ae.Y>af.Y+ag.Y then ac:_close()end end)h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum
.EasingDirection.Out),{Size=UDim2.new(1,-20,0,ac:_openHeight())}):Play()h.tweenService:Create(ac.chevron,TweenInfo.new(
0.7,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Rotation=0}):Play()h.tweenService:Create(ac.panel,TweenInfo.
new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=ac.window.theme.ElementTransparency or
0}):Play()h.tweenService:Create(ac.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=ac.window.theme.ElementStrokeTransparency}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(0.4,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.5}):Play()for ad,ae in ac._optionFrames do ac.
_renderOptionState(ae,true)end ac:_syncScrollHint()ac:_bringIntoView()end function f._bringIntoView(ac)local ad=ac.tab
local ae=ad and(ad.scrollPage or ad.tabPage)if not ae or not ae:IsA'ScrollingFrame'then return end local af,ag,ah,ai=ae.
AbsoluteWindowSize,ae.CanvasPosition,ae.AbsolutePosition,ac.main.AbsolutePosition if not af or not ag or not ah or not
ai or af.Y<=0 then return end local P=ai.Y-ah.Y+ag.Y local Q=P+ac:_openHeight()local R=Q-(ag.Y+af.Y)if R<=0 then return
end local S=math.min(ag.Y+R+8,P)h.tweenService:Create(ae,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{CanvasPosition=Vector2.new(ag.X,S)}):Play()end function f._close(ac)if not ac._isOpen then return end ac._isOpen=
false if ac._outsideClickConn then ac.window:Disconnect(ac._outsideClickConn)ac._outsideClickConn=nil end ac:
_collapseSearch()ac:_syncScrollHint()h.tweenService:Create(ac.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Rotation=180}):Play()h.tweenService:Create(ac.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{BackgroundTransparency=1}):Play()h.tweenService:Create(ac.panelStroke,TweenInfo.new(0.4,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(
0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=1}):Play()for ad,ae in ac._optionFrames do ac.
_renderOptionState(ae,true)end h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()end function f._destroyOption(ac,ad)if ad.connections then for
ae,af in ad.connections do local ag=table.find(ac.connections,af)if ag then table.remove(ac.connections,ag)end ac.window
:Disconnect(af)end ad.connections=nil end ac.window:DestroySubtree(ad.frame)end function f._deriveSelection(ac)local ad=
ac.value ac.value=N(ac._desiredValue or ac.value,ac.options)return not O(ac.value,ad)end function f._reindexOptions(ac)
for ad,ae in ac._optionFrames do ae.frame.LayoutOrder=ad end end function f._rebindOption(ac,ad,ae,af)ad.name=ae ad.
title.Text=ae ad.frame.LayoutOrder=af end function f._destroyOptionsFrom(ac,ad)local ae,af={},{}for ag=#ac._optionFrames
,ad,-1 do local ah=ac._optionFrames[ag]table.insert(ae,ah.frame)if ah.connections then table.move(ah.connections,1,#ah.
connections,#af+1,af)ah.connections=nil end ac._optionFrames[ag]=nil end ac.window:DisconnectMany(ac,af)ac.window:
DestroySubtrees(ae)end function f.Refresh(ac,ad)ac.options=L(ad or{})local ae,af,ag=ac:_deriveSelection(),#ac.
_optionFrames,#ac.options for ah=1,math.min(af,ag)do ac:_rebindOption(ac._optionFrames[ah],ac.options[ah],ah)end for ah=
af+1,ag do local ai=ac._buildOption(ac.options[ah])ai.frame.LayoutOrder=ah table.insert(ac._optionFrames,ai)end if ag<af
then ac:_destroyOptionsFrom(ag+1)end for ah,ai in ac._optionFrames do ac._renderOptionState(ai,false)end ac.
_updateSelectedLabel()ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')if ae then ac.window:
_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end function f.Add(ac,ad)if typeof(ad)~=
'string'or ad==''then return end if table.find(ac.options,ad)then return end table.insert(ac.options,ad)local ae=ac.
_buildOption(ad)table.insert(ac._optionFrames,ae)local af=ac:_deriveSelection()if ac._isOpen then ac._renderOptionState(
ae,true)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')if af then ac._updateSelectedLabel()ac.
window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end function f.Remove(ac,ad)local ae=
table.find(ac.options,ad)if not ae then return end table.remove(ac.options,ae)for af,ag in ac._optionFrames do if ag.
name==ad then ac:_destroyOption(ag)table.remove(ac._optionFrames,af)ac:_reindexOptions()break end end if ac.
_desiredValue then local af=table.find(ac._desiredValue,ad)if af then table.remove(ac._desiredValue,af)end end local af=
table.find(ac.value,ad)if af then table.remove(ac.value,af)ac._updateSelectedLabel()ac.window:_runGuarded(ac,ac.callback
,ac:_callbackValue())ac.window:_persist(ac)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')end
function f.Set(ac,ad,ae)local af=M(ad,ac.multiSelect)ac._desiredValue=af ac.value=N(af,ac.options)for ag,ah in ac.
_optionFrames do ac._renderOptionState(ah,true)end ac._updateSelectedLabel()if not ae then ac.window:_runGuarded(ac,ac.
callback,ac:_callbackValue())ac.window:_persist(ac)end end function f._setShown(ac,ad,ae)local af=ac.window af:_reveal(
ac.stroke,{Transparency=if ad then af.theme.ElementStrokeTransparency else 1},ae)af:_reveal(ac.title,{TextTransparency=
if ad then 0 else 1},ae)af:_reveal(ac.top,{BackgroundTransparency=if ad then(af.theme.ElementTransparency or 0)else 1},
ae)if ac.iconLabel then af:_reveal(ac.iconLabel,{ImageTransparency=if ad then 0 else 1},ae)end if ac.descriptor then af:
_reveal(ac.descriptor.titleLabel,{TextTransparency=if ad then 0.7 else 1},ae)end af:_reveal(ac.selectedLabel,{
TextTransparency=if ad then 0.5 else 1},ae)af:_reveal(ac.chevron,{ImageTransparency=if ad then 0.5 else 1},ae)if not ad
and ac._isOpen then ac:_close()end end function f.MoveTo(ac,ad)ac.tab:_moveElement(ac,ad)end function f.MoveToTop(ac)ac.
tab:_moveElement(ac,1)end function f.MoveToBottom(ac)ac.tab:_moveElement(ac,#ac.tab.elements)end function f.MoveUp(ac)
local ad=table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad-1)end end function f.MoveDown(ac)local ad=
table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad+1)end end o(f)return f end)()end,[3]=function()local
aa,ab,ac=a(3)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Action'local af=ab.Parent.Parent.utility
local ag,ah,ai=ac(af.variables),ac(af.log),ac(af.HapticEngine)function ae.new(b,c)c=if typeof(c)=='table'then c else{}
local d=setmetatable({window=assert(b,'Missing argument #1 (Window expected)'),name=c.name or c.Name or'Action',icon=
assert(c.icon or c.Icon,'Missing argument (Icon expected)'),callback=assert(c.callback or c.Callback,
'Missing argument (Function expected)'),linkedTab=c.linkedTab or c.LinkedTab},ae)d.action=d.window:Create('Frame',{Name=
d.name,BorderSizePixel=0,LayoutOrder=-(c.order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Parent=d.
window.actionContainer})d.iconLabel=d.window:Create('ImageLabel',{Image=d.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,
ImageTransparency=1,Parent=d.action},{ImageColor3='ActionColor'})d.interact=d.window:Create('TextButton',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=
Vector2.new(0.5,0.5),TextTransparency=1,Parent=d.action})local function e()if not d.window:_settled()then return end if
d.linkedTab and d.window.selectedTab==d.linkedTab then return end if d.isLit and d:isLit()then return end ag.
tweenService:Create(d.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=
0.6}):Play()end d.window:Connect(d.interact.MouseButton1Click,function()ai.click()task.spawn(function()local f,g=pcall(d
.callback)if not f then ah.warn(`Rayfield encountered an error, with the callback for a {d.__type} component named '{d.
name}':`)ah.print(g)end e()end)end)d.window:Connect(d.interact.MouseEnter,function()if not d.window:_interactive()then
return end ag.tweenService:Create(d.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
ImageTransparency=0.2}):Play()end)d.window:Connect(d.interact.MouseLeave,e)return d end return ae end)()end,[9]=function
()local aa,ab,ac=a(9)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Descriptor'local af=ac(ab.Parent.
Parent.utility.locale)function ae.new(ag,ah)ah=if typeof(ah)=='table'then ah else{}local ai=setmetatable({tab=assert(ag,
'Missing argument #1 (Tab expected)'),window=ag.window,description=ah.description or ah.Description or''},ae)ai.main=ai.
window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.new(1,-30,0,0),Parent=ai.
tab.tabPage})ai.window:Create('UIListLayout',{SortOrder=Enum.SortOrder.LayoutOrder,Parent=ai.main})ai.titleLabel=ai.
window:Create('TextLabel',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,RichText=true,Size=UDim2.new(1,-
90,0,0),Text=af.t(ai.description),TextSize=12,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=
1,Parent=ai.main},{TextColor3='ContentColor',FontFace='Font'})ai.window:Create('Frame',{BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,Size=UDim2.fromOffset(0,15),Parent=ai.main})return ai end function ae.Remove(ag)if ag.
main then ag.window:DestroySubtree(ag.main)ag.main=nil end end return ae end)()end,[63]=function()local aa,ab,ac=a(63)
local ad return(function(...)local ae=ac(ab.Parent.services)export type RuntimeState={secureMode:boolean,coreGui:CoreGui
,workspace:Workspace,runService:RunService,userInputService:UserInputService,guiService:GuiService,localPlayer:Player?,
tweenService:TweenService,httpService:HttpService,textService:TextService,replicatedStorage:ReplicatedStorage,
localizationService:LocalizationService,guiContainer:Instance}local af={}::RuntimeState af.secureMode=(function()if
typeof(getgenv)~='function'then return false end local ag,ah=pcall(function()return getgenv().RAYFIELD_SECURE end)return
ag and ah==true end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.workspace=ae.getService'Workspace'::Workspace af.
runService=ae.getService'RunService'::RunService af.userInputService=ae.getService'UserInputService'::UserInputService
af.guiService=ae.getService'GuiService'::GuiService af.localPlayer=(ae.getService'Players'::Players).LocalPlayer af.
tweenService=ae.getService'TweenService'::TweenService af.httpService=ae.getService'HttpService'::HttpService af.
textService=ae.getService'TextService'::TextService af.replicatedStorage=ae.getService'ReplicatedStorage'::
ReplicatedStorage af.localizationService=ae.getService'LocalizationService'::LocalizationService af.guiContainer=(
function():Instance if af.runService:IsStudio()then local ag=af.localPlayer if ag then return ag.PlayerGui end return af
.coreGui end if typeof(gethui)=='function'then local ag,ah=pcall(gethui)if ag and ah then return ah end end return af.
coreGui end)()return af end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae,af=ac(ab.
Parent.layouts),{}export type Profile={defaultSize:Vector2,minSize:Vector2,maxOccupancyX:number,maxOccupancyY:number?,
marginFloorX:number,marginFloorY:number,topbarClearance:number?,maxAspectRatio:number,minAspectRatio:number?,
widthCompensation:number?,chromeHeight:number}local ag,ah=200,{top={defaultSize=Vector2.new(760,520),minSize=Vector2.
new(320,285),maxOccupancyX=0.9,topbarClearance=36,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.6,widthCompensation=0
,chromeHeight=ae.top.chromeHeight}::Profile,sidebar={defaultSize=Vector2.new(900,540),minSize=Vector2.new(560,350),
maxOccupancyX=0.92,maxOccupancyY=0.8,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.6,minAspectRatio=1.2,chromeHeight=
ae.sidebar.chromeHeight}::Profile}function af.profile(ai:ae.Mode?):Profile if ai=='sidebar'then return ah.sidebar end
return ah.top end function af.pageHeight(ai:number?,b:ae.Mode?):number local c=af.profile(b)local d=if ai and ai>0 then
ai else c.minSize.Y return math.max(d-c.chromeHeight,0)end local function ai(b:Profile,c:number):number local d=c-b.
marginFloorY if b.topbarClearance then d=math.min(d,c-b.topbarClearance*2)end if b.maxOccupancyY then d=math.min(d,c*b.
maxOccupancyY)end return d end local function b(c:number,d:number,e:number):number return math.clamp((d-c)/(d-e),0,1)end
local function c(d:Profile,e:number,f:number):UDim2 local g=math.floor(math.min(math.clamp(f,d.minSize.Y,d.defaultSize.Y
),f))local h=b(g,d.defaultSize.Y,d.minSize.Y)local i=math.max(d.defaultSize.X+(d.widthCompensation::number)*h,d.minSize.
X)return UDim2.fromOffset(math.floor(math.min(i,e,g*d.maxAspectRatio)),g)end local function d(e:Profile,f:number,g:
number):UDim2 local h,i=math.min(math.clamp(f,e.minSize.X,e.defaultSize.X),f),math.min(math.clamp(g,e.minSize.Y,e.
defaultSize.Y),g)i=math.floor(math.min(i,h/(e.minAspectRatio::number)))h=math.floor(math.min(h,i*e.maxAspectRatio))
return UDim2.fromOffset(h,i)end function af.fit(e:Vector2?,f:ae.Mode?):UDim2 local g=af.profile(f)if not e or e.X<ag or
e.Y<ag then return UDim2.fromOffset(g.defaultSize.X,g.defaultSize.Y)end local h,i=math.min(e.X*g.maxOccupancyX,e.X-g.
marginFloorX),ai(g,e.Y)if g.minAspectRatio then return d(g,h,i)end return c(g,h,i)end return af end)()end,[52]=function(
)local aa,ab,ac=a(52)local ad return(function(...)local ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean
local function ag():boolean return ae.secureMode end local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.
setSecureModeSource(b:SuppressPredicate?)ah=if type(b)=='function'then b else ag end function af.setSuppressPredicate(b:
SuppressPredicate?)ai=if type(b)=='function'then b else nil end local function b():boolean if ai and ai()then return
true end return ah()end function af.warn(...)if b()then return end warn(...)end function af.print(...)if b()then return
end print(...)end return af end)()end,[18]=function()local aa,ab,ac=a(18)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Progress'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m=ac(af.variables)
,ac(af.functions),ac(af.moveable),ac(af.locale),60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local n=
TweenInfo.new(m,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut,-1,true)local function o(p:unknown):number?local q=
tonumber(p)if q==nil or q~=q or math.abs(q)==math.huge then return nil end return q end function ae.new(p,q)q=if typeof(
q)=='table'then q else{}local r=o(q.steps or q.Steps)r=if r and r>=2 then math.floor(r)else nil local s=q.range or q.
Range local t,u=o(s and s[1])or 0,o(s and s[2])or r or 1 if t>u then t,u=u,t end local v=setmetatable({tab=assert(p,
'Missing argument #1 (Tab expected)'),window=p.window,name=q.name or q.Name or'Progress',icon=q.icon or q.Icon,
description=q.description or q.Description,min=t,max=u,steps=r,value=0,text=q.text or q.Text,format=q.format or q.Format
,showValue=if q.showValue==nil then true else q.showValue==true,indeterminate=q.indeterminate or q.Indeterminate or
false},ae)v.value=v:_clamp(o(q.value or q.Value)or t)v:_build()if v.description then v.descriptor=ac(ab.Parent.
descriptor).new(v.tab,{description=v.description})end return v end function ae._clamp(p,q:number):number return math.
clamp(o(q)or p.min,p.min,p.max)end function ae._ratio(p):number local q=p.max-p.min if q<=0 then return 1 end return(p.
value-p.min)/q end function ae._filledSteps(p):number local q=p.steps::number return math.clamp(math.round(p:_ratio()*q)
,0,q)end function ae._readout(p):string if p.text then return b.resolve(p.text)end if p.format then local q,r=pcall(p.
format,p.value,p.min,p.max)if q and type(r)=='string'then return r end end if p.steps then return string.format('%d/%d',
p:_filledSteps(),p.steps)end return string.format('%d%%',math.round(p:_ratio()*100))end function ae._build(p)p.main=p.
window:Create('Frame',{Size=UDim2.new(1,-20,0,c),BorderSizePixel=0,Name=p.name,BackgroundColor3=Color3.fromRGB(255,255,
255),BackgroundTransparency=1,Parent=p.tab.tabPage},{BackgroundTransparency='ElementTransparency'})p.stroke=p.window:
StyleElementBody(p.main)p.container=p.window:Create('Frame',{Size=UDim2.new(0,170,0,h),Position=UDim2.new(0,e,0,20),
AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=p.main})p.window:Create('UIListLayout',
{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=p.container})if p.icon
then p.iconLabel=p.window:Create('ImageLabel',{Image=p.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=p.container},{ImageColor3='ContentColor'})end p.title=p.window:
Create('TextLabel',{Text=b.t(p.name),Size=UDim2.fromOffset(250,h),BorderSizePixel=0,BackgroundTransparency=1,TextSize=h,
AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=p.container},{TextColor3='ContentColor',FontFace='Font'})p.readout=p.window:Create('TextLabel'
,{Text=p:_readout(),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-e,0,20),Size=UDim2.fromOffset(50,i),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=i,TextXAlignment=Enum.
TextXAlignment.Right,Visible=p.showValue,TextTransparency=1,Parent=p.main},{TextColor3='ContentColor',FontFace='Font'})
if p.steps then p:_buildSteps()return end p.track=p.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2
.new(0.5,0,1,-16),Size=UDim2.new(1,-e*2,0,d),BorderSizePixel=0,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3
='SliderBackground'})p.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=p.track})p.fill=p.window:Create(
'Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(if p.indeterminate then 0
else p:_ratio(),1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,
Parent=p.track})p.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=p.fill})p.window:Create('UIGradient',{
Offset=Vector2.new(0,0.5),Rotation=2,Transparency=l,Parent=p.fill},{Color={'SliderProgress',ah.toColorSequence}})p.
fillGlow=p.window:CreateGlow(p.fill,'AccentColor',20,1)if p.indeterminate then p:_startSweep()end end function ae.
_buildSteps(p)local q=p.steps::number p.track=p.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.
new(0.5,0,1,-17),Size=UDim2.new(1,-e*2,0,f),BackgroundTransparency=1,BorderSizePixel=0,Parent=p.main})p.window:Create(
'UIListLayout',{Padding=UDim.new(0,g),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=p
.track})p.stepFrames={}for r=1,q do local s=p.window:Create('Frame',{Size=UDim2.new(1/q,-(g*(q-1))/q,1,0),
BorderSizePixel=0,LayoutOrder=r,BackgroundTransparency=1,Parent=p.track},{BackgroundColor3='SliderBackground'})p.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=s})local t=p.window:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=s})p.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=t})p.window:Create('UIGradient',{Rotation=90,Parent=t},{Color={
'SliderProgress',ah.toColorSequence}})table.insert(p.stepFrames,{segment=s,fill=t})end end function ae._startSweep(p)if
p._sweep or p.steps then return end p.fill.AnchorPoint=Vector2.new(0,0.5)p.fill.Position=UDim2.fromScale(0,0.5)p.fill.
Size=UDim2.fromScale(0,1)p._sweep=ag.tweenService:Create(p.fill,n,{Size=UDim2.fromScale(1,1)})p._sweep:Play()end
function ae._stopSweep(p)if not p._sweep then return end p._sweep:Cancel()p._sweep=nil p.fill.AnchorPoint=Vector2.new(0,
0.5)p.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(p,q:boolean?)p.readout.Text=p:_readout()if p.steps
then if not p._shown then return end local r=p:_filledSteps()for s,t in p.stepFrames do local u=if s<=r then 0 else 1 if
q==false then t.fill.BackgroundTransparency=u else ag.tweenService:Create(t.fill,k,{BackgroundTransparency=u}):Play()end
end return end local r=UDim2.fromScale(p:_ratio(),1)if q==false then p.fill.Size=r else ag.tweenService:Create(p.fill,k,
{Size=r}):Play()end end function ae.Set(p,q)p.value=p:_clamp(q)if p.indeterminate then p.indeterminate=false p:
_stopSweep()end p:_render()end function ae.Get(p):number return p.value end function ae.GetPercentage(p):number return p
:_ratio()end function ae.SetRange(p,q,r)q=o(q)or p.min r=o(r)or p.max if q>r then q,r=r,q end p.min,p.max=q,r p.value=p:
_clamp(p.value)p:_render()end function ae.SetText(p,q)p.text=q p.readout.Text=p:_readout()end function ae.
SetIndeterminate(p,q)q=q==true if q==p.indeterminate then return end p.indeterminate=q if q then p:_startSweep()else p:
_stopSweep()p:_render(false)end end function ae._setShown(p,q,r)local s=p.window p._shown=q s:_reveal(p.readout,{
TextTransparency=if q then j else 1},r)if q then s:_revealCommon(p,r)else s:_hideCommon(p,r)end if p.steps then local t=
p:_filledSteps()for u,v in p.stepFrames do s:_reveal(v.segment,{BackgroundTransparency=if q then 0 else 1},r)s:_reveal(v
.fill,{BackgroundTransparency=if q and u<=t then 0 else 1},r)end return end s:_reveal(p.track,{BackgroundTransparency=if
q then 0 else 1},r)s:_reveal(p.fill,{BackgroundTransparency=if q then 0 else 1},r)s:_reveal(p.fillGlow,{Transparency=if
q then s.theme.AccentGlow else 1},r)end function ae.Remove(p)p:_stopSweep()if p.descriptor then p.descriptor:Remove()end
if p.tab._forget then p.tab:_forget(p)end p.window:DestroySubtree(p.main)end ai(ae)return ae end)()end,[10]=function()
local aa,ab,ac=a(10)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Divider'local af,ag,ah,ai,b,c,d,e,f
=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale),1,12,10,14,12,0.88,0.55 function ae.new(g,h)h
=if typeof(h)=='table'then h else{}local i,j=h.spacing or h.Spacing,h.text or h.Text local k=setmetatable({tab=assert(g,
'Missing argument #1 (Tab expected)'),window=g.window,text=if j~=nil then tostring(j)else'',spacing=if type(i)=='number'
then math.max(i,0)else ai,line=h.line~=false and h.Line~=false},ae)k.main=k.window:Create('Frame',{Size=UDim2.new(1,-40,
0,0),BorderSizePixel=0,Name='Divider',BackgroundTransparency=1,Parent=k.tab.tabPage})k.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,b),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment
=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Parent=k.main})if k.line then k.left=
k:_buildHalf(1)end if k.text~=''then k:_buildLabel()end k:_applyHeight()return k end function ae._buildHalf(g,h)local i=
g.window:Create('Frame',{Size=UDim2.new(0,0,0,ah),BorderSizePixel=0,LayoutOrder=h,BackgroundTransparency=1,Parent=g.main
},{BackgroundColor3='ContentColor'})g.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=i})return i end
function ae._buildLabel(g)g.title=g.window:Create('TextLabel',{Text=ag.t(g.text),Size=UDim2.fromOffset(0,c),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=d,TextXAlignment=Enum.
TextXAlignment.Center,LayoutOrder=2,TextTransparency=1,Parent=g.main},{TextColor3='ContentColor',FontFace='Font'})if g.
line then g.right=g:_buildHalf(3)end end function ae._applyHeight(g)local h=if g.text~=''then c elseif g.line then ah
else 0 g.main.Size=UDim2.new(1,-40,0,g.spacing*2+h)end function ae.Set(g,h)g.text=if h~=nil then tostring(h)else''if g.
text~=''and not g.title then g:_buildLabel()if not g.window.hidden then g:_setShown(true,true)end end if g.title then g.
window:_bindLocale(g.title,'Text',g.text)local i=g.text~=''g.title.Visible=i if g.right then g.right.Visible=i end end g
:_applyHeight()end function ae._setShown(g,h,i)local j,k=g.window,if h then e else 1 j:_reveal(g.left,{
BackgroundTransparency=k},i)j:_reveal(g.right,{BackgroundTransparency=k},i)j:_reveal(g.title,{TextTransparency=if h then
f else 1},i)end af(ae)return ae end)()end,[13]=function()local aa,ab,ac=a(13)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Group'local af,ag,ah,ai,b=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.log),
ac(ab.Parent.Parent.utility.ordering),8,{button=true,toggle=true,stat=true,slider=true}function ae.new(c,d)d=if typeof(d
)=='table'then d else{}local e=string.lower(d.direction or d.Direction or'row')local f=e=='column'or e=='vertical'local
g=not f local h=if g then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical local i,j=setmetatable({tab=
assert(c,'Missing argument #1 (Tab expected)'),window=c.window,direction=h,compact=g,forgetState=c.forgetState,elements=
{}},ae),c.direction==Enum.FillDirection.Horizontal i.main=i.window:Create('Frame',{Name='Group',BackgroundTransparency=1
,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=if g then UDim2.new(1,-20,0,0)else UDim2.new(1,0,0,0),Parent=
i.tab.tabPage})if j then i.main.Size=UDim2.new(0,0,0,0)i.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=i.main})end i.tabPage=i.main i.scrollPage=c.scrollPage or c.tabPage i.layout=i.window:Create('UIListLayout',{
FillDirection=h,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,ai),VerticalAlignment=if g then Enum.
VerticalAlignment.Center else Enum.VerticalAlignment.Top,HorizontalAlignment=if g then Enum.HorizontalAlignment.Left
else Enum.HorizontalAlignment.Center,Parent=i.main})return i end function ae._add(c,d,e)if c.compact and not b[d]then ag
.warn(`Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{d}'. Use a column for it.`)
return nil end local f=ac(ab.Parent[d]).new(c,e)table.insert(c.elements,f)ah(f,#c.elements*10)c.window:_restoreLate(f)if
c.compact then c:_wrapChild(f)end c:_reflowRow()if not c.window.hidden then f:_setShown(true,true)end return f end
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
end end af(ae)return ae end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae={}ae.__index=
ae ae.__type='Tab'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e=ac(af.variables),ac(af.HapticEngine),ac(af.
log),ac(af.columns),ac(ab.Parent.search),ac(ab.Parent.tabSelector),ac(ab.Parent.column)local function f(g,h)for i,j in h
do if j.__type=='Group'then f(g,j.elements)else g:_unregisterControl(j)end if j.connections then for k,l in j.
connections do g:Disconnect(l)end j.connections=nil end if j._dragConnection then j._dragConnection:Disconnect()j.
_dragConnection=nil end if g._recordingKeybind==j then g._recordingKeybind=nil end if j._outsideClickConn then g:
Disconnect(j._outsideClickConn)j._outsideClickConn=nil end end end local g,h=TweenInfo.new(0.4,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(i,j)j=if
typeof(j)=='table'then j else{}local k=setmetatable({window=assert(i,'Missing argument #1 (Window expected)'),name=j.
name or j.Name,icon=j.icon or j.Icon,neglectSelector=j.neglectSelector or j.NeglectSelector or false,customOrder=j.
customOrder or j.CustomOrder or 0,forgetState=j.forgetState or j.ForgetState or false,elements={},connections={}},ae)
assert(k.name or k.icon,'A tab needs a name or an icon.')if not k.neglectSelector then d.build(k,k.window.layout)end k.
tabPage=k.window:Create('ScrollingFrame',{Name=k.name,Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),
AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,
CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=k.
customOrder or 0,Parent=k.window.elements})k.tabPageLayout=k.window:Create('UIListLayout',{Padding=UDim.new(0,7),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=k.tabPage})k.window:Create('UIPadding',{
PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=k.tabPage})k.columnsRow=k.window:Create('Frame',{Name=
'Columns',BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.fromScale(1,0),Parent
=k.tabPage})k.columnsLayout=k.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.
LayoutOrder,Parent=k.columnsRow})k.Left=e.new(k,'Left')k.Right=e.new(k,'Right')k.left=k.Left k.right=k.Right k:
_layoutColumns()if not k.neglectSelector then table.insert(k.connections,k.window:Connect(k.topbarItemInteract.
MouseButton1Click,function()ah.click()k:Select()end))table.insert(k.connections,k.window:Connect(k.topbarItemInteract.
MouseEnter,function()if not k.window:_interactive()then return end if k.window.selectedTab~=k then k:_applyVisual(
'hover',h)k:_spinGradients()end end))table.insert(k.connections,k.window:Connect(k.topbarItemInteract.MouseLeave,
function()if k.window.selectedTab~=k then k:_applyVisual('unselected',h)end end))end return k end function ae.
_applyVisual(i,j,k)if i.neglectSelector or not i.topbarItem then return end local l=d.states[i.window.layout.mode][j]if
not l then return end d.applyVisual(i,l,k)end function ae._spinGradients(i)if i.neglectSelector then return end local j=
TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)for k,l in{i.topbarItemGradient,i.
topbarItemStrokeGradient}do l.Rotation=-270 ag.tweenService:Create(l,j,{Rotation=90}):Play()end end function ae.Select(i
,j)if i.window._searching then c.close(i.window,{showTabs=true,jumpTo=false})end i.window.selectedTab=i i.window:
_jumpTo(i.tabPage)local k=j or not i.window:_interactive()if not i.neglectSelector and not k then i:_applyVisual(
'selected',g)end for l,m in i.window.tabs do if m~=i.window.selectedTab then m:Deselect(k)end end if i~=i.window.
rfSettings and i.window.settingsAction and not k then ag.tweenService:Create(i.window.settingsAction.iconLabel,TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end function ae.Deselect(i
,j)if not i.neglectSelector and not j then i:_applyVisual('unselected',g)end end function ae.GetColumn(i,j)local k=b.
resolveSide(j)if not k then ai.warn(`Rayfield: unknown column '{tostring(j)}', using the left one. Use "Left" or "Right".`
)k='Left'end return if k=='Right'then i.Right else i.Left end function ae._columnFor(i,j)if typeof(j)~='table'then
return i.Left end return i:GetColumn(j.side or j.Side or j.column or j.Column)end function ae._layoutColumns(i)local j,k
=i.Left,i.Right if not j or not k or not i.columnsRow then return end local l=i.window local m=if l.size then b.
pageWidth(l.size.X.Offset,l.layout)else 0 local n,o,p=b.shouldStack(m),#j.elements>0,#k.elements>0 j.main.Visible=o k.
main.Visible=p i.stacked=n if n or not(o and p)then i.columnsLayout.FillDirection=Enum.FillDirection.Vertical i.
columnsLayout.Padding=UDim.new(0,if o and p then 20 else 0)j.main.Size=UDim2.fromScale(1,0)k.main.Size=UDim2.fromScale(1
,0)else i.columnsLayout.FillDirection=Enum.FillDirection.Horizontal i.columnsLayout.Padding=UDim.new(0,-b.overlap)j.main
.Size=UDim2.new(0.5,b.overlap/2,0,0)k.main.Size=UDim2.new(0.5,b.overlap/2,0,0)end end function ae.CreateButton(i,j)
return i:_columnFor(j):CreateButton(j)end function ae.CreateToggle(i,j)return i:_columnFor(j):CreateToggle(j)end
function ae.CreateSwitch(i,j)return i:CreateToggle(j)end function ae.CreateSection(i,j)return i:_columnFor(j):
CreateSection(j)end function ae.CreateText(i,j)return i:_columnFor(j):CreateText(j)end function ae.CreateDivider(i,j)
return i:_columnFor(j):CreateDivider(j)end function ae.CreateProgress(i,j)return i:_columnFor(j):CreateProgress(j)end
function ae.CreateConsole(i,j)return i:_columnFor(j):CreateConsole(j)end function ae.CreateStat(i,j)return i:_columnFor(
j):CreateStat(j)end function ae.CreateSlider(i,j)return i:_columnFor(j):CreateSlider(j)end function ae.CreateDropdown(i,
j)return i:_columnFor(j):CreateDropdown(j)end function ae.CreateInput(i,j)return i:_columnFor(j):CreateInput(j)end
function ae.CreateKeybind(i,j)return i:_columnFor(j):CreateKeybind(j)end function ae.CreateColorPicker(i,j)return i:
_columnFor(j):CreateColorPicker(j)end function ae.CreateGroup(i,j)return i:_columnFor(j):CreateGroup(j)end function ae.
Remove(i)local j=i.window if j._searching then c.close(j,{showTabs=true,jumpTo=j.selectedTab and j.selectedTab.tabPage})
end local k=table.find(j.tabs,i)if k then table.remove(j.tabs,k)end if j.selectedTab==i then j.selectedTab=nil for l,m
in ipairs(j.tabs)do if not m.neglectSelector then m:Select()break end end end f(j,i.elements)for l,m in i.connections do
j:Disconnect(m)end i.connections={}if i.topbarItem then j:DestroySubtree(i.topbarItem)end if i.tabPage then j:
DestroySubtree(i.tabPage)end i.topbarItem=nil i.tabPage=nil i.columnsRow=nil i.elements={}for l,m in{i.Left,i.Right}do m
.elements={}end end return ae end)()end,[51]=function()local aa,ab,ac=a(51)local ad return(function(...)local function
ae<T>(af:T):T local ag=af::any function ag.Lock(ah,ai:string?)ah.window:_setElementLocked(ah,true,ai)end function ag.
Unlock(ah)ah.window:_setElementLocked(ah,false)end function ag.IsLocked(ah):boolean return ah.locked==true end return af
end return ae end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='TabSection'local af,ag,ah,ai,b=ac(ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.utility.log),20,6,3
local function c(d)for e,f in d.tabs do if not f.neglectSelector then return true end end return#d.tabSections>0 end
function ae.new(d,e)e=if typeof(e)=='table'then e else{}local f=setmetatable({window=assert(d,
'Missing argument #1 (Window expected)'),name=e.name or e.Name or'Section',icon=e.icon or e.Icon},ae)if d.layout.mode~=
'sidebar'then if not d._warnedTabSection then d._warnedTabSection=true ag.warn
[[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]end f.inert=true return f
end f.main=d:Create('Frame',{Name=f.name,Size=UDim2.new(1,-ah*2,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=d.tabList})f.padding=d:Create('UIPadding',{PaddingTop=
UDim.new(0,if c(d)then ai else 0),PaddingBottom=UDim.new(0,b),Parent=f.main})d:Create('UIListLayout',{FillDirection=Enum
.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=f.main})if f.icon then f.iconLabel=d:
Create('ImageLabel',{Image=f.icon,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,
ImageTransparency=1,Parent=f.main},{ImageColor3='ContentColor'})end f.title=d:Create('TextLabel',{Text=af.t(f.name),Size
=UDim2.fromOffset(0,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Bottom,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=f.main},{TextColor3='ContentColor',FontFace='Font'})return f end function ae._setShown(d,e,f)
if not d.main then return end local g=d.window g:_reveal(d.title,{TextTransparency=if e then 0.6 else 1},f)if d.
iconLabel then g:_reveal(d.iconLabel,{ImageTransparency=if e then 0.65 else 1},f)end end function ae._setVisible(d,e)if
d.main then d.main.Visible=e end end function ae.Remove(d)local e=table.find(d.window.tabSections,d)if e then table.
remove(d.window.tabSections,e)end d.window:DestroySubtree(d.main)d.main=nil end return ae end)()end,[47]=function()local
aa,ab,ac=a(47)local ad return(function(...)local ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.variables)type
AvatarCallback=ae.AvatarCallback type PreloadCallback=ae.PreloadCallback local ag={}ag.rewrites=ae.rewrites ag.onBlock=
nil::((unknown)->())?type PendingProperties={[string]:boolean}ag.pending={}::{[number]:{[Instance]:PendingProperties}}
local ah,ai:{[string]:boolean}=false,{Image=true,HoverImage=true,PressedImage=true}local function b(c:unknown):number?if
type(c)=='number'then return c elseif type(c)=='string'then return tonumber(string.match(c,'^rbxassetid://(%d+)$'))end
return nil end local function c(d:unknown):string if ag.onBlock then ag.onBlock(d)end return''end function ag.preload(d:
PreloadCallback?):(boolean,number)ah=false return ae.preload(function(e)ah=true table.clear(ag.pending)if d then d(e)end
end)end function ag.avatar(d:number,e:AvatarCallback?):string if not af.secureMode then return`rbxthumb://type=AvatarHeadShot&id={
d}&w=48&h=48`end return ae.avatar(d,e)end function ag.assign(d:Instance,e:string,f:unknown)local g=d::any if not ai[e]
then g[e]=f return end g[e]=ag.resolve(f)if af.secureMode and not ah then local h=b(f)if h and not ag.rewrites[h]then
local i=ag.pending[h]if not i then i=setmetatable({},{__mode='k'})::any ag.pending[h]=i end local j=i[d]if not j then j=
{}i[d]=j end j[e]=true end end end ae.onCached=function(d:number)local e=ag.pending[d]if not e then return end local f=
ag.rewrites[d]if f then for g,h in e do if g.Parent then local i=g::any for j in h do i[j]=f end end end end ag.pending[
d]=nil end function ag.resolve(d:unknown):string if d==nil or d==0 or d==''then return''end if type(d)=='string'then if
string.sub(d,1,11)=='rbxasset://'then return d end if string.sub(d,1,11)=='rbxthumb://'then return if af.secureMode then
c(d)else d end end local e:number?if type(d)=='number'then e=d elseif type(d)=='string'then e=tonumber(string.match(d,
'^rbxassetid://(%d+)$'))end local f=if e then ag.rewrites[e]else nil if f then return f end if af.secureMode then return
c(d)end if type(d)=='number'then return'rbxassetid://'..d end if type(d)=='string'then return d end return c(d)end
return ag end)()end,[7]=function()local aa,ab,ac=a(7)local ad return(function(...)local ae={}ae.__index=ae ae.__type=
'Column'local af,ag=ac(ab.Parent.Parent.utility.ordering),7 function ae.new(ah,ai)local b=setmetatable({tab=assert(ah,
'Missing argument #1 (Tab expected)'),window=ah.window,side=ai,name=ai,forgetState=ah.forgetState,compact=false,
direction=Enum.FillDirection.Vertical,elements={}},ae)b.main=b.window:Create('Frame',{Name=ai,BackgroundTransparency=1,
BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.fromScale(0.5,0),LayoutOrder=if ai=='Left'then 1 else 2,
Visible=false,Parent=ah.columnsRow})b.layout=b.window:Create('UIListLayout',{Padding=UDim.new(0,ag),FillDirection=Enum.
FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.main})b.tabPage=b.main b.scrollPage=ah.tabPage return b end function ae.
_register(ah,ai)table.insert(ah.elements,ai)af(ai,#ah.elements*10)table.insert(ah.tab.elements,ai)ah.window:
_restoreLate(ai)if not ah.window.hidden then ai:_setShown(true,true)end ah.tab:_layoutColumns()return ai end function ae
.CreateButton(ah,ai)return ah:_register(ac(ab.Parent.button).new(ah,ai))end function ae.CreateToggle(ah,ai)return ah:
_register(ac(ab.Parent.toggle).new(ah,ai))end function ae.CreateSwitch(ah,ai)return ah:CreateToggle(ai)end function ae.
CreateSection(ah,ai)return ah:_register(ac(ab.Parent.section).new(ah,ai))end function ae.CreateText(ah,ai)return ah:
_register(ac(ab.Parent.text).new(ah,ai))end function ae.CreateDivider(ah,ai)return ah:_register(ac(ab.Parent.divider).
new(ah,ai))end function ae.CreateStat(ah,ai)return ah:_register(ac(ab.Parent.stat).new(ah,ai))end function ae.
CreateProgress(ah,ai)return ah:_register(ac(ab.Parent.progress).new(ah,ai))end function ae.CreateConsole(ah,ai)return ah
:_register(ac(ab.Parent.console).new(ah,ai))end function ae.CreateSlider(ah,ai)return ah:_register(ac(ab.Parent.slider).
new(ah,ai))end function ae.CreateDropdown(ah,ai)return ah:_register(ac(ab.Parent.dropdown).new(ah,ai))end function ae.
CreateInput(ah,ai)return ah:_register(ac(ab.Parent.input).new(ah,ai))end function ae.CreateKeybind(ah,ai)return ah:
_register(ac(ab.Parent.keybind).new(ah,ai))end function ae.CreateColorPicker(ah,ai)return ah:_register(ac(ab.Parent.
colorpicker).new(ah,ai))end function ae.CreateGroup(ah,ai)return ah:_register(ac(ab.Parent.group).new(ah,ai))end
function ae._forget(ah,ai)local b=table.find(ah.elements,ai)if b then table.remove(ah.elements,b)for c,d in ah.elements
do af(d,c*10)end end local c=table.find(ah.tab.elements,ai)if c then table.remove(ah.tab.elements,c)end ah.window:
_unregisterControl(ai)if ai.connections then ah.window:DisconnectMany(ai,ai.connections)ai.connections=nil end ah.tab:
_layoutColumns()end function ae._moveElement(ah,ai,b)local c=table.find(ah.elements,ai)if not c then return end table.
remove(ah.elements,c)b=math.clamp(b,1,#ah.elements+1)table.insert(ah.elements,b,ai)for d,e in ah.elements do af(e,d*10)
end end return ae end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d=ac(af.variables),ac(af.functions),ac(af.moveable),
ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(e,f)f=if typeof(f)=='table'then f else{}local g=
setmetatable({tab=assert(e,'Missing argument #1 (Tab expected)'),window=e.window,name=f.name or f.Name or'Switch',icon=f
.icon or f.Icon,description=f.description or f.Description,forgetState=f.forgetState or f.ForgetState or e.forgetState,
compact=e.compact or false,flag=f.flag or f.Flag or(not(f.forgetState or f.ForgetState or e.forgetState)and ah.
deriveFlagFromName(f.name or f.Name or'Switch')or nil),callback=f.callback or f.Callback or function()end,value=if(f.
value or f.Value)~=nil then(f.value or f.Value)else false},ae)g.window:_registerControl(g)if g.compact then g:
_buildCompact()else g:_buildFull()end if g.description and not g.compact then g.descriptor=ac(ab.Parent.descriptor).new(
g.tab,{description=g.description})end return g end function ae._buildSwitch(e,f)local g=e.window e.functionContainer=g:
Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(50,21),BackgroundTransparency=1,Parent=f},{BackgroundColor3=
'ToggleTrack'})g:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=e.functionContainer})e.containerStroke=g:Create(
'UIStroke',{Transparency=1,Parent=e.functionContainer},{Color='SurfaceStroke'})e.indicator=g:Create('Frame',{
BorderSizePixel=0,Size=UDim2.fromOffset(25,17),Position=e.value and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),
AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=e.value and e.window.theme.AccentColor or e.window.theme.ToggleKnobOff,
BackgroundTransparency=1,Parent=e.functionContainer})g:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=e.indicator}
)e.indicatorStroke=g:Create('UIStroke',{Color=e.value and e.window.theme.AccentStroke or Color3.fromRGB(255,255,255),
Transparency=1,Parent=e.indicator})e.indicatorGlow=g:CreateGlow(e.indicator,'AccentColor',20,1)e.overlay=g:Create(
'Frame',{BorderSizePixel=0,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=Vector2.new(0,0),
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=e.functionContainer},{Visible=
'DarkToggleOverlay'})g:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=e.overlay})e.overlayGradient=g:Create(
'UIGradient',{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0.35)},Parent=e.overlay})return e.functionContainer end function ae._performToggle(e)d.
click()e.value=not e.value e:_animateIndicator()e.window:_runGuarded(e,e.callback,e.value)e.window:_persist(e)end
function ae._buildFull(e)local f=e.window e.main=f:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=e.
name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=e.tab.tabPage},{BackgroundTransparency
='ElementTransparency'})e.stroke=f:StyleElementBody(e.main)e.hoverOverlay=f:CreateHoverOverlay(e.main)e.container=f:
Create('Frame',{BorderSizePixel=0,Parent=e.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1})e.containerLayout=f:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,Parent=e.container})if e.icon then e.iconLabel=f:Create('ImageLabel',{Image=e.icon,Size=UDim2.
fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=e.container},{ImageColor3=
'ContentColor'})end e.title=f:Create('TextLabel',{Text=c.t(e.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=e.container},{TextColor3='ContentColor',FontFace='Font'})e.
interact=f:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),BorderSizePixel=0,Position=UDim2.
fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,ZIndex=10,Parent=e.main})e:_buildSwitch(e.main)e.
functionContainer.Position=UDim2.new(1,-15,0,20)e.functionContainer.AnchorPoint=Vector2.new(1,0.5)e.window:
_wireElementHover(e)e.window:ConnectFor(e,e.interact.MouseButton1Click,function()ag.tweenService:Create(e.stroke,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()ag.tweenService:Create(e.
main,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,41)}):Play()e:
_performToggle()task.wait(0.11)ag.tweenService:Create(e.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()ag.tweenService:Create(e.stroke,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=e.window.theme.ElementStrokeTransparency}):Play()end)end
function ae._buildCompact(e)local f=e.window e.main,e.stroke,e.interact=f:_buildCompactRow(e.tab,e.name,10)e.
hoverOverlay=e.interact f:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=e.interact})
f:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=e.interact})e.container=f:Create('Frame',
{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0
,Parent=e.interact})f:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=e.container})f:Create('UIListLayout',{
Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=e.container})if e.icon then e.iconLabel=f:Create('ImageLabel',{
Image=e.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,
Parent=e.container},{ImageColor3='ContentColor'})end e.title=f:Create('TextLabel',{Text=c.t(e.name),Size=UDim2.
fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=e.
container},{TextColor3='ContentColor',FontFace='Font'})f:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=e.
title})e:_buildSwitch(e.interact)e.functionContainer.LayoutOrder=1 e.window:_wireElementHover(e)e.window:ConnectFor(e,e.
interact.MouseButton1Click,function()ag.tweenService:Create(e.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=1}):Play()e:_performToggle()task.wait(0.11)ag.tweenService:Create(e.stroke,TweenInfo.
new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=e.window.theme.ElementStrokeTransparency}):Play(
)end)end function ae._animateIndicator(e)local f=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out
)if e.indicatorGlow then ag.tweenService:Create(e.indicatorGlow,f,{Transparency=e.value and e.window.theme.AccentGlow or
1}):Play()end if e.value then ag.tweenService:Create(e.indicator,f,{Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=e.
window.theme.AccentColor,BackgroundTransparency=0}):Play()ag.tweenService:Create(e.indicatorStroke,f,{Color=e.window.
theme.AccentStroke,Transparency=0}):Play()else ag.tweenService:Create(e.indicator,f,{Position=UDim2.new(1,-47,0.5,0),
BackgroundColor3=e.window.theme.ToggleKnobOff,BackgroundTransparency=e.window.theme.ToggleKnobOffTransparency}):Play()ag
.tweenService:Create(e.indicatorStroke,f,{Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local e,f=
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(g,h,i)local j=g.window if h then j:_revealCommon(g,i)j:
_reveal(g.indicator,{BackgroundColor3=g.value and j.theme.AccentColor or j.theme.ToggleKnobOff,BackgroundTransparency=g.
value and 0 or j.theme.ToggleKnobOffTransparency},i,e)j:_reveal(g.indicatorStroke,{Color=g.value and j.theme.
AccentStroke or Color3.fromRGB(255,255,255),Transparency=g.value and 0 or 0.7},i,e)j:_reveal(g.indicatorGlow,{
Transparency=g.value and j.theme.AccentGlow or 1},i,f)j:_reveal(g.overlay,{BackgroundTransparency=0},i,e)j:_reveal(g.
containerStroke,{Transparency=0.85},i,e)j:_reveal(g.functionContainer,{BackgroundTransparency=j.theme.
ToggleTrackTransparency},i,e)else j:_hideCommon(g,i)j:_reveal(g.indicator,{BackgroundTransparency=1},i,e)j:_reveal(g.
indicatorStroke,{Transparency=1},i,e)j:_reveal(g.indicatorGlow,{Transparency=1},i,f)j:_reveal(g.overlay,{
BackgroundTransparency=1},i,e)j:_reveal(g.containerStroke,{Transparency=1},i,e)j:_reveal(g.functionContainer,{
BackgroundTransparency=1},i,e)end end function ae._refreshTheme(g)local h,i,j=g.window.theme,TweenInfo.new(0.5,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService j:Create(g.functionContainer,i,{BackgroundTransparency=h.
ToggleTrackTransparency}):Play()j:Create(g.indicator,i,{BackgroundColor3=g.value and h.AccentColor or h.ToggleKnobOff,
BackgroundTransparency=g.value and 0 or h.ToggleKnobOffTransparency}):Play()j:Create(g.indicatorStroke,i,{Color=g.value
and h.AccentStroke or Color3.fromRGB(255,255,255)}):Play()if g.indicatorGlow then j:Create(g.indicatorGlow,i,{
Transparency=g.value and h.AccentGlow or 1}):Play()end end function ae._minWidth(g)local h=90 if g.icon then h+=21 end h
+=ah.textWidth(g.window.theme.Font,16,c.resolve(g.name))return h end ai(ae)b(ae)function ae.Set(g,h,i)local j=g.value~=h
g.value=h if j then g:_animateIndicator()end if not i then g.window:_runGuarded(g,g.callback,g.value)g.window:_persist(g
)end end return ae end)()end,[16]=function()local aa,ab,ac=a(16)local ad return(function(...)local ae={}ae.__index=ae ae
.__type='Notification'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k=ac(af.variables),ac(af.
functions),ac(af.constants),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)
,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential
,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8
local function l(m)return math.clamp(#m*0.06+3,3,9)end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=
setmetatable({window=assert(m,'Missing argument #1 (Window expected)'),title=n.title or n.Title or'Notification',content
=n.content or n.Content or'',icon=n.icon or n.Icon,_hovered=false,_dismissed=false},ae)o.duration=n.duration or n.
Duration or l(o.content)local p=o.icon~=nil and o.icon~=0 and o.icon~=''o.main=o.window:Create('Frame',{Name=
'Notification',BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.notification,Parent=o
.window.notifications})o.window:Create('UIPadding',{PaddingTop=UDim.new(0,k),Parent=o.main})o.body=o.window:Create(
'Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=h,AnchorPoint=Vector2.new(0.5,0.5
),Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.notification,BackgroundTransparency=1,Parent=o.main})o.window:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=o.body},{Color={'WindowColor',ah.toColorSequence}})o.window
:Create('UICorner',{Parent=o.body},{CornerRadius='CornerRoundness'})o.stroke=o.window:Create('UIStroke',{Transparency=1,
Parent=o.body},{Color='SurfaceStroke'})o.shadow=o.window:CreateGlow(o.body,'ShadowColor',20,1)o.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=o.body})o.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=o.body})if p then o.
iconLabel=o.window:Create('ImageLabel',{Image=o.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.notification,ImageTransparency=1,Parent=o.body},{ImageColor3=
'ContentColor'})end o.container=o.window:Create('Frame',{Size=UDim2.fromOffset(p and 222 or 260,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.notification,Parent=o.body})o.
window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=
UDim.new(0,4),Parent=o.container})o.titleLabel=o.window:Create('TextLabel',{Text=o.title,Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=o.container},{TextColor3=
'ContentColor',FontFace='TitleFont'})if o.content~=''then o.descriptionLabel=o.window:Create('TextLabel',{Text=o.content
,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=ai.zIndex.
notification,TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='Font'})end o.window.
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
return ae end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(function(...)local ae={}function ae.join(af:
string,ag:string?):string if not ag or ag==''then return af end return af..'/'..ag end local function af(ag:string):
string local ah repeat ah=ag ag=ag:gsub('%.%.','')until ag==ah return ag end function ae.sanitizeFolder(ag:unknown):
string local ah=tostring(ag):gsub('\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')return(ah:gsub('^/+',''))end
function ae.sanitizeFile(ag:unknown):string local ah=tostring(ag):gsub('[/\\]',''):gsub('[:<>"|?*%c]','')return af(ah)
end function ae.basename(ag:unknown):string return tostring(ag):match'[^/\\]+$'or tostring(ag)end function ae.
stripExtension(ag:unknown,ah:string?):string if ah and ah~=''then local ai=tostring(ag)if ai:sub(-#ah)==ah then return
ai:sub(1,-#ah-1)end return ai end local ai=tostring(ag):match'^(.+)%.%w+$'return ai or tostring(ag)end return ae end)()
end,[34]=function()local aa,ab,ac=a(34)local ad return(function(...)export type Theme=string|{[string]:any}export type
Translator=(source:string,localeId:string)->string?export type Translations={[string]:{[string]:string}}export type
WindowConfiguration={autoSave:boolean?,autoLoad:boolean?,fileName:string?,customFolder:string?}export type WindowProps={
name:string?,subtitle:string?,theme:Theme?,icon:(string|number)?,showName:string?,showIcon:(string|number)?,showIconOnly
:boolean?,sidebarLayout:boolean?,profile:string?,configuration:WindowConfiguration?,fallbackFont:(Font|Enum.Font)?,
locale:string?,translations:Translations?,translator:Translator?}export type ColumnSide=string|number export type
TabProps={name:string?,icon:(string|number)?}export type TagProps={text:string?,title:string?,icon:(string|number)?,
color:Color3?,order:number?}export type SectionProps={side:ColumnSide?,name:string?,icon:(string|number)?}export type
TextProps={side:ColumnSide?,name:string?,text:string?,icon:(string|number)?}export type DividerProps={side:ColumnSide?,
text:string?,spacing:number?,line:boolean?}export type GroupProps={side:ColumnSide?,direction:string?}export type
ButtonProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,callback:(()->())?}export type
ToggleProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,flag:string?,value:boolean?,
forgetState:boolean?,callback:((value:boolean)->())?}export type SliderProps={side:ColumnSide?,name:string?,description:
string?,icon:(string|number)?,flag:string?,range:{number}?,increment:number?,value:number?,suffix:string?,minimal:
boolean?,forgetState:boolean?,callback:((value:number,dragging:boolean)->())?}export type DropdownProps={side:ColumnSide
?,name:string?,description:string?,icon:(string|number)?,flag:string?,options:{string}?,value:(string|{string})?,
multiSelect:boolean?,placeholder:string?,forgetState:boolean?,callback:((value:any)->())?}export type InputProps={side:
ColumnSide?,name:string?,description:string?,icon:(string|number)?,flag:string?,value:string?,placeholder:string?,
numeric:boolean?,clearOnFocus:boolean?,forgetState:boolean?,callback:((value:string)->())?}export type KeybindProps={
side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,flag:string?,value:(EnumItem|string)?,
forgetState:boolean?,isMenuToggle:boolean?,hold:boolean?,holdThreshold:number?,callback:((value:EnumItem|boolean)->())?,
onChanged:((key:EnumItem)->())?}export type ColorPickerProps={side:ColumnSide?,name:string?,description:string?,icon:(
string|number)?,flag:string?,color:Color3?,alpha:number?,forgetState:boolean?,callback:((value:Color3,alpha:number)->())
?}export type StatProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,prefix:string?,suffix:
string?,value:number?,display:string?,compact:boolean?,changeMode:string?,changeBaseline:string?,numberEasing:boolean?}
export type ProgressProps={side:ColumnSide?,name:string?,description:string?,icon:(string|number)?,range:{number}?,value
:number?,steps:number?,text:string?,format:((value:number,min:number,max:number)->string)?,showValue:boolean?,
indeterminate:boolean?}export type ConsoleProps={side:ColumnSide?,name:string?,description:string?,text:string?,height:
number?,follow:boolean?,maxLines:number?}export type NotifyProps={title:string?,content:string?,icon:(string|number)?,
duration:number?}export type ToastProps={title:string?,subtitle:string?,subtitleAbove:boolean?,icon:(string|number)?,
avatar:number?,minWidth:number?,duration:number?,position:'Top'|'Bottom'?}export type PopupBox={title:string?,
description:string?,icon:(string|number)?}export type PopupOption={text:string?,style:string?,callback:(()->())?}export
type PopupProps={title:string?,subtitle:string?,icon:(string|number)?,content:string?,boxes:{PopupBox}?,options:{
PopupOption}?,dismissable:boolean?}export type Moveable={MoveTo:(self:any,index:number)->(),MoveToTop:(self:any)->(),
MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown:(self:any)->()}export type Lockable={Lock:(self:any,reason:
string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->boolean}export type Button=Moveable&Lockable&{}export type
Toggle=Moveable&Lockable&{value:boolean,Set:(self:Toggle,value:boolean,skipCallback:boolean?)->()}export type Slider=
Moveable&Lockable&{value:number,Set:(self:Slider,value:number,skipCallback:boolean?)->()}export type Dropdown=Moveable&
Lockable&{value:{string},Set:(self:Dropdown,value:string|{string},skipCallback:boolean?)->(),Refresh:(self:Dropdown,
options:{string})->(),Add:(self:Dropdown,option:string)->(),Remove:(self:Dropdown,option:string)->()}export type Input=
Moveable&Lockable&{value:string,Set:(self:Input,value:string,skipCallback:boolean?)->()}export type Keybind=Moveable&
Lockable&{value:EnumItem,Set:(self:Keybind,value:EnumItem|string,skipChanged:boolean?)->()}export type ColorPicker=
Moveable&Lockable&{value:Color3,alpha:number,Set:(self:ColorPicker,value:Color3|string,skipCallback:boolean?)->(),
SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?)->()}export type Stat=Moveable&{value:number,Set:(self:
Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->()}export type Progress=Moveable&{value:number,Set:(self
:Progress,value:number)->(),Get:(self:Progress)->number,GetPercentage:(self:Progress)->number,SetRange:(self:Progress,
min:number,max:number)->(),SetText:(self:Progress,text:string?)->(),SetIndeterminate:(self:Progress,state:boolean)->(),
Remove:(self:Progress)->()}export type Console=Moveable&{Set:(self:Console,text:string)->(),Append:(self:Console,line:
string)->(),Clear:(self:Console)->(),Get:(self:Console)->string,Copy:(self:Console)->boolean,SetHeight:(self:Console,
height:number)->(),Remove:(self:Console)->()}export type Section=Moveable&{}export type TabSection={Remove:(self:
TabSection)->()}export type Text=Moveable&{name:string,text:string,Set:(self:Text,text:string)->(),SetTitle:(self:Text,
title:string)->()}export type Divider=Moveable&{text:string,Set:(self:Divider,text:string?)->()}export type Tag={Set:(
self:Tag,props:TagProps)->(),SetColor:(self:Tag,color:Color3)->(),SetText:(self:Tag,text:string?)->(),SetIcon:(self:Tag,
icon:(string|number)?)->(),Remove:(self:Tag)->()}export type Popup={Close:(self:Popup)->()}export type Group=Moveable&{
CreateButton:(self:Group,props:ButtonProps)->Button,CreateToggle:(self:Group,props:ToggleProps)->Toggle,CreateSwitch:(
self:Group,props:ToggleProps)->Toggle,CreateStat:(self:Group,props:StatProps)->Stat,CreateSlider:(self:Group,props:
SliderProps)->Slider,CreateDropdown:(self:Group,props:DropdownProps)->Dropdown?,CreateSection:(self:Group,props:
SectionProps)->Section?,CreateText:(self:Group,props:TextProps)->Text?,CreateDivider:(self:Group,props:DividerProps?)->
Divider?,CreateGroup:(self:Group,props:GroupProps?)->Group}export type Column={CreateButton:(self:Column,props:
ButtonProps)->Button,CreateToggle:(self:Column,props:ToggleProps)->Toggle,CreateSwitch:(self:Column,props:ToggleProps)->
Toggle,CreateSlider:(self:Column,props:SliderProps)->Slider,CreateDropdown:(self:Column,props:DropdownProps)->Dropdown,
CreateInput:(self:Column,props:InputProps)->Input,CreateKeybind:(self:Column,props:KeybindProps)->Keybind,
CreateColorPicker:(self:Column,props:ColorPickerProps)->ColorPicker,CreateStat:(self:Column,props:StatProps)->Stat,
CreateProgress:(self:Column,props:ProgressProps)->Progress,CreateConsole:(self:Column,props:ConsoleProps)->Console,
CreateSection:(self:Column,props:SectionProps)->Section,CreateText:(self:Column,props:TextProps)->Text,CreateDivider:(
self:Column,props:DividerProps?)->Divider,CreateGroup:(self:Column,props:GroupProps?)->Group}export type Tab={Left:
Column,Right:Column,left:Column,right:Column,GetColumn:(self:Tab,side:ColumnSide?)->Column,Select:(self:Tab,noAnimation:
boolean?)->(),Deselect:(self:Tab,noAnimation:boolean?)->(),Remove:(self:Tab)->(),CreateButton:(self:Tab,props:
ButtonProps)->Button,CreateToggle:(self:Tab,props:ToggleProps)->Toggle,CreateSwitch:(self:Tab,props:ToggleProps)->Toggle
,CreateSlider:(self:Tab,props:SliderProps)->Slider,CreateDropdown:(self:Tab,props:DropdownProps)->Dropdown,CreateInput:(
self:Tab,props:InputProps)->Input,CreateKeybind:(self:Tab,props:KeybindProps)->Keybind,CreateColorPicker:(self:Tab,props
:ColorPickerProps)->ColorPicker,CreateStat:(self:Tab,props:StatProps)->Stat,CreateProgress:(self:Tab,props:ProgressProps
)->Progress,CreateConsole:(self:Tab,props:ConsoleProps)->Console,CreateSection:(self:Tab,props:SectionProps)->Section,
CreateText:(self:Tab,props:TextProps)->Text,CreateDivider:(self:Tab,props:DividerProps?)->Divider,CreateGroup:(self:Tab,
props:GroupProps?)->Group}export type Window={unloaded:boolean,Flags:{[string]:any},CreateTab:(self:Window,props:
TabProps)->Tab,CreateSection:(self:Window,props:SectionProps)->TabSection,CreateTag:(self:Window,props:TagProps)->Tag,
Notify:(self:Window,props:NotifyProps)->(),Toast:(self:Window,props:ToastProps)->(),Popup:(self:Window,props:PopupProps
)->Popup?,Show:(self:Window)->(),Hide:(self:Window)->(),ToggleHide:(self:Window)->(),ToggleMinimise:(self:Window)->(),
Navigate:(self:Window,tab:string|Tab)->(),ChangeTheme:(self:Window,theme:Theme)->(),SetLocale:(self:Window,localeId:
string)->(),SetTranslator:(self:Window,translator:Translator?)->(),RegisterTranslations:(self:Window,translations:
Translations)->(),Save:(self:Window,name:string?)->boolean,Load:(self:Window,name:string?)->boolean,ListConfigs:(self:
Window)->{string},DeleteConfig:(self:Window,name:string)->boolean,GetPath:(self:Window)->(string,string),Get:(self:
Window,flag:string)->any,Set:(self:Window,flag:string,value:any)->boolean,Unload:(self:Window)->()}export type Rayfield=
{CreateWindow:(self:Rayfield,props:WindowProps)->Window}return{}end)()end,[14]=function()local aa,ab,ac=a(14)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Input'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e=
ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.constants),ac(af.HapticEngine)
local f,g,h,i,j=d.pillResizeInfo,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),70,220,182
local function k(l)local m,n=l:match'^([%d%.%-]+)%^([%d%.%-]+)$'if m and n then local o,p=tonumber(m),tonumber(n)if o
and p then return o^p end end return tonumber(l)end function ae.new(l,m)m=if typeof(m)=='table'then m else{}local n=
setmetatable({tab=assert(l,'Missing argument #1 (Tab expected)'),window=l.window,name=m.name or m.Name or'Input',icon=m.
icon or m.Icon,description=m.description or m.Description,forgetState=m.forgetState or m.ForgetState or l.forgetState,
placeholder=m.placeholder or m.Placeholder or'',numeric=m.numeric or m.Numeric or false,clearOnFocus=m.clearOnFocus or m
.ClearOnFocus or false,callback=m.callback or m.Callback or function()end},ae)n.value=tostring(m.value or m.Value or m.
currentValue or m.CurrentValue or'')n.flag=m.flag or m.Flag or(not n.forgetState and ah.deriveFlagFromName(n.name)or nil
)n.window:_registerControl(n)n.main=n.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=n.name,
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
,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)local ae,af=ac(ab.Parent.network),ac(ab.Parent.log)
export type AssetId=number|string export type AssetDownloadUrl=string export type CacheKey=AssetId export type
ResolvedAsset=AssetId export type AssetRequestPayload={Url:string,Method:string}local ag={Enum={AssetDownloadUrl={
RobloxDownloadUrl='https://assetdelivery.roblox.com/v1/asset/?id=%d'::AssetDownloadUrl,RoProxyDownloadUrl=
'https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag ag.__type='assetResolver'type
AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,contentDownloadUrl:AssetDownloadUrl,
pendingRequests:{[CacheKey]:{thread}}}export type AssetResolver=AssetResolverState&{resolve:(self:AssetResolver,value:
unknown)->ResolvedAsset?,getAssetContentFromUrl:(self:AssetResolver,url:string,cacheKey:CacheKey?,forced:boolean?)->
string?,getAssetContentFromId:(self:AssetResolver,id:AssetId,forced:boolean?)->string?}local ah=8 function ag.new(ai:
boolean?,b:AssetDownloadUrl?):AssetResolver local c:{[CacheKey]:string}?=if ai then{}else nil local d=setmetatable({
contentCache=c,contentCacheOrder=if ai then{}::{CacheKey}else nil,contentDownloadUrl=b or ag.Enum.AssetDownloadUrl.
RobloxDownloadUrl,pendingRequests={}}::AssetResolverState,ag)::any return d end function ag.resolve(ai:AssetResolver,b:
unknown):ResolvedAsset?if type(b)=='number'then return b end if type(b)~='string'then return nil end if string.sub(b,1,
11)=='rbxasset://'or string.sub(b,1,11)=='rbxthumb://'then return b end local c=tonumber(string.match(b,
'^rbxassetid://(%d+)$'))if c then return c end return nil end local function ai(b:unknown):boolean if type(b)~='table'
then return false end local c=b::{Body:unknown,StatusCode:unknown,Success:unknown}local d=c.Body if type(d)~='string'or#
d==0 then return false end if type(c.StatusCode)=='number'then local e=c.StatusCode::number return e>=200 and e<300 end
if type(c.Success)=='boolean'then return c.Success::boolean end return false end function ag.getAssetContentFromUrl(b:
AssetResolver,c:string,d:CacheKey?,e:boolean?):string?local f=b.contentCache if d~=nil and f and not e then local g=f[d]
if g then return g end end local g=b.pendingRequests if d~=nil then local h=g[d]if h then table.insert(h,coroutine.
running())return coroutine.yield()end g[d]={}end local h,i:string?=(ae.getRequestFn())if not h then af.warn
'No request function available to download asset content.'else local j,k=pcall(h,{Url=c,Method='GET'}::
AssetRequestPayload)if j and ai(k)then local l=(k::{Body:string}).Body i=l if d~=nil and f then local m=b.
contentCacheOrder if m and f[d]==nil then table.insert(m,d)local n=if#m>ah then table.remove(m,1)else nil if n~=nil then
f[n]=nil end end f[d]=l end elseif not e then af.warn('Failed to download asset content for url: '..tostring(c))end end
if d~=nil then local j=g[d]g[d]=nil if j then for k,l in j do coroutine.resume(l,i)end end end return i end function ag.
getAssetContentFromId(b:AssetResolver,c:AssetId,d:boolean?):string?local e=b:resolve(c)if not e or type(e)~='number'then
af.warn('Invalid asset id: '..tostring(e))return nil end local f=string.format(b.contentDownloadUrl,e)return b:
getAssetContentFromUrl(f,e,d)end return ag end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)
local ae={}function ae.contrastColor(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.5 then
Color3.fromRGB(0,0,0)else Color3.fromRGB(255,255,255)end function ae.toColorSequence(af:Color3|ColorSequence):
ColorSequence return if typeof(af)=='ColorSequence'then af else ColorSequence.new(af)end function ae.contrastText(af:
Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.6 then Color3.fromRGB(20,20,20)else Color3.
fromRGB(255,255,255)end return ae end)()end,[39]=function()local aa,ab,ac=a(39)local ad return(function(...)local ae,af=
ac(ab.Parent.layouts),{}export type Side='Left'|'Right'af.overlap=10 af.stackBelow=560 local ag=20 function af.pageWidth
(ah:number,ai:ae.Layout):number return math.max(ah-ae.railWidthFor(ai,ah)-ag,0)end function af.shouldStack(ah:number):
boolean return ah>0 and ah<af.stackBelow end function af.resolveSide(ah:unknown):Side?if ah==nil then return'Left'end if
ah==1 then return'Left'elseif ah==2 then return'Right'end if type(ah)~='string'then return nil end local ai=string.
lower(ah)if ai=='left'or ai=='l'then return'Left'elseif ai=='right'or ai=='r'then return'Right'end return nil end return
af end)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,
ag,ah,ai=ac(ae.variables),ac(ae.functions),ac(ae.locale),{}local function b(c:string?):string if type(c)~='string'or c==
''then return'?'end local d=utf8.offset(c,2)local e=if d then string.sub(c,1,d-1)else c return string.upper(e)end ai.
states={top={selected={background=0,stroke=0,content=0},hover={background=0.4,stroke=0.3,content=0.3},unselected={
background=0.8,stroke=0.65,content=0.5},hidden={background=1,stroke=1,content=1}},sidebar={selected={background=0.4,
stroke=0.5,content=0,shadow=0.8},hover={background=0.7,stroke=0.8,content=0.3,shadow=1},unselected={background=1,stroke=
1,content=0.5,shadow=1},hidden={background=1,stroke=1,content=1,shadow=1}}}local function c(d,e,f)d.topbarItemGradient=d
.window:Create('UIGradient',{Rotation=90,Parent=e},{Color={'TabBackground',ag.toColorSequence}})d.
topbarItemStrokeGradient=d.window:Create('UIGradient',{Rotation=90,Parent=f},{Color={'TabStroke',ag.toColorSequence}})
end local function d(e,f,g)if g and not e.icon then e.topbarItemInitial=e.window:Create('TextLabel',{Text=b(e.name),Size
=UDim2.fromOffset(f,f),BorderSizePixel=0,BackgroundTransparency=1,TextSize=f-4,TextXAlignment=Enum.TextXAlignment.Center
,TextYAlignment=Enum.TextYAlignment.Center,Visible=false,TextTransparency=1,Parent=e.topbarItemContainer},{TextColor3=
'TabColor',FontFace='Font'})end if e.icon then e.topbarItemIcon=e.window:Create('ImageLabel',{Image=e.icon,Size=UDim2.
fromOffset(f,f),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=e.topbarItemContainer},{
ImageColor3='TabColor'})end if e.name then e.topbarItemTitle=e.window:Create('TextLabel',{Text=ah.t(e.name),Size=UDim2.
fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.XY,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=e.topbarItemContainer},
{TextColor3='TabColor',FontFace='Font'})end end local function e(f)f.topbarItem=f.window:Create('Frame',{Name=f.name,
Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Visible=false,LayoutOrder=f.customOrder or 0,Parent=f.window.tabList})f.
topbarItemInteract=f.window:Create('TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Text='',TextTransparency=1,Parent=f.topbarItem})f.window:Create('UICorner',{Parent=f.topbarItem},{
CornerRadius='PillCornerRadius'})f.topbarItemStroke=f.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.
Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=f.topbarItem})c(f,f.topbarItem,f.topbarItemStroke)f.
topbarItemContainer=f.window:Create('Frame',{Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,BorderSizePixel=0,Parent=f.topbarItem})f.window:Create('UIPadding',{PaddingLeft=UDim.new(0,13),
PaddingRight=UDim.new(0,14),Parent=f.topbarItemContainer})f.topbarItemLayout=f.window:Create('UIListLayout',{Padding=
UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f.topbarItemContainer})
d(f,16,false)end local function f(g,h)g.topbarItem=g.window:Create('Frame',{Name=g.name,Size=UDim2.new(1,-h.rowInset*2,0
,h.rowHeight),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=false,
LayoutOrder=g.customOrder or 0,Parent=g.window.tabList})g.topbarItemInteract=g.window:Create('TextButton',{Active=false,
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=g.topbarItem})g.
window:Create('UICorner',{CornerRadius=UDim.new(0,h.rowCornerRadius),Parent=g.topbarItem})g.topbarItemStroke=g.window:
Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=g
.topbarItem})c(g,g.topbarItem,g.topbarItemStroke)g.topbarItemShadow=g.window:Create('UIShadow',{BlurRadius=UDim.new(0,20
),Color=Color3.fromRGB(255,255,255),Offset=UDim2.new(0,0,0,-15),Spread=UDim2.new(0,10,0,-30),ZIndex=-1,Transparency=1,
Parent=g.topbarItem})g.topbarItemContainer=g.window:Create('Frame',{Size=UDim2.new(1,-h.rowPadding,0,24),Position=UDim2.
new(0,h.rowPadding,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=g.topbarItem}
)g.topbarItemLayout=g.window:Create('UIListLayout',{Padding=UDim.new(0,h.rowContentSpacing),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=g.topbarItemContainer})d(g,h.rowIconSize,true)end function ai.build(g,h
)if h.mode=='sidebar'then f(g,h)else e(g)end end function ai.setRowCollapsed(g,h,i)if i.mode~='sidebar'or not g.
topbarItem then return end if g.topbarItemTitle then g.topbarItemTitle.Visible=not h end if g.topbarItemInitial then g.
topbarItemInitial.Visible=h end local j=if h then 0 else i.rowPadding g.topbarItemContainer.Size=UDim2.new(1,-j,0,24)g.
topbarItemContainer.Position=UDim2.new(0,j,0.5,0)g.topbarItemLayout.HorizontalAlignment=if h then Enum.
HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end function ai.applyVisual(g,h,i)local j={[g.topbarItem]=
{BackgroundTransparency=h.background},[g.topbarItemStroke]={Transparency=h.stroke}}if g.topbarItemIcon then j[g.
topbarItemIcon]={ImageTransparency=h.content}end if g.topbarItemTitle then j[g.topbarItemTitle]={TextTransparency=h.
content}end if g.topbarItemInitial then j[g.topbarItemInitial]={TextTransparency=h.content}end if g.topbarItemShadow and
h.shadow then j[g.topbarItemShadow]={Transparency=h.shadow}end for k,l in j do if i then af.tweenService:Create(k,i,l):
Play()else for m,n in l do k[m]=n end end end end return ai end)()end,[4]=function()local aa,ab,ac=a(4)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='Button'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d=ac(af.
variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(e,f)f=if
typeof(f)=='table'then f else{}local g=setmetatable({tab=assert(e,'Missing argument #1 (Tab expected)'),window=e.window,
name=f.name or f.Name or'Button',icon=f.icon or f.Icon,description=f.description or f.Description,compact=e.compact or
false,callback=f.callback or f.Callback or function()end},ae)if g.compact then g:_buildCompact()else g:_buildFull()end
if g.description and not g.compact then g.descriptor=ac(ab.Parent.descriptor).new(g.tab,{description=g.description})end
return g end function ae._runCallback(e)e.window:_runGuarded(e,e.callback)end function ae._buildFull(e)e.main=e.window:
Create('Frame',{Size=UDim2.new(1,-20,0,43),BorderSizePixel=0,Name=e.name,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=e.tab.tabPage},{BackgroundTransparency='ElementTransparency'})e.stroke=e.window:
StyleElementBody(e.main)e.hoverOverlay=e.window:CreateHoverOverlay(e.main)e.container=e.window:Create('Frame',{
BorderSizePixel=0,Parent=e.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5)
,BackgroundTransparency=1})e.containerLayout=e.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,Parent=e.container})if e.icon then e.iconLabel=e.window:Create('ImageLabel',{Image=e.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=e.container},{ImageColor3='ContentColor'})end
e.title=e.window:Create('TextLabel',{Text=c.t(e.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=e.container},{TextColor3='ContentColor',FontFace='Font'})e.
interact=e.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=
UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=e.main})e.window:_wireElementHover(e
)e.window:ConnectFor(e,e.interact.MouseButton1Click,function()d.click()ag.tweenService:Create(e.stroke,TweenInfo.new(
0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()ag.tweenService:Create(e.main,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,43)}):Play()e:_runCallback()task.
wait(0.11)ag.tweenService:Create(e.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=
UDim2.new(1,-20,0,43)}):Play()ag.tweenService:Create(e.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=e.window.theme.ElementStrokeTransparency}):Play()end)end function ae._buildCompact(e)
local f=e.window e.main,e.stroke,e.interact=f:_buildCompactRow(e.tab,e.name)e.hoverOverlay=e.interact f:Create(
'UIPadding',{PaddingLeft=UDim.new(0,16),PaddingRight=UDim.new(0,16),Parent=e.interact})f:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Padding=UDim.new(0,6),Parent=e.interact})if e.icon then e.iconLabel=f:Create('ImageLabel',{
Image=e.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,
Parent=e.interact},{ImageColor3='ContentColor'})end e.title=f:Create('TextLabel',{Text=c.t(e.name),Size=UDim2.
fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=e.
interact},{TextColor3='ContentColor',FontFace='Font'})f:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=e.
title})e.window:_wireElementHover(e)e.window:ConnectFor(e,e.interact.MouseButton1Click,function()d.click()ag.
tweenService:Create(e.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play(
)e:_runCallback()task.wait(0.11)ag.tweenService:Create(e.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=e.window.theme.ElementStrokeTransparency}):Play()end)end function ae._setShown(e,f,g)
if f then e.window:_revealCommon(e,g)else e.window:_hideCommon(e,g)end end function ae._minWidth(e)local f=32 if e.icon
then f+=22 end f+=ah.textWidth(e.window.theme.Font,16,c.resolve(e.name))return f end ai(ae)b(ae)return ae end)()end,[28]
=function()local aa,ab,ac=a(28)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Text'local af,ag,ah,ai,b
=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale),16,14,0.45 function ae.new(c,d)d=if typeof(d)
=='table'then d else{}local e=setmetatable({tab=assert(c,'Missing argument #1 (Tab expected)'),window=c.window,name=
tostring(d.name or d.Name or''),text=tostring(d.text or d.Text or''),icon=d.icon or d.Icon},ae)e.main=e.window:Create(
'Frame',{Size=UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name=if e.name~=''then e.name
else'Text',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=e.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})e.stroke=e.window:StyleElementBody(e.main)e.window:Create('UIPadding',{
PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=e.
main})e.window:Create('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.main})e.
titleRow=e.window:Create('Frame',{Name='Title',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=1,Parent=e.main})e.window:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.
VerticalAlignment.Top,Parent=e.titleRow})if e.icon then e.iconLabel=e.window:Create('ImageLabel',{Image=e.icon,Size=
UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=e.titleRow},{ImageColor3=
'ContentColor'})end e.title=e.window:Create('TextLabel',{Text=ag.t(e.name),Size=UDim2.new(1,if e.icon then-22 else 0,0,0
),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ah,TextWrapped=
true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,TextTransparency=1,Parent=e.titleRow},{TextColor3=
'TitlingColor',FontFace='Font'})e.body=e.window:Create('TextLabel',{Text=ag.t(e.text),Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ai,TextWrapped=true
,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=e.main},{TextColor3='ContentColor',
FontFace='Font'})e:_applyPresence()return e end function ae._applyPresence(c)c.titleRow.Visible=c.name~=''or c.icon~=nil
c.body.Visible=c.text~=''end function ae.Set(c,d)c.text=tostring(d)c.window:_bindLocale(c.body,'Text',c.text)c:
_applyPresence()end function ae.SetTitle(c,d)c.name=tostring(d)c.window:_bindLocale(c.title,'Text',c.name)c:
_applyPresence()end function ae._setShown(c,d,e)if d then c.window:_revealCommon(c,e)else c.window:_hideCommon(c,e)end c
.window:_reveal(c.body,{TextTransparency=if d then b else 1},e)end af(ae)return ae end)()end,[56]=function()local aa,ab,
ac=a(56)local ad return(function(...)type OrderedElement={main:GuiObject,descriptor:{main:GuiObject}?}local function ae(
af:OrderedElement,ag:number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.main.LayoutOrder=ag+1 end end
return ae end)()end,[6]=function()local aa,ab,ac=a(6)local ad return(function(...)local ae={}ae.__index=ae ae.__type=
'ColorPicker'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q=ac(af.variables),ac(af.
functions),ac(af.moveable),ac(af.lockable),ac(af.constants),ac(af.locale),ac(af.HapticEngine),ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),
ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),
ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))},41,52,Vector2.new(150,120),184,10,214,10,240,62,8,400 local r,s,t,
u,v,w,x,y={wide={height=190,previewPos=UDim2.new(1,-20,0,h+39),previewSize=UDim2.new(1,-(n+20),0,78),hexPos=UDim2.new(0,
n,0,h+90),hexSize=UDim2.new(1,-(n+20+o+p),0,30),alphaFieldPos=UDim2.new(1,-(20+o),0,h+90),alphaFieldSize=UDim2.new(0,o,0
,30)},narrow={height=296,previewPos=UDim2.new(1,-20,0,h+i.Y+40),previewSize=UDim2.new(1,-40,0,56),hexPos=UDim2.new(0,20,
0,h+i.Y+78),hexSize=UDim2.new(1,-(40+o+p),0,30),alphaFieldPos=UDim2.new(1,-(20+o),0,h+i.Y+78),alphaFieldSize=UDim2.new(0
,o,0,30)}},UDim2.new(1,-16,0,g/2),UDim2.fromOffset(40,22),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.12,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function z(A)return math.clamp(A,0,1)end
local function A(B)return math.clamp(math.round(B),0,255)end local B={black=Color3.fromRGB(0,0,0),white=Color3.fromRGB(
255,255,255),red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(0,255,0),blue=Color3.fromRGB(0,0,255),yellow=Color3.
fromRGB(255,255,0),cyan=Color3.fromRGB(0,255,255),magenta=Color3.fromRGB(255,0,255),orange=Color3.fromRGB(255,165,0),
purple=Color3.fromRGB(128,0,128),pink=Color3.fromRGB(255,105,180),brown=Color3.fromRGB(139,69,19),gray=Color3.fromRGB(
128,128,128),grey=Color3.fromRGB(128,128,128)}local function C(D,E,F)if E<=0 then return Color3.new(F,F,F)end
local function G(H,I,J)J=J%1 if J<0.16666666666666666 then return H+(I-H)*6*J elseif J<0.5 then return I elseif J<
0.6666666666666666 then return H+(I-H)*(0.6666666666666666-J)*6 end return H end local H=if F<0.5 then F*(1+E)else F+E-F
*E local I=2*F-H return Color3.new(G(I,H,D+0.3333333333333333),G(I,H,D),G(I,H,D-0.3333333333333333))end local function D
(E)local F={}for G in E:gmatch'[%d%.]+'do table.insert(F,tonumber(G))end return F end local function E(F)if typeof(F)~=
'string'then return nil end local G=(F:lower():match'^%s*(.-)%s*$')or''if G==''then return nil end if B[G]then return B[
G]end local H,I=G:match'^(%a+)',D(G)if(H=='hsv'or H=='hsb')and#I>=3 then local J,K,L=(I[1]%360)/360,if I[2]>1 then I[2]/
100 else I[2],if I[3]>1 then I[3]/100 else I[3]return Color3.fromHSV(J,z(K),z(L))end if H=='hsl'and#I>=3 then local J,K,
L=(I[1]%360)/360,if I[2]>1 then I[2]/100 else I[2],if I[3]>1 then I[3]/100 else I[3]return C(J,z(K),z(L))end if(H=='rgb'
or H=='rgba')and#I>=3 then return Color3.fromRGB(A(I[1]),A(I[2]),A(I[3]))end local J=G:match'^#?(%x%x%x%x%x%x)$'or G:
match'^#?(%x%x%x)$'or G:match'^0x(%x%x%x%x%x%x)$'if J then local K,L=pcall(Color3.fromHex,J)if K then return L end end
if#I>=3 and not H then if I[1]<=1 and I[2]<=1 and I[3]<=1 then return Color3.new(z(I[1]),z(I[2]),z(I[3]))end return
Color3.fromRGB(A(I[1]),A(I[2]),A(I[3]))end return nil end local function F(G,H)if typeof(G)=='Color3'then return G end
if typeof(G)=='string'then return E(G)or H end return H end function ae.new(G,H)H=if typeof(H)=='table'then H else{}
local I=setmetatable({tab=assert(G,'Missing argument #1 (Tab expected)'),window=G.window,name=H.name or H.Name or
'Color Picker',icon=H.icon or H.Icon,description=H.description or H.Description,forgetState=H.forgetState or H.
ForgetState or G.forgetState,callback=H.callback or H.Callback or function()end,_isOpen=false},ae)I.value=F(H.color or H
.Color or H.value or H.Value or H.default,Color3.fromRGB(255,255,255))I.hue,I.sat,I.val=I.value:ToHSV()local J=H.alpha
or H.Alpha I.alpha=if type(J)=='number'then z(J)else 1 I.flag=H.flag or H.Flag or(not I.forgetState and ah.
deriveFlagFromName(I.name)or nil)I.window:_registerControl(I)I.main=I.window:Create('Frame',{Size=UDim2.new(1,-20,0,g),
BorderSizePixel=0,Name=I.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=I.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})I.stroke=I.window:StyleElementBody(I.main)I.hoverOverlay=I.window:
CreateHoverOverlay(I.main)I:_buildHeader()I:_buildPicker()I.window:ConnectFor(I,I.interact.MouseButton1Click,function()e
.click()if I._isOpen then I:_close()else I:_open()end end)I.window:ConnectFor(I,I.main.MouseEnter,function()if I._isOpen
or not I.window:_interactive()then return end local K=I.window.theme ag.tweenService:Create(I.stroke,v,{Transparency=K.
ElementStrokeHoverTransparency,Color=K.ElementStrokeHover}):Play()ag.tweenService:Create(I.title,v,{TextColor3=K.
ElementTextHoverColor}):Play()ag.tweenService:Create(I.hoverOverlay,v,{BackgroundTransparency=0.97}):Play()end)I.window:
ConnectFor(I,I.main.MouseLeave,function()local K=I.window.theme ag.tweenService:Create(I.stroke,v,{Transparency=K.
ElementStrokeTransparency,Color=K.ElementStroke}):Play()ag.tweenService:Create(I.title,v,{TextColor3=K.ContentColor}):
Play()ag.tweenService:Create(I.hoverOverlay,v,{BackgroundTransparency=1}):Play()end)if I.description then I.descriptor=
ac(ab.Parent.descriptor).new(I.tab,{description=I.description})end I:_applyPickerVisibility(false,false)I:
_setControlsVisible(false)I.window:ConnectFor(I,I.main:GetPropertyChangedSignal'AbsoluteSize',function()if I.window.
animating or(I.window.hidden and I.window.hasShownOnce)then return end I:_applyLayout()end)I:_applyLayout()I:_render
'instant'return I end function ae._buildHeader(G)G.container=G.window:Create('Frame',{Size=UDim2.new(0,170,0,16),
Position=UDim2.new(0,20,0,g/2),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent
=G.main})G.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=G.container})if G.icon then
G.iconLabel=G.window:Create('ImageLabel',{Image=G.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=G.container},{ImageColor3='ContentColor'})end G.title=G.
window:Create('TextLabel',{Text=d.t(G.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=G.container},{TextColor3='ContentColor',FontFace='Font'})G.preview=G.window:Create('Frame',{
AnchorPoint=Vector2.new(1,0.5),Position=s,Size=t,BackgroundColor3=G.value,BorderSizePixel=0,ZIndex=3,
BackgroundTransparency=1,Parent=G.main})G.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=G.preview})G.
previewShadow=G.window:CreateGlow(G.preview,G.value,20,1)G.invisibleGroup=G.window:Create('Frame',{Size=UDim2.fromScale(
1,1),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,
ZIndex=5,Parent=G.preview})G.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment
=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,6),SortOrder=Enum.
SortOrder.LayoutOrder,Parent=G.invisibleGroup})G.invisibleIcon=G.window:Create('ImageLabel',{Image=c.icons.colorpicker,
Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,ImageTransparency=1,Parent=G.
invisibleGroup},{ImageColor3='ContentColor'})G.invisibleText=G.window:Create('TextLabel',{Text=d.t'Invisible',Size=UDim2
.fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,LayoutOrder=
1,ZIndex=5,TextTransparency=1,Parent=G.invisibleGroup},{TextColor3='ContentColor',FontFace='Font'})G.interact=G.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,g),Position=UDim2.fromScale(0,0),BorderSizePixel=0,
Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=10,Parent=G.main})end function ae._buildMap(G)G.map=G.window:
Create('Frame',{Position=UDim2.fromOffset(20,h),Size=UDim2.fromOffset(i.X,i.Y),BackgroundColor3=Color3.fromHSV(G.hue,1,1
),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=G.main})G.window:Create('UICorner',{CornerRadius=UDim.new(0
,8),Parent=G.map})G.mapStroke=G.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=G.map}
)G.satOverlay=G.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=G.map})G.window:Create('UICorner',{CornerRadius=UDim.new(0,8)
,Parent=G.satOverlay})G.window:Create('UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)},Parent=G.satOverlay})G.valOverlay=G.window:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=G.map})G.window:
Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=G.valOverlay})G.window:Create('UIGradient',{Rotation=90,
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)},Parent=G.valOverlay})
end function ae._buildPicker(G)G:_buildMap()G.satCursor=G.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=
UDim2.fromOffset(12,12),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=6,BackgroundTransparency=1
,Parent=G.map})G.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=G.satCursor})G.satCursorStroke=G.window:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=G.satCursor})G.mapInteract=G.
window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,
AutoButtonColor=false,ZIndex=7,Parent=G.map})G.hueBar=G.window:Create('Frame',{Position=UDim2.fromOffset(j,h),Size=UDim2
.fromOffset(k,i.Y),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,
Parent=G.main})G.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=G.hueBar})G.window:Create('UIGradient',{
Color=f,Rotation=90,Parent=G.hueBar})G.hueHandle=G.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(k+8,8),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=
4,BackgroundTransparency=1,Parent=G.hueBar})G.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=G.hueHandle})G
.hueHandleStroke=G.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=G.
hueHandle})G.hueInteract=G.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=G.
hueBar})G.alphaBar=G.window:Create('Frame',{Position=UDim2.fromOffset(l,h),Size=UDim2.fromOffset(m,i.Y),BackgroundColor3
=G.value,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=G.main})G.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=G.alphaBar})G.alphaGradient=G.window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)},Parent=G.alphaBar})G.alphaHandle=G.window:Create(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(m+8,8),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=G.alphaBar})G.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=G.alphaHandle})G.alphaHandleStroke=G.window:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=G.alphaHandle})G.alphaInteract=G.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.
new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=G.alphaBar})G.hexBox=G.window:Create(
'Frame',{Position=UDim2.new(0,n,0,h+90),Size=UDim2.new(1,-(n+20),0,30),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=G.main})G.window:Create('UICorner',{CornerRadius=UDim.new(0,8
),Parent=G.hexBox})G.hexBoxStroke=G.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=G.
hexBox})G.hexInput=G.window:Create('TextBox',{Text='#'..G.value:ToHex():upper(),PlaceholderText=d.t'Smart Input',Size=
UDim2.new(1,-14,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency
=1,Parent=G.hexBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})G.alphaBox=G.window
:Create('Frame',{Position=UDim2.new(0,n,0,h+90),Size=UDim2.fromOffset(o,30),BackgroundColor3=Color3.fromRGB(255,255,255)
,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=G.main})G.window:Create('UICorner',{CornerRadius=UDim.new(0,
8),Parent=G.alphaBox})G.alphaBoxStroke=G.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,
Parent=G.alphaBox})G.alphaInput=G.window:Create('TextBox',{Text=tostring(math.round(G.alpha*100))..'%',PlaceholderText=
'100%',Size=UDim2.new(1,-10,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,
ZIndex=3,TextTransparency=1,Parent=G.alphaBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3=
'PlaceholderColor'})G.window:ConnectFor(G,G.mapInteract.InputBegan,function(H)if H.UserInputType==Enum.UserInputType.
MouseButton1 or H.UserInputType==Enum.UserInputType.Touch then G:_beginDrag('sat',H.UserInputType==Enum.UserInputType.
MouseButton1)end end)G.window:ConnectFor(G,G.hueInteract.InputBegan,function(H)if H.UserInputType==Enum.UserInputType.
MouseButton1 or H.UserInputType==Enum.UserInputType.Touch then G:_beginDrag('hue',H.UserInputType==Enum.UserInputType.
MouseButton1)end end)G.window:ConnectFor(G,G.alphaInteract.InputBegan,function(H)if H.UserInputType==Enum.UserInputType.
MouseButton1 or H.UserInputType==Enum.UserInputType.Touch then G:_beginDrag('alpha',H.UserInputType==Enum.UserInputType.
MouseButton1)end end)G.window:ConnectFor(G,ag.userInputService.InputEnded,function(H)if(H.UserInputType==Enum.
UserInputType.MouseButton1 or H.UserInputType==Enum.UserInputType.Touch)and G._drag then G:_endDrag()end end)G.window:
ConnectFor(G,G.hexInput.FocusLost,function()local H=E(G.hexInput.Text)if H then G:Set(H)else G.hexInput.Text='#'..G.
value:ToHex():upper()end end)G.window:ConnectFor(G,G.alphaInput.FocusLost,function()local H=tonumber((G.alphaInput.Text:
gsub('[^%d%.]','')))if H then G:SetAlpha(z(H/100))else G.alphaInput.Text=tostring(math.round(G.alpha*100))..'%'end end)
end function ae._beginDrag(G,H,I)if not G._isOpen then return end G._drag=H G._dragIsMouse=I G:_setHeld(H)G:_pump()if G.
_dragConnection then G._dragConnection:Disconnect()G._dragConnection=nil end G._dragConnection=ag.runService.
RenderStepped:Connect(function()local J=G._dragIsMouse and not ag.userInputService:IsMouseButtonPressed(Enum.
UserInputType.MouseButton1)if G.window.unloaded or not G._drag or J then if J then G:_endDrag()return end if G.
_dragConnection then G._dragConnection:Disconnect()G._dragConnection=nil end return end G:_pump()end)end function ae.
_endDrag(G)G._drag=nil G:_setHeld(nil)if G._dragConnection then G._dragConnection:Disconnect()G._dragConnection=nil end
G.window:_persist(G)end function ae._setHeld(G,H)local I,J,K=if H=='sat'then UDim2.fromOffset(16,16)else UDim2.
fromOffset(12,12),if H=='hue'then UDim2.fromOffset(k+12,10)else UDim2.fromOffset(k+8,8),if H=='alpha'then UDim2.
fromOffset(m+12,10)else UDim2.fromOffset(m+8,8)ag.tweenService:Create(G.satCursor,y,{Size=I}):Play()ag.tweenService:
Create(G.hueHandle,y,{Size=J}):Play()ag.tweenService:Create(G.alphaHandle,y,{Size=K}):Play()end function ae.
_mouseLocation(G)local H,I=ag.userInputService:GetMouseLocation(),G.window.screenGui if I and I.IgnoreGuiInset then
return H-ag.guiService:GetGuiInset()end return H end function ae._pump(G)local H,I,J,K=G.hue,G.sat,G.val,G.alpha if G.
_drag=='sat'then local L=G.map.AbsoluteSize if L.X<=0 or L.Y<=0 then return end local M=G:_mouseLocation()G.sat=z((M.X-G
.map.AbsolutePosition.X)/L.X)G.val=1-z((M.Y-G.map.AbsolutePosition.Y)/L.Y)elseif G._drag=='hue'then local L=G.hueBar.
AbsoluteSize.Y if L<=0 then return end local M=G:_mouseLocation()G.hue=z((M.Y-G.hueBar.AbsolutePosition.Y)/L)elseif G.
_drag=='alpha'then local L=G.alphaBar.AbsoluteSize.Y if L<=0 then return end local M=G:_mouseLocation()G.alpha=1-z((M.Y-
G.alphaBar.AbsolutePosition.Y)/L)else return end if G.hue==H and G.sat==I and G.val==J and G.alpha==K then return end G.
value=Color3.fromHSV(G.hue,G.sat,G.val)G:_render'drag'G:_fireCallback()end function ae._render(G,H)local I,J,K,L,M,N=
Color3.fromHSV(G.hue,1,1),UDim2.new(G.sat,0,1-G.val,0),UDim2.new(0.5,0,G.hue,0),UDim2.new(0.5,0,1-G.alpha,0),1-G.alpha,1
-0.4*G.alpha if H=='instant'then G.map.BackgroundColor3=I G.satCursor.Position,G.satCursor.BackgroundColor3=J,G.value G.
hueHandle.Position,G.hueHandle.BackgroundColor3=K,I G.alphaBar.BackgroundColor3=G.value G.alphaHandle.Position,G.
alphaHandle.BackgroundColor3=L,G.value G.preview.BackgroundColor3=G.value G.previewShadow.Color=G.value if not G.window.
hidden then G.preview.BackgroundTransparency=M G.previewShadow.Transparency=N end else local O=if H=='drag'then x else w
ag.tweenService:Create(G.map,O,{BackgroundColor3=I}):Play()ag.tweenService:Create(G.satCursor,O,{Position=J,
BackgroundColor3=G.value}):Play()ag.tweenService:Create(G.hueHandle,O,{Position=K,BackgroundColor3=I}):Play()ag.
tweenService:Create(G.alphaHandle,O,{Position=L,BackgroundColor3=G.value}):Play()ag.tweenService:Create(G.alphaBar,w,{
BackgroundColor3=G.value}):Play()local P,Q={BackgroundColor3=G.value},{Color=G.value}if not G.window.hidden then P.
BackgroundTransparency=M Q.Transparency=N end ag.tweenService:Create(G.preview,w,P):Play()ag.tweenService:Create(G.
previewShadow,w,Q):Play()end if not G.hexInput:IsFocused()then G.hexInput.Text='#'..G.value:ToHex():upper()end if not G.
alphaInput:IsFocused()then G.alphaInput.Text=tostring(math.round(G.alpha*100))..'%'end G:_renderInvisible(H~='instant')
end function ae._renderInvisible(G,H)local I=0 if G._isOpen and not G.window.hidden then I=z((0.12-G.alpha)/0.12)end
local J=1-I if H then ag.tweenService:Create(G.invisibleIcon,v,{ImageTransparency=J}):Play()ag.tweenService:Create(G.
invisibleText,v,{TextTransparency=J}):Play()else G.invisibleIcon.ImageTransparency=J G.invisibleText.TextTransparency=J
end end function ae._fireCallback(G)G.window:_runGuarded(G,G.callback,G.value,G.alpha)end function ae._open(G)if G.
_isOpen then return end G._isOpen=true G:_setControlsVisible(true)if G._outsideClickConn then G.window:Disconnect(G.
_outsideClickConn)end G._outsideClickConn=G.window:Connect(ag.userInputService.InputBegan,function(H)if H.UserInputType
~=Enum.UserInputType.MouseButton1 and H.UserInputType~=Enum.UserInputType.Touch then return end local I,J,K=H.Position,G
.main.AbsolutePosition,G.main.AbsoluteSize if I.X<J.X or I.X>J.X+K.X or I.Y<J.Y or I.Y>J.Y+K.Y then G:_close()end end)ag
.tweenService:Create(G.main,u,{Size=UDim2.new(1,-20,0,G._openHeight)}):Play()ag.tweenService:Create(G.preview,u,{
Position=G._previewOpenPos,Size=G._previewOpenSize}):Play()G:_applyPickerVisibility(true,true)G:_renderInvisible(true)
end function ae._close(G)if not G._isOpen then return end G._isOpen=false if G._outsideClickConn then G.window:
Disconnect(G._outsideClickConn)G._outsideClickConn=nil end if G._drag then G:_endDrag()end if G.hexInput:IsFocused()then
G.hexInput:ReleaseFocus()end if G.alphaInput:IsFocused()then G.alphaInput:ReleaseFocus()end G:_applyPickerVisibility(
false,true)G:_renderInvisible(true)ag.tweenService:Create(G.preview,u,{Position=s,Size=t}):Play()ag.tweenService:Create(
G.main,u,{Size=UDim2.new(1,-20,0,g)}):Play()task.delay(v.Time,function()if not G._isOpen then G:_setControlsVisible(
false)end end)end function ae._applyPickerVisibility(G,H,I)local J={[G.map]={BackgroundTransparency=if H then 0 else 1},
[G.satOverlay]={BackgroundTransparency=if H then 0 else 1},[G.valOverlay]={BackgroundTransparency=if H then 0 else 1},[G
.mapStroke]={Transparency=if H then 0.9 else 1},[G.satCursor]={BackgroundTransparency=if H then 0 else 1},[G.
satCursorStroke]={Transparency=if H then 0 else 1},[G.hueBar]={BackgroundTransparency=if H then 0 else 1},[G.hueHandle]=
{BackgroundTransparency=if H then 0 else 1},[G.hueHandleStroke]={Transparency=if H then 0 else 1},[G.alphaBar]={
BackgroundTransparency=if H then 0 else 1},[G.alphaHandle]={BackgroundTransparency=if H then 0 else 1},[G.
alphaHandleStroke]={Transparency=if H then 0 else 1},[G.hexBox]={BackgroundTransparency=if H then 0.9 else 1},[G.
hexBoxStroke]={Transparency=if H then 0.85 else 1},[G.hexInput]={TextTransparency=if H then 0.4 else 1},[G.alphaBox]={
BackgroundTransparency=if H then 0.9 else 1},[G.alphaBoxStroke]={Transparency=if H then 0.85 else 1},[G.alphaInput]={
TextTransparency=if H then 0.4 else 1}}for K,L in J do if I then ag.tweenService:Create(K,v,L):Play()else for M,N in L
do K[M]=N end end end end function ae._setControlsVisible(G,H)for I,J in{G.map,G.hueBar,G.alphaBar,G.hexBox,G.alphaBox}
do J.Visible=H end end function ae._applyLayout(G)local H=G.main.AbsoluteSize.X local I=if H>0 and H<q then'narrow'else
'wide'if I==G._layoutMode then return end G._layoutMode=I local J=r[I]G._openHeight=J.height G._previewOpenPos=J.
previewPos G._previewOpenSize=J.previewSize G.hexBox.Position=J.hexPos G.hexBox.Size=J.hexSize G.alphaBox.Position=J.
alphaFieldPos G.alphaBox.Size=J.alphaFieldSize if G._isOpen then ag.tweenService:Create(G.main,u,{Size=UDim2.new(1,-20,0
,G._openHeight)}):Play()ag.tweenService:Create(G.preview,u,{Position=G._previewOpenPos,Size=G._previewOpenSize}):Play()
end end function ae.Set(G,H,I)G.value=F(H,G.value)G.hue,G.sat,G.val=G.value:ToHSV()G:_render(if G._isOpen then'animate'
else'instant')if not I then G:_fireCallback()G.window:_persist(G)end end function ae.SetAlpha(G,H,I)G.alpha=z(if type(H)
=='number'then H else G.alpha)G:_render(if G._isOpen then'animate'else'instant')if not I then G:_fireCallback()G.window:
_persist(G)end end function ae._serialize(G)return G.value:ToHex()..string.format('%02x',math.clamp(math.round((G.alpha
or 1)*255),0,255))end function ae._deserialize(G,H)local I,J=(tostring(H))if#I>=8 then J=(tonumber(I:sub(7,8),16)or 255)
/255 I=I:sub(1,6)end local K,L=pcall(Color3.fromHex,I)if not K then return end if J then G:SetAlpha(J,true)end G:Set(L)
end function ae._setShown(G,H,I)local J=G.window if H then J:_revealCommon(G,I)J:_reveal(G.preview,{
BackgroundTransparency=1-G.alpha},I)J:_reveal(G.previewShadow,{Transparency=1-0.4*G.alpha},I)else J:_hideCommon(G,I)J:
_reveal(G.preview,{BackgroundTransparency=1},I)J:_reveal(G.previewShadow,{Transparency=1},I)if G._isOpen then G:_close()
end end end ai(ae)b(ae)return ae end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(function(...)local ae,af,
ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string return ah..ag end function af.write(ah
:string,ai:string,b:string)local c=af.tempPathFor(ai)ae.ensureDir(ah)ae.writefile(c,b)if ae.readfile(c)~=b then error
'parked copy did not write cleanly'end ae.writefile(ai,b)pcall(ae.delfile,c)end return af end)()end,[19]=function()local
aa,ab,ac=a(19)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,b,c,d,e=ac(ae.variables),
ac(ae.constants),ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),0.6,0.2 local function f(g)if g.__type=='Group'then local h={}local function i(j)for k,l in j.elements do if l.
__type=='Group'then i(l)elseif l.name then table.insert(h,l.name)end end end i(g)return table.concat(h,'\n')end return g
.name or''end local function g(h)local i={}for j,k in h.tabs do if k.neglectSelector then continue end for l,m in k.
elements do if m.__type~='Section'then table.insert(i,m)end end end return i end local function h(i,j,k)af.tweenService:
Create(i.searchPill,k,{BackgroundTransparency=if j then 0.9 else 1}):Play()af.tweenService:Create(i.searchStroke,k,{
Transparency=if j then 0.85 else 1}):Play()af.tweenService:Create(i.searchShadow,k,{Transparency=if j then 0.92 else 1})
:Play()af.tweenService:Create(i.searchIcon,k,{ImageTransparency=if j then 0.65 else 1}):Play()af.tweenService:Create(i.
searchInput,k,{TextTransparency=if j then 0.2 else 1}):Play()end local function i(j,k,l)if j.layout.mode=='sidebar'then
return end for m,n in j.tabs do if not n.neglectSelector and n.topbarItem then n:_applyVisual(if k then(if j.selectedTab
==n then'selected'else'unselected')else'hidden',l)end end end local function j(k,l)l=string.lower(l or'')local m=false
for n,o in k._searchUnits do local p=l==''or string.find(o.text,l,1,true)~=nil o.unit.main.Visible=p if o.unit.
descriptor then o.unit.descriptor.main.Visible=p end m=m or p end k.searchEmpty.Visible=not m and l~=''end
local function k(l)l._searchUnits={}local m=0 for n,o in g(l)do m+=1 local p=o.main table.insert(l._searchUnits,{unit=o,
text=string.lower(f(o)),homeParent=p.Parent,homeOrder=p.LayoutOrder,descOrder=o.descriptor and o.descriptor.main.
LayoutOrder})p.LayoutOrder=m*10 p.Parent=l.searchPage p.Visible=true if o.descriptor then o.descriptor.main.LayoutOrder=
m*10+1 o.descriptor.main.Parent=l.searchPage o.descriptor.main.Visible=true end end end local function l(m)for n,o in m.
_searchUnits do local p=o.unit if p.main and p.main.Parent then p.main.LayoutOrder=o.homeOrder p.main.Parent=o.
homeParent p.main.Visible=true end if p.descriptor and p.descriptor.main and p.descriptor.main.Parent then p.descriptor.
main.LayoutOrder=o.descOrder p.descriptor.main.Parent=o.homeParent p.descriptor.main.Visible=true end end m._searchUnits
={}end function b.open(m)if m._searching or m.minimised or not m:_interactive()then return end m._searching=true k(m)j(m
,'')m:_jumpTo(m.searchPage)i(m,false,c)task.delay(c.Time,function()if m._searching and m.layout.mode~='sidebar'then m.
tabList.Visible=false end end)m.searchPill.Visible=true h(m,true,c)m.searchInput:CaptureFocus()af.tweenService:Create(m.
searchAction.iconLabel,c,{ImageTransparency=e}):Play()end function b.close(m,n)if not m._searching then return end n=n
or{}m._searching=false m.searchInput.Text=''m.searchInput:ReleaseFocus()m.searchEmpty.Visible=false l(m)local o=if n.
jumpTo==nil then m.selectedTab and m.selectedTab.tabPage else n.jumpTo if o then m:_jumpTo(o)end h(m,false,c)task.delay(
c.Time,function()if not m._searching then m.searchPill.Visible=false end end)if n.showTabs then m.tabList.Visible=true
i(m,true,c)end af.tweenService:Create(m.searchAction.iconLabel,c,{ImageTransparency=d}):Play()end function b.toggle(m)if
m._searching then b.close(m,{showTabs=true})else b.open(m)end end function b.railWidth(m,n)if m.searchPill then m.
searchPill.Size=UDim2.new(1,-(n+30),0,35)end end function b.build(m)m._searching=false m.searchPage=m:Create(
'ScrollingFrame',{Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5
),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2000,Parent=m.elements})m:Create(
'UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.searchPage})m:
Create('UIPadding',{PaddingTop=UDim.new(0,if m.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),
Parent=m.searchPage})m.searchEmpty=m:Create('TextLabel',{Name='NoResults',Text=ah.t'No results',FontFace=af.brandFont(
Enum.FontWeight.Medium),TextSize=15,TextTransparency=0.6,BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.55,0),Size=UDim2.fromOffset(200,20),Visible=false,ZIndex=3,Parent=m.main},{TextColor3=
'ContentColor',FontFace='Font'})local n=m.layout.mode=='sidebar'local o=if n then m.layout.chromeHeight+8 else m.layout.
tabStripTop+1 m.searchPill=m:Create('Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if n then 1 else 0.5,0),Position=
UDim2.new(if n then 1 else 0.5,if n then-15 else 0,0,o),Size=UDim2.new(1,if n then-(m.layout.railWidth+30)else-35,0,35),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=m
.main})m:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=m.searchPill})m.searchStroke=m:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Thickness=1,Transparency=1,Parent=m.searchPill})m.searchShadow=m:Create('UIShadow',{
BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=m.searchPill})m.searchIcon=m
:Create('ImageLabel',{Image='rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,15,0.5,1),Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=m.searchPill}
,{ImageColor3='ContentColor'})m.searchInput=m:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,
TextTransparency=1,Parent=m.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'}
)m:Connect(m.searchInput:GetPropertyChangedSignal'Text',function()if m._searching then j(m,m.searchInput.Text)end end)m.
searchAction=ai.new(m,{name='Search',icon=ag.icons.search,order=4,callback=function()b.toggle(m)end})m.searchAction.
isLit=function()return m._searching end end return b end)()end,[15]=function()local aa,ab,ac=a(15)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='Keybind'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g=
ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.constants),ac(af.HapticEngine),ac(
af.enums),ac(af.log)local h,i,j=d.pillResizeInfo,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{[
Enum.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.MouseButton2]='MB2',[Enum.UserInputType.MouseButton3]='MB3'}
local function k(l)if typeof(l)~='EnumItem'or l==Enum.KeyCode.Unknown then return'None'end return j[l]or l.Name end
local function l(m)if typeof(m)=='EnumItem'then return m end if type(m)=='string'then local n,o=pcall(function()return
Enum.KeyCode[m]end)if n and o then return o end local p,q=pcall(function()return Enum.UserInputType[m]end)if p and q and
j[q]then return q end end return Enum.KeyCode.Unknown end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local
o=setmetatable({tab=assert(m,'Missing argument #1 (Tab expected)'),window=m.window,name=n.name or n.Name or'Keybind',
icon=n.icon or n.Icon,description=n.description or n.Description,forgetState=n.forgetState or n.ForgetState or m.
forgetState,isMenuToggle=n.isMenuToggle or n.IsMenuToggle or false,callback=n.callback or n.Callback or function()end,
onChanged=n.onChanged or n.OnChanged or function()end,hold=n.hold or n.Hold or false,holdThreshold=n.holdThreshold or n.
HoldThreshold or 0.2,recording=false},ae)o.value=l(n.value or n.Value or n.default or n.Default)o.flag=n.flag or n.Flag
or(not o.forgetState and ah.deriveFlagFromName(o.name)or nil)o.window:_registerControl(o)o.main=o.window:Create('Frame',
{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=o.name,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=o.tab.tabPage},{BackgroundTransparency='ElementTransparency'})o.stroke=o.window:
StyleElementBody(o.main)o.hoverOverlay=o.window:CreateHoverOverlay(o.main)o.container=o.window:Create('Frame',{Size=
UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=o.main})o.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=o.container})if o.icon then o.iconLabel=
o.window:Create('ImageLabel',{Image=o.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,
ZIndex=5,ImageTransparency=1,Parent=o.container},{ImageColor3='ContentColor'})end o.title=o.window:Create('TextLabel',{
Text=c.t(o.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,
Parent=o.container},{TextColor3='ContentColor',FontFace='Font'})o.box=o.window:Create('TextButton',{AnchorPoint=Vector2.
new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.fromOffset(40,30),AutoButtonColor=false,Text='',BorderSizePixel=0,
BackgroundTransparency=1,Parent=o.main},{BackgroundColor3='FieldBackground'})o.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=o.box})o.boxStroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.box},{Color='SurfaceStroke'}
)o.glow=o.window:CreateGlow(o.box,'FieldGlow',20,1)o._glowIdle=0.9 o.keyLabel=o.window:Create('TextLabel',{Text=k(o.
value),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.
TextXAlignment.Center,ZIndex=2,TextTransparency=1,Parent=o.box},{TextColor3='ContentColor',FontFace='Font'})o.window:
ConnectFor(o,o.box.MouseButton1Click,function()e.click()if o.recording then o:_stopRecording()else o:_startRecording()
end end)o.window:ConnectFor(o,ag.userInputService.InputBegan,function(p,q)if q then return end if o.recording then o:
_capture(p)return end if o.window._recordingKeybind then return end if o:_matches(p)then if o.hold then o:_beginHold(p)
else o.window:_runGuarded(o,o.callback,o.value)end end end)o.window:_wireElementHover(o)if o.description then o.
descriptor=ac(ab.Parent.descriptor).new(o.tab,{description=o.description})end o:_sizeBox(false)return o end function ae.
_sizeBox(m,n)local o=math.clamp(ah.textWidth(m.window.theme.Font,15,m.keyLabel.Text)+28,40,200)if n then ag.tweenService
:Create(m.box,h,{Size=UDim2.fromOffset(o,30)}):Play()else m.box.Size=UDim2.fromOffset(o,30)end end function ae.
_startRecording(m)local n=m.window._recordingKeybind if n and n~=m then n:_stopRecording()end m.recording=true m.window.
_recordingKeybind=m m.keyLabel.Text=c.resolve'Recording'm:_sizeBox(true)ag.tweenService:Create(m.glow,i,{Transparency=
0.7}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0}):Play()end function ae._stopRecording(m)m.recording
=false if m.window._recordingKeybind==m then local n=m.window task.defer(function()if n._recordingKeybind==m then n.
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
Out),{BackgroundTransparency=m.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[22]=function()
local aa,ab,ac=a(22)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.Parent.Parent.
utility local ag,ah,ai,b,c,d,e=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.lockable),ac(af.
locale),ac(af.HapticEngine)local function f(g)local h=0 while h<6 do local i=g*10^h if math.abs(i-math.round(i))<1e-9
then break end h+=1 end return h end local function g(h,i,j)local k=h[1]+math.round((j-h[1])/i)*i return math.clamp(k,h[
1],h[2])end local h,i,j,k,l,m=TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(
0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out),440,Vector2.new(35,20),Vector2.new(41,22)local function n(o:number):UDim2 return UDim2.new(o,0,1,0)end
local function o():UDim2 return UDim2.new(1,0,0.5,0)end local function p(q:number,r:number,s:number):number return math.
clamp((q-r)/s,0,1)end function ae.new(q,r)r=if typeof(r)=='table'then r else{}local s=setmetatable({tab=assert(q,
'Missing argument #1 (Tab expected)'),window=q.window,name=r.name or r.Name or'Slider',icon=r.icon or r.Icon,description
=r.description or r.Description,forgetState=r.forgetState or r.ForgetState or q.forgetState,range=r.range or r.Range or{
0,100},increment=r.increment or r.Increment or 1,suffix=r.suffix or r.Suffix or'',callback=r.callback or r.Callback or
function()end,dragging=false,minimal=r.minimal or r.Minimal or false,_handleWidth=l.X},ae)assert(typeof(s.range)==
'table'and typeof(s.range[1])=='number'and typeof(s.range[2])=='number',
'A slider range needs two numbers, like { 0, 100 }.')if s.range[1]>s.range[2]then s.range={s.range[2],s.range[1]}end if
s.increment<=0 then s.increment=1 end s.value=if(r.value or r.Value)~=nil then(r.value or r.Value)elseif(r.currentValue
or r.CurrentValue)~=nil then(r.currentValue or r.CurrentValue)else s.range[1]s.value=g(s.range,s.increment,s.value)s.
_decimals=f(s.increment)s.flag=r.flag or r.Flag or(not s.forgetState and ah.deriveFlagFromName(s.name)or nil)s.window:
_registerControl(s)s.main=s.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=s.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=s.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})s.stroke=s.window:StyleElementBody(s.main)s._lastValue=s.value if not s.minimal then s:
_buildLabel()end s.track=s.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=s.main},{BackgroundColor3='SliderBackground'}
)s.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=s.track})s.progress=s.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=s.track})s.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=s.progress})s.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=s.progress},{Color={
'SliderProgress',ah.toColorSequence}})s.progressGlow=s.window:CreateGlow(s.progress,'AccentColor',20,1)s.handle=s.window
:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=o(),Size=UDim2.fromOffset(l.X,l.Y),BorderSizePixel=0,ZIndex=
50,BackgroundTransparency=1,Parent=s.progress},{BackgroundColor3='SliderHandle'})s.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=s.handle})s.handleGlow=s.window:CreateGlow(s.handle,Color3.fromRGB(255,255,255),10,1)s
.handleStroke=s.window:Create('UIStroke',{Transparency=1,Parent=s.handle},{Color='SliderStroke'})s.interact=s.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=s.
track})s.window:ConnectFor(s,s.main.MouseEnter,function()if not s.window:_interactive()then return end ag.tweenService:
Create(s.track,h,{BackgroundColor3=s.window.theme.SliderBackgroundHover}):Play()end)s.window:ConnectFor(s,s.main.
MouseLeave,function()ag.tweenService:Create(s.track,h,{BackgroundColor3=s.window.theme.SliderBackground}):Play()end)s.
window:ConnectFor(s,s.interact.InputBegan,function(t)if t.UserInputType==Enum.UserInputType.MouseButton1 or t.
UserInputType==Enum.UserInputType.Touch then e.click()s.dragging=true s:_setHeld(true)s:_updateFromMouse()if s.
_dragConnection then s._dragConnection:Disconnect()s._dragConnection=nil end s._dragConnection=ag.runService.
RenderStepped:Connect(function()if s.window.unloaded or not s.dragging then if s._dragConnection then s._dragConnection:
Disconnect()s._dragConnection=nil end return end s:_updateFromMouse()end)end end)s.window:ConnectFor(s,ag.
userInputService.InputEnded,function(t)if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.
UserInputType.Touch then s:_endDrag()end end)s.window:ConnectFor(s,ag.userInputService.WindowFocusReleased,function()s:
_endDrag()end)if s.description and not s.minimal then s.descriptor=ac(ab.Parent.descriptor).new(s.tab,{description=s.
description})end s.window:ConnectFor(s,s.main:GetPropertyChangedSignal'AbsoluteSize',function()if s.window.animating or(
s.window.hidden and s.window.hasShownOnce)then return end s:_applyLayout()end)s:_applyLayout()if s.minimal then s.main.
Size=UDim2.new(1,-20,0,41)s.track.AnchorPoint=Vector2.new(0.5,0.5)s.track.Position=UDim2.new(0.5,0,0.5,0)s.track.Size=
UDim2.new(1,-30,0,14)end s:_renderProgress()return s end function ae._buildLabel(q)q.container=q.window:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=q.main})q.containerLayout=q.window:Create('UIListLayout',{Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=q.container})q.
titleContainer=q.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,
Parent=q.container})q.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=q.titleContainer})q.
titleFlex=q.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=q.titleContainer})if q.icon then q.
iconLabel=q.window:Create('ImageLabel',{Image=q.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=q.titleContainer},{ImageColor3='ContentColor'})end q.title=
q.window:Create('TextLabel',{Text=d.t(q.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=q.titleContainer},{TextColor3='ContentColor',FontFace='Font'})q.window:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=q.title})q.valueHost=q.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=q.container})q.valueOdo=ai.new(q.window,q.
valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})q.valueOdo:snap(q:_format(q
.value))end function ae._setMainHeight(q,r)if q._widthManaged then q.main.Size=UDim2.new(q.main.Size.X.Scale,q.main.Size
.X.Offset,0,r)else q.main.Size=UDim2.new(1,-20,0,r)end end function ae._applyLayout(q)if q.minimal then return end local
r=q.main.AbsoluteSize.X local s=if r>0 and r<k then'narrow'else'wide'if q._layoutMode==s then return end q._layoutMode=s
if s=='narrow'then q:_setMainHeight(70)q.container.AnchorPoint=Vector2.new(0,0)q.container.Position=UDim2.new(0,20,0,14)
q.container.Size=UDim2.new(1,-40,0,16)q.containerLayout.FillDirection=Enum.FillDirection.Horizontal q.titleFlex.FlexMode
=Enum.UIFlexMode.Fill q.valueHost.AutomaticSize=Enum.AutomaticSize.X q.valueHost.Size=UDim2.new(0,0,0,16)q.track.
AnchorPoint=Vector2.new(0.5,1)q.track.Position=UDim2.new(0.5,0,1,-14)q.track.Size=UDim2.new(1,-30,0,14)else q:
_setMainHeight(65)q.container.AnchorPoint=Vector2.new(0,0.5)q.container.Position=UDim2.new(0,20,0.5,0)q.container.Size=
UDim2.new(0,170,0,33)q.containerLayout.FillDirection=Enum.FillDirection.Vertical q.titleFlex.FlexMode=Enum.UIFlexMode.
None q.valueHost.AutomaticSize=Enum.AutomaticSize.None q.valueHost.Size=UDim2.new(1,0,0,16)q.track.AnchorPoint=Vector2.
new(1,0.5)q.track.Position=UDim2.new(1,-15,0.5,0)q.track.Size=UDim2.new(0,222,0,14)end end function ae._format(q,r)local
s=string.format('%.'..q._decimals..'f',r)if q.suffix~=''then return s..' '..q.suffix end return s end function ae.
_pillTravel(q)return math.max(q.track.AbsoluteSize.X,0)end function ae._renderProgress(q,r)local s=q.range[2]-q.range[1]
local t=if s~=0 then math.clamp((q.value-q.range[1])/s,0,1)else 0 local u=n(t)if r then ag.tweenService:Create(q.
progress,r,{Size=u}):Play()else q.progress.Size=u end end function ae._updateFromMouse(q)local r=q:_pillTravel()if r<=0
then return end local s=p(ag.userInputService:GetMouseLocation().X,q.track.AbsolutePosition.X,r)local t=g(q.range,q.
increment,q.range[1]+s*(q.range[2]-q.range[1]))if t~=q.value then q.value=t if q.valueOdo then q.valueOdo:snap(q:
_format(t))end q._lastValue=t q:_renderProgress(j)q:_fireCallback(t)end end function ae._endDrag(q)if not q.dragging
then return end q.dragging=false q:_setHeld(false)if q._dragConnection then q._dragConnection:Disconnect()q.
_dragConnection=nil end q.window:_persist(q)end function ae._setHeld(q,r)if not r then q:_fireCallback(q.value)end local
s=if r then m else l q._handleWidth=s.X ag.tweenService:Create(q.handle,i,{Size=UDim2.fromOffset(s.X,s.Y),
BackgroundTransparency=if r then 0.7 else 0}):Play()ag.tweenService:Create(q.handleStroke,i,{Transparency=if r then 0.6
else 1}):Play()q:_renderProgress(i)end function ae._fireCallback(q,r)q.window:_runGuarded(q,q.callback,r,q.dragging==
true)end function ae.Set(q,r,s)r=g(q.range,q.increment,r)q.value=r if q.valueOdo then q.valueOdo:to(q:_format(r),r>=(q.
_lastValue or r))end q._lastValue=r q:_renderProgress(h)if not s then q:_fireCallback(r)q.window:_persist(q)end end
local q=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(r,s,t
)local u=r.window if s then u:_revealCommon(r,t)u:_reveal(r.track,{BackgroundTransparency=0},t)u:_reveal(r.progress,{
BackgroundTransparency=0},t)u:_reveal(r.handle,{BackgroundTransparency=0},t)if r.valueOdo then r.valueOdo:reveal(0.3,t)
end u:_reveal(r.progressGlow,{Transparency=math.max(0.55,u.theme.AccentGlow)},t,q)u:_reveal(r.handleGlow,{Transparency=
0.8},t,q)else u:_hideCommon(r,t)u:_reveal(r.track,{BackgroundTransparency=1},t)u:_reveal(r.progress,{
BackgroundTransparency=1},t)u:_reveal(r.handle,{BackgroundTransparency=1},t)if r.valueOdo then r.valueOdo:reveal(1,t)end
u:_reveal(r.progressGlow,{Transparency=1},t,q)u:_reveal(r.handleGlow,{Transparency=1},t,q)end end function ae.
_refreshTheme(r)ag.tweenService:Create(r.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
,{Transparency=math.max(0.55,r.window.theme.AccentGlow)}):Play()end function ae._minWidth(r)if r.minimal then return 100
end local s=40 if r.icon then s+=22 end s+=ah.textWidth(r.window.theme.Font,16,d.resolve(r.name))s+=12 s+=ah.textWidth(r
.window.theme.Font,15,r:_format(r.value))return math.max(s,160)end b(ae)c(ae)return ae end)()end,[17]=function()local aa
,ab,ac=a(17)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.Parent.utility
local ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.locale),ac(af.log),ac(af
.HapticEngine),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),400,22,24,22,16 local n,o,p,q,r,s,t,u=i-j
*2,18,14,15,16,12,300,4 local v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K=n-u*2,16,13,20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}
local function L()for M=#J,1,-1 do local N=J[M]if N._closed or not N.screenGui.Parent then table.remove(J,M)end end end
local function M(N)L()return J[#J]==N end function ae.new(N,O)O=if typeof(O)=='table'then O else{}local P=setmetatable({
window=assert(N,'Missing argument #1 (Window expected)'),title=O.title or O.Title or'Popup',subtitle=O.subtitle or O.
Subtitle,content=O.content or O.Content,icon=O.icon or O.Icon,boxes=O.boxes or O.Boxes,options=O.options or O.Options,
dismissable=if O.dismissable~=nil then O.dismissable elseif O.Dismissable~=nil then O.Dismissable else true,_reveal={},
_connections={},_closed=false},ae)if not P.options or#P.options==0 then P.options={{text='Okay'}}end P:_build()L()table.
insert(J,P)task.spawn(function()P:_show()end)return P end function ae._fade(N,O,P,Q)table.insert(N._reveal,{instance=O,
prop=P,to=Q})return O end function ae._build(N)local O,P=N.window,N.icon~=nil and N.icon~=0 and N.icon~=''N.screenGui=O:
Create('ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,
DisplayOrder=ai.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})N.backdrop=O:
Create('Frame',{Name='Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),
Active=true,BackgroundTransparency=1,Parent=N.screenGui})N:_fade(N.backdrop,'BackgroundTransparency',I)N.card=O:Create(
'Frame',{Name='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(
0.5,0,0.5,14),Size=UDim2.fromOffset(i,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,BorderSizePixel=0,
BackgroundTransparency=1,Parent=N.screenGui})N:_fade(N.card,'BackgroundTransparency',0)O:Create('UIGradient',{Rotation=
270,Offset=Vector2.new(0,-0.1),Parent=N.card},{Color={'WindowColor',ah.toColorSequence}})O:Create('UICorner',{Parent=N.
card},{CornerRadius='CornerRoundness'})N.cardStroke=O:Create('UIStroke',{Transparency=1,Parent=N.card},{Color=
'SurfaceStroke'})N:_fade(N.cardStroke,'Transparency',0.95)N.cardShadow=O:CreateGlow(N.card,'ShadowColor',26,1)N:_fade(N.
cardShadow,'Transparency',0.55)O:Create('UIPadding',{PaddingLeft=UDim.new(0,j),PaddingRight=UDim.new(0,j),PaddingTop=
UDim.new(0,k),PaddingBottom=UDim.new(0,l),Parent=N.card})O:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,m),
Parent=N.card})local Q=N:_measureHeader(P)N:_buildHeader(P,Q)local R=N:_buildContent()N:_buildFooter()local S=2+(R>0 and
1 or 0)local T=k+Q+R+E+l+m*(S-1)N.card.Size=UDim2.fromOffset(i,T)N.card.AutomaticSize=Enum.AutomaticSize.None if N.
dismissable then table.insert(N._connections,O:Connect(N.backdrop.InputBegan,function(U)if U.UserInputType==Enum.
UserInputType.MouseButton1 or U.UserInputType==Enum.UserInputType.Touch then N:Close()end end))table.insert(N.
_connections,O:Connect(ag.userInputService.InputBegan,function(U,V)if not V and U.KeyCode==Enum.KeyCode.Escape and M(N)
then if U==K then return end K=U N:Close()end end))end end function ae._buildHeader(N,O,P)local Q=N.window local R=Q:
Create('Frame',{Name='Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,P),LayoutOrder=1,Parent=N.card})Q:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,s),Parent=R})
if O then N:_fade(Q:Create('ImageLabel',{Image=N.icon,Size=UDim2.fromOffset(r,r),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=R},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end
local S=Q:Create('Frame',{Name='Text',BackgroundTransparency=1,Size=UDim2.new(1,O and-(r+s)or 0,0,N._columnH),
LayoutOrder=2,Parent=R})Q:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,3),Parent=S})N:_fade(Q:Create('TextLabel',{Text=b.t(N.title),Size=UDim2.new(1,0,0,N.
_titleH),BackgroundTransparency=1,TextSize=o,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=S},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if N.subtitle and N.
subtitle~=''then N:_fade(Q:Create('TextLabel',{Text=b.t(N.subtitle),Size=UDim2.new(1,0,0,N._subH),BackgroundTransparency
=1,TextSize=p,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=S},{
TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0.55)end end function ae._buildContent(N)if(not N.content
or N.content=='')and(not N.boxes or#N.boxes==0)then return 0 end local O,P=N.window,if N.boxes and#N.boxes>0 then N:
_measureBoxes()else N:_measureText()local Q=math.min(P,t)+u*2 local R=O:Create('ScrollingFrame',{Name='Content',
BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,Q),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=
Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollingDirection=Enum.
ScrollingDirection.Y,LayoutOrder=2,ScrollBarImageTransparency=1,Parent=N.card})N:_fade(R,'ScrollBarImageTransparency',
0.8)O:Create('UIPadding',{PaddingLeft=UDim.new(0,u),PaddingRight=UDim.new(0,u),PaddingTop=UDim.new(0,u),PaddingBottom=
UDim.new(0,u),Parent=R})if N.boxes and#N.boxes>0 then O:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical
,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,C),Parent=R
})for S,T in N.boxes do N:_buildBox(R,T,S)end else N:_fade(O:Create('TextLabel',{Text=b.t(N.content),Size=UDim2.new(1,0,
0,P),BackgroundTransparency=1,TextSize=q,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
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
DestroySubtree(aj.screenGui)end)end return ae end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)
local ae,af,ag={},ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.getPath=af.getPath ae.save=af.save
ae.load=af.load ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.getSettingsPath=ag.getSettingsPath ae.
saveSettings=ag.saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[31]=function()local aa,ab,ac=a(31)
local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h=ac(ae.image),
ac(ae.functions),ac(ae.persistence),ac(ae.constants),ac(ae.locale),ac(ae.log),ac(ae.HapticEngine),ac(ae.windowSizing),
ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.Parent.search),ac(ab.Parent.sidebar),ac(ae.variables),ab.Parent.Parent.themes,
{}h.__index=h local i,j,k,l,m=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(
185,50),UDim2.fromOffset(50,50),UDim2.new(0.5,0,0,20),UDim2.new(0.5,0,0,12)local n,o,p,q,r,s,t,u,v=UDim2.new(0.5,0,0,l.Y
.Offset+j.Y.Offset+12),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2
local function w(x):UDim2 local y=f.workspace.CurrentCamera return am.fit(y and y.ViewportSize,x)end local x,y={
'TopLeftRadius','TopRightRadius','BottomLeftRadius','BottomRightRadius'},(function()return(pcall(function()local x=
Instance.new'UICorner'x.TopLeftRadius=UDim.new(0,1)x:Destroy()end))end)()local function z(A)return if A then b.sidebar
else b.top end local A={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,TabBackground=true,TabStroke=
true,SliderProgress=true}local function B(C,D)if A[C]and typeof(D)=='Color3'then return ColorSequence.new(D)end return D
end local function C(D)return if typeof(D)=='ColorSequence'then D.Keypoints[1].Value else D end local function D(E,F)
local G=E._toastsTop if not G then return end local H=if E._collapsedShown then n else m if not F or G.Position==H then
G.Position=H return end f.tweenService:Create(G,o,{Position=H}):Play()end local function E(F,G)local H=0.299*F.R+0.587*F
.G+0.114*F.B local I=if H>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return F:Lerp(I,G)end local function F(G,H)if
H.ElementGradient then local I=C(G.ElementGradient)if H.ElementStroke==nil then G.ElementStroke=E(I,0.28)end if H.
ElementStrokeGradient==nil then G.ElementStrokeGradient=ColorSequence.new(E(I,0.4))end if H.ElementStrokeHover==nil then
G.ElementStrokeHover=E(I,0.52)end end if H.TabBackground and H.TabStroke==nil then G.TabStroke=ColorSequence.new(E(C(G.
TabBackground),0.4))end end local function G(H)if typeof(H)=='table'then return H elseif typeof(H)=='string'then local I
=g:FindFirstChild(string.lower(H))if I then return ac(I)end ak.warn("Rayfield: unknown theme '"..H..
"', using default (the only built-in theme)")elseif H~=nil then ak.warn
[[Rayfield: invalid theme (expected "Default" or a theme table), using default]]end return ac(g.default)end
local function H(I)local J,K=table.clone(ac(g.default)),G(I)for L,M in K do J[L]=B(L,M)end if typeof(I)=='table'then F(J
,K)end local L=if typeof(I)=='table'then I else nil if not(L and(L.Font or L.font))then J.Font=f.brandFont(Enum.
FontWeight.Medium)end if not(L and(L.TitleFont or L.titleFont))then J.TitleFont=f.brandFont(Enum.FontWeight.SemiBold)end
return J end function h.new(I)I=if typeof(I)=='table'then I else{}if I.translations or I.Translations then aj.register(I
.translations or I.Translations)end if I.translator or I.Translator then aj.translator=I.translator or I.Translator end
aj.setActive(I.locale or I.Locale or aj.detect())local J=I.fallbackFont or I.FallbackFont if J then f.setFallbackFont(J)
end local K=z(I.sidebarLayout or I.SidebarLayout)local L=setmetatable({name=I.name or I.Name or'Rayfield Window',
subheading=I.subtitle or I.Subtitle,layout=K,size=w(K.mode),instances={},connections={},icon=I.icon or I.Icon,showName=I
.showName or I.ShowName or'Rayfield',showIcon=I.showIcon or I.ShowIcon or ai.icons.rayfield,showIconOnly=I.showIconOnly
or I.ShowIconOnly or false,profileText=I.profile or I.Profile,themeProperties={},localeProperties={},tabs={},tabSections
={},tags={},selectedTab=nil,theme=H(I.theme or I.Theme),controls={},configuration=(function()local L=I.configuration or
I.Configuration if not L then return{}end return{autoSave=L.autoSave or L.AutoSave,autoLoad=L.autoLoad or L.AutoLoad,
fileName=L.fileName or L.FileName,customFolder=L.customFolder or L.CustomFolder}end)()},h)L.Flags=setmetatable({},{
__index=function(M,N)local O=L.controls[N]return O and O.value end,__newindex=function(M,N,O)local P=L.controls[N]if not
P then ak.warn("Rayfield: no flag '"..tostring(N).."' to set")return end P:Set(O)end,__iter=function()local M return
function()local N M,N=next(L.controls,M)if M then return M,N.value end return nil end end})L.settings={toggleKeybind=
Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast=true,haptics=true,showProfile=true}L.screenGui=L:
Create('ScreenGui',{Name=f.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,
DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=f.guiContainer})L.main=L:Create(
'Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name=L.name,ZIndex=1,AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((L.size.X.Offset-50),0),BackgroundTransparency=1,Visible=false,Parent=L.
screenGui})L.drag=ac(ab.Parent.drag).new(L)L.windowCorner=L:Create('UICorner',{Parent=L.main},{CornerRadius=
'CornerRoundness'})L.windowStroke=L:Create('UIStroke',{Transparency=1,Parent=L.main},{Color='SurfaceStroke'})L.
windowGradient=L:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=L.main},{Color={'WindowColor',ag.
toColorSequence}})L.bottomFade=L:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
AnchorPoint=Vector2.new(1,1),Position=UDim2.fromScale(1,1),Size=L.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,
BackgroundTransparency=1,Parent=L.main})L.bottomFadeCorner=L:_roundCorners(L.bottomFade,L.layout.fadeCorners)L.
bottomFadeGradient=L:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,0.2),Transparency=L.layout.fadeTransparency,
Parent=L.bottomFade},{Color={'WindowColor',function(M)return ColorSequence.new(ag.toColorSequence(M).Keypoints[1].Value)
end}})L.topbar=L:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,L.layout.topbarHeight),Active=true,Parent
=L.main})L.topContainer=L:Create('Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.
AutomaticSize.Y,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Parent=L.topbar})L.topContainerLayout=L:Create(
'UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L
.topContainer})L.titleContainer=L:Create('Frame',{Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),
AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=L.
topContainer})L.titleContainerLayout=L:Create('UIListLayout',{Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.
Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.titleContainer})
if L.name then L.title=L:Create('TextLabel',{Text=aj.t(L.name),FontFace=f.brandFont(Enum.FontWeight.Medium),Size=UDim2.
fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=L.titleContainer},{FontFace='Font',TextColor3=
'TitlingColor'})end if L.icon then L.topbarIcon=L:Create('ImageLabel',{Image=L.icon,BackgroundTransparency=1,Size=UDim2.
fromOffset(32,32),ImageTransparency=1,Parent=L.topContainer},{ImageColor3='TitlingColor'})end if L.subheading then L.
subtitle=L:Create('TextLabel',{Text=aj.t(L.subheading),Size=UDim2.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=
L.titleContainer},{TextColor3='TitlingColor',FontFace='Font'})end L.tagContainer=L:Create('Frame',{AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,
BackgroundTransparency=1,LayoutOrder=2,Visible=false,Parent=L.topContainer})L.tagContainerLayout=L:Create('UIListLayout'
,{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.tagContainer})L.windowShadow=L:CreateGlow(L.main,'ShadowColor',20,1)L.
elements=L:Create('Frame',{Size=UDim2.new(1,0,1,-L.layout.chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=
Vector2.new(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,
ClipsDescendants=true,Parent=L.main})if L.layout.mode=='sidebar'then L.elementsCorner=L:_roundCorners(L.elements,L.
layout.cardCorners)L.elementsStroke=L:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,
Parent=L.elements},{Color='SurfaceStroke'})L:Create('UIGradient',{Rotation=L.layout.cardStrokeRotation,Transparency=L.
layout.cardStrokeTransparency,Parent=L.elementsStroke})end L.elementsLayout=L:Create('UIPageLayout',{Padding=UDim.new(0,
0),FillDirection=L.layout.pageDirection,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,
TouchInputEnabled=false,EasingStyle=Enum.EasingStyle.Exponential,TweenTime=0.4,Parent=L.elements})if L.layout.mode==
'sidebar'then e.build(L,L.layout)e.applyWidth(L,b.railWidthFor(L.layout,L.size.X.Offset))else L.tabList=L:Create(
'ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,0,L.layout.tabStripHeight),Position=UDim2.new(0.5,0,0,L.
layout.tabStripTop),AnchorPoint=Vector2.new(0.5,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,
CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.
ScrollingDirection.X,Parent=L.main})L.tabListLayout=L:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.tabList})L:Create('UIPadding',{PaddingLeft=UDim.new(0,22),
PaddingRight=UDim.new(0,10),Parent=L.tabList})end L.actionContainer=L:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,
Parent=L.topbar})L.actionsListLayout=L:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=
Enum.SortOrder.LayoutOrder,Parent=L.actionContainer})L.rfSettings=L:CreateTab{name='Rayfield Settings',customOrder=1000,
neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(L,{name='Close',icon=ai.icons.close,order=1,callback=
function()L:ToggleHide()end})L.minimiseAction=ac(ab.Parent.action).new(L,{name='Minimise',icon=ai.icons.minimise,order=2
,callback=function()L:ToggleMinimise()end})L.settingsAction=ac(ab.Parent.action).new(L,{name='Settings',icon=ai.icons.
settings,order=3,linkedTab=L.rfSettings,callback=function()L.rfSettings:Select()end})d.build(L)L:_applyRailWidth()L.
unloaded=false L.minimised=false L.hidden=true L.animating=false L._revealing=false L.hasShownOnce=false L.
_collapsedShown=false L:LoadSettings()if L.layout.mode=='sidebar'then e.reflowProfile(L)e.setSubtitle(L,L.profileText)
end al.setContainer(L.screenGui)al.setEnabled(L.settings.haptics)c.buildCollapsedFace(L)L:_bindKeybind()L:
_bindMouseOverride()L:_bindTopbarDrag()L:_watchViewport()L:_buildSettingsUI()L:_syncLiveAnimation()return L end function
h._syncLiveAnimation(I)if not I.theme.LiveAnimation then I._liveAnimating=false return end if I._liveAnimating then
return end I._liveAnimating=true I._liveGeneration=(I._liveGeneration or 0)+1 local J=I._liveGeneration task.spawn(
function()local K,L=true,TweenInfo.new(10,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)while I._liveGeneration==J and
I._liveAnimating and not I.unloaded do local M=f.tweenService:Create(I.windowGradient,L,{Offset=Vector2.new(if K then
0.4 else-0.2,0),Rotation=(if K then 220 else 280)})I._liveTween=M M:Play()M.Completed:Wait()K=not K end if I.
_liveGeneration==J then I._liveAnimating=false I._liveTween=nil end end)end function h.ChangeTheme(I,J)local K=if
typeof(J)=='table'then J else H(J)for L,M in K do I.theme[L]=B(L,M)end if typeof(J)=='table'then F(I.theme,K)end for L,M
in I.themeProperties do for N,O in M do local P=if typeof(O)=='table'then O[2](I.theme[O[1] ])else I.theme[O]if typeof(P
)=='Color3'or typeof(P)=='number'then f.tweenService:Create(L,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[N]=P}):Play()else L[N]=P end end end if I.hidden then I._themeRefreshPending=true else I:
_refreshElementThemes()end I:_syncLiveAnimation()end function h._refreshElementThemes(I)for J,K in I.tabs do for L,M in
K.elements do if M._refreshTheme then M:_refreshTheme()end end end end function h.CreateTab(I,J)assert(not I.unloaded,
'Cannot create a tab on an unloaded window.')local K=ac(ab.Parent.tab).new(I,J)table.insert(I.tabs,K)if not K.
neglectSelector then local L=true for M,N in I.tabs do if N~=K and not N.neglectSelector then L=false break end end if L
then K:Select(true)end if not I.hidden and not I.minimised then K.topbarItem.Visible=true K:_applyVisual(if I.
selectedTab==K then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end
return K end function h.CreateSection(I,J)assert(not I.unloaded,'Cannot create a section on an unloaded window.')local K
=ac(ab.Parent.tabSection).new(I,J)table.insert(I.tabSections,K)if not K.inert and not I.hidden and not I.minimised then
K:_setVisible(true)K:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return K end
function h._setTabSectionsShown(I,J,K)for L,M in I.tabSections do M:_setShown(J,K)end end function h.
_setTabSectionsVisible(I,J)for K,L in I.tabSections do L:_setVisible(J)end end function h.CreateTag(I,J)assert(not I.
unloaded,'Cannot create a tag on an unloaded window.')local K=ac(ab.Parent.tag).new(I,J)table.insert(I.tags,K)return K
end function h._registerControl(I,J)if not J.flag or J.flag==''or J.forgetState then return end local K=J.flag if I.
controls[K]then local L=2 while I.controls[K..L]do L+=1 end K=K..L ak.warn("Rayfield: duplicate config flag '"..J.flag..
"', saving this one as '"..K.."'. Set a unique flag to keep it stable across sessions.")end J.flag=K I.controls[K]=J
return K end function h._restoreLate(I,J)if not I._loadedConfig or not J.flag or J.forgetState then return end local K=I
._loading I._loading=true ah.applyTo(J,I._loadedConfig[J.flag])I._loading=K end function h._persist(I,J)if J.flag and
not J.forgetState and I.configuration.autoSave and not I._loading then task.spawn(I.Save,I)end end function h.
_unregisterControl(I,J)if J.flag and I.controls[J.flag]==J then I.controls[J.flag]=nil end end function h._keybindUsing(
I,J,K)if typeof(J)~='EnumItem'or J==Enum.KeyCode.Unknown then return nil end for L,M in I.tabs do for N,O in M.elements
do if O~=K and O.__type=='Keybind'and O.value==J then return O end end end return nil end function h.Notify(I,J)if I.
unloaded then return end if not I.notifications then I.notifications=I:Create('Frame',{Name='Notifications',Size=UDim2.
new(0,300,0,800),Position=UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=I.
screenGui})I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.
Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),
Parent=I.notifications})end return ac(ab.Parent.notification).new(I,J)end function h.Toast(I,J)if I.unloaded then return
end J=if typeof(J)=='table'then J else{}local K=J.position or J.Position or'Top'local L=typeof(K)~='string'or K:lower()
~='bottom'J.position=if L then'Top'else'Bottom'local M=if L then'_toastsTop'else'_toastsBottom'local N=I[M]if not N then
N=I:Create('Frame',{Name='Toasts',Size=UDim2.new(0,p,1,-24),Position=if L then m else UDim2.new(0.5,0,1,-12),AnchorPoint
=if L then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,ZIndex=ai.zIndex.toast,Parent=I.screenGui}
)I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=if L then Enum.VerticalAlignment.
Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,0),Parent=N})I[M]=N if L then D(I,false)end end return ac(ab.Parent.toast).new(I,J,N)end
function h.Popup(I,J)if I.unloaded then return end return ac(ab.Parent.popup).new(I,J)end function h.Hide(I)if I.
animating or I.hidden then return end if I._searching then d.close(I,{showTabs=false,jumpTo=I.selectedTab and I.
selectedTab.tabPage})end if I._recordingKeybind then I._recordingKeybind:_stopRecording()end I.animating=true I.
_revealing=true I.hidden=true I.collapsedInteract.Visible=false if I.minimised then I.minimised=false af.assign(I.
minimiseAction.iconLabel,'Image',ai.icons.minimise)end I._restorePosition=I.main.Position local J,K=I:_collapsedRect()
local L,M,N,O=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.
Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),
TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)f.tweenService:Create(I.drag.dragCosmetic,L,{Size=
UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not I.hidden then return end I.drag.
drag.Visible=false end)I:_fadeSurfaces(false,L)if I.title then f.tweenService:Create(I.title,L,{TextTransparency=1}):
Play()end if I.subtitle then f.tweenService:Create(I.subtitle,L,{TextTransparency=1}):Play()end if I.topbarIcon then f.
tweenService:Create(I.topbarIcon,L,{ImageTransparency=1}):Play()end for P,Q in ipairs(I.actionContainer:GetChildren())do
if Q:IsA'Frame'then f.tweenService:Create(Q.ImageLabel,L,{ImageTransparency=1}):Play()end end for P,Q in I.tags do Q:
_setShown(false,L)end for P,Q in pairs(I.tabs)do if not Q.neglectSelector and Q.topbarItem then Q:_applyVisual('hidden',
L)end end I:_setTabSectionsShown(false,L)I:_fadeSelectedElementsOut()local P=f.tweenService:Create(I.main,M,{Size=K,
Position=J})P.Completed:Connect(function()if I.unloaded or not I.hidden then return end I._collapsedShown=true D(I,true)
I.collapsedInteract.Visible=true I.animating=false I._revealing=false end)P:Play()f.tweenService:Create(I.windowCorner,N
,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()if not I.hidden then return end I.topbar.Visible=false I:
_setContentVisible(false)c.setCollapsedShown(I,true,O)end)end function h.ToggleHide(I)if I.animating then return end if
I.hidden then I:Show()else I:Hide()end end function h.ToggleMinimise(I)if I.animating or I.hidden then return end if I.
_searching then d.close(I,{showTabs=true})end I.animating=true local J,K=TweenInfo.new(0.5,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if I.minimised then I.
minimised=false af.assign(I.minimiseAction.iconLabel,'Image',ai.icons.minimise)f.tweenService:Create(I.main,J,{Size=I.
size}):Play()I:_fadeSurfaces(true,K)f.tweenService:Create(I.drag.drag,J,{Position=UDim2.new(I.main.Position.X.Scale,I.
main.Position.X.Offset,I.main.Position.Y.Scale,I.main.Position.Y.Offset+I.size.Y.Offset/2+15)}):Play()task.delay(0.2,
function()if I.minimised or I.hidden then return end I:_setContentVisible(true)for L,M in pairs(I.tabs)do if not M.
neglectSelector and M.topbarItem then M.topbarItem.Visible=true M:_applyVisual(if I.selectedTab==M then'selected'else
'unselected',K)end end I:_setTabSectionsVisible(true)I:_setTabSectionsShown(true,K)I:_revealElements(0.035,0.4)end)task.
delay(0.5,function()I.animating=false end)else I.minimised=true af.assign(I.minimiseAction.iconLabel,'Image',ai.icons.
maximise)I:_fadeSelectedElementsOut()for L,M in pairs(I.tabs)do if not M.neglectSelector and M.topbarItem then M:
_applyVisual('hidden',K)end end I:_setTabSectionsShown(false,K)task.delay(0.3,function()if not I.minimised then return
end I:_setContentVisible(false)for L,M in pairs(I.tabs)do if not M.neglectSelector and M.topbarItem then M.topbarItem.
Visible=false end end I:_setTabSectionsVisible(false)end)I:_fadeSurfaces(false,K)f.tweenService:Create(I.main,J,{Size=
UDim2.fromOffset(I.size.X.Offset,I.layout.topbarHeight)}):Play()f.tweenService:Create(I.drag.drag,J,{Position=UDim2.new(
I.main.Position.X.Scale,I.main.Position.X.Offset,I.main.Position.Y.Scale,I.main.Position.Y.Offset+I.layout.topbarHeight/
2+15)}):Play()task.delay(0.5,function()I.animating=false end)end end function h._syncDragBar(I)local J=I.drag and I.drag
.drag if not J then return end local K,L=I.main.Position,I.size.Y.Offset/2+15 J.Position=UDim2.new(K.X.Scale,K.X.Offset,
K.Y.Scale,K.Y.Offset+L)end function h._clampedPosition(I,J:UDim2):UDim2 if not I.settings or not I.settings.keepOnScreen
then return J end if J.X.Scale~=0 or J.Y.Scale~=0 then return J end local K,L,M,N=I.screenGui.AbsoluteSize,I.size.X.
Offset/2,I.size.Y.Offset/2,8 local O,P=math.clamp(J.X.Offset,L+N,math.max(L+N,K.X-L-N)),math.clamp(J.Y.Offset,M+N,math.
max(M+N,K.Y-M-N))if O==J.X.Offset and P==J.Y.Offset then return J end return UDim2.fromOffset(O,P)end function h.
_clampToScreen(I)I.main.Position=I:_clampedPosition(I.main.Position)end function h._applyWindowSize(I)if I.unloaded then
return end local J=w(I.layout.mode)local K=J~=I.size I.size=J I:_applyRailWidth()if K then I:_layoutColumns()end if I.
hidden or I.minimised or I.animating or I._revealing then I._pendingResize=I._pendingResize or K return end if not K and
not I._pendingResize then return end I._pendingResize=false I.main.Size=J I:_clampToScreen()I:_syncDragBar()end function
h._layoutColumns(I)for J,K in I.tabs do K:_layoutColumns()end end function h._applyRailWidth(I)if I.layout.mode~=
'sidebar'then return end e.applyWidth(I,b.railWidthFor(I.layout,I.size.X.Offset))end function h._watchViewport(I)local J
,K:RBXScriptConnection?=false local function L()if J then return end J=true task.defer(function()J=false I:
_applyWindowSize()end)end local function M()if K then I:Disconnect(K)K=nil end local N=f.workspace.CurrentCamera if N
then K=I:Connect(N:GetPropertyChangedSignal'ViewportSize',L)end L()end I:Connect(f.workspace:GetPropertyChangedSignal
'CurrentCamera',M)M()local N=0 I:Connect(f.runService.Heartbeat,function(O:number)N+=O if N<v then return end N=0 I:
_applyWindowSize()end)end function h._bindKeybind(I)I:Connect(f.userInputService.InputBegan,function(J,K)if K or I.
_recordingKeybind then return end if J.KeyCode==I.settings.toggleKeybind or J.UserInputType==I.settings.toggleKeybind
then I:ToggleHide()end end)end function h._bindMouseOverride(I)local J=f.userInputService local function K()return I.
settings.mouseOverride and not I.hidden and not I.minimised end local function L()if not K()then return end if J:
IsMouseButtonPressed(Enum.UserInputType.MouseButton2)then return end if J.MouseBehavior~=Enum.MouseBehavior.Default then
J.MouseBehavior=Enum.MouseBehavior.Default end if not J.MouseIconEnabled then J.MouseIconEnabled=true end end I:Connect(
J:GetPropertyChangedSignal'MouseBehavior',L)I:Connect(J:GetPropertyChangedSignal'MouseIconEnabled',L)I:Connect(J.
InputEnded,function(M)if M.UserInputType==Enum.UserInputType.MouseButton2 then L()end end)I._freeMouse=L end function h.
_bindTopbarDrag(I)local J,K,L,M=f.userInputService,false,Vector2.zero,Vector2.zero if I.screenGui and I.screenGui.
IgnoreGuiInset then M=f.guiService:GetGuiInset()end local function N()local O=J:GetMouseLocation()+L+M local P,Q=O.X,O.Y
if I.settings and I.settings.keepOnScreen then local R,S,T=I.main.AbsoluteSize,I.screenGui.AbsoluteSize,8 local U,V=R.X/
2,R.Y/2 P=math.clamp(P,U+T,math.max(U+T,S.X-U-T))Q=math.clamp(Q,V+T,math.max(V+T,S.Y-V-T))end return UDim2.fromOffset(P,
Q)end local function O(P,Q)for R,S in{I.tabList,I.actionContainer}do local T,U=S.AbsolutePosition,S.AbsoluteSize if P>=T
.X and P<=T.X+U.X and Q>=T.Y and Q<=T.Y+U.Y then return true end end return false end I:Connect(I.topbar.InputBegan,
function(P,Q)if Q then return end local R=P.UserInputType.Name if R~='MouseButton1'and R~='Touch'then return end if O(P.
Position.X,P.Position.Y)then return end if not I:_interactive()then return end K=true if I.screenGui and I.screenGui.
IgnoreGuiInset then M=f.guiService:GetGuiInset()end L=I.main.AbsolutePosition+I.main.AbsoluteSize*I.main.AnchorPoint-J:
GetMouseLocation()end)I:Connect(J.InputEnded,function(P)local Q=P.UserInputType.Name if Q=='MouseButton1'or Q=='Touch'
then K=false end end)I:Connect(J.WindowFocusReleased,function()K=false end)I:Connect(f.runService.RenderStepped,function
()if not K then return end if not I:_interactive()then K=false return end I.main.Position=N()if I.drag and I.drag.drag
then local P=I.main.Position I.drag.drag.Position=UDim2.new(P.X.Scale,P.X.Offset,P.Y.Scale,P.Y.Offset+(I.main.Size.Y.
Offset/2+15))end end)end function h._buildSettingsUI(I)I.rfSettings:CreateSection{name='General'}I.rfSettings:
CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=I.settings.toggleKeybind,isMenuToggle=true,onChanged=
function(J)I.settings.toggleKeybind=J I:SaveSettings()end}I.rfSettings:CreateToggle{name='Unlock cursor while open',
description=[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=I.
settings.mouseOverride,callback=function(J)I.settings.mouseOverride=J I:SaveSettings()end}I.rfSettings:CreateToggle{name
='Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=I
.settings.welcomeToast,callback=function(J)I.settings.welcomeToast=J I:SaveSettings()end}I.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=I.settings.haptics,
callback=function(J)I.settings.haptics=J al.setEnabled(J)I:SaveSettings()end}I.rfSettings:CreateSection{name='Window'}if
I.layout.mode=='sidebar'and I.profile then I.rfSettings:CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=I.settings.showProfile,callback=function(J)e.setProfileEnabled(I,J)I:SaveSettings()end}end I.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=I.settings.keepOnScreen,callback=function(
J)I.settings.keepOnScreen=J I:SaveSettings()end}I.rfSettings:CreateButton{name='Reset Window Position',callback=function
()f.tweenService:Create(I.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.
new(0.5,0,0.5,0)}):Play()f.tweenService:Create(I.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,I.size.Y.Offset/2+15)}):Play()end}if next(I.configuration)~=nil then
I.rfSettings:CreateSection{name='Configurations'}local J,K,L=(I:ListConfigs()[1])local function M()local N=I:
ListConfigs()K:Refresh(N)if J and not table.find(N,J)then J=N[1]end if J then K:Set(J,true)end end K=I.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=I:ListConfigs(),value=J,placeholder=
'No saved configurations',callback=function(N)J=N end}L=I.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local N=I.rfSettings:CreateGroup()N:CreateButton{name='Save',icon=ai.icons.config,callback=function()local O=L.
value if O==''then O=J end if not O or O==''then I:Toast{title=aj.resolve'Name your configuration first'}return end if I
:Save(O)then L:Set''J=O M()I:Toast{title=aj.resolve'Saved configuration',subtitle=O,icon=ai.icons.config}else I:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=O}end end}N:CreateButton{name='Load',callback=function()if not J
or J==''then I:Toast{title=aj.resolve'Pick a configuration to load'}return end if I:_applyNamedConfig(J)then I:Toast{
title=aj.resolve'Loaded configuration',subtitle=J}else I:Toast{title=aj.resolve"Couldn't load configuration",subtitle=J}
end end}N:CreateButton{name='Delete',callback=function()local O=J if not O or O==''then I:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if I:DeleteConfig(O)then M()I:Toast{title=aj.resolve'Deleted configuration',
subtitle=O}else I:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=O}end end}end end function h.SetProfile
(I,J)I.profileText=J e.setSubtitle(I,J)end function h.SaveSettings(I)return ah.saveSettings(I)end function h.
LoadSettings(I)return ah.loadSettings(I)end function h._roundCorners(I,J,K)if not K or not y then return I:Create(
'UICorner',{Parent=J},{CornerRadius='CornerRoundness'})end local L,M={Parent=J},{}for N,O in x do L[O]=UDim.new(0,0)end
for N,O in K do L[O]=nil M[O]='CornerRoundness'end return I:Create('UICorner',L,M)end function h._setElementLocked(I,J,K
,L)K=K==true local M=J.locked==true if M==K and not(K and L)then return end J.locked=K if not J.lockScrim then I:
_buildLockScrim(J)end local N=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if K then J.lockScrim.
Visible=true end f.tweenService:Create(J.lockScrim,N,{BackgroundTransparency=if K then r else 1}):Play()if not K then
task.delay(N.Time,function()if not J.locked and J.lockScrim then J.lockScrim.Visible=false end end)end local O=J.
descriptor if not O then return end if K then J._descriptionBefore=J._descriptionBefore or O.titleLabel.Text O.
titleLabel.Text=aj.resolve(L or'This element is locked.')elseif J._descriptionBefore then O.titleLabel.Text=J.
_descriptionBefore J._descriptionBefore=nil end f.tweenService:Create(O.titleLabel,N,{TextTransparency=if K then s else
0.7}):Play()end function h._buildLockScrim(I,J)J.lockScrim=I:Create('TextButton',{Name='ElementLock',Active=true,
AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=J.main},{BackgroundColor3={'WindowColor',C}})I:Create(
'UICorner',{Parent=J.lockScrim},{CornerRadius='ElementCornerRadius'})end function h._setContentVisible(I,J)I.elements.
Visible=J I.tabList.Visible=J if I.sidebar then I.sidebar.Visible=J end end function h._fadeSurfaces(I,J,K)local L={[I.
windowShadow]={Transparency=if J then 0.6 else 1},[I.windowStroke]={Transparency=if J then 0.95 else 1},[I.bottomFade]={
BackgroundTransparency=if J then 0 else 1}}if I.elementsStroke then L[I.elements]={BackgroundTransparency=if J then I.
layout.cardTransparency else 1}L[I.elementsStroke]={Transparency=if J then 0 else 1}end for M,N in L do if K then f.
tweenService:Create(M,K,N):Play()else for O,P in N do M[O]=P end end end e.setProfileShown(I,J,K)end function h.
_fadeSelectedElementsOut(I)if I.selectedTab then for J,K in ipairs(I.selectedTab.elements)do K:_setShown(false,true)end
end end function h._revealElements(I,J,K)for L,M in pairs(I.tabs)do if M~=I.selectedTab then for N,O in ipairs(M.
elements)do O:_setShown(true,false)end end end local L=I.selectedTab if not L then return end local M=L.tabPage local N=
M.AbsolutePosition.Y local O,P,Q=N+M.AbsoluteWindowSize.Y,table.clone(L.elements),{}for R,S in P do Q[S]=R end table.
sort(P,function(R,S)local T,U=R.main.AbsolutePosition,S.main.AbsolutePosition if T.Y~=U.Y then return T.Y<U.Y end if T.X
~=U.X then return T.X<U.X end return Q[R]<Q[S]end)local R,S=math.floor(K/J),0 for T,U in P do local V=U.main.
AbsolutePosition.Y local W=(V+U.main.AbsoluteSize.Y)>N and V<O if W then U:_setShown(true,true)S+=1 if S<=R then task.
wait(J)end else U:_setShown(true,false)end end end function h.Show(I)if I.animating or not I.hidden then return end I.
animating=true I._revealing=true if I.configuration.autoLoad and not I._autoLoaded then I._autoLoaded=true local J,K=
pcall(I.Load,I)if not J then ak.warn('Rayfield: Failed to load configuration - '..tostring(K))end end I.hidden=false I.
minimised=false if I._themeRefreshPending then I._themeRefreshPending=false I:_refreshElementThemes()end I.
collapsedInteract.Visible=false if I._freeMouse then I._freeMouse()end if I.hasShownOnce then I:_quickRestore()else I.
hasShownOnce=true I:_firstShow()end end function h._quickRestore(I)local J=I:_clampedPosition(I._restorePosition or
UDim2.new(0.5,0,0.5,0))I._restorePosition=J local K,L,M=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)c.setCollapsedShown(I,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local N=f.tweenService:Create(I.main,K,{Size=I.size,Position=J})N.Completed:Connect(
function()if I.hidden or I.unloaded then return end I._collapsedShown=false D(I,true)end)N:Play()f.tweenService:Create(I
.windowCorner,L,{CornerRadius=I.theme.CornerRoundness}):Play()task.delay(0.22,function()I.topbar.Visible=true I:
_setContentVisible(true)I:_fadeSurfaces(true,M)if I.topbarIcon then f.tweenService:Create(I.topbarIcon,M,{
ImageTransparency=0}):Play()end if I.title then f.tweenService:Create(I.title,M,{TextTransparency=0}):Play()end if I.
subtitle then f.tweenService:Create(I.subtitle,M,{TextTransparency=0.7}):Play()end for O,P in ipairs(I.actionContainer:
GetChildren())do if P:IsA'Frame'then f.tweenService:Create(P.ImageLabel,M,{ImageTransparency=0.6}):Play()end end if I.
settingsAction and I.selectedTab==I.rfSettings then f.tweenService:Create(I.settingsAction.iconLabel,M,{
ImageTransparency=0.2}):Play()end for O,P in I.tags do P:_setShown(true,M)end for O,P in pairs(I.tabs)do if not P.
neglectSelector and P.topbarItem then P.topbarItem.Visible=true P:_applyVisual(if I.selectedTab==P then'selected'else
'unselected',M)end end I:_setTabSectionsVisible(true)I:_setTabSectionsShown(true,M)I:_revealElements(0.035,0.4)end)task.
delay(0.22,function()I.drag.drag.Position=UDim2.new(J.X.Scale,J.X.Offset,J.Y.Scale,J.Y.Offset+I.size.Y.Offset/2+15)I.
drag.dragCosmetic.Size=UDim2.fromOffset(0,4)I.drag.dragCosmetic.BackgroundTransparency=1 I.drag.drag.Visible=true f.
tweenService:Create(I.drag.dragCosmetic,K,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()I.animating=false I._revealing=false end)end function h._firstShow(I)I:_setContentVisible(true)I.
drag.drag.Visible=false I.main.Visible=true f.tweenService:Create(I.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=I.size}):Play()task.wait(0.85)I:_fadeSurfaces(true,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if I.icon then f.tweenService:Create(I.
topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if
I.title then f.tweenService:Create(I.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if I.subtitle then f.tweenService:Create(I.subtitle,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for J,K in ipairs(I.actionContainer:
GetChildren())do if K:IsA'Frame'then task.wait(0.02)f.tweenService:Create(K.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for J,K in I.tags do K:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()local J=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)I:_setTabSectionsVisible(true)I:
_setTabSectionsShown(true,J)local K=0 for L,M in pairs(I.tabs)do if not M.neglectSelector then M.topbarItem.Visible=true
M:_applyVisual(if I.selectedTab==M then'selected'else'unselected',J)M:_spinGradients()K+=1 if K<=u then task.wait(t)end
end end end)I:_revealElements(0.03,2)task.wait(1)I:_syncDragBar()I.drag.drag.Visible=true f.tweenService:Create(I.drag.
dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):
Play()f.tweenService:Create(I.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=UDim2.fromOffset(100,4)}):Play()I.animating=false I._revealing=false local J=f.localPlayer if J and I.settings.
welcomeToast and c.isNewUser()then I:Toast{title=J.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,
avatar=J.UserId,minWidth=220}end end function h.GetPath(I)return ah.getPath(I)end function h.Save(I,J)if J~=nil and(
type(J)~='string'or J=='')then return false end return ah.save(I,J)end function h.Load(I,J)if J~=nil and(type(J)~=
'string'or J=='')then return false end return ah.load(I,J)end function h._applyNamedConfig(I,J)if not I:Load(J)then
return false end local K,L=ah.getPath(I)I._loadedConfigPath=L I:Save()return true end function h.ListConfigs(I)return ah
.list(I)end function h.DeleteConfig(I,J)return ah.delete(I,J)end function h.Get(I,J)local K=I.controls[J]return K and K.
value end function h.Set(I,J,K)local L=I.controls[J]if not L then return false end L:Set(K)return true end function h.
_jumpTo(I,J)if J then I.elementsLayout:JumpTo(J)end end function h.Navigate(I,J)if J==nil then return end local K for L,
M in I.tabs do if M==J or M.name==J or M.tabPage==J then K=M break end end if not K then return end K:Select()end
function h.Create(I,J,K,L)assert(typeof(J)=='string','Invalid argument #1 (string expected)')local M=Instance.new(J)if L
and I.theme then for N,O in L do M[N]=(if typeof(O)=='table'then O[2](I.theme[O[1] ])else I.theme[O])end I.
themeProperties[M]=L end if K then for N,O in K do if aj.isToken(O)then I:_bindLocale(M,N,aj.sourceOf(O))else af.assign(
M,N,O)end end end table.insert(I.instances,M)return M end function h._bindLocale(I,J,K,L)J[K]=aj.resolve(L)local M=I.
localeProperties[J]if not M then M={}I.localeProperties[J]=M end M[K]=L end function h.SetLocale(I,J)aj.setActive(J)for
K,L in I.localeProperties do for M,N in L do K[M]=aj.resolve(N)end end end function h.SetTranslator(I,J)aj.translator=J
end function h.RegisterTranslations(I,J)aj.register(J)I:SetLocale(aj.current)end function h.CreateGlow(I,J,K,L,M)local N
={BlurRadius=UDim.new(0,L),Transparency=M,ZIndex=-1,Parent=J}if typeof(K)=='string'then return I:Create('UIShadow',N,{
Color={K,function(O)return if typeof(O)=='ColorSequence'then O.Keypoints[1].Value else O end}})end N.Color=K return I:
Create('UIShadow',N)end function h._flashResult(I,J,K)local L=J.box if not L then return end local M,N,O,P,Q,R=J.glow,J.
boxStroke,K and ai.accent.on or I.theme.ErrorColor,K and ai.accent.onStroke or I.theme.ErrorStrokeColor,TweenInfo.new(
0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
f.tweenService:Create(L,Q,{BackgroundColor3=O}):Play()if N then f.tweenService:Create(N,Q,{Color=P,Transparency=0.4}):
Play()end if M then f.tweenService:Create(M,Q,{Color=P,Transparency=0.6}):Play()end J._flashToken=(J._flashToken or 0)+1
local S=J._flashToken task.delay(0.22,function()if J._flashToken~=S then return end f.tweenService:Create(L,R,{
BackgroundColor3=I.theme.FieldBackground}):Play()if N then f.tweenService:Create(N,R,{Color=I.theme.SurfaceStroke,
Transparency=0.85}):Play()end if M then f.tweenService:Create(M,R,{Color=I.theme.FieldGlow,Transparency=J._glowIdle or 1
}):Play()end end)end function h.CreateHoverOverlay(I,J)local K=I:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=1,Parent=J})I:Create('UICorner',{
Parent=K},{CornerRadius='ElementCornerRadius'})return K end function h._wireElementHover(I,J)local K,L=TweenInfo.new(
0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),I.theme I:ConnectFor(J,J.main.MouseEnter,function()if not I:
_interactive()then return end f.tweenService:Create(J.stroke,K,{Transparency=L.ElementStrokeHoverTransparency,Color=L.
ElementStrokeHover}):Play()f.tweenService:Create(J.title,K,{TextColor3=L.ElementTextHoverColor}):Play()if J.hoverOverlay
then f.tweenService:Create(J.hoverOverlay,K,{BackgroundTransparency=0.97}):Play()end end)I:ConnectFor(J,J.main.
MouseLeave,function()f.tweenService:Create(J.stroke,K,{Transparency=L.ElementStrokeTransparency,Color=L.ElementStroke}):
Play()f.tweenService:Create(J.title,K,{TextColor3=L.ContentColor}):Play()if J.hoverOverlay then f.tweenService:Create(J.
hoverOverlay,K,{BackgroundTransparency=1}):Play()end end)end function h._runGuarded(I,J,K,...)if J.locked then return
end local L=table.pack(...)task.spawn(function()local M,N=pcall(function()return K(table.unpack(L,1,L.n))end)if M or J.
_errored then return end J._errored=true local O,P=J.flashTarget or J.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out)f.tweenService:Create(O,P,{BackgroundColor3=I.theme.ErrorColor}):Play()f.tweenService:Create(J.
stroke,P,{Color=I.theme.ErrorStrokeColor}):Play()if J.title then J.title.Text=aj.resolve
'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {J.__type} component named '{
J.name}':`)ak.print(N)task.wait(1)if J.title then J.title.Text=aj.resolve(J.name)end f.tweenService:Create(O,TweenInfo.
new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()f.
tweenService:Create(J.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Color=I.theme.
ElementStroke}):Play()J._errored=false end)end function h.StyleElementBody(I,J)I:Create('UIGradient',{Rotation=270,
Parent=J},{Color='ElementGradient'})I:Create('UICorner',{Parent=J},{CornerRadius='ElementCornerRadius'})return I:Create(
'UIStroke',{Transparency=1,Parent=J},{Color='ElementStroke',Transparency='ElementStrokeTransparency'})end function h.
_buildCompactRow(I,J,K,L)local M=I:Create('Frame',{Name=K,Size=UDim2.fromOffset(0,q),AutomaticSize=Enum.AutomaticSize.X,
ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Parent=J.
tabPage},{BackgroundTransparency='ElementTransparency'})local N=I:StyleElementBody(M)I:Create('UIFlexItem',{FlexMode=
Enum.UIFlexMode.Fill,Parent=M})I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=M})local O=I:Create('TextButton',{Text='',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,q),BorderSizePixel=0,TextTransparency=1,ZIndex=L or 1,Parent=M})I:Create('UICorner',{Parent=O},{
CornerRadius='ElementCornerRadius'})return M,N,O end function h.StyleElementPanel(I,J)I:Create('UIGradient',{Rotation=
270,Parent=J},{Color='ElementGradient'})I:Create('UICorner',{Parent=J},{CornerRadius='ElementCornerRadius'})local K=I:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=J})I:Create('UIGradient',{Rotation=270,Parent
=K},{Color='ElementStrokeGradient'})return K end function h._reveal(I,J,K,L,M)if not J then return end if L then f.
tweenService:Create(J,M or i,K):Play()else for N,O in K do J[N]=O end end end function h._revealCommon(I,J,K)I:_reveal(J
.stroke,{Transparency=I.theme.ElementStrokeTransparency},K)I:_reveal(J.title,{TextTransparency=0},K)I:_reveal(J.main,{
BackgroundTransparency=I.theme.ElementTransparency or 0},K)if J.iconLabel then I:_reveal(J.iconLabel,{ImageTransparency=
0},K)end if J.descriptor then I:_reveal(J.descriptor.titleLabel,{TextTransparency=0.7},K)end end function h._hideCommon(
I,J,K)I:_reveal(J.stroke,{Transparency=1},K)I:_reveal(J.title,{TextTransparency=1},K)I:_reveal(J.main,{
BackgroundTransparency=1},K)if J.iconLabel then I:_reveal(J.iconLabel,{ImageTransparency=1},K)end if J.descriptor then I
:_reveal(J.descriptor.titleLabel,{TextTransparency=1},K)end end function h._collapsedRect(I)local J=if I.showIconOnly
then k else j if I._collapsedPosition then return I._collapsedPosition,J end local K=UDim2.new(l.X.Scale,l.X.Offset,l.Y.
Scale,l.Y.Offset+J.Y.Offset/2)return K,J end function h._interactive(I)return not I.animating and not I.hidden end
function h._settled(I)return not I.hidden and not I._revealing end function h.Connect(I,J,K)local L=J:Connect(K)table.
insert(I.connections,L)return L end function h.ConnectFor(I,J,K,L)local M=I:Connect(K,L)J.connections=J.connections or{}
table.insert(J.connections,M)return M end function h.Disconnect(I,J)if not J then return end local K=table.find(I.
connections,J)if K then table.remove(I.connections,K)end J:Disconnect()end function h.DestroySubtree(I,J)if not J then
return end local K={[J]=true}for L,M in J:GetDescendants()do K[M]=true end for L=#I.instances,1,-1 do local M=I.
instances[L]if K[M]then table.remove(I.instances,L)I.themeProperties[M]=nil I.localeProperties[M]=nil end end J:Destroy(
)end function h.DisconnectMany(I,J,K)if not K or#K==0 then return end local L={}for M,N in K do L[N]=true N:Disconnect()
end local function M(N)if not N then return end local O=0 for P=1,#N do local Q=N[P]if not L[Q]then O+=1 N[O]=Q end end
for P=#N,O+1,-1 do N[P]=nil end end M(I.connections)if J and J~=I then M(J.connections)end end function h.
DestroySubtrees(I,J)if not J or#J==0 then return end local K={}for L,M in J do K[M]=true for N,O in M:GetDescendants()do
K[O]=true end end local L=0 for M=1,#I.instances do local N=I.instances[M]if K[N]then I.themeProperties[N]=nil I.
localeProperties[N]=nil else L+=1 I.instances[L]=N end end for M=#I.instances,L+1,-1 do I.instances[M]=nil end for M,N
in J do N:Destroy()end end function h.Unload(I)I.unloaded=true al.teardown()al.releaseContainer(I.screenGui)if I.
_liveTween then I._liveTween:Cancel()I._liveTween=nil end for J=#I.connections,1,-1 do I.connections[J]:Disconnect()end
for J=#I.instances,1,-1 do I.instances[J]:Destroy()end table.clear(I.connections)table.clear(I.instances)table.clear(I.
themeProperties)table.clear(I.localeProperties)table.clear(I.controls)table.clear(I.tabs)end return h end)()end,[29]=
function()local aa,ab,ac=a(29)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.Parent.
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
end return ae end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.
filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.constants)export type RewriteMap={[number]:string}
export type CacheSettledCallback=(failed:number)->()export type PreloadCallback=CacheSettledCallback export type
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
return''end return ai end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function(...)local ae={}ae.fontAsset=
'rbxassetid://12187365364'ae.pillResizeInfo=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)ae.
icons={close=83277910885129,minimise=108115485663409,maximise=88738500661569,settings=129180860773723,search=
100604009889706,chevron=88479147175134,check=125626312718314,dot=91452555903853,colorpicker=91452555903853,banner=
111263549366178,config=125823673784681,rayfield=80387863064905}ae.accent={on=Color3.fromRGB(23,153,110),onStroke=Color3.
fromRGB(32,201,144)}ae.statAccents={positive={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98))
,stroke=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))},negative={fill=ColorSequence.new(Color3.
fromRGB(172,47,47),Color3.fromRGB(135,37,37)),stroke=ColorSequence.new(Color3.fromRGB(255,75,75),Color3.fromRGB(244,67,
67))},neutral={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(
Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))}}ae.zIndex={elementLock=60,elementLockContent=65,bottomFade=100,
notification=1500,drag=1000,toast=2000,toastContent=2001,restoreContent=100001,restoreInteract=100002}ae.displayOrder={
window=99999,banner=100000,popup=100001}return ae end)()end,[11]=function()local aa,ab,ac=a(11)local ad return(function(
...)local ae={}ae.__index=ae ae.__type='Drag'local af=ab.Parent.Parent.utility local ag,ah=ac(af.variables),ac(af.
constants)function ae.new(ai,aj)aj=if typeof(aj)=='table'then aj else{}local ak=setmetatable({window=assert(ai,
'Missing argument #1 (Window expected)')},ae)ak.drag=ak.window:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
fromOffset(150,20),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,ak.window.size.Y.Offset/2+15),ZIndex=ah
.zIndex.drag,Visible=false,Parent=ak.window.screenGui})ak.dragCosmetic=ak.window:Create('Frame',{BackgroundColor3=Color3
.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.3),ZIndex=ah.zIndex.drag,
BackgroundTransparency=1,Size=UDim2.fromOffset(0,4),Parent=ak.drag})ak.window:Create('UICorner',{CornerRadius=UDim.new(0
,20),Parent=ak.dragCosmetic})ak.window:CreateGlow(ak.dragCosmetic,Color3.fromRGB(255,255,255),10,0.5)ak.dragInteract=ak.
window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),TextTransparency=1,ZIndex=ah.zIndex.drag,
Parent=ak.drag})local al,am,b,c=false,Vector2.zero,(ak.window.screenGui)if b and b.IgnoreGuiInset then am=ag.guiService:
GetGuiInset()end local function d()local e,f,g=ag.userInputService and ag.userInputService:GetMouseLocation()or Vector2.
new(0,0),c or Vector2.new(0,0),am or Vector2.new(0,0)return e+f+g end local function e()local f=d()local g,h=f.X,f.Y if
ak.window.settings and ak.window.settings.keepOnScreen then local i,j,k=ak.window.main.AbsoluteSize,ak.window.screenGui.
AbsoluteSize,8 local l,m=i.X/2,i.Y/2 g=math.clamp(g,l+k,math.max(l+k,j.X-l-k))h=math.clamp(h,m+k,math.max(m+k,j.Y-m-k))
end local i,j=UDim2.fromOffset(g,h),UDim2.fromOffset(g,h+(ak.window.main.Size.Y.Offset/2+15))return i,j end ak.window:
Connect(ak.drag.MouseEnter,function()if not al and not ak.window.hidden then ag.tweenService:Create(ak.dragCosmetic,
TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.5,Size=UDim2.new(0,120,0,4)
}):Play()end end)ak.window:Connect(ak.drag.MouseLeave,function()if not al and not ak.window.hidden then ag.tweenService:
Create(ak.dragCosmetic,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.7,
Size=UDim2.new(0,100,0,4)}):Play()end end)local function f()if not al then return end al=false if not ak.window:
_interactive()then return end ag.tweenService:Create(ak.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.
EasingDirection.Out),{Size=UDim2.new(0,100,0,4),BackgroundTransparency=0.7}):Play()local g,h,i=TweenInfo.new(0.3,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),e()ag.tweenService:Create(ak.window.main,g,{Position=h}):Play()ag.
tweenService:Create(ak.drag,g,{Position=i}):Play()end ak.window:Connect(ak.dragInteract.InputBegan,function(g,h)if h
then return end local i=g.UserInputType.Name if i=='MouseButton1'or i=='Touch'then if not ak.window:_interactive()then
return end al=true if b and b.IgnoreGuiInset then am=ag.guiService:GetGuiInset()end c=ak.window.main.AbsolutePosition+ak
.window.main.AbsoluteSize*ak.window.main.AnchorPoint-ag.userInputService:GetMouseLocation()if not ak.window.hidden then
ag.tweenService:Create(ak.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.
new(0,110,0,4),BackgroundTransparency=0}):Play()end end end)ak.window:Connect(ag.userInputService.InputEnded,function(g)
local h=g.UserInputType.Name if h=='MouseButton1'or h=='Touch'then f()end end)ak.window:Connect(ag.userInputService.
WindowFocusReleased,f)local g,h=1e-7,1e-60 ak.window:Connect(ag.runService.RenderStepped,function(i)if not al then
return end if not ak.window:_interactive()then f()return end local j,k=e()ak.window.main.Position=ak.window.main.
Position:Lerp(j,1-g^i)ak.drag.Position=ak.drag.Position:Lerp(k,1-h^i)end)return ak end return ae end)()end,[44]=function
()local aa,ab,ac=a(44)local ad return(function(...)local ae,af,ag={},2166136261,16777619 local function ah(ai:string):
number local aj=af for ak=1,#ai do aj=bit32.bxor(aj,string.byte(ai,ak))local al=aj%65536 local am=(aj-al)/65536 aj=(((am
*ag)%65536)*65536+al*ag)%4294967296 end return aj end function ae.deriveFlagFromName(ai:string):string local aj=ai:gsub(
'(%S+)',function(aj:string):string return aj:sub(1,1):upper()..aj:sub(2,-1)end):gsub('[^%w]','')if aj==''and ai~=''then
return string.format('Flag%08x',ah(ai))end return aj end return ae end)()end,[61]=function()local aa,ab,ac=a(61)local ad
return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.
persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),{}type SettingsWindow={settings:{toggleKeybind:
EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean,showProfile:boolean}}type
DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,keepOnScreen:unknown?,welcomeToast:unknown?,
haptics:unknown?,showProfile:unknown?}function aj.getSettingsPath():(string,string)return ag.getSettingsPath()end
function aj.saveSettings(ak:SettingsWindow):boolean local al,am=aj.getSettingsPath()local b:{[string]:unknown}={
toggleKeybind={tostring(ak.settings.toggleKeybind.EnumType),ak.settings.toggleKeybind.Value}::{unknown},mouseOverride=ak
.settings.mouseOverride,keepOnScreen=ak.settings.keepOnScreen,welcomeToast=ak.settings.welcomeToast,haptics=ak.settings.
haptics,showProfile=ak.settings.showProfile}local c,d=pcall(ae.httpService.JSONEncode,ae.httpService,b)if not c then
return false end local e=pcall(ah.write,al,am,d)if not e then return false end return true end local function ak(al:
string):(DecodedSettings?,string?)local am=false pcall(function()am=af.isfile(al)end)if not am then return nil,nil end
local b,c=pcall(af.readfile,al)if not b or type(c)~='string'then return nil,nil end local d,e=pcall(ae.httpService.
JSONDecode,ae.httpService,c)if not d or type(e)~='table'then return nil,c end return e::DecodedSettings,c end function
aj.loadSettings(al:SettingsWindow):boolean local am,b=aj.getSettingsPath()local c=ak(b)if not c then local d,e=ak(ah.
tempPathFor(b))if d and e then c=d pcall(ah.write,am,b,e)end end if not c then return false end if c.toggleKeybind then
pcall(function()local d=tostring(c.toggleKeybind[1]):gsub('^Enum%.','')local e=(Enum::any)[d]if e then local f=ai.
itemFromValue(e,c.toggleKeybind[2])if f then al.settings.toggleKeybind=f end end end)end if type(c.mouseOverride)==
'boolean'then al.settings.mouseOverride=c.mouseOverride end if type(c.keepOnScreen)=='boolean'then al.settings.
keepOnScreen=c.keepOnScreen end if type(c.welcomeToast)=='boolean'then al.settings.welcomeToast=c.welcomeToast end if
type(c.haptics)=='boolean'then al.settings.haptics=c.haptics end if type(c.showProfile)=='boolean'then al.settings.
showProfile=c.showProfile end return true end return aj end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(
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
function b.getFontFromId(j:FontManager,k:number|string):Font?return j:resolve(k)end return b end)()end,[42]=function()
local aa,ab,ac=a(42)local ad return(function(...)local ae,af=ac(ab.Parent.services),{}local ag=ae.getService'RunService'
:IsStudio()local ah=not ag and typeof(writefile)=='function'and typeof(readfile)=='function'and typeof(isfile)==
'function'and typeof(isfolder)=='function'and typeof(makefolder)=='function'and typeof(listfiles)=='function'and typeof(
delfile)=='function'and typeof(delfolder)=='function'if ah then function af.writefile(ai:string,aj:string)writefile(ai,
aj)end function af.readfile(ai:string):string return readfile(ai)end if typeof(appendfile)=='function'then function af.
appendfile(ai:string,aj:string)appendfile(ai,aj)end end function af.isfile(ai:string):boolean return isfile(ai)end
function af.delfile(ai:string)delfile(ai)end function af.listfiles(ai:string):{string}return listfiles(ai)end function
af.makefolder(ai:string)makefolder(ai)end function af.isfolder(ai:string):boolean return isfolder(ai)end function af.
delfolder(ai:string)delfolder(ai)end elseif ag then local ai=Instance.new'Folder'ai.Name='Filesystem'ai.Parent=ae.
getService'ReplicatedStorage'local function aj(ak:string):{string}local al={}for am in string.gmatch(ak,'[^/]+')do table
.insert(al,am)end return al end local function ak(al:{string},am:boolean):Instance?local b:Instance=ai for c=1,#al-1 do
local d=b:FindFirstChild(al[c])if not d then if not am then return nil end local e=Instance.new'Folder'e.Name=al[c]e.
Parent=b d=e end b=d::Instance end return b end local function al(am:Instance?):StringValue?if am and am:IsA
'StringValue'then return am end return nil end function af.writefile(am:string,b:string)local c=aj(am)assert(#c>0,
'Invalid path')local d=ak(c,true)assert(d,'Invalid path')local e=c[#c]local f=d:FindFirstChild(e)local g=al(f)if g then
g.Value=b else if f then f:Destroy()end local h=Instance.new'StringValue'h.Name=e h.Value=b h.Parent=d end end function
af.readfile(am:string):string local b=aj(am)assert(#b>0,'Invalid path')local c=ak(b,false)assert(c,'File not found: '..
am)local d=c:FindFirstChild(b[#b])local e=al(d)assert(e,'File not found: '..am)return e.Value end function af.isfile(am:
string):boolean local b=aj(am)if#b==0 then return false end local c=ak(b,false)if not c then return false end return al(
c:FindFirstChild(b[#b]))~=nil end function af.listfiles(am:string):{string}local b,c:Instance=aj(am),ai for d,e in b do
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
af end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag
,ah:{[string]:number},ai,aj=ae.textService,{},{},0,1024 local function ak(al:GetTextBoundsParams):unknown local am,b=
pcall(function()return af:GetTextBoundsAsync(al)end)return if am then b else nil end local function al(am:unknown,b:'X'|
'Y'):number?if typeof(am)=='Vector2'then return if b=='X'then am.X else am.Y end if type(am)=='table'and type((am::any)[
b])=='number'then return(am::any)[b]end return nil end function ag.textWidth(am:Font,b:number,c:any):number c=tostring(c
)local d=tostring(am.Family)..'|'..tostring(am.Weight)..'|'..tostring(am.Style)..'|'..tostring(b)..'|'..c local e=ah[d]
if e then return e end local f=Instance.new'GetTextBoundsParams'f.Text=c f.Font=am f.Size=b f.Width=math.huge local g=
al(ak(f),'X')if not g then local h=utf8.len(c)or#c return math.ceil(b*0.55*h)end local h=math.ceil(g)if ai>=aj then ah={
}ai=0 end ah[d]=h ai+=1 return h end function ag.textHeight(am:Font,b:number,c:any,d:number):number local e=Instance.new
'GetTextBoundsParams'e.Text=tostring(c)e.Font=am e.Size=b e.Width=d local f=al(ak(e),'Y')return if f then math.ceil(f)
else b end return ag end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)local ae,af=ac(ab.Parent.
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
end)()end,[64]=function()local aa,ab,ac=a(64)local ad return(function(...)local ae={}function ae.getService(af)local ag=
game:GetService(af)return if cloneref then cloneref(ag)else ag end return ae end)()end,[46]=function()local aa,ab,ac=a(
46)local ad return(function(...)local ae,af,ag,ah={},ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.
flagNames)ae.textWidth=af.textWidth ae.textHeight=af.textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae.
contrastColor=ag.contrastColor ae.toColorSequence=ag.toColorSequence ae.contrastText=ag.contrastText return ae end)()end
,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag=ae.
textService,{}ag.__index=ag local ah=20 local function ai(aj,ak,al)local am=Instance.new'GetTextBoundsParams'am.Text=al
am.Font=aj am.Size=ak am.Width=math.huge local b,c=pcall(af.GetTextBoundsAsync,af,am)return if b then c else Vector2.
new(ak*0.6,ak)end local aj={}local function ak(al,am)local b=tostring(al.Family)..'|'..tostring(al.Weight)..'|'..
tostring(al.Style)..'|'..tostring(am)local c=aj[b]if c then return c end local d,e={},0 for f=0,9 do local g=math.ceil(
ai(al,am,tostring(f)).X)d[f]=g if g>e then e=g end end c={advance=d,maxWidth=e}aj[b]=c return c end function ag.new(al,
am,b)b=b or{}local c=setmetatable({window=al,container=am,textSize=b.textSize or 16,transparency=b.transparency or 1,
duration=b.duration or 0.55,slots={},length=0},ag)c.roll=TweenInfo.new(c.duration,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)c.zIndex=math.max(am.ZIndex+1,6)c.height=math.ceil(c.textSize)local d=ak(al.theme.Font,c.textSize)c.
advance=d.advance c.maxWidth=d.maxWidth al:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=b.alignment or Enum.HorizontalAlignment.Left,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=am})return c end function ag._reel(al,am)local b=al.
slots[am]if b.reel then return b.reel end local c=al.window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(al.
maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=al.zIndex,Parent=al.
container})local d=al.window:Create('Frame',{Size=UDim2.fromOffset(al.maxWidth,al.height),AnchorPoint=Vector2.new(0.5,0)
,Position=UDim2.new(0.5,0,0,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=al.zIndex,Parent=c})for e=0,ah-1 do al.
window:Create('TextLabel',{Text=tostring(e%10),Position=UDim2.fromOffset(0,e*al.height),Size=UDim2.fromOffset(al.
maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.
Center,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=d},{TextColor3
='ContentColor',FontFace='Font'})end local e={cell=c,strip=d,digit=0,target=0,stripTween=nil,sizeTween=nil}b.reel=e
return e end function ag._static(al,am)local b=al.slots[am]if b.static then return b.static end local c=al.window:
Create('TextLabel',{Name='Static',Size=UDim2.fromOffset(0,al.height),AutomaticSize=Enum.AutomaticSize.X,
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
TextTransparency=b},c,d)end end end end end return ag end)()end,[27]=function()local aa,ab,ac=a(27)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='Tag'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=ac(af.
variables),ac(af.functions),ac(af.image),Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)function ae.new(al,am)am=if typeof(am)=='table'then am else{}local b=setmetatable({window=assert(al,
'Missing argument #1 (Window expected)'),text=am.text or am.Text or am.title or am.Title,icon=am.icon or am.Icon,color=
am.color or am.Color or aj},ae)assert(b.icon or(b.text and b.text~=''),'A Tag requires an icon, text, or both.')b.main=b
.window:Create('Frame',{Name='Tag',Size=UDim2.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=b.
color,BorderSizePixel=0,LayoutOrder=am.order or am.Order or 0,BackgroundTransparency=1,Parent=b.window.tagContainer})b.
window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=b.main})b.window:Create('UIPadding',{PaddingLeft=UDim.new(0,
10),PaddingRight=UDim.new(0,10),Parent=b.main})b.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.
main})local c=ah.contrastColor(b.color)b.iconLabel=b.window:Create('ImageLabel',{Name='Icon',Image=b.icon or'',
ImageColor3=c,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,Visible=b.icon~=nil,ZIndex=5,ImageTransparency=1,
Parent=b.main})b.title=b.window:Create('TextLabel',{Name='Title',AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10
,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,Text=b.text or'',TextColor3=c,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,RichText=true,Visible=b.text~=nil and b.text~='',LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=b.main},{FontFace='Font'})b.window.tagContainer.Visible=true if not b.window.hidden
then b:_setShown(true,ak)end return b end function ae._setShown(al,am,b)local c,d=if am then 0 else 1,if typeof(b)==
'TweenInfo'then b elseif b then ak else nil if d then ag.tweenService:Create(al.main,d,{BackgroundTransparency=c}):Play(
)ag.tweenService:Create(al.iconLabel,d,{ImageTransparency=c}):Play()ag.tweenService:Create(al.title,d,{TextTransparency=
c}):Play()else al.main.BackgroundTransparency=c al.iconLabel.ImageTransparency=c al.title.TextTransparency=c end end
function ae.SetColor(al,am)al.color=am local b=ah.contrastColor(am)ag.tweenService:Create(al.main,ak,{BackgroundColor3=
am}):Play()ag.tweenService:Create(al.iconLabel,ak,{ImageColor3=b}):Play()ag.tweenService:Create(al.title,ak,{TextColor3=
b}):Play()end function ae.SetText(al,am)al.text=am al.title.Text=am or''al.title.Visible=am~=nil and am~=''end function
ae.SetIcon(al,am)al.icon=am ai.assign(al.iconLabel,'Image',am)al.iconLabel.Visible=am~=nil end function ae.Set(al,am)if
am.color or am.Color then al:SetColor(am.color or am.Color)end if am.text or am.Text or am.title or am.Title then al:
SetText(am.text or am.Text or am.title or am.Title)end if am.icon~=nil or am.Icon~=nil then al:SetIcon(am.icon or am.
Icon)end end function ae.Remove(al)al.window:DestroySubtree(al.main)local am=table.find(al.window.tags,al)if am then
table.remove(al.window.tags,am)end if#al.window.tags==0 then al.window.tagContainer.Visible=false end end return ae end
)()end},{{1,2,{'Rayfield'},{{34,2,{'types'}},{35,1,{'utility'},{{66,2,{'variables'}},{67,2,{'windowSizing'}},{63,2,{
'runtime'}},{51,2,{'lockable'}},{47,2,{'image'}},{62,2,{'persistenceWrite'}},{61,2,{'persistenceSettings'}},{65,2,{
'textMetrics'}},{55,2,{'odometer'}},{53,2,{'moveable'}},{64,2,{'services'}},{60,2,{'persistencePaths'}},{59,2,{
'persistenceConfig'}},{42,2,{'filesystem'}},{58,2,{'persistence'}},{44,2,{'flagNames'}},{50,2,{'locale'}},{57,2,{'path'}
},{46,2,{'functions'}},{36,2,{'HapticEngine'}},{37,2,{'assetResolver'}},{49,2,{'layouts'}},{48,2,{'imageCache'}},{54,2,{
'network'}},{45,2,{'fontManager'}},{52,2,{'log'}},{38,2,{'colors'}},{41,2,{'enums'}},{39,2,{'columns'}},{56,2,{
'ordering'}},{43,2,{'filesystemManager'}},{40,2,{'constants'}}}},{2,1,{'components'},{{8,2,{'console'}},{22,2,{'slider'}
},{31,2,{'window'}},{30,2,{'toggle'}},{18,2,{'progress'}},{17,2,{'popup'}},{15,2,{'keybind'}},{13,2,{'group'}},{6,2,{
'colorpicker'}},{28,2,{'text'}},{27,2,{'tag'}},{26,2,{'tabSelector'}},{25,2,{'tabSection'}},{11,2,{'drag'}},{14,2,{
'input'}},{4,2,{'button'}},{7,2,{'column'}},{24,2,{'tab'}},{19,2,{'search'}},{10,2,{'divider'}},{16,2,{'notification'}},
{9,2,{'descriptor'}},{21,2,{'sidebar'}},{20,2,{'section'}},{3,2,{'action'}},{23,2,{'stat'}},{5,2,{'chrome'}},{29,2,{
'toast'}},{12,2,{'dropdown'}}}},{32,1,{'themes'},{{33,2,{'default'}}}}}}},'0.4.1','Rayfield',string,task,setmetatable,
error,next,table,unpack,coroutine,script,type,require,pcall,xpcall,tostring,tonumber,_VERSION local j,k,l,m,n,o,p=aj.
insert,aj.remove,aj.freeze or function(j)return j end,al.wrap,ae.sub,ae.match,ae.gmatch if h and n(h,1,4)=='Lune'then
local q,r=d(c,'@lune/task')if q and r then af=r end end local q=af and af.defer local r,s,t,u,v,w,x,y,z=q or function(r,
...)m(r)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}
local A,B={GetFullName={{},function(A)local B,C=A.Name,A.Parent while C do B=C.Name..'.'..B C=C.Parent end return B end}
,GetChildren={{},function(A)local B={}for C in ai,z[A]do j(B,C)end return B end},GetDescendants={{},function(A)local B={
}for C in ai,z[A]do j(B,C)for D,E in ai,C:GetDescendants()do j(B,E)end end return B end},FindFirstChild={{'string',
'boolean?'},function(A,B,C)local D=z[A]for E in ai,D do if E.Name==B then return E end end if C then for E in ai,D do
return E:FindFirstChild(B,true)end end end},FindFirstAncestor={{'string'},function(A,B)local C=A.Parent while C do if C.
Name==B then return C end C=C.Parent end end},WaitForChild={{'string','number?'},function(A,B)return A:FindFirstChild(B)
end}},{}for C,D in ai,A do local E,F,G=D[1],D[2],{}for H,I in ai,E do local J,K=o(I,'^([^%?]+)(%??)')G[H]={J,K}end B[C]=
function(H,...)if not z[H]then ah("Expected ':' not '.' calling member function "..C,2)end local I={...}for J,K in ai,G
do local L=I[J]local M,N,O=b(L),K[1],K[2]if L==nil and not O then ah('Argument '..L..' missing or nil',3)end if N~='any'
and M~=N and not(M=='nil'and O)then ah('Argument '..J..' expects type "'..N..'", got "'..M..'"',2)end end return F(H,...
)end end local function C(D,E,F)local G,H=(ag({},{__mode='k'}))local function I(J)ah(J..
' is not a valid (virtual) member of '..D..' "'..E..'"',3)end local function J(K)ah(
'Unable to assign (virtual) property '..K..'. Property is read only',3)end local K,L={},{}L.__metatable=false L.__index=
function(M,N)if N=='ClassName'then return D elseif N=='Name'then return E elseif N=='Parent'then return F elseif D==
'StringValue'and N=='Value'then return H else local O=B[N]if O then return O end end for O in ai,G do if O.Name==N then
return O end end I(N)end L.__newindex=function(M,N,O)if N=='ClassName'then J(N)elseif N=='Name'then E=O elseif N==
'Parent'then if O==K then return end if F~=nil then z[F][K]=nil end F=O if O~=nil then z[O][K]=true end elseif D==
'StringValue'and N=='Value'then H=O else I(N)end end L.__tostring=function()return E end ag(K,L)z[K]=G if F~=nil then z[
F][K]=true end return K end local function D(E,F)local G,H,I,J=E[1],E[2],E[3],E[4]local K=s[H]local L=I and k(I,1)or K
local M=C(K,L,F)t[G]=M if I then for N,O in ai,I do M[N]=O end end if J then for N,O in ai,J do D(O,M)end end return M
end local E=C('Folder','['..ad..']')for F,G in ai,ab do D(G,E)end for F,G in ai,aa do local H=t[F]u[H]=G v[H]=F local I=
H.ClassName if I=='LocalScript'or I=='Script'then j(x,H)end end local function F(G)local H,I=G.ClassName,w[G]if I and H
=='ModuleScript'then return ak(I)end local J=u[G]local function K(L)local M,N,O=nil,d(function()return debug.traceback(
nil,2)end)if N then M=O end return{Message=L,Traceback=M}end local function L(M)local N,O=f(M.Message),G:GetFullName()
local P,Q=o(N,'[^:]+:(%d+): (.+)')local R if not P or not i then R=O..':*: '..(Q or N)else P=g(P)local S=v[G]local T=i[S
]local U=P-T+1 if U<0 then U='?'end R=O..':'..U..': '..Q end local S=M.Traceback if S and S~=''then R=R..'\n'..S end
return R end if H=='LocalScript'or H=='Script'then local M,N=e(J,K)if not M then ah(L(N),0)end else local M={e(J,K)}
local N=k(M,1)if not N then local O=k(M,1)ah(L(O),0)end w[G]=M return ak(M)end end function a(G)local H=t[G]
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