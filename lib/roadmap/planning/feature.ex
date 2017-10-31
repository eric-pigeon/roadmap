defmodule Roadmap.Planning.Feature do
  use Ecto.Schema
  import Ecto.Changeset
  alias Roadmap.Planning.Feature

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "features" do
    field :name, :string
    field :effort, :integer
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(%Feature{} = feature, attrs) do
    feature
    |> cast(attrs, [:name, :effort, :value])
    |> validate_required([:name, :effort, :value])
  end
end
