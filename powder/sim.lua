---
--- Created by Lyr.
--- DateTime: 8/12/2019 7:29 PM
---
--- From: https://www.boxmein.net/tpt/tptelements/reference/lua-reference.html
---
--- Simulation API
--- Everything to do with particles, pressure, heat, gravity, resetting temperature, whatnot.
---


sim = {}
simulation = sim

---@alias partProperty string | '"ctype"' | '"dcolour"' | '"life"' | '"temp"' | '"tmp"' | '"tmp2"' | '"type"' | '"vx"' | '"vy"' | '"x"' | '"y"' | '"pavg0"' | '"pavg1"' @-- '"flags"' doesn't work.

---@type partProperty
sim.FIELD_CTYPE, sim.FIELD_DCOLOUR, sim.FIELD_FLAGS, sim.FIELD_LIFE, sim.FIELD_TEMP, sim.FIELD_TMP, sim.FIELD_TMP2, sim.FIELD_TYPE, sim.FIELD_VX, sim.FIELD_VY, sim.FIELD_X, sim.FIELD_Y = ""


--[[
||
||  TODO: finish this section.
||
]]--


--- Returns an iterator returning existing element indexes which you can for index in sim.parts() over.
---@param type elemID
---@return int
function sim.elementCount(type) end

--- Returns an iterator returning existing element indexes which you can for index in sim.parts() over.
---@return fun():partID
function sim.parts() end

---Returns the sim->pmap entry for a given location. (Looks like just the particle id)
---@param x int
---@param y int
---@return partID
function sim.pmap(x, y) end

---neighbors
---@param x int
---@param y int
---@param rx int @ Default is 2
---@param ry int @ ^
---@overload fun(x:int,y:int):(fun():partID, int, int)
---@return (fun():partID, int, int) @ particle ID, x, y
function sim.neighbors(x, y, rx, ry) end
sim.neighbours = sim.neighbors
