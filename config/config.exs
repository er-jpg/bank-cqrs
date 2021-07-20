import Config

config :bank, Bank.ProjectionStoreRepo,
  database: "bank_projection_store_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :bank, Bank.EventStoreRepo,
  database: "bank_event_store_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :bank, ecto_repos: [Bank.EventStoreRepo, Bank.ProjectionStoreRepo]

import_config "#{config_env()}.exs"
