local fs = require("@lune/fs")
local serde = require("@lune/serde")
local net = require("@lune/net")

local input: { number } = serde.decode("json", fs.readFile("users/in.json"))

local output: {
	{
		description: string,
		created: string,
		isBanned: boolean,
		externalAppDisplayName: string?,
		hasVerifiedBadge: boolean,
		id: number,
		name: string,
		displayName: string,
	}
} =
	{}

for _, userId in input do
	local data = net.request(`http://users.roproxy.com/v1/users/{userId}`)
	local body = net.jsonDecode(data.body)

	if not data.ok then
		print(`Failed to fetch the data of user {userId}: {body.errors[1].message}`)
		return
	end

	table.insert(output, body)
end

fs.writeFile("users/out.json", serde.encode("json", output))
