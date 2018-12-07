defmodule Cosmo.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string
      add :population, :integer
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end
  end
end
