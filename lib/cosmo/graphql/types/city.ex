defmodule Cosmo.Graphql.Types.City do
  use Absinthe.Schema.Notation

  object :city do
    field :id, non_null(:id)
    field :nam, non_null(:string)
    field :pop, non_null(:integer)
    field :lat, non_null(:float)
    field :lon, non_null(:float)
  end
end
