defmodule Cosmo.Graphql.Types.Property do
  use Absinthe.Schema.Notation

  @desc """
  The `Property` object type represents a record from the NYC condominium database.
  """
  object :property do
    field :id, :id
    #
    field :bbl, :integer
    field :bin, :integer
    field :borough, :integer
    field :census_tract, :integer
    field :community_board, :integer
    field :council_district, :integer
    field :latitude, :float
    field :longitude, :float
    field :nta, :string
    field :postcode, :integer
    #
    field :manhattan_condominium_property_address, :string
    field :manhattan_condominium_property_boro_block_lot, :string
    field :manhattan_condominium_property_building_classification, :string
    field :manhattan_condominium_property_condo_section, :string
    field :manhattan_condominium_property_est_gross_income, :integer
    field :manhattan_condominium_property_full_market_value, :integer
    field :manhattan_condominium_property_gross_income_per_sqft, :float
    field :manhattan_condominium_property_gross_sqft, :integer
    field :manhattan_condominium_property_market_value_per_sqft, :float
    field :manhattan_condominium_property_neighborhood, :string
    field :manhattan_condominium_property_total_units, :integer
    field :manhattan_condominium_property_year_built, :integer
    #
    field :comparable_rental_1_address, :string
    field :comparable_rental_1_boro_block_lot, :string
    field :comparable_rental_1_building_classification, :string
    field :comparable_rental_1_dist_from_coop_in_miles, :float
    field :comparable_rental_1_est_gross_income, :integer
    field :comparable_rental_1_full_market_value, :integer
    field :comparable_rental_1_gross_income_per_sqft, :float
    field :comparable_rental_1_gross_sqft, :integer
    field :comparable_rental_1_market_value_per_sqft, :float
    field :comparable_rental_1_neighborhood, :string
    field :comparable_rental_1_total_units, :integer
    field :comparable_rental_1_year_built, :integer
    #
    field :comparable_rental_2_address, :string
    field :comparable_rental_2_boro_block_lot, :string
    field :comparable_rental_2_building_classification, :string
    field :comparable_rental_2_dist_from_coop_in_miles, :float
    field :comparable_rental_2_est_gross_income, :integer
    field :comparable_rental_2_full_market_value, :integer
    field :comparable_rental_2_gross_income_per_sqft, :float
    field :comparable_rental_2_gross_sqft, :integer
    field :comparable_rental_2_market_value_per_sqft, :float
    field :comparable_rental_2_neighborhood, :string
    field :comparable_rental_2_total_units, :integer
    field :comparable_rental_2_year_built, :integer
  end
end
