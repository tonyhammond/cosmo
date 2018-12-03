defmodule Cosmo.DatasetsTest do
  use Cosmo.DataCase

  alias Cosmo.Datasets

  describe "cities" do
    alias Cosmo.Datasets.City

    @valid_attrs %{lat: 120.5, lon: 120.5, nam: "some nam", pop: 42}
    @update_attrs %{lat: 456.7, lon: 456.7, nam: "some updated nam", pop: 43}
    @invalid_attrs %{lat: nil, lon: nil, nam: nil, pop: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Datasets.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Datasets.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Datasets.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = Datasets.create_city(@valid_attrs)
      assert city.lat == 120.5
      assert city.lon == 120.5
      assert city.nam == "some nam"
      assert city.pop == 42
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Datasets.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, %City{} = city} = Datasets.update_city(city, @update_attrs)
      assert city.lat == 456.7
      assert city.lon == 456.7
      assert city.nam == "some updated nam"
      assert city.pop == 43
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Datasets.update_city(city, @invalid_attrs)
      assert city == Datasets.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Datasets.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Datasets.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Datasets.change_city(city)
    end
  end

  describe "properties" do
    alias Cosmo.Datasets.Property

    @valid_attrs %{comparable_rental_1_est_gross_income: 42, comparable_rental_2_market_value_per_sqft: 120.5, latitude: 120.5, manhattan_condominium_property_full_market_value: 42, manhattan_condominium_property_market_value_per_sqft: 120.5, comparable_rental_1_market_value_per_sqft: 120.5, comparable_rental_1_building_classification: "some comparable_rental_1_building_classification", manhattan_condominium_property_total_units: 42, bbl: 42, longitude: 120.5, manhattan_condominium_property_building_classification: "some manhattan_condominium_property_building_classification", comparable_rental_1_neighborhood: "some comparable_rental_1_neighborhood", comparable_rental_1_gross_sqft: 42, manhattan_condominium_property_est_gross_income: 42, borough: 42, census_tract: 42, manhattan_condominium_property_year_built: 42, comparable_rental_1_year_built: 42, comparable_rental_2_year_built: 42, comparable_rental_1_boro_block_lot: "some comparable_rental_1_boro_block_lot", nta: "some nta", comparable_rental_2_gross_sqft: 42, comparable_rental_2_boro_block_lot: "some comparable_rental_2_boro_block_lot", manhattan_condominium_property_address: "some manhattan_condominium_property_address", manhattan_condominium_property_gross_sqft: 42, bin: 42, comparable_rental_1_total_units: 42, comparable_rental_2_address: "some comparable_rental_2_address", comparable_rental_2_total_units: 42, comparable_rental_1_full_market_value: 42, comparable_rental_1_dist_from_coop_in_miles: 120.5, comparable_rental_2_building_classification: "some comparable_rental_2_building_classification", manhattan_condominium_property_neighborhood: "some manhattan_condominium_property_neighborhood", comparable_rental_2_gross_income_per_sqft: 120.5, manhattan_condominium_property_condo_section: "some manhattan_condominium_property_condo_section", council_district: 42, comparable_rental_2_full_market_value: 42, comparable_rental_2_dist_from_coop_in_miles: 120.5, manhattan_condominium_property_boro_block_lot: "some manhattan_condominium_property_boro_block_lot", comparable_rental_2_est_gross_income: 42, manhattan_condominium_property_gross_income_per_sqft: 120.5, comparable_rental_2_neighborhood: "some comparable_rental_2_neighborhood", comparable_rental_1_gross_income_per_sqft: 120.5, comparable_rental_1_address: "some comparable_rental_1_address", community_board: 42, postcode: 42}
    @update_attrs %{comparable_rental_1_est_gross_income: 43, comparable_rental_2_market_value_per_sqft: 456.7, latitude: 456.7, manhattan_condominium_property_full_market_value: 43, manhattan_condominium_property_market_value_per_sqft: 456.7, comparable_rental_1_market_value_per_sqft: 456.7, comparable_rental_1_building_classification: "some updated comparable_rental_1_building_classification", manhattan_condominium_property_total_units: 43, bbl: 43, longitude: 456.7, manhattan_condominium_property_building_classification: "some updated manhattan_condominium_property_building_classification", comparable_rental_1_neighborhood: "some updated comparable_rental_1_neighborhood", comparable_rental_1_gross_sqft: 43, manhattan_condominium_property_est_gross_income: 43, borough: 43, census_tract: 43, manhattan_condominium_property_year_built: 43, comparable_rental_1_year_built: 43, comparable_rental_2_year_built: 43, comparable_rental_1_boro_block_lot: "some updated comparable_rental_1_boro_block_lot", nta: "some updated nta", comparable_rental_2_gross_sqft: 43, comparable_rental_2_boro_block_lot: "some updated comparable_rental_2_boro_block_lot", manhattan_condominium_property_address: "some updated manhattan_condominium_property_address", manhattan_condominium_property_gross_sqft: 43, bin: 43, comparable_rental_1_total_units: 43, comparable_rental_2_address: "some updated comparable_rental_2_address", comparable_rental_2_total_units: 43, comparable_rental_1_full_market_value: 43, comparable_rental_1_dist_from_coop_in_miles: 456.7, comparable_rental_2_building_classification: "some updated comparable_rental_2_building_classification", manhattan_condominium_property_neighborhood: "some updated manhattan_condominium_property_neighborhood", comparable_rental_2_gross_income_per_sqft: 456.7, manhattan_condominium_property_condo_section: "some updated manhattan_condominium_property_condo_section", council_district: 43, comparable_rental_2_full_market_value: 43, comparable_rental_2_dist_from_coop_in_miles: 456.7, manhattan_condominium_property_boro_block_lot: "some updated manhattan_condominium_property_boro_block_lot", comparable_rental_2_est_gross_income: 43, manhattan_condominium_property_gross_income_per_sqft: 456.7, comparable_rental_2_neighborhood: "some updated comparable_rental_2_neighborhood", comparable_rental_1_gross_income_per_sqft: 456.7, comparable_rental_1_address: "some updated comparable_rental_1_address", community_board: 43, postcode: 43}
    @invalid_attrs %{comparable_rental_1_est_gross_income: nil, comparable_rental_2_market_value_per_sqft: nil, latitude: nil, manhattan_condominium_property_full_market_value: nil, manhattan_condominium_property_market_value_per_sqft: nil, comparable_rental_1_market_value_per_sqft: nil, comparable_rental_1_building_classification: nil, manhattan_condominium_property_total_units: nil, bbl: nil, longitude: nil, manhattan_condominium_property_building_classification: nil, comparable_rental_1_neighborhood: nil, comparable_rental_1_gross_sqft: nil, manhattan_condominium_property_est_gross_income: nil, borough: nil, census_tract: nil, manhattan_condominium_property_year_built: nil, comparable_rental_1_year_built: nil, comparable_rental_2_year_built: nil, comparable_rental_1_boro_block_lot: nil, nta: nil, comparable_rental_2_gross_sqft: nil, comparable_rental_2_boro_block_lot: nil, manhattan_condominium_property_address: nil, manhattan_condominium_property_gross_sqft: nil, bin: nil, comparable_rental_1_total_units: nil, comparable_rental_2_address: nil, comparable_rental_2_total_units: nil, comparable_rental_1_full_market_value: nil, comparable_rental_1_dist_from_coop_in_miles: nil, comparable_rental_2_building_classification: nil, manhattan_condominium_property_neighborhood: nil, comparable_rental_2_gross_income_per_sqft: nil, manhattan_condominium_property_condo_section: nil, council_district: nil, comparable_rental_2_full_market_value: nil, comparable_rental_2_dist_from_coop_in_miles: nil, manhattan_condominium_property_boro_block_lot: nil, comparable_rental_2_est_gross_income: nil, manhattan_condominium_property_gross_income_per_sqft: nil, comparable_rental_2_neighborhood: nil, comparable_rental_1_gross_income_per_sqft: nil, comparable_rental_1_address: nil, community_board: nil, postcode: nil}

    def property_fixture(attrs \\ %{}) do
      {:ok, property} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Datasets.create_property()

      property
    end

    test "list_properties/0 returns all properties" do
      property = property_fixture()
      assert Datasets.list_properties() == [property]
    end

    test "get_property!/1 returns the property with given id" do
      property = property_fixture()
      assert Datasets.get_property!(property.id) == property
    end

    test "create_property/1 with valid data creates a property" do
      assert {:ok, %Property{} = property} = Datasets.create_property(@valid_attrs)
      assert property.postcode == 42
      assert property.community_board == 42
      assert property.comparable_rental_1_address == "some comparable_rental_1_address"
      assert property.comparable_rental_1_gross_income_per_sqft == 120.5
      assert property.comparable_rental_2_neighborhood == "some comparable_rental_2_neighborhood"
      assert property.manhattan_condominium_property_gross_income_per_sqft == 120.5
      assert property.comparable_rental_2_est_gross_income == 42
      assert property.manhattan_condominium_property_boro_block_lot == "some manhattan_condominium_property_boro_block_lot"
      assert property.comparable_rental_2_dist_from_coop_in_miles == 120.5
      assert property.comparable_rental_2_full_market_value == 42
      assert property.council_district == 42
      assert property.manhattan_condominium_property_condo_section == "some manhattan_condominium_property_condo_section"
      assert property.comparable_rental_2_gross_income_per_sqft == 120.5
      assert property.manhattan_condominium_property_neighborhood == "some manhattan_condominium_property_neighborhood"
      assert property.comparable_rental_2_building_classification == "some comparable_rental_2_building_classification"
      assert property.comparable_rental_1_dist_from_coop_in_miles == 120.5
      assert property.comparable_rental_1_full_market_value == 42
      assert property.comparable_rental_2_total_units == 42
      assert property.comparable_rental_2_address == "some comparable_rental_2_address"
      assert property.comparable_rental_1_total_units == 42
      assert property.bin == 42
      assert property.manhattan_condominium_property_gross_sqft == 42
      assert property.manhattan_condominium_property_address == "some manhattan_condominium_property_address"
      assert property.comparable_rental_2_boro_block_lot == "some comparable_rental_2_boro_block_lot"
      assert property.comparable_rental_2_gross_sqft == 42
      assert property.nta == "some nta"
      assert property.comparable_rental_1_boro_block_lot == "some comparable_rental_1_boro_block_lot"
      assert property.comparable_rental_2_year_built == 42
      assert property.comparable_rental_1_year_built == 42
      assert property.manhattan_condominium_property_year_built == 42
      assert property.census_tract == 42
      assert property.borough == 42
      assert property.manhattan_condominium_property_est_gross_income == 42
      assert property.comparable_rental_1_gross_sqft == 42
      assert property.comparable_rental_1_neighborhood == "some comparable_rental_1_neighborhood"
      assert property.manhattan_condominium_property_building_classification == "some manhattan_condominium_property_building_classification"
      assert property.longitude == 120.5
      assert property.bbl == 42
      assert property.manhattan_condominium_property_total_units == 42
      assert property.comparable_rental_1_building_classification == "some comparable_rental_1_building_classification"
      assert property.comparable_rental_1_market_value_per_sqft == 120.5
      assert property.manhattan_condominium_property_market_value_per_sqft == 120.5
      assert property.manhattan_condominium_property_full_market_value == 42
      assert property.latitude == 120.5
      assert property.comparable_rental_2_market_value_per_sqft == 120.5
      assert property.comparable_rental_1_est_gross_income == 42
    end

    test "create_property/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Datasets.create_property(@invalid_attrs)
    end

    test "update_property/2 with valid data updates the property" do
      property = property_fixture()
      assert {:ok, %Property{} = property} = Datasets.update_property(property, @update_attrs)
      assert property.postcode == 43
      assert property.community_board == 43
      assert property.comparable_rental_1_address == "some updated comparable_rental_1_address"
      assert property.comparable_rental_1_gross_income_per_sqft == 456.7
      assert property.comparable_rental_2_neighborhood == "some updated comparable_rental_2_neighborhood"
      assert property.manhattan_condominium_property_gross_income_per_sqft == 456.7
      assert property.comparable_rental_2_est_gross_income == 43
      assert property.manhattan_condominium_property_boro_block_lot == "some updated manhattan_condominium_property_boro_block_lot"
      assert property.comparable_rental_2_dist_from_coop_in_miles == 456.7
      assert property.comparable_rental_2_full_market_value == 43
      assert property.council_district == 43
      assert property.manhattan_condominium_property_condo_section == "some updated manhattan_condominium_property_condo_section"
      assert property.comparable_rental_2_gross_income_per_sqft == 456.7
      assert property.manhattan_condominium_property_neighborhood == "some updated manhattan_condominium_property_neighborhood"
      assert property.comparable_rental_2_building_classification == "some updated comparable_rental_2_building_classification"
      assert property.comparable_rental_1_dist_from_coop_in_miles == 456.7
      assert property.comparable_rental_1_full_market_value == 43
      assert property.comparable_rental_2_total_units == 43
      assert property.comparable_rental_2_address == "some updated comparable_rental_2_address"
      assert property.comparable_rental_1_total_units == 43
      assert property.bin == 43
      assert property.manhattan_condominium_property_gross_sqft == 43
      assert property.manhattan_condominium_property_address == "some updated manhattan_condominium_property_address"
      assert property.comparable_rental_2_boro_block_lot == "some updated comparable_rental_2_boro_block_lot"
      assert property.comparable_rental_2_gross_sqft == 43
      assert property.nta == "some updated nta"
      assert property.comparable_rental_1_boro_block_lot == "some updated comparable_rental_1_boro_block_lot"
      assert property.comparable_rental_2_year_built == 43
      assert property.comparable_rental_1_year_built == 43
      assert property.manhattan_condominium_property_year_built == 43
      assert property.census_tract == 43
      assert property.borough == 43
      assert property.manhattan_condominium_property_est_gross_income == 43
      assert property.comparable_rental_1_gross_sqft == 43
      assert property.comparable_rental_1_neighborhood == "some updated comparable_rental_1_neighborhood"
      assert property.manhattan_condominium_property_building_classification == "some updated manhattan_condominium_property_building_classification"
      assert property.longitude == 456.7
      assert property.bbl == 43
      assert property.manhattan_condominium_property_total_units == 43
      assert property.comparable_rental_1_building_classification == "some updated comparable_rental_1_building_classification"
      assert property.comparable_rental_1_market_value_per_sqft == 456.7
      assert property.manhattan_condominium_property_market_value_per_sqft == 456.7
      assert property.manhattan_condominium_property_full_market_value == 43
      assert property.latitude == 456.7
      assert property.comparable_rental_2_market_value_per_sqft == 456.7
      assert property.comparable_rental_1_est_gross_income == 43
    end

    test "update_property/2 with invalid data returns error changeset" do
      property = property_fixture()
      assert {:error, %Ecto.Changeset{}} = Datasets.update_property(property, @invalid_attrs)
      assert property == Datasets.get_property!(property.id)
    end

    test "delete_property/1 deletes the property" do
      property = property_fixture()
      assert {:ok, %Property{}} = Datasets.delete_property(property)
      assert_raise Ecto.NoResultsError, fn -> Datasets.get_property!(property.id) end
    end

    test "change_property/1 returns a property changeset" do
      property = property_fixture()
      assert %Ecto.Changeset{} = Datasets.change_property(property)
    end
  end
end
