defmodule Bank.BankAccount do
  @behaviour Incident.Aggregate

  alias Bank.BankAccount.State
  alias Bank.Commands.OpenAccount
  alias Bank.Events.AccountOpened

  @version_one 1
  @inital_balance 0

  @impl true
  def execute(%OpenAccount{aggregate_id: aggregate_id}) do
    case State.get(aggregate_id) do
      %{account_number: nil} = state ->
        new_event = %AccountOpened{
          aggregate_id: aggregate_id,
          account_number: aggregate_id,
          version: @version_one
        }

        {:ok, new_event, state}

      _state ->
        {:error, :account_already_opened}
    end
  end

  @impl true
  def apply(%{event_type: "AccountOpened"} = event, state) do
    %{
      state
      | aggregate_id: event.aggregate_id,
        account_number: event.event_data["account_number"],
        balance: @inital_balance,
        version: event.version,
        updated_at: event.event_date
    }
  end
end
