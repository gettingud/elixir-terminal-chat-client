defmodule ChatClient.Prompter do
  alias ChatClient.{State, Interact}

  def handle_message(%State{chat_node: chat_node}) do
    IO.gets("#{node()}: ")
    |> String.trim
    |> Interact.message(chat_node)
    |> handle_message()
  end
end
