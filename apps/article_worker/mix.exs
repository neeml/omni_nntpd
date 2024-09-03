defmodule ArticleWorker.MixProject do
  use Mix.Project

  def project do
    [
      app: :article_worker,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ArticleWorker.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yugo, "~> 1.0", runtime: false},
      {:pique, "~> 0.1.0", runtime: false},
      {:gen_nntp, "~> 0.19.0", runtime: false},
      {:tentacat, "~> 2.0", runtime: false},
      {:storage_worker, in_umbrella: true}
    ]
  end
end
