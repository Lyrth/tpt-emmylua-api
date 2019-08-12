---
--- Created by Lyr.
--- DateTime: 8/9/2019 12:52 PM
---
--- From: https://www.boxmein.net/tpt/tptelements/reference/lua-reference.html
---
--- Interface API
--- We apologize for the inconvenience.
---


ui = {}
interface = ui

--- Opens a Window.
---@param w Window
function ui.showWindow(w) end

--- Closes a Window.
---@param w Window
function ui.closeWindow(w) end

--- Adds a Component to the main window.
---@param c Component
function ui.addComponent(c) end

--- Removes a Component from the main window.
---@param c Component
function ui.removeComponent(c) end


--region Component

--- Generic class for utilities
---@class Component
local Component = {}

--- Gets/sets whether the component is visible
---@param visible boolean
---@overload fun():boolean
function Component:visible(visible) end

--- Gets/sets the component's size
---@param width int
---@param height int
---@overload fun():int, int
function Component:size(width, height) end

--- Gets/sets the component's position
---@param x int
---@param y int
---@overload fun():int, int
function Component:position(x, y) end

--endregion Component

--region Window

---@class Window @ :visible is missing for a window.
Window = {}

--- A container element for components. Set x/y to -1 to center.
---@param x int
---@param y int
---@param width int
---@param height int
---@return Window
function Window:new(x, y, width, height) end

--- Gets/sets the component's size
---@param width int
---@param height int
---@overload fun():int, int
function Window:size(width, height) end

--- Gets/sets the component's position
---@param x int
---@param y int
---@overload fun():int, int
function Window:position(x, y) end

--region Window Callbacks

--- Function listener for initialization. Callback has no arguments.
---@param func fun()
function Window:onInitialized(func) end

--- Every tick. Callback has no arguments.
---@param func fun()
function Window:onTick(func) end

--- When the window closes. Callback has no arguments.
---@param func fun()
function Window:onExit(func) end

--- [no description]
---@param func fun()
function Window:onTryOkay(func) end

--- When the window is drawn.
---@param func fun()
function Window:onDraw(func) end

--- Callback args: int x, int y, int button
---@param func fun(x:int, y:int, button:int)
function Window:onMouseUp(func) end

--- Callback args: int x, int y, int button
---@param func fun(x:int, y:int, button:int)
function Window:onMouseDown(func) end

--- Callback args: int x, int y, int dx, int dy
---@param func fun(x:int, y:int, dx:int, dy:int)
function Window:onMouseMove(func) end

--- Callback args: int x, int y, int d
---@param func fun(x:int, y:int, d:int)
function Window:onMouseWheel(func) end

--- Callback args: int key, Uint16 character, bool shift, bool ctrl, bool alt
---@param func fun(key:int, char:uint16, shift:boolean, ctrl:boolean, alt:boolean)
function Window:onKeyPress(func) end

--- Callback args: int key, Uint16 character, bool shift, bool ctrl, bool alt
---@param func fun(key:int, char:uint16, shift:boolean, ctrl:boolean, alt:boolean)
function Window:onKeyRelease(func) end

--- When receives focus. Callback has no arguments.
---@param func fun()
function Window:onFocus(func) end

--- When loses focus. Callback has no arguments.
---@param func fun()
function Window:onBlur(func) end

--- When user attempts to exit the window. Callback has no arguments.
---@param func fun()
function Window:onTryExit(func) end

--endregion Window Callbacks

--- Adds a Component to the Window.
---@param c Component
function Window:addComponent(c) end

--- Removes a Component from the Window.
---@param c Component
function Window:removeComponent(c) end

--endregion Window


--region Button

---@class Button : Component
Button = {}

--- Creates a new button. Event listener needs to be attached later.
---@param x int
---@param y int
---@param width int
---@param height int
---@overload fun(x:int, y:int, w:int, h:int, text:string):Button
---@overload fun(x:int, y:int, w:int, h:int, text:string, tooltip:string):Button
---@return Button
function Button:new(x, y, width, height) end

--- Attaches an event listener. Arguments: Button sender
---@param onClick fun(sender:Button)
function Button:action(onClick) end

--- Gets/sets the button's text
---@param text string
---@overload fun():string
function Button:text(text) end

--- Get/set the button's enabled state
---@param state boolean
---@overload fun():boolean
function Button:enabled(state) end

--endregion Button


--region ProgressBar

---@class ProgressBar : Component
ProgressBar = {}

--- Creates a new instance.
---@param x int
---@param y int
---@param width int
---@param height int
---@overload fun(x:int, y:int, w:int, h:int, progress:int):ProgressBar
---@overload fun(x:int, y:int, w:int, h:int, progress:int, status:string):ProgressBar
---@return ProgressBar
function ProgressBar:new(x, y, width, height) end

--- Gets/sets the progress bar progress [0:100] -1 makes it scroll right slowly.
---@param progress int
---@overload fun():int
function ProgressBar:progress(progress) end

--- Gets/sets the progress bar's status text.
---@param status string
---@overload fun():string
function ProgressBar:status(status) end

--endregion ProgressBar


--region Slider

---@class Slider : Component
Slider = {}

--- Creates a new instance. Specify the event listener and handler later on.
---@param x int
---@param y int
---@param width int
---@param height int
---@return Slider
function Slider:new(x, y, width, height) end

--- Attaches a onChanged event handler. Arguments: sender, value
---@param onChange fun(sender:Slider, value:int)
function Slider:onValueChanged(onChange) end

--- Gets/sets its value.
---@param value int
---@overload fun():int
function Slider:value(value) end

--- Gets/sets the amount of 'steps' the slider has.
---@param steps int
---@overload fun():int
function Slider:steps(steps) end

--endregion Slider


--region Checkbox

---@class Checkbox : Component
Checkbox = {}

--- Creates a new instance.
---@param x int
---@param y int
---@param width int
---@param height int
---@overload fun(x:int, y:int, w:int, h:int, text:string):Checkbox
---@return Checkbox
function Checkbox:new(x, y, width, height) end

--- Attaches an event listener. Arguments: sender, value
---@param onAction fun(sender:Checkbox, value:int)
function Checkbox:action(onAction) end

--- Gets/sets its text.
---@param text string
---@overload fun():string
function Checkbox:text(text) end

--- Gets/sets its checked state.
---@param checked int
---@overload fun():int
function Checkbox:checked(checked) end

--endregion Checkbox


--region Label

---@class Label : Component
Label = {}

--- Creates a new instance.
---@param x int
---@param y int
---@param width int
---@param height int
---@overload fun(x:int, y:int, w:int, h:int, text:string):Label
---@return Label
function Label:new(x, y, width, height) end

--- Gets/sets its text.
---@param text string
---@overload fun():string
function Label:text(text) end

--endregion Label


--region Textbox

---@class Textbox : Component
Textbox = {}

--- Creates a new instance.
---@param x int
---@param y int
---@param width int
---@param height int
---@overload fun(x:int, y:int, w:int, h:int, text:string):Textbox
---@overload fun(x:int, y:int, w:int, h:int, text:string, placeholder:string):Textbox
---@return Textbox
function Textbox:new(x, y, width, height) end

--- Attaches an event listener. Arguments: Textbox sender
---@param onChange fun(sender:Textbox)
function Textbox:onTextChanged(onChange) end

--- Gets/sets its readonly state.
---@param readonly boolean
---@overload fun():boolean
function Textbox:readonly(readonly) end

--- Gets/sets its text.
---@param text string
---@overload fun():string
function Textbox:text(text) end

--endregion Textbox
