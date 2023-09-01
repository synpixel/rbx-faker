local Groups = require(script.Groups)
local Universes = require(script.Universes)
local Text = require(script.Text)
local Users = require(script.Users)
local Utils = require(script.Utils)

--- @class Faker
local Faker = {}

--- @prop Users Users
--- @within Faker
Faker.Users = Users

--- @prop Universes Universes
--- @within Faker
Faker.Universes = Universes

--- @prop Groups Groups
--- @within Faker
Faker.Groups = Groups

--- @prop Text Text
--- @within Faker
Faker.Text = Text

--- @prop Utils Utils
--- @within Faker
Faker.Utils = Utils

return Faker
