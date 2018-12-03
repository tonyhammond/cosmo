defmodule CosmoWeb.Resolvers.CityResolver do
    alias Cosmo.Datasets

    def cities(_root, _args, _info) do
      cities = Datasets.list_cities()
      {:ok, cities}
    end

    def create_city(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Datasets.create_city(args) do
      {:ok, city} ->
        {:ok, city}
      _error ->
        {:error, "could not create city"}
    end
  end

  end
