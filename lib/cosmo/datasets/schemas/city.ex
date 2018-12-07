defmodule Cosmo.Datasets.Schemas.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :latitude, :float
    field :longitude, :float
    field :name, :string
    field :population, :integer

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :population, :latitude, :longitude])
    |> validate_required([:name, :population, :latitude, :longitude])
  end
end
