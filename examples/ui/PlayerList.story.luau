local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Faker = require(ReplicatedStorage.Packages.Faker)

local PlayerList = require(script.Parent.PlayerList)

return function(parent: Instance)
	local playerList = PlayerList({
		Players = Faker.Utils.createUniqueList(Faker.Users.createMockPlayer, 10),
		Parent = parent,
	})

	return function()
		playerList:Destroy()
	end
end
