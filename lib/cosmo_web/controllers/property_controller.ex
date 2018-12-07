defmodule CosmoWeb.PropertyController do
  @moduledoc """
  Controller actions for property_path routes.
  """

  use CosmoWeb, :controller

  alias Cosmo.Datasets
  alias Cosmo.Datasets.Schemas.Property
  alias Cosmo.Datasets.Query

  plug CosmoWeb.Plugs.Controller

  def index(conn, _params) do
    properties = Datasets.list_properties()
    render(conn, "index.html", properties: properties)
  end

  def new(conn, _params) do
    changeset = Datasets.change_property(%Property{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"property" => property_params}) do
    case Datasets.create_property(property_params) do
      {:ok, property} ->
        conn
        |> put_flash(:info, "Property created successfully.")
        |> redirect(to: Routes.property_path(conn, :show, property))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    property = Datasets.get_property!(id)
    render(conn, "show.html", property: property)
  end

  def edit(conn, %{"id" => id}) do
    property = Datasets.get_property!(id)
    changeset = Datasets.change_property(property)
    render(conn, "edit.html", property: property, changeset: changeset)
  end

  def update(conn, %{"id" => id, "property" => property_params}) do
    property = Datasets.get_property!(id)

    case Datasets.update_property(property, property_params) do
      {:ok, property} ->
        conn
        |> put_flash(:info, "Property updated successfully.")
        |> redirect(to: Routes.property_path(conn, :show, property))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", property: property, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    property = Datasets.get_property!(id)
    {:ok, _property} = Datasets.delete_property(property)

    conn
    |> put_flash(:info, "Property deleted successfully.")
    |> redirect(to: Routes.property_path(conn, :index))
  end

  ##

  # @max_index 3228
  @max_index Application.get_env(:cosmo, Cosmo.Import.Property)[:max_property_index]

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
        |> render("query_property.html")
    end
  end

  def query(conn, %{"address" => nam}) do
    _query_addr(conn, nam)
  end

  def query(conn, %{"addr" => nam}) do
    _query_addr(conn, nam)
  end

  def query(conn, %{"neighborhood" => nam}) do
    _query_distr(conn, nam)
  end

  def query(conn, %{"hood" => nam}) do
    _query_distr(conn, nam)
  end

  def query(conn, %{"year" => year}) do
    _query_year(conn, year)
  end

  def query(conn, _) do
    conn |> render("query_property.html")
  end

  def random(conn, _params) do
    id = Integer.to_string(Enum.random(1..@max_index))
    query(conn, %{"id" => id})
  end

  # private functions

  defp _query_id(conn, id) when id <= 0 or id > @max_index do
    conn
    |> put_flash(:error, "! Error: Could not find property with ID (\"#{id}\")")
    |> render("query_property.html")
  end

  defp _query_id(conn, id) when id > 0 do
    properties = Query.Property.by_id(id)

    conn
    |> assign(:properties, properties)
    |> render("query_property.html")
  end

  defp _query_addr(conn, nam) do
    properties = Query.Property.by_addr(nam)
    matches = length(properties)

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
    |> assign(:properties, properties)
    |> render("query_property.html")
  end

  defp _query_distr(conn, nam) do
    properties = Query.Property.by_distr(nam)
    matches = length(properties)

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
    |> assign(:properties, properties)
    |> render("query_property.html")
  end

  #  defp _query_year(conn, year) when id > 0 do
  defp _query_year(conn, year) do
    properties = Query.Property.by_year(year)

    conn
    |> assign(:properties, properties)
    |> render("query_property.html")
  end
end
