defmodule PlugApiElixir.Application do
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: PlugApiElixir.HelloWorldPlug, options: [port: 4000]}
    ]
    opts = [strategy: :one_for_one, name: PlugApiElixir.Supervisor]

    Logger.info("Starting application")

    Supervisor.start_link(children, opts)
  end
end
