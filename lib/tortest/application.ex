defmodule Tortest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias Tortoise311.Transport.Wss.Api

  @impl true
  def start(_type, _args) do
    {:ok, pid} =
      Tortoise310.Supervisor.start_child(
        client_id: T999,
        handler: {Tortoise310.Handler.Logger, []},
        server: {Tortoise310.Transport.Wss, host: 'localhost', port: 1883}
      )

    children = [
      {Tortoise311.Connection, get_wss_opts()}
      # Starts a worker by calling: Tortest.Worker.start_link(arg)
      # {Tortest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tortest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def get_wss_opts() do
    username = System.get_env("SENGLED_USERNAME")
    password = System.get_env("SENGLED_PASSWORD")
    sid = Api.get_session_id(username, password)
    headers = Api.get_wss_headers(sid)
    [url: get_url(), headers: headers]
  end

  def get_url() do
    "wss://element.cloud.sengled.com/mqtt"
  end
end
