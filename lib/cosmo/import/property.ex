defmodule Cosmo.Import.Property do
  @moduledoc """
  Imports CSV data from priv/csv/properties.csv

  CSV file originally sourced from:

  ...
  """

  alias Cosmo.Repo
  alias Cosmo.Datasets.Property

  @properties_file Path.join(Application.app_dir(:cosmo), "priv") <> "/csv/properties.csv"

  defp to_integer(arg) do
    (String.length(arg) > 0)
    |>
    case do
      true -> String.to_integer(arg)
      false -> 0
    end
  end

  defp to_float(arg) do
    (String.length(arg) > 0)
    |>
    case do
      true -> elem(Float.parse(String.trim(arg)),0)
      false -> 0.0
    end
  end

  def read_properties_file() do
    File.stream!(@properties_file)
    |> CSV.decode(separator: ?\,, headers: false)
    |> Enum.map(fn row ->
      # IO.inspect(row)
      {:ok, [
        manhattan_condominium_property_boro_block_lot,
         manhattan_condominium_property_condo_section,
         manhattan_condominium_property_address,
         borough,
         postcode,
         latitude,
         longitude,
         community_board,
         council_district,
         census_tract,
         bin,
         bbl,
         nta,
         manhattan_condominium_property_neighborhood,
         manhattan_condominium_property_building_classification,
         manhattan_condominium_property_total_units,
         manhattan_condominium_property_year_built,
         manhattan_condominium_property_gross_sqft,
         manhattan_condominium_property_est_gross_income,
         manhattan_condominium_property_gross_income_per_sqft,
         manhattan_condominium_property_full_market_value,
         manhattan_condominium_property_market_value_per_sqft,
         comparable_rental_1_boro_block_lot,
         comparable_rental_1_address,
         comparable_rental_1_neighborhood,
         comparable_rental_1_building_classification,
         comparable_rental_1_total_units,
         comparable_rental_1_year_built,
         comparable_rental_1_gross_sqft,
         comparable_rental_1_est_gross_income,
         comparable_rental_1_gross_income_per_sqft,
         comparable_rental_1_full_market_value,
         comparable_rental_1_market_value_per_sqft,
         comparable_rental_1_dist_from_coop_in_miles,
         comparable_rental_2_boro_block_lot,
         comparable_rental_2_address,
         comparable_rental_2_neighborhood,
         comparable_rental_2_building_classification,
         comparable_rental_2_total_units,
         comparable_rental_2_year_built,
         comparable_rental_2_gross_sqft,
         comparable_rental_2_est_gross_income,
         comparable_rental_2_gross_income_per_sqft,
         comparable_rental_2_full_market_value,
         comparable_rental_2_market_value_per_sqft,
         comparable_rental_2_dist_from_coop_in_miles,
      ]} = row
      property = %Property{}
      params = %{
        bbl: to_integer(String.trim(bbl)),
         bin: to_integer(String.trim(bin)),
         borough: to_integer(String.trim(borough)),
         census_tract: to_integer(String.trim(census_tract)),
         community_board: to_integer(String.trim(community_board)),
         comparable_rental_1_address: String.trim(comparable_rental_1_address),
         comparable_rental_1_boro_block_lot: String.trim(comparable_rental_1_boro_block_lot),
         comparable_rental_1_building_classification: String.trim(comparable_rental_1_building_classification),
         comparable_rental_1_dist_from_coop_in_miles: to_float(String.trim(comparable_rental_1_dist_from_coop_in_miles)),
         comparable_rental_1_est_gross_income: to_integer(String.trim(comparable_rental_1_est_gross_income)),
         comparable_rental_1_full_market_value: to_integer(String.trim(comparable_rental_1_full_market_value)),
         comparable_rental_1_gross_income_per_sqft: to_float(String.trim(comparable_rental_1_gross_income_per_sqft)),
         comparable_rental_1_gross_sqft: to_integer(String.trim(comparable_rental_1_gross_sqft)),
         comparable_rental_1_market_value_per_sqft: to_float(String.trim(comparable_rental_1_market_value_per_sqft)),
         comparable_rental_1_neighborhood: String.trim(comparable_rental_1_neighborhood),
         comparable_rental_1_total_units: to_integer(String.trim(comparable_rental_1_total_units)),
         comparable_rental_1_year_built: to_integer(String.trim(comparable_rental_1_year_built)),
         comparable_rental_2_address: String.trim(comparable_rental_2_address),
         comparable_rental_2_boro_block_lot: String.trim(comparable_rental_2_boro_block_lot),
         comparable_rental_2_building_classification: String.trim(comparable_rental_2_building_classification),
         comparable_rental_2_dist_from_coop_in_miles: to_float(String.trim(comparable_rental_2_dist_from_coop_in_miles)),
         comparable_rental_2_est_gross_income: to_integer(String.trim(comparable_rental_2_est_gross_income)),
         comparable_rental_2_full_market_value: to_integer(String.trim(comparable_rental_2_full_market_value)),
         comparable_rental_2_gross_income_per_sqft: to_float(String.trim(comparable_rental_2_gross_income_per_sqft)),
         comparable_rental_2_gross_sqft: to_integer(String.trim(comparable_rental_2_gross_sqft)),
         comparable_rental_2_market_value_per_sqft: to_float(String.trim(comparable_rental_2_market_value_per_sqft)),
         comparable_rental_2_neighborhood: String.trim(comparable_rental_2_neighborhood),
         comparable_rental_2_total_units: to_integer(String.trim(comparable_rental_2_total_units)),
         comparable_rental_2_year_built: to_integer(String.trim(comparable_rental_2_year_built)),
         council_district: to_integer(String.trim(council_district)),
         latitude: to_float(String.trim(latitude)),
         longitude: to_float(String.trim(longitude)),
         manhattan_condominium_property_address: String.trim(manhattan_condominium_property_address),
         manhattan_condominium_property_boro_block_lot: String.trim(manhattan_condominium_property_boro_block_lot),
         manhattan_condominium_property_building_classification: String.trim(manhattan_condominium_property_building_classification),
         manhattan_condominium_property_condo_section: String.trim(manhattan_condominium_property_condo_section),
         manhattan_condominium_property_est_gross_income: to_integer(String.trim(manhattan_condominium_property_est_gross_income)),
         manhattan_condominium_property_full_market_value: to_integer(String.trim(manhattan_condominium_property_full_market_value)),
         manhattan_condominium_property_gross_income_per_sqft: to_float(String.trim(manhattan_condominium_property_gross_income_per_sqft)),
         manhattan_condominium_property_gross_sqft: to_integer(String.trim(manhattan_condominium_property_gross_sqft)),
         manhattan_condominium_property_market_value_per_sqft: to_float(String.trim(manhattan_condominium_property_market_value_per_sqft)),
         manhattan_condominium_property_neighborhood: String.trim(manhattan_condominium_property_neighborhood),
         manhattan_condominium_property_total_units: to_integer(String.trim(manhattan_condominium_property_total_units)),
         manhattan_condominium_property_year_built: to_integer(String.trim(manhattan_condominium_property_year_built)),
         nta: String.trim(nta),
         postcode: to_integer(String.trim(postcode))
      }

      changeset = Property.changeset(property, params)
      Repo.insert!(changeset)
    end)
  end
end
