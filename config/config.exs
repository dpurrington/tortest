import Config
config :backend, :Tortoise311,
    client_id: "T999",

    #TODO: move these secrets to runtime
    user_name: System.get_env("SENGLED_USERNAME"),
    password: System.get_env("SENGLED_PASSWORD"),
    username: :user_name,
    #keep_alive: 60,
    will: "will?",
    # if we re-spawn from here it means our state is gone
    #clean_session: true,

    backoff: [],

    # This allow us to either pass in a list of topics, or a
    # subscription struct. Passing in a subscription struct is helpful
    # in tests.
    #subscriptions = [],

    # wss options
    host: "localhost",
    port: 443,
    opts:
      path: "/mqtt",
      headers: [],





import_config("#{config_env()}.exs")
