defmodule Portal.Mixfile do
  use Mix.Project

  def project do
    [app: :portal,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     name: "Portal",
     description: "A shooting fault-tolerant doors for distributed portal data-transfer application in Elixir",
     package: [
       contributors: ["José Valim", "László Bácsi"],
       licenses: ["MIT"],
       links: %{github: "https://github.com/josevalim/portal"}
     ],
     source_url: "https://github.com/josevalim/portal",
     homepage_url: "http://howistart.org/posts/elixir/1",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [],
     mod: {Portal, []}]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.6", only: :dev}]
  end
end
