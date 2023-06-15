defmodule PlugApiElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_api_elixir,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PlugApiElixir.Application, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
