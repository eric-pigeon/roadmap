defmodule Roadmap.Repo.Migrations.CreateFeatures do
  use Ecto.Migration

  def change do
    create table(:features, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :name, :string, null: false
      add :effort, :integer, null: false
      add :value, :integer, null: false

      timestamps()
    end
  end
end
