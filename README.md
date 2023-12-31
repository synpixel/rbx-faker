<div align="center">
    <h1>Faker</h1>
    <p>A library that generates Roblox data such as group icons and display names, inspired by faker-js.</p>
    <a href="https://synpixel.github.io/rbx-faker/">View docs →</a>
</div>

## Installation

You can install Faker as a wally dependency by adding this to your `wally.toml` file:

```toml
Faker = "synpixel/faker@1.0.0"
```

## Why?

Mocking data in your UI component stories can be tedious to do by hand, this library simplifies the task significantly.

## Examples

### Player list story with Fusion

```lua
PlayerList {
    Players = Faker.Utils.createUniqueList(Faker.Users.createMockPlayer, 10) :: { Player }
}
```

![player list example](.moonwave/static/player-list-example.png)
