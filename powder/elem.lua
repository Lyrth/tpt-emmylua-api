---
--- Created by Lyr.
--- DateTime: 8/11/2019 5:04 PM
---
--- From: https://www.boxmein.net/tpt/tptelements/reference/lua-reference.html
---
--- Elements API
--- Everything to do with elements, adding them, modifying them, ...
---


elem = {}
elements = elem

---@class elemType : number
---@class elemProp : number
---@class elemFlag : number
---@class elemState : number
---@class elemSection : number

--region Constants

--- Particle movement types in .properties
---@type elemType
elem.TYPE_PART, elem.TYPE_LIQUID, elem.TYPE_SOLID, elem.TYPE_GAS, elem.TYPE_ENERGY
    = 0x00001, 0x00002, 0x00004, 0x00008, 0x00010

--- Particle properties
---@type elemProp
elem.PROP_CONDUCTS, elem.PROP_BLACK, elem.PROP_NEUTPENETRATE, elem.PROP_NEUTABSORB, elem.PROP_NEUTPASS, elem.PROP_DEADLY, elem.PROP_HOT_GLOW, elem.PROP_LIFE, elem.PROP_RADIOACTIVE, elem.PROP_LIFE_DEC, elem.PROP_LIFE_KILL, elem.PROP_LIFE_KILL_DE, elem.PROP_SPARKSETTLE, elem.PROP_NOAMBHEAT, elem.PROP_DRAWONCTYPE, elem.PROP_NOCTYPEDRAW
    = 0x00020, 0x00040, 0x00080, 0x00100, 0x00200, 0x00400, 0x00800, 0x01000, 0x02000, 0x04000, 0x08000, 0x10000, 0x20000, 0x40000, 0x80000, 0x100000

--- .flags for how often update happens et cetera
---@type elemFlag
elem.FLAG_STAGNANT, elem.FLAG_SKIPMOVE, elem.FLAG_MOVABLE
    = 0x1, 0x2, 0x8

--- .state values - element states
---@type elemState
elem.ST_NONE, elem.ST_SOLID, elem.ST_LIQUID, elem.ST_GAS
    = 0, 1, 2, 3

--- Element categories in the menu
---@type elemSection
elem.SC_WALL, elem.SC_ELEC, elem.SC_POWERED, elem.SC_SENSOR, elem.SC_FORCE, elem.SC_EXPLOSIVE, elem.SC_GAS, elem.SC_LIQUID, elem.SC_POWDERS, elem.SC_SOLIDS, elem.SC_NUCLEAR, elem.SC_SPECIAL, elem.SC_LIFE, elem.SC_TOOL, elem.SC_DECO
    = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14

--endregion Constants

-- why am i doing this
--region DEFAULT_PT Elements

---@type elemID
elem.DEFAULT_PT_SMKE, elem.DEFAULT_PT_LNTG, elem.DEFAULT_PT_IRON, elem.DEFAULT_PT_GLOW, elem.DEFAULT_PT_QRTZ, elem.DEFAULT_PT_SHLD4, elem.DEFAULT_PT_RIME, elem.DEFAULT_PT_GRAV, elem.DEFAULT_PT_SPWN, elem.DEFAULT_PT_DUST,
elem.DEFAULT_PT_PIPE, elem.DEFAULT_PT_GOO, elem.DEFAULT_PT_FSEP, elem.DEFAULT_PT_SHLD2, elem["DEFAULT_PT_C-4"], elem.DEFAULT_PT_GPMP, elem.DEFAULT_PT_GEL, elem.DEFAULT_PT_SAWD, elem.DEFAULT_PT_PSNS, elem.DEFAULT_PT_116,
elem.DEFAULT_PT_ISOZ, elem.DEFAULT_PT_DMND, elem.DEFAULT_PT_WWLD, elem.DEFAULT_PT_PLUT, elem.DEFAULT_PT_BIZS, elem.DEFAULT_PT_TSNS, elem.DEFAULT_PT_DTEC, elem.DEFAULT_PT_LIGH, elem.DEFAULT_PT_PSTE, elem.DEFAULT_PT_WATR,
elem.DEFAULT_PT_EMBR, elem.DEFAULT_PT_ICEI, elem.DEFAULT_PT_VIRS, elem.DEFAULT_PT_ICE, elem.DEFAULT_PT_PCLN, elem.DEFAULT_PT_VACU, elem.DEFAULT_PT_VRSS, elem.DEFAULT_PT_BHOL, elem.DEFAULT_PT_BREL, elem.DEFAULT_PT_TESC,
elem.DEFAULT_PT_CBNW, elem.DEFAULT_PT_GBMB, elem.DEFAULT_PT_SHD3, elem.DEFAULT_PT_RFRG, elem.DEFAULT_PT_SALT, elem.DEFAULT_PT_NBHL, elem.DEFAULT_PT_MORT, elem.DEFAULT_PT_PSTS, elem.DEFAULT_PT_SPWN2, elem.DEFAULT_PT_BRMT,
elem.DEFAULT_PT_INST, elem.DEFAULT_PT_STKM, elem.DEFAULT_PT_DCEL, elem.DEFAULT_PT_FILT, elem.DEFAULT_PT_PUMP, elem.DEFAULT_PT_PRTO, elem.DEFAULT_PT_LOLZ, elem.DEFAULT_PT_FUSE, elem.DEFAULT_PT_PTCT, elem.DEFAULT_PT_SPAWN,
elem.DEFAULT_PT_FRME, elem.DEFAULT_PT_DRIC, elem.DEFAULT_PT_PPIP, elem.DEFAULT_PT_ACID, elem.DEFAULT_PT_GRVT, elem.DEFAULT_PT_INWR, elem.DEFAULT_PT_LRBD, elem.DEFAULT_PT_GOLD, elem.DEFAULT_PT_STKM2, elem.DEFAULT_PT_BANG,
elem.DEFAULT_PT_URAN, elem.DEFAULT_PT_EMP, elem.DEFAULT_PT_NONE, elem.DEFAULT_PT_YEST, elem.DEFAULT_PT_C5, elem.DEFAULT_PT_RBDM, elem.DEFAULT_PT_BOYL, elem.DEFAULT_PT_DRAY, elem.DEFAULT_PT_BIZG, elem.DEFAULT_PT_FWRK,
elem.DEFAULT_PT_SNOW, elem.DEFAULT_PT_IGNT, elem.DEFAULT_PT_FRZZ, elem.DEFAULT_PT_WAX, elem.DEFAULT_PT_BREC, elem.DEFAULT_PT_METL, elem.DEFAULT_PT_POLO, elem.DEFAULT_PT_BUBW, elem.DEFAULT_PT_VRSG, elem["DEFAULT_PT_C-5"],
elem.DEFAULT_PT_MWAX, elem.DEFAULT_PT_SING, elem.DEFAULT_PT_LAVA, elem.DEFAULT_PT_CRMC, elem.DEFAULT_PT_PHOT, elem.DEFAULT_PT_EQVE, elem.DEFAULT_PT_PLSM, elem.DEFAULT_PT_STK2, elem.DEFAULT_PT_BRCK, elem.DEFAULT_PT_SHLD1,
elem.DEFAULT_PT_BCOL, elem.DEFAULT_PT_DMG, elem.DEFAULT_PT_ARAY, elem.DEFAULT_PT_SPAWN2, elem.DEFAULT_PT_PROT, elem.DEFAULT_PT_WTRV, elem.DEFAULT_PT_LOXY, elem.DEFAULT_PT_NTCT, elem.DEFAULT_PT_CRAY, elem.DEFAULT_PT_HEAC,
elem.DEFAULT_PT_BCLN, elem.DEFAULT_PT_WOOD, elem.DEFAULT_PT_BMTL, elem.DEFAULT_PT_NEUT, elem.DEFAULT_PT_VOID, elem.DEFAULT_PT_CLST, elem.DEFAULT_PT_BRAY, elem.DEFAULT_PT_DSTW, elem.DEFAULT_PT_SLTW, elem.DEFAULT_PT_SHD4,
elem.DEFAULT_PT_BIZRG, elem.DEFAULT_PT_ELEC, elem.DEFAULT_PT_INSL, elem.DEFAULT_PT_OXYG, elem.DEFAULT_PT_TNT, elem.DEFAULT_PT_VIBR, elem.DEFAULT_PT_SHD2, elem.DEFAULT_PT_SPRK, elem.DEFAULT_PT_H2, elem.DEFAULT_PT_PRTI,
elem.DEFAULT_PT_IGNC, elem.DEFAULT_PT_DESL, elem.DEFAULT_PT_ISZS, elem.DEFAULT_PT_RFGL, elem.DEFAULT_PT_PQRT, elem.DEFAULT_PT_NSCN, elem.DEFAULT_PT_TUNG, elem.DEFAULT_PT_NBLE, elem.DEFAULT_PT_CLNE, elem.DEFAULT_PT_EXOT,
elem.DEFAULT_PT_O2, elem.DEFAULT_PT_SWCH, elem.DEFAULT_PT_MERC, elem.DEFAULT_PT_THRM, elem.DEFAULT_PT_BIZR, elem.DEFAULT_PT_ETRD, elem.DEFAULT_PT_LSNS, elem.DEFAULT_PT_PSTN, elem.DEFAULT_PT_TRON, elem.DEFAULT_PT_DLAY,
elem.DEFAULT_PT_OIL, elem.DEFAULT_PT_BVBR, elem.DEFAULT_PT_GLAS, elem.DEFAULT_PT_LDTC, elem.DEFAULT_PT_CONV, elem.DEFAULT_PT_VENT, elem.DEFAULT_PT_WHOL, elem.DEFAULT_PT_GUNP, elem.DEFAULT_PT_CNCT, elem.DEFAULT_PT_ACEL,
elem.DEFAULT_PT_DEST, elem.DEFAULT_PT_SAND, elem.DEFAULT_PT_FIRW, elem.DEFAULT_PT_DEUT, elem.DEFAULT_PT_RPEL, elem.DEFAULT_PT_INVS, elem.DEFAULT_PT_LN2, elem.DEFAULT_PT_FRAY, elem.DEFAULT_PT_PLNT, elem.DEFAULT_PT_STNE,
elem.DEFAULT_PT_NICE, elem.DEFAULT_PT_GAS, elem.DEFAULT_PT_BTRY, elem.DEFAULT_PT_LO2, elem.DEFAULT_PT_CO2, elem.DEFAULT_PT_COAL, elem.DEFAULT_PT_FIRE, elem.DEFAULT_PT_PBCN, elem.DEFAULT_PT_AMTR, elem.DEFAULT_PT_DYST,
elem.DEFAULT_PT_HFLM, elem.DEFAULT_PT_HSWC, elem.DEFAULT_PT_LIFE, elem.DEFAULT_PT_STOR, elem.DEFAULT_PT_BGLA, elem.DEFAULT_PT_SPNG, elem.DEFAULT_PT_FOG, elem.DEFAULT_PT_LOVE, elem.DEFAULT_PT_VINE, elem.DEFAULT_PT_LCRY,
elem.DEFAULT_PT_HYGN, elem.DEFAULT_PT_CAUS, elem.DEFAULT_PT_SHLD, elem.DEFAULT_PT_ANAR, elem.DEFAULT_PT_INVIS, elem.DEFAULT_PT_PVOD, elem.DEFAULT_PT_WIFI, elem.DEFAULT_PT_BOMB, elem.DEFAULT_PT_NITR, elem.DEFAULT_PT_FRZW,
elem.DEFAULT_PT_TTAN, elem.DEFAULT_PT_PLEX, elem.DEFAULT_PT_GUN, elem.DEFAULT_PT_SOAP, elem.DEFAULT_PT_CFLM, elem.DEFAULT_PT_THDR, elem.DEFAULT_PT_NWHL, elem.DEFAULT_PT_WIRE, elem.DEFAULT_PT_BIZRS, elem.DEFAULT_PT_FIGH,
elem.DEFAULT_PT_WARP, elem.DEFAULT_PT_PSCN, elem.DEFAULT_PT_SHLD3 = 0

--endregion

--- Sets up a space for a new element. Returns new element ID.
--- Creates key elements.NAMESPACE_PT_NAME for the ID.
---@param namespace string
---@param name string
---@return elemID
function elem.allocate(namespace, name) end

--- Deletes a given element from existence.
---@param elementID elemID
function elem.free(elementID) end

--- Deletes all new elements. Restores all default elements.
function elem.loadDefault() end

--- Sets _all_ the properties of an element to ones from the table. Useful for element cloning.
---@param elementID elemID
---@param properties table<elemProperty, any>
---@overload fun(elementID:elemID):table<elemProperty, any> @ Returns a table with the element's properties, to modify and set further on
function elem.element(elementID, properties) end

--- Sets an element's single property to value.
---@param elementID elemID
---@param property elemProperty
---@param value any
---@overload fun(elementID:elemID):any @ Returns an element's single property.
function elem.property(elementID, property, value) end





