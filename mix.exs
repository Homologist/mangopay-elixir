defmodule Mangopay.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mangopay,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      elixirc_paths: elixirc_paths()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      env: [
        {:client,
         %{id: Application.get_env(:mangopay, :client_id), passphrase: Application.get_env(:mangopay, :passphrase)}
        }
      ],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:credo, "~> 0.8.10", only: :dev},
      {:inch_ex, only: :docs},
      {:excoveralls, "~> 0.8", only: :test},
      {:ex_machina, "~> 2.2"},
      {:exvcr, "~> 0.8", only: :test}
    ]
  end

  defp elixirc_paths, do: ["lib", "web", "test/support/factory.ex", "test/factories/"]
end
