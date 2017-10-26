# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :roadmap,
  ecto_repos: [Roadmap.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :roadmap, RoadmapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "E+ZprD4spCK+Gh3R+fg8i7k0x/VbXv+xJ+cJ2eFlYl8K9FLU/3J1rQi4FVaI0Md6",
  render_errors: [view: RoadmapWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Roadmap.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
