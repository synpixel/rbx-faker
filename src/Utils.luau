local function tableEquals(t1: { [any]: any }, t2: { [any]: any }): boolean
	for index, value in t1 do
		if t2[index] ~= value then
			return false
		end
	end
	return true
end

local function findInArray(array: { [number]: any }, targetValue: any): number?
	for index, value in array do
		if typeof(value) == "table" and typeof(targetValue) == "table" then
			if not tableEquals(value, targetValue) then
				continue
			end
		elseif value ~= targetValue then
			continue
		end

		return index
	end
	return
end

--- @class Utils
local Utils = {}

--- @prop RNG Random
--- @private
--- @within Utils
Utils.RNG = Random.new(os.time() + os.clock())

--- @return { TReturn }
--- Creates an array of length `count` filled with the return value of `fn`. (`fn` is called each iteration)
function Utils.createList<TReturn>(fn: () -> TReturn, count: number): { TReturn }
	local list = {}
	for i = 1, count do
		table.insert(list, fn())
	end
	return list
end

--- @return { TReturn }
--- Creates an array of length `count` filled with the return value of `fn`. (`fn` is called each iteration, and the table cannot contain duplicate values)
function Utils.createUniqueList<TReturn>(fn: () -> TReturn, count: number): { TReturn }
	local list = {}

	for i = 1, count do
		local value = fn()
		while findInArray(list, value) do
			value = fn()
		end
		table.insert(list, value)
	end

	return list
end

return Utils
