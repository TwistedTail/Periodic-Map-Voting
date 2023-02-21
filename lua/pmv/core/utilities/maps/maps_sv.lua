local file   = file
local string = string
local Maps   = PMV.Utilities.Maps
local Patterns = {
	["^background"]     = true,
	["^devtest"]        = true,
	["^ep1_background"] = true,
	["^ep2_background"] = true,
	["^styleguide"]     = true,
}
local Prefixes = {
	["sdk_"]                     = true,
	["test_"]                    = true,
	["vst_"]                     = true,
	["c4a1y"]                    = true,
	["credits"]                  = true,
	["d2_coast_02"]              = true,
	["d3_c17_02_camera"]         = true,
	["ep1_citadel_00_demo"]      = true,
	["c5m1_waterfront_sndscape"] = true,
	["intro"]                    = true,
	["test"]                     = true,
}


local function AllowMap(Name)
	if Prefixes[Name] then return false end

	local Prefix = string.match(Name, "^(.-_)")

	if Prefixes[Prefix] then return false end

	for Pattern in pairs(Patterns) do
		if string.find(Name, Pattern) then
			return false
		end
	end

	return true
end

function Maps.GetInstalled()
	local Names  = file.Find("maps/*.bsp", "GAME")
	local Result = {}

	for _, V in ipairs(Names) do
		local Name = string.lower(string.gsub(V, "%.bsp$", ""))

		if AllowMap(Name) then
			Result[Name] = true
		end
	end

	return Result
end


