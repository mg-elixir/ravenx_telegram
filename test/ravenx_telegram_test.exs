defmodule RavenxTelegramTest do
  @moduledoc false

  use ExUnit.Case

  setup do

    payload = %{
      channel_id: "@ravenx_test_channel",
      text: "TEST TEXT"
    }

    payload_wrong = %{
      channel_id: "@ravenx_test_channel_wrong",
      text: "TEST TEXT"
    }

    Application.put_env(:nadia, :token, "YOUR_BOT_TOKEN")

    Application.put_env(:ravenx, :strategies, [
      telegram: RavenxTelegram
    ])

    {:ok, payload: payload, payload_wrong: payload_wrong}
  end

  test "`Ravenx.available_strategies` returns the default strategies plus `RavenxTelegram.Strategy`" do
    strategies = Ravenx.available_strategies
    assert telegram: RavenxTelegram in strategies
  end

  test "`Ravenx.dispatch/3` returns `:ok` when ok", %{payload: payload} do
    response = Ravenx.dispatch(:telegram, payload)
    assert :ok = response
  end

  test "`Ravenx.dispatch/3` returns `{:error, :chat_not_found}` when something goes wrong with telegram.", %{payload_wrong: payload_wrong} do
    response = Ravenx.dispatch(:telegram, payload_wrong)
    assert {:error, :chat_not_found} = response
  end

end
