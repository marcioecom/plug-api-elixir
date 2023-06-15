defmodule PlugApiElixir.Application do
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: PlugApiElixir.Router, options: [port: cowboy_port()]}
    ]
    opts = [strategy: :one_for_one, name: PlugApiElixir.Supervisor]

    Logger.info("Starting application #{cowboy_port()}")

    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:plug_api_elixir, :port, 3000)
end
