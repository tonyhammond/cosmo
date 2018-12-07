defmodule Cosmo.Datasets.Import.City do
  @moduledoc """
  Imports CSV data from priv/csv/cities.csv

  CSV file originally sourced from:

  https://github.com/plotly/datasets/blob/master/2014_us_cities.csv
  """

  alias Cosmo.Repo
  alias Cosmo.Datasets.Schemas.City

  @cities_file Path.join(Application.app_dir(:cosmo), "priv") <> "/csv/cities.csv"

  def read_cities_file() do
    File.stream!(@cities_file)
    |> CSV.decode(separator: ?\,, headers: false)
    |> Enum.map(fn row ->
      # IO.inspect(row)
      {:ok, [name, population, latitude, longitude]} = row
      city = %City{}

      params = %{
        name: String.trim(name),
        population: String.to_integer(String.trim(population)),
        latitude: String.to_float(String.trim(latitude)),
        longitude: String.to_float(String.trim(longitude))
      }

      changeset = City.changeset(city, params)
      Repo.insert!(changeset)
    end)
  end
end
