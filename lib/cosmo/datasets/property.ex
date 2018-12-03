defmodule Cosmo.Datasets.Property do
  use Ecto.Schema
  import Ecto.Changeset


  schema "properties" do
    field :postcode, :integer
    field :community_board, :integer
    field :comparable_rental_1_address, :string
    field :comparable_rental_1_gross_income_per_sqft, :float
    field :comparable_rental_2_neighborhood, :string
    field :manhattan_condominium_property_gross_income_per_sqft, :float
    field :comparable_rental_2_est_gross_income, :integer
    field :manhattan_condominium_property_boro_block_lot, :string
    field :comparable_rental_2_dist_from_coop_in_miles, :float
    field :comparable_rental_2_full_market_value, :integer
    field :council_district, :integer
    field :manhattan_condominium_property_condo_section, :string
    field :comparable_rental_2_gross_income_per_sqft, :float
    field :manhattan_condominium_property_neighborhood, :string
    field :comparable_rental_2_building_classification, :string
    field :comparable_rental_1_dist_from_coop_in_miles, :float
    field :comparable_rental_1_full_market_value, :integer
    field :comparable_rental_2_total_units, :integer
    field :comparable_rental_2_address, :string
    field :comparable_rental_1_total_units, :integer
    field :bin, :integer
    field :manhattan_condominium_property_gross_sqft, :integer
    field :manhattan_condominium_property_address, :string
    field :comparable_rental_2_boro_block_lot, :string
    field :comparable_rental_2_gross_sqft, :integer
    field :nta, :string
    field :comparable_rental_1_boro_block_lot, :string
    field :comparable_rental_2_year_built, :integer
    field :comparable_rental_1_year_built, :integer
    field :manhattan_condominium_property_year_built, :integer
    field :census_tract, :integer
    field :borough, :integer
    field :manhattan_condominium_property_est_gross_income, :integer
    field :comparable_rental_1_gross_sqft, :integer
    field :comparable_rental_1_neighborhood, :string
    field :manhattan_condominium_property_building_classification, :string
    field :longitude, :float
    field :bbl, :integer
    field :manhattan_condominium_property_total_units, :integer
    field :comparable_rental_1_building_classification, :string
    field :comparable_rental_1_market_value_per_sqft, :float
    field :manhattan_condominium_property_market_value_per_sqft, :float
    field :manhattan_condominium_property_full_market_value, :integer
    field :latitude, :float
    field :comparable_rental_2_market_value_per_sqft, :float
    field :comparable_rental_1_est_gross_income, :integer

    timestamps()
  end

  @doc false
  def changeset(property, attrs) do
    property
    |> cast(attrs, [:bbl, :bin, :borough, :census_tract, :community_board, :comparable_rental_1_address, :comparable_rental_1_boro_block_lot, :comparable_rental_1_building_classification, :comparable_rental_1_dist_from_coop_in_miles, :comparable_rental_1_est_gross_income, :comparable_rental_1_full_market_value, :comparable_rental_1_gross_income_per_sqft, :comparable_rental_1_gross_sqft, :comparable_rental_1_market_value_per_sqft, :comparable_rental_1_neighborhood, :comparable_rental_1_total_units, :comparable_rental_1_year_built, :comparable_rental_2_address, :comparable_rental_2_boro_block_lot, :comparable_rental_2_building_classification, :comparable_rental_2_dist_from_coop_in_miles, :comparable_rental_2_est_gross_income, :comparable_rental_2_full_market_value, :comparable_rental_2_gross_income_per_sqft, :comparable_rental_2_gross_sqft, :comparable_rental_2_market_value_per_sqft, :comparable_rental_2_neighborhood, :comparable_rental_2_total_units, :comparable_rental_2_year_built, :council_district, :latitude, :longitude, :manhattan_condominium_property_address, :manhattan_condominium_property_boro_block_lot, :manhattan_condominium_property_building_classification, :manhattan_condominium_property_condo_section, :manhattan_condominium_property_est_gross_income, :manhattan_condominium_property_full_market_value, :manhattan_condominium_property_gross_income_per_sqft, :manhattan_condominium_property_gross_sqft, :manhattan_condominium_property_market_value_per_sqft, :manhattan_condominium_property_neighborhood, :manhattan_condominium_property_total_units, :manhattan_condominium_property_year_built, :nta, :postcode])
    # |> validate_required([:bbl, :bin, :borough, :census_tract, :community_board, :comparable_rental_1_address, :comparable_rental_1_boro_block_lot, :comparable_rental_1_building_classification, :comparable_rental_1_dist_from_coop_in_miles, :comparable_rental_1_est_gross_income, :comparable_rental_1_full_market_value, :comparable_rental_1_gross_income_per_sqft, :comparable_rental_1_gross_sqft, :comparable_rental_1_market_value_per_sqft, :comparable_rental_1_neighborhood, :comparable_rental_1_total_units, :comparable_rental_1_year_built, :comparable_rental_2_address, :comparable_rental_2_boro_block_lot, :comparable_rental_2_building_classification, :comparable_rental_2_dist_from_coop_in_miles, :comparable_rental_2_est_gross_income, :comparable_rental_2_full_market_value, :comparable_rental_2_gross_income_per_sqft, :comparable_rental_2_gross_sqft, :comparable_rental_2_market_value_per_sqft, :comparable_rental_2_neighborhood, :comparable_rental_2_total_units, :comparable_rental_2_year_built, :council_district, :latitude, :longitude, :manhattan_condominium_property_address, :manhattan_condominium_property_boro_block_lot, :manhattan_condominium_property_building_classification, :manhattan_condominium_property_condo_section, :manhattan_condominium_property_est_gross_income, :manhattan_condominium_property_full_market_value, :manhattan_condominium_property_gross_income_per_sqft, :manhattan_condominium_property_gross_sqft, :manhattan_condominium_property_market_value_per_sqft, :manhattan_condominium_property_neighborhood, :manhattan_condominium_property_total_units, :manhattan_condominium_property_year_built, :nta, :postcode])
  end
end
