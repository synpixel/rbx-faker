local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local ForPairs = Fusion.ForPairs

type PlayerListEntryProps = {
	Player: Player,
	LayoutOrder: number?,
}

local function PlayerListEntry(props: PlayerListEntryProps)
	local playerThumbnail = Value("")

	task.spawn(function()
		playerThumbnail:set(
			Players:GetUserThumbnailAsync(
				props.Player.UserId,
				Enum.ThumbnailType.HeadShot,
				Enum.ThumbnailSize.Size420x420
			)
		)
	end)

	return New("Frame")({
		Name = props.Player.Name,

		Size = UDim2.new(1, 0, 0, 40),

		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.4,

		LayoutOrder = props.LayoutOrder,

		[Children] = {
			New("UICorner")({
				CornerRadius = UDim.new(0, 4),
			}),

			New("UIPadding")({
				PaddingLeft = UDim.new(0, 7),
				PaddingRight = UDim.new(0, 7),
				PaddingTop = UDim.new(0, 5),
				PaddingBottom = UDim.new(0, 5),
			}),

			New("UIListLayout")({
				Padding = UDim.new(0, 8),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),

			New("ImageLabel")({
				Name = "Icon",
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Image = playerThumbnail,

				[Children] = {
					New("UIAspectRatioConstraint")({}),

					New("UICorner")({
						CornerRadius = UDim.new(1),
					}),
				},
			}),

			New("TextLabel")({
				Name = "Name",

				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.X,

				BackgroundTransparency = 1,

				FontFace = Font.fromEnum(Enum.Font.GothamMedium),
				Text = props.Player.Name,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 16,
			}),
		},
	})
end

type PlayerListProps = {
	Players: Fusion.Value<{ Player }> | { Player },
	Parent: Instance?,
}

local function PlayerList(props: PlayerListProps)
	return New("ScrollingFrame")({
		Name = "PlayerList",
		Parent = props.Parent,

		Position = UDim2.new(1, -10, 0, 10),
		AnchorPoint = Vector2.new(1, 0),
		Size = UDim2.new(0.16, 0, 0.5, -20),

		BackgroundTransparency = 1,

		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
		ScrollBarThickness = 6,

		[Children] = {
			New("UIPadding")({
				PaddingRight = UDim.new(0, 10),
			}),

			New("UIListLayout")({
				Padding = UDim.new(0, 2),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),

			ForPairs(props.Players, function(_use, key, player)
				return key, PlayerListEntry({
					Player = player,
					LayoutOrder = key,
				})
			end, Fusion.cleanup),
		},
	})
end

return PlayerList
