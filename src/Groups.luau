local Utils = require(script.Parent.Utils)
local GroupData = require(script.Parent.data.groups)

--- @interface GroupInfo
--- @within Groups
--- .id number
--- .name string
--- .description string
--- .icon string
export type GroupInfo = typeof(GroupData[...])

local function getGroupInfoFromId(groupId: number): GroupInfo?
	for _, groupInfo in GroupData do
		if groupInfo.id == groupId then
			return groupInfo
		end
	end
	return
end

--- @class Groups
local Groups = {}

--- @return GroupInfo
--- Gets some group info from the groups list.
function Groups.getGroupInfo(): GroupInfo
	local groupId = GroupData[Utils.RNG:NextInteger(1, #GroupData)].id
	return getGroupInfoFromId(groupId) :: GroupInfo
end

--- @return number
--- Gets some group id from the groups list.
function Groups.getGroupId(): number
	return Groups.getGroupInfo().id
end

--- @return string
--- Gets some group names from the groups list.
function Groups.getGroupName(): string
	return Groups.getGroupInfo().name
end

--- @return string
--- Gets some group description from the groups list.
function Groups.getGroupDescription(): string
	return Groups.getGroupInfo().description
end

--- @return string
--- Gets some group icon from the groups list.
function Groups.getGroupIcon(): string
	return Groups.getGroupInfo().icon
end

return Groups
