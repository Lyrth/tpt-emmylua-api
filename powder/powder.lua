---
--- Created by Lyr.
--- DateTime: 8/4/2019 5:38 PM
---
--- From: https://www.boxmein.net/tpt/tptelements/reference/lua-reference.html
---
--- Global namespace
--- When things don't belong to tables.
---


--region aliases

---@class int : number @ Integer
---@class uint : int @ Unsigned int
---@class uint16 : int @ 16-bit unsigned int
---@class boolint : int @ Int as boolean (0 or 1)
---@class elemID : int @ Element ID
---@class partID : int @ Simulation particle ID
---@class float : number @ Floating-point decimal number
---@class char : string @ Single character

--endregion aliases


--region classes

---@class Element @ Element definition
---@field id elemID
---@field name string
---@field color int
-----@field colour int
---@field advection float
---@field airdrag float
---@field airloss float
---@field loss float
---@field collision float
---@field gravity float
---@field diffusion float
---@field hotair float
---@field falldown int
---@field flammable int
---@field explosive int
---@field meltable boolint
---@field hardness int
---@field menu boolint
---@field enabled boolint
---@field weight int
---@field menusection elemSection
---@field heat float
---@field hconduct int
---@field state elemState @ missing, but is nil
---@field properties elemProp
---@field description string
local Element = {}


-- yeah
---@alias elemProperty string | '"Weight"' | '"HotAir"' | '"Properties"' | '"HighTemperatureTransition"' | '"LowPressureTransition"' | '"AirLoss"' | '"Gravity"' | '"Name"' | '"Colour"' | '"Identifier"' | '"PhotonReflectWavelengths"' | '"HighTemperature"' | '"Enabled"' | '"Diffusion"' | '"Advection"' | '"Hardness"' | '"HighPressureTransition"' | '"HighPressure"' | '"Loss"' | '"MenuVisible"' | '"LowTemperatureTransition"' | '"MenuSection"' | '"Collision"' | '"AirDrag"' | '"LowTemperature"' | '"Color"' | '"Explosive"' | '"Falldown"' | '"Meltable"' | '"Temperature"' | '"Description"' | '"LowPressure"' | '"HeatConduct"' | '"Flammable"'


---@class Particle @ Simulation particle definition
---@field type elemID
---@field life int
---@field ctype elemID
---@field x float
---@field y float
---@field vx float
---@field vy float
---@field temp float
---@field pavg float[]
--|@field flags int  -- displayed as "Invalid property"
---@field tmp int
---@field tmp2 int
---@field pavg0 int
---@field pavg1 int
---@field dcolor uint
-----@field dcolour uint
local Particle = {}

--endregion classes


-- TODO: cast Reveal on `socket`
-- might just probably be luasocket, require "ltn12" works, "socket.http" errors, etc
socket = {}

-- TODO: functions in _G:
-- gcinfo
-- newproxy
-- jit @ AH YES JIT
-- require-able things, incl. but not limited to: "ffi", luasocket things, jit things, etc