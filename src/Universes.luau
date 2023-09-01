local Utils = require(script.Parent.Utils)
local UniverseData = require(script.Parent.data.universes)

--- @interface UniverseInfo
--- @within Universes
--- .id number
--- .name string
--- .description string
--- .icon string
--- .thumbnail string
export type UniverseInfo = typeof(UniverseData[...])

local function getUniverseInfoFromId(universeId: number): UniverseInfo?
	for _, universeInfo in UniverseData do
		if universeInfo.id == universeId then
			return universeInfo
		end
	end
	return
end

--- @class Universes
local Universes = {}

--- @return UniverseInfo
--- Gets some universe info from the universes list.
function Universes.getUniverseInfo(): UniverseInfo
	local universeId = UniverseData[Utils.RNG:NextInteger(1, #UniverseData)].id
	return getUniverseInfoFromId(universeId) :: UniverseInfo
end

--- @return number
--- Gets some universe id from the universes list.
function Universes.getUniverseId(): number
	return Universes.getUniverseInfo().id
end

--- @return string
--- Gets some universe names from the users list.
function Universes.getUniverseName(): string
	return Universes.getUniverseInfo().name
end

--- @return string
--- Gets some universe description from the universes list.
function Universes.getUniverseDescription(): string
	return Universes.getUniverseInfo().description
end

--- @return string
--- Gets some universe icon from the universes list.
function Universes.getUniverseIcon(): string
	return Universes.getUniverseInfo().icon
end

--- @return string
--- Gets some universe thumbnail from the universes list.
function Universes.getUniverseThumbnail(): string
	return Universes.getUniverseInfo().thumbnail
end

return Universes
