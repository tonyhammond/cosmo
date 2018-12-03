defmodule Cosmo.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :nam, :string
      add :pop, :integer
      add :lat, :float
      add :lon, :float

      timestamps()
    end

  end
end
