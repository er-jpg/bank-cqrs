defmodule Bank.Commands.OpenAccount do
  @behaviour Incident.Command

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @required_fields ~w(aggregate_id)a

  embedded_schema do
    field(:aggregate_id, :string)
  end

  @impl true
  def valid?(command) do
    data = Map.from_struct(command)

    %__MODULE__{}
    |> cast(data, @required_fields)
    |> validate_required(@required_fields)
    |> Map.get(:valid?)
  end
end
