# RavenxTelegram

RavenxTelegram is a custom strategy for [`ravenx`](https://github.com/acutario/ravenx) to help you send notifications
through Telegram in an 4 steps.

## Installation

To install this package, you need to add  `ravenx_telegram` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ravenx_telegram, "~> 0.1.1"}]
end
```

And second you need to add it to the list of `Ravenx` strategies in the config in order for it to work:
```elixir
config :ravenx, :strategies, [
  pusher: RavenxTelegram
]
```

This module uses [Nadia](https://github.com/zhyu/nadia), so add into your app:
```elixir
# You can get your token from @BotFather bot in Telegram.
config :nadia,
  token: "YOUR_BOT_TOKEN"
```

Send messages via `Ravenx`:
```elixir
# You should create public channel in Telegram and add your bot to Admin users, when get public channel name from channel settings (or set it)   
iex> Ravenx.dispatch(:telegram, %{channel_id: "@ravenx_test", text: "Test message"}
```
