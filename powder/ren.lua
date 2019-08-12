---
--- Created by Lyr.
--- DateTime: 8/12/2019 6:14 PM
---
--- From: https://www.boxmein.net/tpt/tptelements/reference/lua-reference.html
---
--- Renderer API
--- Everything to do with how particles look.
---


ren = {}
renderer = {}

--region Constants

--[[ Pixel drawing modes. See Particle_Drawing_Modes.png for a quick reference. ]]
ren.PMODE,          -- Bitmask to get display modes via binary AND
ren.PMODE_NONE,     -- Invisible as in totally invisible
ren.PMODE_FLAT,     -- Regular like Basic view
ren.PMODE_BLOB,     -- Blurry like Blob view
ren.PMODE_BLUR,     -- Blurry like wtrv
ren.PMODE_GLOW,     -- Glowy like PLUT with fancy view
ren.PMODE_SPARK,    -- Sparks used to be drawn more fancily
ren.PMODE_FLARE,    -- Flare like BOMB
ren.PMODE_LFLARE,   -- Large flare like DEST
ren.PMODE_ADD,      -- If particles are stacking then adds up the colours
ren.PMODE_BLEND     -- Weaker than the above, does blendy magic.
    = 0x00000FFF, 0x00000000, 0x00000001, 0x00000002, 0x00000004, 0x00000008, 0x00000010, 0x00000020, 0x00000040, 0x00000080, 0x00000100

ren.PSPEC_STICKMAN, -- Only works for STKM, shows them as STKM
ren.OPTIONS,        -- A bit mask for the option bit. If you're making a custom render mode just always involve this.
ren.NO_DECO         -- politely refuses decorations be drawn upon it (like LCRY)
    = 0x00000200, 0x0000F000, 0x00001000

ren.DECO_FIRE,      -- enables changing the blur colour via deco
ren.FIREMODE,       -- Bit mask for fire modes (below)
ren.FIRE_ADD,       -- A pixel mode that makes it drawn like a fire particle.
ren.FIRE_BLEND      -- ^ with blendy magic.
    = 0x00002000, 0x00FF0000, 0x00100000, 0x00200000

ren.EFFECT,
ren.EFFECT_GRAVIN,  -- Enables what PRTI does (particle sucky effect), however more life/ctype magic may be needed
ren.EFFECT_GRAVOUT, -- ^ for PRTO
ren.EFFECT_LINES,
ren.EFFECT_DBGLINES
    = 0xFF000000, 0x01000000, 0x02000000, 0x04000000, 0x08000000

--[[ Render mode flags all bundled up together ]]
ren.RENDER_EFFE = ren.OPTIONS + ren.PSPEC_STICKMAN + ren.EFFECT + ren.PMODE_SPARK + ren.PMODE_FLARE + ren.PMODE_LFLARE
ren.RENDER_FIRE = ren.OPTIONS + ren.PSPEC_STICKMAN + ren.PMODE_ADD + ren.PMODE_BLEND + ren.FIREMODE
ren.RENDER_GLOW = ren.OPTIONS + ren.PSPEC_STICKMAN + ren.PMODE_GLOW + ren.PMODE_ADD + ren.PMODE_BLEND
ren.RENDER_BLUR = ren.OPTIONS + ren.PSPEC_STICKMAN + ren.PMODE_BLUR + ren.PMODE_ADD + ren.PMODE_BLEND
ren.RENDER_BLOB = ren.OPTIONS + ren.PSPEC_STICKMAN + ren.PMODE_BLOB + ren.PMODE_ADD + ren.PMODE_BLEND
ren.RENDER_BASC = ren.OPTIONS + ren.PSPEC_STICKMAN + ren.PMODE_FLAT + ren.PMODE_ADD + ren.PMODE_BLEND + ren.EFFECT_LINES
ren.RENDER_NONE = ren.OPTIONS + ren.PSPEC_STICKMAN + ren.PMODE_FLAT

--[[ What particle colors get drawn like - heat view or regular or whatnot ]]
ren.COLOUR_HEAT,    -- This is like Heat view.
ren.COLOUR_LIFE,    -- Like Life display
ren.COLOUR_GRAD,    -- Like Heat Gradient display
ren.COLOUR_BASC,    -- Like Basic display
ren.COLOUR_DEFAULT  -- Default whatever
    = 0x0000001, 0x0000002, 0x0000004, 0x0000008, 0x00000000

ren.DISPLAY_AIRC,
ren.DISPLAY_AIRP,   -- Display air pressure
ren.DISPLAY_AIRV,   -- Display air velocity
ren.DISPLAY_AIRH,   -- Display air heat
ren.DISPLAY_AIR,
ren.DISPLAY_WARP,   -- Enable gravity wells
ren.DISPLAY_PERS,   -- Display Persistent lines
ren.DISPLAY_EFFE
    = 0x00000001, 0x00000002, 0x00000004, 0x00000008, 0x0000000F, 0x00000010, 0x00000020, 0x00000040

--endregion Constants

--- Get/set the render mode table
---@param renderModeTable int[]
---@overload fun():int[]
function ren.renderModes(renderModeTable) end

--- Get/set the display mode table
---@param displayModeTable int[]
---@overload fun():int[]
function ren.displayModes(displayModeTable) end

--- Get/set color mode
---@param colorMode int
---@overload fun():int
function ren.colorMode(colorMode) end
ren.colourMode = ren.colorMode;

--- Get or set whether decorations are enabled.
---@param state boolint
---@overload fun():boolint
function ren.decorations(state) end

--- Get or set the grid display size
---@param size int
---@overload fun():int
function ren.grid(size) end

--- Get/set whether or not debug HUD is visible. Replacement for tpt.setdebug
---@param level int
---@overload fun():int
function ren.debugHUD(level) end
