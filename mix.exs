defmodule Mangopay.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mangopay,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      preferred_cli_env: [
        vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      env: [{:client, %{"id": "sdk-unit-tests", "passphrase": "cqFfFrWfCcb7UadHNxx2C9Lo6Djw8ZduLi7J9USTmu8bhxxpju"}}],
#      mod: {Mangopay, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
		  {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:decorator, "~> 0.0"},
      {:exvcr, "~> 0.8", only: :test}
    ]
  end
end
