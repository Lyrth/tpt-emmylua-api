---
--- Created by Lyr.
--- DateTime: 8/9/2019 12:37 PM
---
--- From: https://www.boxmein.net/tpt/tptelements/reference/lua-reference.html
---
--- Legacy Lua API
--- Most, if not every, methods here are covered in other APIs.
--- Except versions. Those are only accessible here.
---


tpt = {}


tpt.version = {
    major = 81,
    minor = 0,
    build = 292
}

--- Array of particles by index, emulates sim->parts in C++
---@type Particle[]
tpt.parts = {}

-- i dont need to do this tho...
--region tpt.el Elements

tpt.el = {}

---@type Element
tpt.el.nble, tpt.el.smke, tpt.el.thdr, tpt.el.pstn, tpt.el.gpmp, tpt.el.pbcn, tpt.el.conv, tpt.el.gun, tpt.el.dmnd, tpt.el.fsep,
tpt.el.sltw, tpt.el.bomb, tpt.el.wtrv, tpt.el.stne, tpt.el.pste, tpt.el.gold, tpt.el.grav, tpt.el.virs, tpt.el.plnt, tpt.el.neut,
tpt.el.fog, tpt.el.nice, tpt.el.psts, tpt.el.lsns, tpt.el.fuse, tpt.el.dstw, tpt.el.polo, tpt.el.merc, tpt.el.bvbr, tpt.el.snow,
tpt.el.filt, tpt.el.rbdm, tpt.el.spwn2, tpt.el.psns, tpt.el.cnct, tpt.el.aray, tpt.el.cray, tpt.el.hswc, tpt.el.dtec, tpt.el.spng,
tpt.el.stk2, tpt.el.stkm, tpt.el.dlay, tpt.el.whol, tpt.el.bmtl, tpt.el.shd3, tpt.el.sawd, tpt.el.pipe, tpt.el.fwrk, tpt.el["c-4"],
tpt.el.lava, tpt.el.dric, tpt.el.etrd, tpt.el.ldtc, tpt.el.bcln, tpt.el.heac, tpt.el.bizg, tpt.el.emp, tpt.el.tron, tpt.el.coal,
tpt.el.caus, tpt.el.rime, tpt.el.yest, tpt.el.co2, tpt.el.sing, tpt.el.iron, tpt.el.pvod, tpt.el.vibr, tpt.el.spwn, tpt.el.figh,
tpt.el.bizs, tpt.el.bizr, tpt.el.embr, tpt.el.tnt, tpt.el.ice, tpt.el.rfgl, tpt.el.loxy, tpt.el.wifi, tpt.el.rfrg, tpt.el.glow,
tpt.el.love, tpt.el.clst, tpt.el.grvt, tpt.el.vrsg, tpt.el.mwax, tpt.el.phot, tpt.el.pscn, tpt.el.vrss, tpt.el.fire, tpt.el.acel,
tpt.el.prot, tpt.el.acid, tpt.el.goo, tpt.el.frme, tpt.el.ppip, tpt.el.brck, tpt.el.pqrt, tpt.el.tsns, tpt.el.shld, tpt.el.qrtz,
tpt.el.lcry, tpt.el.rpel, tpt.el.fray, tpt.el.uran, tpt.el.inwr, tpt.el.gbmb, tpt.el.invs, tpt.el.pump, tpt.el.dray, tpt.el.bhol,
tpt.el.oil, tpt.el.soap, tpt.el.sand, tpt.el.hygn, tpt.el.bcol, tpt.el.exot, tpt.el.bray, tpt.el.shd4, tpt.el.ignc, tpt.el.eqve,
tpt.el.bran, tpt.el.insl, tpt.el.gel, tpt.el.salt, tpt.el.wax, tpt.el.boyl, tpt.el.amtr, tpt.el.prto, tpt.el.stor, tpt.el.ttan,
tpt.el["c-5"], tpt.el.vent, tpt.el.glas, tpt.el.inst, tpt.el.shd2, tpt.el.frzw, tpt.el.nitr, tpt.el.tung, tpt.el.dyst, tpt.el.clne,
tpt.el.wwld, tpt.el.warp, tpt.el.swch, tpt.el.ptct, tpt.el.desl, tpt.el.brmt, tpt.el.btry, tpt.el.nscn, tpt.el.dest, tpt.el.wood,
tpt.el.ln2, tpt.el.bgla, tpt.el.elec, tpt.el.lolz, tpt.el.prti, tpt.el.plut, tpt.el.dust, tpt.el.thrm, tpt.el.life, tpt.el.vacu,
tpt.el.watr, tpt.el.lrbd, tpt.el.firw, tpt.el.cflm, tpt.el.ligh, tpt.el.brel, tpt.el.pcln, tpt.el.oxyg, tpt.el.ntct, tpt.el.void,
tpt.el.sprk, tpt.el.tesc, tpt.el.crmc, tpt.el.dcel, tpt.el.frzz, tpt.el.gas, tpt.el.deut, tpt.el.metl, tpt.el.bubw, tpt.el.mort,
tpt.el.dmg, tpt.el.plsm, tpt.el.isoz, tpt.el.iszs, tpt.el.anar, tpt.el.vine = {}

--endregion


--- Draws a text string only for the next frame
---@param x int
---@param y int
---@param text string
---@overload fun(x:int, y:int, text:string, r:int, g:int, b:int):void
---@overload fun(x:int, y:int, text:string, r:int, g:int, b:int, a:int):void
function tpt.drawtext(x, y, text) end

--- Creates a new particle at (x, y)
---@param x int
---@param y int
---@return partID index
function tpt.create(x, y) end

--- Pauses/unpauses the game (1 = paused). -1 returns the paused state.
---@param state boolint
---@return nil|int
function tpt.set_pause(state) end

--- Toggles pause for the game.
---@return int
function tpt.toggle_pause() end

--- Opens/closes the console (1 = open)
---@param state boolint
function tpt.set_console(state) end

--- Logs to the console - precisely the thing on the right
---@param text string
function tpt.log(text) end

--- Sets pressure for given rectangle. [wall coordinates]
---@param x int
---@param y int
---@param width int
---@param height int
---@param value int
function tpt.set_pressure(x, y, width, height, value) end

--- Sets the Newtonian Gravity for a given position.
---@param x int
---@param y int
---@overload fun(x:int, y:int, width:int, height:int):void
---@overload fun(x:int, y:int, width:int, height:int, value:int):void
function tpt.set_gravity(x, y) end

--- Sets gravity at (x, y) to 0.0
---@param x int
---@param y int
---@overload fun(x:int, y:int, width:int, height:int):void
function tpt.reset_gravity_field(x, y) end

--- Sets velocity (vx and vy) in the specified rectangle to 0
---@param x int
---@param y int
---@overload fun(x:int, y:int, width:int, height:int):void
function tpt.reset_velocity(x, y) end

--- Converts SPRK(X) into X
function tpt.reset_spark() end

--- Sets a property of an element [affects every element]
---@param property partProperty
---@param value number
---@overload fun(property:partProperty, value:number, type:string):void @ [affects elements of 1 type]
---@overload fun(property:partProperty, value:number, index:int):void @ [affects particle via index]
---@overload fun(property:partProperty, value:number, index:int, type:string):void @ [affects particle via index if it is of the specified type]
---@overload fun(property:partProperty, value:number, x:int, y:int):void @ [affects particle via position]
---@overload fun(property:partProperty, value:number, x:int, y:int, type:string):void @ [affects particle via x/y if of the specified type]
---@overload fun(property:partProperty, value:number, x:int, y:int, width:int, height:int):void @ [affects region]
---@overload fun(property:partProperty, value:number, x:int, y:int, width:int, height:int, type:string):void @ [affects region if of the specified type]
function tpt.set_property(property, value) end

--- Returns some property of a given particle
---@param property partProperty
---@param index partID
---@overload fun(property:partProperty, x:int, y:int):number
---@return number
function tpt.get_property(property, index) end

--- Place or change a wall at (x, y) to (value)
---@param x int
---@param y int
---@param value int
function tpt.set_wallmap(x, y, value) end

--- Get the wall at [wall coordinates!] x, y
---@param x int
---@param y int
---@return int
function tpt.get_wallmap(x, y) end

--- Sets the sim->emap value for [wall coordinate] x, y
---@param x int
---@param y int
---@param value int
function tpt.set_elecmap(x, y, value) end

--- Returns the sim->emap value for [wall coordinate] x, y
---@param x int
---@param y int
---@return int
function tpt.get_elecmap(x, y) end

--- Draws a pixel for the next frame
---@param x int
---@param y int
---@overload fun(x:int, y:int, r:int, g:int, b:int):void
---@overload fun(x:int, y:int, r:int, g:int, b:int, a:int):void
function tpt.drawpixel(x, y) end

--- Draws a hollow rect for the next frame
---@param x int
---@param y int
---@param width int
---@param height int
---@overload fun(x:int, y:int, width:int, height:int, red:int, green:int, blue:int):void
---@overload fun(x:int, y:int, width:int, height:int, red:int, green:int, blue:int, alpha:int):void
function tpt.drawrect(x, y, width, height) end

--- Draws a filled rect for the next frame
---@param x int
---@param y int
---@param width int
---@param height int
---@overload fun(x:int, y:int, width:int, height:int, red:int, green:int, blue:int):void
---@overload fun(x:int, y:int, width:int, height:int, red:int, green:int, blue:int, alpha:int):void
function tpt.fillrect(x, y, width, height) end

--- Draws a line for the next frame
---@param x1 int
---@param y1 int
---@param x2 int
---@param y2 int
---@overload fun(x1:int, y1:int, x2:int, y2:int, red:int, green:int, blue:int):void
---@overload fun(x1:int, y1:int, x2:int, y2:int, red:int, green:int, blue:int, alpha:int):void
function tpt.drawline(x1, y1, x2, y2) end

--- Find out the width of a string of text in the TPT font
---@param text string
---@return int
function tpt.textwidth(text) end

--- Returns username
---@return string
function tpt.get_name() end

--- Enable/Disable key shortcuts
---@param state boolint
function tpt.set_shortcuts(state) end

--- Delete particle @ position/index
---@param index partID
---@overload fun(x:int, y:int):void
function tpt.delete(index) end

--- Add a function to be run every tick. You can have 6 of these.
---@param onTick fun()
function tpt.register_step(onTick) end

--- Remove a given tick function to clean up the place. Ha!
---@param onTick fun()
function tpt.unregister_step(onTick) end

--- Add a function(int mousex, int mousey, int button, int event) to run on mouse click.
---@param onClick fun(mousex:int, mousey:int, button:int, event:int)
function tpt.register_mouseclick(onClick) end

--- Remove a given click function
---@param onClick fun(mousex:int, mousey:int, button:int, event:int)
function tpt.unregister_mouseclick(onClick) end

--- Add a function to run on keypress. Arguments: char key, int keyCode, int modifierKeys, int event
---@param onKey fun(key:char, keyCode:int, modifierKeys:int, event:int)
function tpt.register_keypress(onKey) end

--- Remove a given key press function.
---@param onKey fun(key:char, keyCode:int, modifierKeys:int, event:int)
function tpt.unregister_keypress(onKey) end

tpt.register_mouseevent   = tpt.register_mouseclick
tpt.unregister_mouseevent = tpt.unregister_mouseclick
tpt.register_keyevent     = tpt.register_keypress
tpt.unregister_keyevent   = tpt.register_keyevent

--- Prompt the user for input and return the data as string. Like prompt()
---@param title string
---@param message string
---@return string
function tpt.input(title, message) end

--- Show an user some information. Really generic. Like alert()
---@param title string
---@param message string
function tpt.message_box(title, message) end

--- Returns the particle count right now (a maximum of 235008)
---@return int
function tpt.get_numOfParts() end

--- Prepare getPartIndex in order to use the other two functions
function tpt.start_getPartIndex() end

--- True if there's a particle ID to be returned by getPartIndex
---@return boolean
function tpt.next_getPartIndex() end

--- Returns the next used particle index (you can loop over this)
---@return partID index
function tpt.getPartIndex() end

--- Show/Hide the HUD. (1 = Show). -1 returns current state.
---@param state boolint
---@return nil|int
function tpt.hud(state) end

--- Set Newtonian Gravity. (1 = On). -1 returns current state.
---@param state boolint
---@return nil|int
function tpt.newtonian_gravity(state) end

--- Set Ambient Heat. (1 = On) -1 returns current state.
---@param state boolint
---@return nil|int
function tpt.ambient_heat(state) end

--- Set active menu section. -1 returns current state.
---@param menuID int
---@return nil|int
function tpt.active_menu(menuID) end

--- Toggle decorations. (1 = On) -1 returns current state.
---@param state boolint
---@return nil|int
function tpt.decorations_enable(state) end

--- Set Display mode.
---@param displayID int
function tpt.display_mode(displayID) end

--- Display a message with an error of your choosing.
---@param text string
function tpt.throw_error(text) end

--- Toggle Heat. (1 = On) -1 returns current state.
---@param state boolint
---@return nil|int
function tpt.heat(state) end

--- Set strength of fire effects
---@param strength int
function tpt.setfire(strength) end

--- Deprecated:  Set debug level. 1 is what pressing D produces, higher levels used to do something
---@param level int
function tpt.setdebug(level) end

--- Set max FPS
---@param maxFPS int
function tpt.setfpscap(maxFPS) end

--- Fetch a script from the TPT Script Index. The index has no known entries as of 2013-12-27.
---@param author string
---@param id string
function tpt.getscript(author, id) end

--- Set window size (scaled or fullscreen)
---@param scale int @ 1 or 2
---@param fullscreen boolint
function tpt.setwindowsize(scale, fullscreen) end

--- Toggle water equalization. Returns new state.
---@return int
function tpt.watertest() end

--- Take a screenshot and save it as screenshot_####.png
function tpt.screenshot() end

--- Return element ID from element name as string
---@param element string
---@overload fun(elementID:elemID):string @ Return element name as string from element ID
---@return elemID
function tpt.element(element) end

--- Returns the current clipboard data as text
---@return string
function tpt.get_clipboard() end

--- Sets the current clipboard data as text
---@param data string
function tpt.set_clipboard(data) end

---@alias elementFunc fun(index:partID, x:int, y:int, surround_space:int, no_type:int)
---@alias graphicsFunc fun(index:partID, colr:int, colg:int, colb:int)

--- Make a particle update function. #update_func
---@param id elemID
---@param onElement elementFunc
---@overload fun(id:elemID, onElement:elementFunc, replace:boolean):void @ Replace the previous update function.
function tpt.element_func(id, onElement) end

--- Make an element look fancy. #graphics_func
--- onDraw returns (cache, pixel_mode, cola, colr, colg, colb, firea, firer, fireg, and fireb)
--- The cache variable tells the graphics renderer not to call this function anymore.
---@param id elemID
---@param onDraw graphicsFunc
function tpt.graphics_func(id, onDraw) end
