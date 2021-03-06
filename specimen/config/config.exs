# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :specimen, Specimen.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UCf/Kvd2M5zvhpYaaLBfJUEh8hs63mzvqEKbXQ8WTTHRkdSJokCUNqo6wnhvfSYl",
  render_errors: [view: Specimen.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Specimen.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


### Guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "specimen",
  ttl: { 365, :days },
  verify_issuer: true,
  secret_key: "12345",
  serializer: Specimen.GuardianSerializer,

  permissions: %{
    user: [
      :normal_login,
      :admin_login,
    ],
  }



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
