defmodule Cosmo.Datasets do
  @moduledoc """
  The Datasets context.
  """

  import Ecto.Query, warn: false
  alias Cosmo.Repo

  alias Cosmo.Datasets.Schemas.City
  alias Cosmo.Datasets.Schemas.Property

  @doc """
  Returns the list of cities.
  """
  def list_cities do
    Repo.all(City)
  end

  @doc """
  Gets a single city.
  """
  def get_city!(id), do: Repo.get!(City, id)

  @doc """
  Creates a city.
  """
  def create_city(attrs \\ %{}) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city.
  """
  def update_city(%City{} = city, attrs) do
    city
    |> City.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a City.
  """
  def delete_city(%City{} = city) do
    Repo.delete(city)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking city changes.
  """
  def change_city(%City{} = city) do
    City.changeset(city, %{})
  end

  ##

  @doc """
  Returns the list of properties.
  """
  def list_properties do
    Repo.all(Property)
  end

  @doc """
  Gets a single property.
  """
  def get_property!(id), do: Repo.get!(Property, id)

  @doc """
  Creates a property.
  """
  def create_property(attrs \\ %{}) do
    %Property{}
    |> Property.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a property.
  """
  def update_property(%Property{} = property, attrs) do
    property
    |> Property.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Property.
  """
  def delete_property(%Property{} = property) do
    Repo.delete(property)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking property changes.
  """
  def change_property(%Property{} = property) do
    Property.changeset(property, %{})
  end
end
