defmodule Gitlab.MixProject do
  use Mix.Project

  def project do
    [
      app: :gitlab,
      version: "0.1.0",
      elixir: "~> 1.16",
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:tesla, "~> 1.9.0"},
      {:jason, ">= 1.4.1"},
      {:hackney, "~> 1.20.1"},
      {:ex_doc, "~> 0.32.1", only: :dev, runtime: false}
    ]
  end
end
