defmodule RavenxTelegram.Mixfile do
  use Mix.Project

  @version "0.1.1"

  def project do
    [
      app: :ravenx_telegram,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      build_embedded: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  def elixirc_paths(:test), do: ["lib", "test/support"]
  def elixirc_paths(_), do:     ["lib"]

  defp docs do
    [
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/ravenx_telegram",
      main: "RavenxTelegram",
      source_url: "https://github.com/maratgaliev/ravenx-telegram",
      extras: ["README.md"]
    ]
  end

  defp description do
    """
    Strategy to send notifications through Telegram with Ravenx.
    """
  end

  defp package do
    [
     name: :ravenx_telegram,
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Marat Galiev"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/maratgaliev/ravenx-telegram"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :nadia]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     {:ravenx, "~> 1.0.0"}, 
     {:nadia, "~> 0.4.2"},
      
     # Docs
     {:ex_doc, "~> 0.16", only: :dev, runtime: false},
     {:earmark, ">= 1.2.3", only: :dev, runtime: false},

     # Testing
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
    ]
  end
end
