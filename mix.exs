defmodule Homepage.Mixfile do
  use Mix.Project

  def project do
    [ app: :homepage,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [Homepage.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Homepage, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "~> 0.1.0-dev", github: "dynamo/dynamo" },
      { :timex, "~> 0.6.0"}
      #{ :eml, github: "zambal/eml"}

       ]
  end
end
