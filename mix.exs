defmodule ChatClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :chat_client,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      included_applications: [:chat],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:chat, github: "gettingud/elixir-terminal-chat", branch: "master"}
    ]
  end
end
