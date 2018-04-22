defmodule ExW3.MixProject do
  use Mix.Project

  def project do
    [app: :exw3,
     version: "0.0.1",
     elixir: "~> 1.1-dev",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
     name: "exw3",
     source_url: "https://github.com/hswick/exw3"
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :ethereumex]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:ethereumex, "~> 0.3.2"},
      {:abi, "~> 0.1.8"},
      {:poison, "~> 3.1"},
      {:inflex, "~> 1.10.0" },
      {:hexate,  ">= 0.6.0"}
    ]
  end

  defp description do
    "A high level Ethereum JSON RPC Client for Elixir"
  end

  defp package do
    [
      name: "exw3",
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Harley Swick"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/hswick/exw3"}
    ]
  end
end

defmodule Mix.Tasks.Solc do
  use Mix.Task

  @shortdoc "Runs the solc compiler to create binary and abi of all contracts. Outputs to build directory"
  def run(_) do
    # calling our Hello.say() function from earlier
    Mix.Shell.IO.cmd("solc -o test/examples/build --abi --bin test/examples/contracts/* --overwrite")
  end
end