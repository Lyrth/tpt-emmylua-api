---
--- Created by Lyr.
--- DateTime: 8/12/2019 8:07 PM
---
--- From: https://www.boxmein.net/tpt/tptelements/reference/lua-reference.html
---
--- Bit API
--- Because Lua doesn't have one.
---


bit = {}


--- Normalize for binary operations. bit.* functions do it already.
---@param input int
---@return int
function bit.tobit(input) end

--- Generate a hex string from the input.
---@param input int
---@param length int
---@return string
function bit.tohex(input, length) end


--- Performs bitwise NOT (~input)
---@param input int
---@return int
function bit.bnot(input) end

--- Performs bitwise AND (input&input) over all arguments.
---@vararg int
---@return int
function bit.band(...) end

--- Performs bitwise OR (input|input) over all arguments.
---@vararg int
---@return int
function bit.bor(...) end

--- Performs bitwise XOR (input^input) over all arguments.
---@vararg int
---@return int
function bit.bxor(...) end


--- Performs a leftwards bit shift (input << count).
---@param input int
---@param count int
---@return int
function bit.lshift(input, count) end

--- Performs a rightwards bit shift (input >> count).
---@param input int
---@param count int
---@return int
function bit.rshift(input, count) end

--- Performs a rightwards arithmetic bit shift (input >>> count).
---@param input int
---@param count int
---@return int
function bit.arshift(input, count) end


--- Rotates a bit right by count bits.
---@param input int
---@param count int
---@return int
function bit.rol(input, count) end

--- Rotates a bit right by count bits.
---@param input int
---@param count int
---@return int
function bit.ror(input, count) end


--- Swaps endianness of the number.
---@param input int
---@return int
function bit.bswap(input) end

