defmodule ChatClient.Interact do
  alias ChatClient.{State, Prompter}
  def join(chat_node) do
    :global.register_name(node(), :erlang.group_leader)

    connect(chat_node)
    |> setup_state()
    |> Prompter.handle_message()
  end

  def message(message, chat_node) do
    publish_message(message, chat_node)
    |> setup_state()
  end

  defp connect(chat_node) do
    :rpc.call(
      chat_node,
      Chat,
      :join,
      [chat_node]
    )
  end

  defp publish_message(message, chat_node) do
    :rpc.call(
      chat_node,
      Chat,
      :new_message,
      [{chat_node, node(), message}]
    )
  end

  defp setup_state({:ok, node}) do
    %State{
      chat_node: node,
    }
  end
end
