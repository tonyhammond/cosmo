defmodule Cosmo.Graphql.Types.City do
  use Absinthe.Schema.Notation

  @desc """
  The `City` object type represents a record from the US cities database.
  """
  object :city do
    field :id, :id
    #
    field :nam, :string
    field :pop, :integer
    field :lat, :float
    field :lon, :float
  end
end
