local Players = game:GetService("Players")
local Users: { UserInfo } = require(script.Users)

--- @interface UserInfo
--- @within Faker
--- .description string
--- .created string
--- .isBanned boolean
--- .externalAppDisplayName? string
--- .hasVerifiedBadge boolean
--- .id number
--- .name string
--- .displayName string
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

--- @interface MockPlayer
--- @within Faker
--- .UserId number
--- .Name string
--- .DisplayName string
export type MockPlayer = {
	UserId: number,
	Name: string,
	DisplayName: string,
}

local RNG = Random.new(os.time() + os.clock())

local function getUserInfoById(userId: number): UserInfo?
	for _, userInfo in Users do
		if userInfo.id == userId then
			return userInfo
		end
	end
	return
end

--- @class Faker
local Faker = {}

--- @return UserInfo
--- Gets some user info from the users list.
function Faker.getUserInfo(): UserInfo
	local userId = Users[RNG:NextInteger(1, #Users)].id
	return getUserInfoById(userId) :: UserInfo
end

--- @return number
--- Gets some user id from the users list.
function Faker.getUserId(): number
	return Faker.getUserInfo().id
end

--- @return string
--- Gets some username from the users list.
function Faker.getUsername(): string
	return Faker.getUserInfo().name
end

--- @return string
--- Gets some display name from the users list.
function Faker.getDisplayName(): string
	return Faker.getUserInfo().displayName
end

--- @param thumbnailType Enum.ThumbnailType
--- @param thumbnailSize Enum.ThumbnailSize
--- @return string
--- Gets some user thumbnail from the users list.
function Faker.getUserThumbnail(thumbnailType: Enum.ThumbnailType, thumbnailSize: Enum.ThumbnailSize): string
	local userId = Faker.getUserId()
	return Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
end

--- @return MockPlayer
--- Creates a mock player.
function Faker.createMockPlayer(): MockPlayer
	local userInfo = Faker.getUserInfo()
	return {
		UserId = userInfo.id,
		Name = userInfo.name,
		DisplayName = userInfo.displayName,
	}
end

--- @return { TReturn }
--- Creates an array of length `count` filled with the return value of `fn`. (`fn` is called each iteration)
function Faker.createList<TReturn>(fn: () -> TReturn, count: number): { TReturn }
	local list = {}
	for i = 1, count do
		table.insert(list, fn())
	end
	return list
end

--- @return { TReturn }
--- Creates an array of length `count` filled with the return of `fn`. (`fn` is called each iteration, and the table cannot contain duplicates)
function Faker.createUniqueList<TReturn>(fn: () -> TReturn, count: number): { TReturn }
	if count > #Users then
		error("count cannot be higher than the length of Users.")
	end

	local list = {}

	for i = 1, count do
		local value = fn()
		while table.find(value) do
			value = fn()
		end
		table.insert(list, value)
	end

	return list
end

return Faker