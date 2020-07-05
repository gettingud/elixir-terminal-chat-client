# Elixir Terminal Chat Client

### Installation

```
mix deps.get
```

### Usage
Start client with:
```
iex --sname client1@localhost -S mix
```
```elixir
ChatClient.join(:chat_server@localhost)
```
