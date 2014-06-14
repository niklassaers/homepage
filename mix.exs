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
      { :timex, "~> 0.6.0"},
      { :json,   github: "cblage/elixir-json"},
      { :ex_doc, github: "elixir-lang/ex_doc", ref: "4a6391bf2d6dacec8c6b52ef2506fb5607eb894c"}
	  #{ :htmlentities, github: "shurizzle/elixir-htmlentities" }
      #{ :eml, github: "mjs2600/eml", branch: "0.13-upgrade"}

       ]
  end
end
