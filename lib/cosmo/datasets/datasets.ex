defmodule Cosmo.Datasets do
  @moduledoc """
  The Datasets context.
  """

  import Ecto.Query, warn: false
  alias Cosmo.Repo

  alias Cosmo.Datasets.City

  @doc """
  Returns the list of cities.

  ## Examples

      iex> list_cities()
      [%City{}, ...]

  """
  def list_cities do
    Repo.all(City)
  end

  @doc """
  Gets a single city.

  Raises `Ecto.NoResultsError` if the City does not exist.

  ## Examples

      iex> get_city!(123)
      %City{}

      iex> get_city!(456)
      ** (Ecto.NoResultsError)

  """
  def get_city!(id), do: Repo.get!(City, id)

  @doc """
  Creates a city.

  ## Examples

      iex> create_city(%{field: value})
      {:ok, %City{}}

      iex> create_city(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_city(attrs \\ %{}) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city.

  ## Examples

      iex> update_city(city, %{field: new_value})
      {:ok, %City{}}

      iex> update_city(city, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_city(%City{} = city, attrs) do
    city
    |> City.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a City.

  ## Examples

      iex> delete_city(city)
      {:ok, %City{}}

      iex> delete_city(city)
      {:error, %Ecto.Changeset{}}

  """
  def delete_city(%City{} = city) do
    Repo.delete(city)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking city changes.

  ## Examples

      iex> change_city(city)
      %Ecto.Changeset{source: %City{}}

  """
  def change_city(%City{} = city) do
    City.changeset(city, %{})
  end

  alias Cosmo.Datasets.Property

  @doc """
  Returns the list of properties.

  ## Examples

      iex> list_properties()
      [%Property{}, ...]

  """
  def list_properties do
    Repo.all(Property)
  end

  @doc """
  Gets a single property.

  Raises `Ecto.NoResultsError` if the Property does not exist.

  ## Examples

      iex> get_property!(123)
      %Property{}

      iex> get_property!(456)
      ** (Ecto.NoResultsError)

  """
  def get_property!(id), do: Repo.get!(Property, id)

  @doc """
  Creates a property.

  ## Examples

      iex> create_property(%{field: value})
      {:ok, %Property{}}

      iex> create_property(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_property(attrs \\ %{}) do
    %Property{}
    |> Property.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a property.

  ## Examples

      iex> update_property(property, %{field: new_value})
      {:ok, %Property{}}

      iex> update_property(property, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_property(%Property{} = property, attrs) do
    property
    |> Property.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Property.

  ## Examples

      iex> delete_property(property)
      {:ok, %Property{}}

      iex> delete_property(property)
      {:error, %Ecto.Changeset{}}

  """
  def delete_property(%Property{} = property) do
    Repo.delete(property)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking property changes.

  ## Examples

      iex> change_property(property)
      %Ecto.Changeset{source: %Property{}}

  """
  def change_property(%Property{} = property) do
    Property.changeset(property, %{})
  end
end
