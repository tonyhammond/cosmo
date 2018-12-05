# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cosmo,
  ecto_repos: [Cosmo.Repo]

config :cosmo, Cosmo.Import.City,
  city_dataset_source: "https://github.com/plotly/datasets/blob/master/2014_us_cities.csv",
  max_city_index: 3228,
  max_city_fields: 4,
  max_city_data_points: 12912

config :cosmo, Cosmo.Import.Property,
  property_dataset_source: "https://data.cityofnewyork.us/api/views/ikqj-pyhc/rows.csv",
  max_property_index: 1165,
  max_property_fields: 46,
  max_property_data_points: 53590

config :cosmo,
  banner_image: "aerial-urban-skyline-black-white-82952601.jpg",
  banner_image_source:
    "https://thumbs.dreamstime.com/b/aerial-urban-skyline-black-white-82952601.jpg"

# Configures the endpoint
config :cosmo, CosmoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xE/OrNO5VeR652xhyiB3Vb7nKq3oHBp/Ei0GSEOieF4SMoVbqAx3m8b9zzOwuMO2",
  render_errors: [view: CosmoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cosmo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
