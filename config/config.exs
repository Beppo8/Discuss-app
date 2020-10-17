# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, DiscussWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K+/alKVl8Zv0m2aiq0BZdVGA7rbbeM22pB0UrRsJS8NaPaHoh7VxXZrLW10hnTuk",
  render_errors: [view: DiscussWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Discuss.PubSub,
  live_view: [signing_salt: "lqsGm/cF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

#Config GitHub Login
config :ueberauth, Ueberauth,
  base_path: "/auth",
  providers: [
    github: { Ueberauth.Strategy.Github, [request_path: "/auth/github",
                                          callback_path: "/auth/github/callback",
                                          default_scope: "user:email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "9e694f59f28e3422b649",
  client_secret: "b23ffd14acfe41a52beeaee31e40bb3914d90f9b"
