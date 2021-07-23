defmodule Bank do
  @moduledoc false

  alias Bank.BankAccount.CommandHandler
  alias Bank.Projections.BankAccount

  defdelegate receive_command(command),
    to: CommandHandler,
    as: :receive

  defdelegate get_projection(module \\ BankAccount, account_number),
    to: Incident.ProjectionStore,
    as: :get

  defdelegate get_all_events(account_number),
    to: Incident.EventStore,
    as: :get
end
