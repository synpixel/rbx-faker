local fs = require("@lune/fs")
local serde = require("@lune/serde")
local net = require("@lune/net")

type Processor<T, K> = (input: { T }, insert: (entry: K) -> ()) -> ()

local function processProcessor<T, K>(inputs: { T }, processor: Processor<T, K>): { K }
	local outputs: { K } = {}
	processor(inputs, function(entry)
		table.insert(outputs, entry)
	end)
	return outputs
end

local userProcessor: Processor<number, {
	id: number,
	name: string,
	displayName: string,
	description: string,
	created: string,
}> = function(
	userIds,
	insert
)
	for _, userId in userIds do
		local data = net.request(`https://users.roblox.com/v1/users/{userId}`)
		local body = net.jsonDecode(data.body)

		if body.errors then
			for apiError in body.errors do
				error(`[Users.{userId}] {apiError.message}`)
			end
		end

		insert({
			id = body.id,
			name = body.name,
			displayName = body.displayName,
			description = body.description,
			created = body.created,
		})
	end
end

local universeProcessor: Processor<number, { id: number, name: string, description: string, icon: string, thumbnail: string }> = function(
	universeIds,
	insert
)
	local data = net.request(`https://games.roblox.com/v1/games?universeIds={table.concat(universeIds, ",")}`)
	local body = net.jsonDecode(data.body)

	if body.errors then
		for apiError in body.errors do
			error(`[Games] {apiError.message}`)
		end
	end

	local universes: { { id: number, name: string, description: string, rootPlaceId: number } } = body.data

	for _, universe in universes do
		insert({
			id = universe.id,
			name = universe.name,
			description = universe.description,
			icon = `rbxthumb://type=GameIcon&id={universe.id}&w=512&h=512`,
			thumbnail = `rbxthumb://type=GameThumbnail&id={universe.rootPlaceId}&w=768&h=432`,
		})
	end
end

local groupProcessor: Processor<number, { id: number, name: string, description: string, icon: string }> = function(
	groupIds,
	insert
)
	local data = net.request(`https://groups.roblox.com/v2/groups?groupIds={table.concat(groupIds, ",")}`)
	local body = net.jsonDecode(data.body)

	if body.errors then
		for apiError in body.errors do
			error(`[Groups] {apiError.message}`)
		end
	end

	local groups: { { id: number, name: string, description: string } } = body.data

	for _, group in groups do
		insert({
			id = group.id,
			name = group.name,
			description = group.description,
			icon = `rbxthumb://type=GroupIcon&id={group.id}&w=420&h=420`,
		})
	end
end

local processors = {
	users = userProcessor,
	universes = universeProcessor,
	groups = groupProcessor,
}

for name, processor in processors do
	local outputs = processProcessor(serde.decode("json", fs.readFile(`in/{name}.json`)), processor)
	fs.writeFile(`out/{name}.json`, serde.encode("json", outputs))
end
