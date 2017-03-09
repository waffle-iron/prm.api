defmodule PRM.Mixfile do
  use Mix.Project

  def project do
    [app: :prm,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {PRM.Application, []},
     extra_applications: [
      :logger, :cowboy, :confex, :poison, :eview, :postgrex,
      :phoenix, :phoenix_pubsub, :phoenix_ecto, :phoenix_html]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:distillery, ">= 0.0.0"},
     {:cowboy, "~> 1.0"},
     {:confex, "~> 1.4"},
     {:poison, "~> 3.1", override: true},
     {:eview, ">= 0.0.0"},
     {:gettext, "~> 0.13"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix, "~> 1.3.0-rc"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.2"},
     {:phoenix_html, "~> 2.6"},
     {:benchfella, ">= 0.0.0", only: [:dev, :test]},
     {:ex_doc, ">= 0.0.0", only: [:dev, :test]},
     {:excoveralls, ">= 0.0.0", only: [:dev, :test]},
     {:dogma, ">= 0.0.0", only: [:dev, :test]},
     {:credo, ">= 0.0.0", only: [:dev, :test]}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
