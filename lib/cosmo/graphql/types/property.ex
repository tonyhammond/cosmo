defmodule Cosmo.Graphql.Types.Property do
  use Absinthe.Schema.Notation

  @desc """
  The `Property` object type represents a record from the NYC condominium database.
  """
  object :property do
    field :id, :id
    #
    field :bbl, :integer, description: "BBL"
    field :bin, :integer, description: "BIN"
    field :borough, :integer, description: "Borough"
    field :census_tract, :integer, description: "Census Tract"
    field :community_board, :integer, description: "Community Board"
    field :council_district, :integer, description: "Council District"
    field :latitude, :float, description: "Latitude"
    field :longitude, :float, description: "Longitude"
    field :nta, :string, description: "NTA"
    field :postcode, :integer, description: "Postcode"
    #
    field :manhattan_condominium_property_address, :string, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Address"
    field :manhattan_condominium_property_boro_block_lot, :string, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Boro-Block-Lot"
    field :manhattan_condominium_property_building_classification, :string, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Building Class"
    field :manhattan_condominium_property_condo_section, :string, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Condo Section"
    field :manhattan_condominium_property_est_gross_income, :integer, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Estimated Gross Income"
    field :manhattan_condominium_property_full_market_value, :integer, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Full Market Value"
    field :manhattan_condominium_property_gross_income_per_sqft, :float, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Gross Income per SqFt"
    field :manhattan_condominium_property_gross_sqft, :integer, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Gross SqFt"
    field :manhattan_condominium_property_market_value_per_sqft, :float, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Market Value per SqFt"
    field :manhattan_condominium_property_neighborhood, :string, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Neighborhood"
    field :manhattan_condominium_property_total_units, :integer, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Total Units"
    field :manhattan_condominium_property_year_built, :integer, \
      description: "MANHATTAN CONDOMINIUM PROPERTY Year Built"
    #
    field :comparable_rental_1_address, :string, \
      description: "COMPARABLE RENTAL 1 Address"
    field :comparable_rental_1_boro_block_lot, :string, \
      description: "COMPARABLE RENTAL 1 Boro-Block-Lot"
    field :comparable_rental_1_building_classification, :string, \
      description: "COMPARABLE RENTAL 1 Building Class"
    field :comparable_rental_1_dist_from_coop_in_miles, :float, \
      description: "COMPARABLE RENTAL 1 Distance from Condo in miles"
    field :comparable_rental_1_est_gross_income, :integer, \
      description: "COMPARABLE RENTAL 1 Estimated Gross Income"
    field :comparable_rental_1_full_market_value, :integer, \
      description: "COMPARABLE RENTAL 1 Full Market Value"
    field :comparable_rental_1_gross_income_per_sqft, :float, \
      description: "COMPARABLE RENTAL 1 Gross Income per SqFt"
    field :comparable_rental_1_gross_sqft, :integer, \
      description: "COMPARABLE RENTAL 1 Gross SqFt"
    field :comparable_rental_1_market_value_per_sqft, :float, \
      description: "COMPARABLE RENTAL 1 Market Value per SqFt"
    field :comparable_rental_1_neighborhood, :string, \
      description: "COMPARABLE RENTAL 1 Neighborhood"
    field :comparable_rental_1_total_units, :integer, \
      description: "COMPARABLE RENTAL 1 Total Units"
    field :comparable_rental_1_year_built, :integer, \
      description: "COMPARABLE RENTAL 1 Year Built"
    #
    field :comparable_rental_2_address, :string, \
      description: "COMPARABLE RENTAL 2 Address"
    field :comparable_rental_2_boro_block_lot, :string, \
      description: "COMPARABLE RENTAL 2 Boro-Block-Lot"
    field :comparable_rental_2_building_classification, :string, \
      description: "COMPARABLE RENTAL 2 Building Class"
    field :comparable_rental_2_dist_from_coop_in_miles, :float, \
      description: "COMPARABLE RENTAL 2 Distance from Condo in miles"
    field :comparable_rental_2_est_gross_income, :integer, \
      description: "COMPARABLE RENTAL 2 Estimated Gross Income"
    field :comparable_rental_2_full_market_value, :integer, \
      description: "COMPARABLE RENTAL 2 Full Market Value"
    field :comparable_rental_2_gross_income_per_sqft, :float, \
      description: "COMPARABLE RENTAL 2 Gross Income per SqFt"
    field :comparable_rental_2_gross_sqft, :integer, \
      description: "COMPARABLE RENTAL 2 Gross SqFt"
    field :comparable_rental_2_market_value_per_sqft, :float, \
      description: "COMPARABLE RENTAL 2 Market Value per SqFt"
    field :comparable_rental_2_neighborhood, :string, \
      description: "COMPARABLE RENTAL 2 Neighborhood"
    field :comparable_rental_2_total_units, :integer, \
      description: "COMPARABLE RENTAL 2 Total Units"
    field :comparable_rental_2_year_built, :integer, \
      description: "COMPARABLE RENTAL 2 Year Built"
  end
end
