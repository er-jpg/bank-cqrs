import Config

config :bank, Bank.EventStoreRepo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "bank_event_store_dev"

config :bank, Bank.ProjectionStoreRepo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "bank_projection_store_dev"
