local Players = game:GetService("Players")
local Users: { UserInfo } = require(script.Users)

export type UserInfo = {
	description: string,
	created: string,
	isBanned: boolean,
	externalAppDisplayName: string?,
	hasVerifiedBadge: boolean,
	id: number,
	name: string,
	displayName: string,
}

export type FakePlayer = {
	UserId: number,
	Name: string,
	DisplayName: string,
}

local function getKeys(t: { [any]: any }): { any }
	local keys = {}
	for key in t do
		table.insert(keys, key)
	end
	return keys
end

local function getUserInfoById(userId: number): UserInfo?
	for _, userInfo in Users do
		if userInfo.id == userId then
			return userInfo
		end
	end
	return
end

local Faker = {}

function Faker.getUserInfo(): UserInfo
	local userId = Users[math.random(1, #Users)].id
	return getUserInfoById(userId) :: UserInfo
end

function Faker.getUserId(): number
	return Faker.getUserInfo().id
end

function Faker.getUsername(): string
	return Faker.getUserInfo().name
end

function Faker.getDisplayName(): string
	return Faker.getUserInfo().displayName
end

function Faker.getUserThumbnail(thumbnailType: Enum.ThumbnailType, thumbnailSize: Enum.ThumbnailSize): string
	local userId = Faker.getUserId()
	return Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
end

function Faker.createFakePlayer(): FakePlayer
	local userInfo = Faker.getUserInfo()
	return {
		UserId = userInfo.id,
		Name = userInfo.name,
		DisplayName = userInfo.displayName,
	}
end

return Faker
