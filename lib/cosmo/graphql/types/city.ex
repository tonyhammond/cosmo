defmodule Cosmo.Graphql.Types.City do
  use Absinthe.Schema.Notation

  @desc """
  The `City` object type represents a record from the US cities database.
  """
  object :city do
    field :id, :id
    #
    field :name, :string, description: "The name of the city"
    field :population, :integer, description: "The population of the city"
    field :latitude, :float, description: "The latitude of the city"
    field :longitude, :float, description: "The longitude of the city"
  end
end
