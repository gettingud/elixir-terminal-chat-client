defmodule ChatClient do
  defdelegate join(chat_node), to: ChatClient.Interact
end
