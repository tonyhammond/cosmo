defmodule CosmoWeb.Resolvers.PropertyResolver do
  alias Cosmo.Datasets

  def properties(_root, _args, _info) do
    properties = Datasets.list_properties()
    {:ok, properties}
  end

  def get_property(_parent, %{id: id}, _resolution) do
    case Datasets.get_property!(id) do
      nil ->
        {:error, "Property ID #{id} not found"}

      property ->
        {:ok, property}
    end
  end

  def create_property(_root, args, _info) do
    case Datasets.create_property(args) do
      {:ok, property} ->
        {:ok, property}

      _error ->
        {:error, "could not create property"}
    end
  end
end
