defmodule Bank.BankAccount.CommandHandler do
  use Incident.CommandHandler,
    aggregate: Bank.BankAccount,
    event_handler: Bank.BankAccount.EventHandler
end
