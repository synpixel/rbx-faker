local Players = game:GetService("Players")
local UserService = game:GetService("UserService")

local UserIds = require(script.UserIds)

export type UserInfo = {
	Id: number,
	Username: string,
	DisplayName: string,
	HasVerifiedBadge: boolean,
}

export type FakePlayer = {
	UserId: number,
	Name: string,
	DisplayName: string,
}

local Faker = {}

function Faker.getUserId(): number
	return UserIds[math.random(1, #UserIds)]
end

function Faker.getUserInfo(): UserInfo
	local userId = Faker.getUserId()
	return UserService:GetUserInfosByUserIdsAsync(userId)[1]
end

function Faker.getUsername(): string
	local userId = Faker.getUserId()
	return Players:GetNameFromUserIdAsync(userId)
end

function Faker.getDisplayName(): string
	local userInfo = Faker.getUserInfo()
	return userInfo.DisplayName
end

function Faker.getUserThumbnail(thumbnailType: Enum.ThumbnailType, thumbnailSize: Enum.ThumbnailSize): string
	local userId = Faker.getUserId()
	return Players:GetNameFromUserIdAsync(userId, thumbnailType, thumbnailSize)
end

function Faker.createFakePlayer(): FakePlayer
	local userId = Faker.getUserId()
	local userInfo: UserInfo = UserService:GetUserInfosByUserIdsAsync(userId)[1]
	return {
		UserId = userId,
		Name = Players:GetNameFromUserIdAsync(userId),
		DisplayName = userInfo.DisplayName,
	}
end

return Faker
