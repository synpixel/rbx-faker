local Players = game:GetService("Players")

local Utils = require(script.Parent.Utils)
local UserData = require(script.Parent.data.users)

--- @interface UserInfo
--- @within Users
--- .id number
--- .name string
--- .displayName string
--- .description string
--- .created string
export type UserInfo = typeof(UserData[...])

--- @interface MockPlayer
--- @within Users
--- .UserId number
--- .Name string
--- .DisplayName string
--- .AccountAge number
export type MockPlayer = {
	UserId: number,
	Name: string,
	DisplayName: string,
	AccountAge: number,
}

local function getUserInfoFromId(userId: number): UserInfo?
	for _, userInfo in UserData do
		if userInfo.id == userId then
			return userInfo
		end
	end
	return
end

local function getAccountAgeFromIsoDate(isoDate: string): number
	return math.floor((DateTime.now().UnixTimestamp - DateTime.fromIsoDate(isoDate).UnixTimestamp) / 86400)
end

--- @class Users
local Users = {}

--- @return UserInfo
--- Gets some user info from the users list.
function Users.getUserInfo(): UserInfo
	local userId = UserData[Utils.RNG:NextInteger(1, #UserData)].id
	return getUserInfoFromId(userId) :: UserInfo
end

--- @return number
--- Gets some user id from the users list.
function Users.getUserId(): number
	return Users.getUserInfo().id
end

--- @return string
--- Gets some username from the users list.
function Users.getUsername(): string
	return Users.getUserInfo().name
end

--- @return string
--- Gets some display name from the users list.
function Users.getDisplayName(): string
	return Users.getUserInfo().displayName
end

--- @return string
--- Gets some user description from the users list.
function Users.getUserDescription(): string
	return Users.getUserInfo().description
end

--- @param thumbnailType Enum.ThumbnailType
--- @param thumbnailSize Enum.ThumbnailSize
--- @return string
--- Gets some user thumbnail from the users list.
function Users.getUserThumbnail(thumbnailType: Enum.ThumbnailType, thumbnailSize: Enum.ThumbnailSize): string
	local userId = Users.getUserId()
	return Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
end

--- @return MockPlayer
--- Creates a mock player.
function Users.createMockPlayer(): MockPlayer
	local userInfo = Users.getUserInfo()
	return {
		UserId = userInfo.id,
		Name = userInfo.name,
		DisplayName = userInfo.displayName,
		AccountAge = getAccountAgeFromIsoDate(userInfo.created),
	}
end

return Users
