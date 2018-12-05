defmodule Cosmo.Graphql do
  use Absinthe.Schema

  alias CosmoWeb.Resolvers.CityResolver
  alias CosmoWeb.Resolvers.PropertyResolver

  import_types(Cosmo.Graphql.Types.City)
  import_types(Cosmo.Graphql.Types.Property)

  query do
    @desc "List all cities"
    field :cities, non_null(list_of(non_null(:city))) do
      resolve(&CityResolver.cities/3)
    end

    @desc "Get a city"
    field :city, :city do
      arg(:id, non_null(:id))
      resolve(&CityResolver.get_city/3)
    end

    @desc "List all properties"
    field :properties, non_null(list_of(non_null(:property))) do
      resolve(&PropertyResolver.properties/3)
    end

    @desc "Get a property"
    field :property, :property do
      arg(:id, non_null(:id))
      resolve(&PropertyResolver.get_property/3)
    end
  end

  mutation do
    field :create_city, :city do
      arg(:lat, non_null(:float))
      arg(:lon, non_null(:float))
      arg(:nam, non_null(:string))
      arg(:pop, non_null(:integer))

      resolve(&CityResolver.create_city/3)
    end

    field :create_property, :property do
      arg(:postcode, :integer)
      arg(:community_board, :integer)
      arg(:comparable_rental_1_address, :string)
      arg(:comparable_rental_1_gross_income_per_sqft, :float)
      arg(:comparable_rental_2_neighborhood, :string)
      arg(:manhattan_condominium_property_gross_income_per_sqft, :float)
      arg(:comparable_rental_2_est_gross_income, :integer)
      arg(:manhattan_condominium_property_boro_block_lot, :string)
      arg(:comparable_rental_2_dist_from_coop_in_miles, :float)
      arg(:comparable_rental_2_full_market_value, :integer)
      arg(:council_district, :integer)
      arg(:manhattan_condominium_property_condo_section, :string)
      arg(:comparable_rental_2_gross_income_per_sqft, :float)
      arg(:manhattan_condominium_property_neighborhood, :string)
      arg(:comparable_rental_2_building_classification, :string)
      arg(:comparable_rental_1_dist_from_coop_in_miles, :float)
      arg(:comparable_rental_1_full_market_value, :integer)
      arg(:comparable_rental_2_total_units, :integer)
      arg(:comparable_rental_2_address, :string)
      arg(:comparable_rental_1_total_units, :integer)
      arg(:bin, :integer)
      arg(:manhattan_condominium_property_gross_sqft, :integer)
      arg(:manhattan_condominium_property_address, :string)
      arg(:comparable_rental_2_boro_block_lot, :string)
      arg(:comparable_rental_2_gross_sqft, :integer)
      arg(:nta, :string)
      arg(:comparable_rental_1_boro_block_lot, :string)
      arg(:comparable_rental_2_year_built, :integer)
      arg(:comparable_rental_1_year_built, :integer)
      arg(:manhattan_condominium_property_year_built, :integer)
      arg(:census_tract, :integer)
      arg(:borough, :integer)
      arg(:manhattan_condominium_property_est_gross_income, :integer)
      arg(:comparable_rental_1_gross_sqft, :integer)
      arg(:comparable_rental_1_neighborhood, :string)
      arg(:manhattan_condominium_property_building_classification, :string)
      arg(:longitude, :float)
      arg(:bbl, :integer)
      arg(:manhattan_condominium_property_total_units, :integer)
      arg(:comparable_rental_1_building_classification, :string)
      arg(:comparable_rental_1_market_value_per_sqft, :float)
      arg(:manhattan_condominium_property_market_value_per_sqft, :float)
      arg(:manhattan_condominium_property_full_market_value, :integer)
      arg(:latitude, :float)
      arg(:comparable_rental_2_market_value_per_sqft, :float)
      arg(:comparable_rental_1_est_gross_income, :integer)

      resolve(&PropertyResolver.create_property/3)
    end
  end
end
