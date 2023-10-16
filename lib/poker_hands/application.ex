defmodule PokerHands.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PokerHandsWeb.Telemetry,
      # Start the Ecto repository
      PokerHands.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PokerHands.PubSub},
      # Start Finch
      {Finch, name: PokerHands.Finch},
      # Start the Endpoint (http/https)
      PokerHandsWeb.Endpoint
      # Start a worker by calling: PokerHands.Worker.start_link(arg)
      # {PokerHands.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PokerHands.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PokerHandsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
