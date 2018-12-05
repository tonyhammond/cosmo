defmodule Cosmo.Repo.Migrations.CreateProperties do
  use Ecto.Migration

  def change do
    create table(:properties) do
      add :bbl, :integer
      add :bin, :integer
      add :borough, :integer
      add :census_tract, :integer
      add :community_board, :integer
      add :comparable_rental_1_address, :string
      add :comparable_rental_1_boro_block_lot, :string
      add :comparable_rental_1_building_classification, :string
      add :comparable_rental_1_dist_from_coop_in_miles, :float
      add :comparable_rental_1_est_gross_income, :integer
      add :comparable_rental_1_full_market_value, :integer
      add :comparable_rental_1_gross_income_per_sqft, :float
      add :comparable_rental_1_gross_sqft, :integer
      add :comparable_rental_1_market_value_per_sqft, :float
      add :comparable_rental_1_neighborhood, :string
      add :comparable_rental_1_total_units, :integer
      add :comparable_rental_1_year_built, :integer
      add :comparable_rental_2_address, :string
      add :comparable_rental_2_boro_block_lot, :string
      add :comparable_rental_2_building_classification, :string
      add :comparable_rental_2_dist_from_coop_in_miles, :float
      add :comparable_rental_2_est_gross_income, :integer
      add :comparable_rental_2_full_market_value, :integer
      add :comparable_rental_2_gross_income_per_sqft, :float
      add :comparable_rental_2_gross_sqft, :integer
      add :comparable_rental_2_market_value_per_sqft, :float
      add :comparable_rental_2_neighborhood, :string
      add :comparable_rental_2_total_units, :integer
      add :comparable_rental_2_year_built, :integer
      add :council_district, :integer
      add :latitude, :float
      add :longitude, :float
      add :manhattan_condominium_property_address, :string
      add :manhattan_condominium_property_boro_block_lot, :string
      add :manhattan_condominium_property_building_classification, :string
      add :manhattan_condominium_property_condo_section, :string
      add :manhattan_condominium_property_est_gross_income, :integer
      add :manhattan_condominium_property_full_market_value, :integer
      add :manhattan_condominium_property_gross_income_per_sqft, :float
      add :manhattan_condominium_property_gross_sqft, :integer
      add :manhattan_condominium_property_market_value_per_sqft, :float
      add :manhattan_condominium_property_neighborhood, :string
      add :manhattan_condominium_property_total_units, :integer
      add :manhattan_condominium_property_year_built, :integer
      add :nta, :string
      add :postcode, :integer

      timestamps()
    end
  end
end
