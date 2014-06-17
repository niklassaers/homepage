defmodule Homepage.Mixfile do
  use Mix.Project

  def project do
    [
      app: :homepage,
      version: "0.0.1",
      deps: deps(Mix.env)
    ]
  end

  def application do
    [
      applications: [],
      mod: {Homepage, []}
    ]
  end

  defp deps(:prod) do
    [
      { :weber, github: "elixir-web/weber" }
    ]
  end

  defp deps(:test) do
    deps(:prod) ++ [{ :hackney, github: "benoitc/hackney" }]
  end

  defp deps(_) do
    deps(:prod)
  end
end
