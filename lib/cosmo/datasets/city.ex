defmodule Cosmo.Datasets.City do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cities" do
    field :lat, :float
    field :lon, :float
    field :nam, :string
    field :pop, :integer

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:nam, :pop, :lat, :lon])
    |> validate_required([:nam, :pop, :lat, :lon])
  end
end
