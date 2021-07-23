defmodule Bank.Commands.DepositMoney do
  @behaviour Incident.Command

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @required_fields ~w(aggregate_id amount)a

  embedded_schema do
    field(:aggregate_id, :string)
    field(:amount, :integer)
  end

  @impl true
  def valid?(command) do
    data = Map.from_struct(command)

    %__MODULE__{}
    |> cast(data, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:amount, greater_than: 0)
    |> Map.get(:valid?)
  end
end
