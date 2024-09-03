defmodule RestApiWorker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RestApiWorkerWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:omni_nntpd, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RestApiWorker.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RestApiWorker.Finch},
      # Start a worker by calling: RestApiWorker.Worker.start_link(arg)
      # {RestApiWorker.Worker, arg},
      # Start to serve requests, typically the last entry
      RestApiWorkerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RestApiWorker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RestApiWorkerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
