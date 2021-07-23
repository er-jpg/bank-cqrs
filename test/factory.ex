defmodule Bank.Factory do
  use ExMachina.Ecto, repo: Bank.Repo

  def account_factory do
    ext_id = sequence(:conta_id, &"#{&1}")

    %Bank.Projections.BankAccount{
      aggregate_id: Ecto.UUID.generate(),
      account_number: Ecto.UUID.generate(),
      balance: 0,
      version: 0,
      event_id: Ecto.UUID.generate(),
      event_date: DateTime.utc_now()
    }
  end
end
