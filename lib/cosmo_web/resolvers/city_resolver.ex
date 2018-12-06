defmodule CosmoWeb.Resolvers.CityResolver do
  @moduledoc """
  Resolver functions for GraphQL city queries.
  """

  alias Cosmo.Datasets
  alias Cosmo.Datasets.Query.City

  def cities(_root, _args, _info) do
    cities = Datasets.list_cities()
    {:ok, cities}
  end

  def get_city(_parent, %{id: id}, _resolution) do
    # case Datasets.get_city!(id) do
    case City.by_id(String.to_integer(id)) do
      nil ->
        {:error, "City ID #{id} not found"}

      city ->
        {:ok, city}
    end
  end

  def get_cities(_parent, %{nam: name}, _resolution) do
    case City.by_nam(name) do
      nil ->
        {:error, "City name #{name} not found"}

      city ->
        {:ok, city}
    end
  end

  def create_city(_root, args, _info) do
    case Datasets.create_city(args) do
      {:ok, city} ->
        {:ok, city}

      _error ->
        {:error, "could not create city"}
    end
  end
end
