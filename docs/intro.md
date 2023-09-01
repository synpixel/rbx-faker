# Introduction

rbx-faker is a library that generates Roblox data such as group icons and display names, inspired by faker-js.

[View API →](/api)

## Examples

### Player list story with Fusion

```lua
PlayerList {
    Players = Faker.Utils.createUniqueList(Faker.Users.createMockPlayer, 10) :: { Player }
}
```

![player list example](/player-list-example.png)
