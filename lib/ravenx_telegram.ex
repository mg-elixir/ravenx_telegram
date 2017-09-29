defmodule RavenxTelegram do
  @moduledoc """
  Ravenx Telegram strategy.
  Used to dispatch notifications to Telegram messenger.
  """

  @behaviour Ravenx.StrategyBehaviour

  @doc """
  Function used to send a notification to Telegram.

  The function receives a map including a `chat_id` param used to specify telegram chat and `text` param - used to build the message.

  It will respond with a tuple, indicating if everything was `:ok` or there was
  an `:error`.
  
  Ravenx.dispatch(:telegram, %{channel_id: "@ravenx_test", text: "Test message"}

  """
  @spec call(map, map) :: {:ok, binary} | {:error, {atom, any}}
  def call(payload, options \\ %{}) when is_map(payload) and is_map(options) do
    send_telegram_message(Map.get(payload, :channel_id), Map.get(payload, :text))
  end

  defp send_telegram_message(channel_id, msg_text) do
    case Nadia.send_message(channel_id, msg_text) do
    {:ok, _result} ->
      :ok
    {:error, %Nadia.Model.Error{reason: "Bad Request: chat not found"}} ->
      { :error, :chat_not_found }
    {:error, %Nadia.Model.Error{reason: "Please wait a little"}} ->
      { :wait, :timeout }
    end
  end
end