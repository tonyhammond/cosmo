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
      {:ok, [nam, pop, lat, lon]} = row
      city = %City{}

      params = %{
        nam: String.trim(nam),
        pop: String.to_integer(String.trim(pop)),
        lat: String.to_float(String.trim(lat)),
        lon: String.to_float(String.trim(lon))
      }

      changeset = City.changeset(city, params)
      Repo.insert!(changeset)
    end)
  end
end
