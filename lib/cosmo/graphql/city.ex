defmodule Cosmo.Graphql.City do
    use Absinthe.Schema

    alias CosmoWeb.Resolvers.CityResolver

    object :city do
      field :id, non_null(:id)
      field :nam, non_null(:string)
      field :pop, non_null(:integer)
      field :lat, non_null(:float)
      field :lon, non_null(:float)
      end

    query do
      @desc "List all cities"
      field :cities, non_null(list_of(non_null(:city))) do
        resolve &CityResolver.cities/3
      end

     @desc "Get a city"
     field :city, :city do
       arg :id, non_null(:id)
       resolve &CityResolver.get_city/3
     end

    end

    mutation do
      field :create_city, :city do
        arg :lat, non_null(:float)
        arg :lon, non_null(:float)
        arg :nam, non_null(:string)
        arg :pop, non_null(:integer)

        resolve &CityResolver.create_city/3
      end
    end

  end
