defmodule CosmoWeb.CityController do
  @moduledoc """
  Controller actions for city_path routes.
  """

  use CosmoWeb, :controller

  alias Cosmo.Datasets
  alias Cosmo.Datasets.Schemas.City
  alias Cosmo.Datasets.Query

  plug CosmoWeb.Plugs.Controller

  def index(conn, _params) do
    cities = Datasets.list_cities()
    render(conn, "index.html", cities: cities)
  end

  def new(conn, _params) do
    changeset = Datasets.change_city(%City{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"city" => city_params}) do
    case Datasets.create_city(city_params) do
      {:ok, city} ->
        conn
        |> put_flash(:info, "City created successfully.")
        |> redirect(to: Routes.city_path(conn, :show, city))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    city = Datasets.get_city!(id)
    render(conn, "show.html", city: city)
  end

  def edit(conn, %{"id" => id}) do
    city = Datasets.get_city!(id)
    changeset = Datasets.change_city(city)
    render(conn, "edit.html", city: city, changeset: changeset)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Datasets.get_city!(id)

    case Datasets.update_city(city, city_params) do
      {:ok, city} ->
        conn
        |> put_flash(:info, "City updated successfully.")
        |> redirect(to: Routes.city_path(conn, :show, city))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", city: city, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Datasets.get_city!(id)
    {:ok, _city} = Datasets.delete_city(city)

    conn
    |> put_flash(:info, "City deleted successfully.")
    |> redirect(to: Routes.city_path(conn, :index))
  end

  ##

  # @max_index 3228
  @max_index Application.get_env(:cosmo, Cosmo.Datasets.Import.City)[:max_city_index]

  # q = from c in City, select: count(c.id, :distinct)
  # max_index = Repo.one(q)

  # public functions

  def query(conn, %{"id" => id}) do
    # require IEx; IEx.pry()
    case Integer.parse(id) do
      {_, ""} ->
        _query_id(conn, String.to_integer(id))

      _ ->
        conn
        |> put_flash(:error, "! Error: Not valid ID for city (\"#{id}\")")
        |> render("query_city.html")
    end
  end

  def query(conn, %{"name" => name}) do
    _query_name(conn, name)
  end

  def query(conn, _) do
    conn |> render("query_city.html")
  end

  def random(conn, _params) do
    id = Integer.to_string(Enum.random(1..@max_index))
    query(conn, %{"id" => id})
  end

  # private functions

  defp _query_id(conn, id) when id <= 0 or id > @max_index do
    conn
    |> put_flash(:error, "! Error: Could not find city with ID (\"#{id}\")")
    |> render("query_city.html")
  end

  defp _query_id(conn, id) when id > 0 do
    cities = Query.City.by_id(id)

    conn
    |> assign(:cities, cities)
    |> render("query_city.html")
  end

  defp _query_name(conn, name) do
    # cities = []
    # cities = cities ++
    # for n <- String.split(name, "|") do
    #   Query.by_name(n)
    # end
    cities = Query.City.by_name(name)
    matches = length(cities)

    conn =
      cond do
        matches > 1 ->
          put_flash(conn, :info, "Found #{matches} matches")

        matches == 0 ->
          put_flash(conn, :error, "! Error: Found #{matches} matches")

        matches == 1 ->
          conn
      end

    conn
    |> assign(:cities, cities)
    |> render("query_city.html")
  end
end
