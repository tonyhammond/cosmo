defmodule CosmoWeb.PropertyControllerTest do
  use CosmoWeb.ConnCase

  alias Cosmo.Datasets

  @create_attrs %{comparable_rental_1_est_gross_income: 42, comparable_rental_2_market_value_per_sqft: 120.5, latitude: 120.5, manhattan_condominium_property_full_market_value: 42, manhattan_condominium_property_market_value_per_sqft: 120.5, comparable_rental_1_market_value_per_sqft: 120.5, comparable_rental_1_building_classification: "some comparable_rental_1_building_classification", manhattan_condominium_property_total_units: 42, bbl: 42, longitude: 120.5, manhattan_condominium_property_building_classification: "some manhattan_condominium_property_building_classification", comparable_rental_1_neighborhood: "some comparable_rental_1_neighborhood", comparable_rental_1_gross_sqft: 42, manhattan_condominium_property_est_gross_income: 42, borough: 42, census_tract: 42, manhattan_condominium_property_year_built: 42, comparable_rental_1_year_built: 42, comparable_rental_2_year_built: 42, comparable_rental_1_boro_block_lot: "some comparable_rental_1_boro_block_lot", nta: "some nta", comparable_rental_2_gross_sqft: 42, comparable_rental_2_boro_block_lot: "some comparable_rental_2_boro_block_lot", manhattan_condominium_property_address: "some manhattan_condominium_property_address", manhattan_condominium_property_gross_sqft: 42, bin: 42, comparable_rental_1_total_units: 42, comparable_rental_2_address: "some comparable_rental_2_address", comparable_rental_2_total_units: 42, comparable_rental_1_full_market_value: 42, comparable_rental_1_dist_from_coop_in_miles: 120.5, comparable_rental_2_building_classification: "some comparable_rental_2_building_classification", manhattan_condominium_property_neighborhood: "some manhattan_condominium_property_neighborhood", comparable_rental_2_gross_income_per_sqft: 120.5, manhattan_condominium_property_condo_section: "some manhattan_condominium_property_condo_section", council_district: 42, comparable_rental_2_full_market_value: 42, comparable_rental_2_dist_from_coop_in_miles: 120.5, manhattan_condominium_property_boro_block_lot: "some manhattan_condominium_property_boro_block_lot", comparable_rental_2_est_gross_income: 42, manhattan_condominium_property_gross_income_per_sqft: 120.5, comparable_rental_2_neighborhood: "some comparable_rental_2_neighborhood", comparable_rental_1_gross_income_per_sqft: 120.5, comparable_rental_1_address: "some comparable_rental_1_address", community_board: 42, postcode: 42}
  @update_attrs %{comparable_rental_1_est_gross_income: 43, comparable_rental_2_market_value_per_sqft: 456.7, latitude: 456.7, manhattan_condominium_property_full_market_value: 43, manhattan_condominium_property_market_value_per_sqft: 456.7, comparable_rental_1_market_value_per_sqft: 456.7, comparable_rental_1_building_classification: "some updated comparable_rental_1_building_classification", manhattan_condominium_property_total_units: 43, bbl: 43, longitude: 456.7, manhattan_condominium_property_building_classification: "some updated manhattan_condominium_property_building_classification", comparable_rental_1_neighborhood: "some updated comparable_rental_1_neighborhood", comparable_rental_1_gross_sqft: 43, manhattan_condominium_property_est_gross_income: 43, borough: 43, census_tract: 43, manhattan_condominium_property_year_built: 43, comparable_rental_1_year_built: 43, comparable_rental_2_year_built: 43, comparable_rental_1_boro_block_lot: "some updated comparable_rental_1_boro_block_lot", nta: "some updated nta", comparable_rental_2_gross_sqft: 43, comparable_rental_2_boro_block_lot: "some updated comparable_rental_2_boro_block_lot", manhattan_condominium_property_address: "some updated manhattan_condominium_property_address", manhattan_condominium_property_gross_sqft: 43, bin: 43, comparable_rental_1_total_units: 43, comparable_rental_2_address: "some updated comparable_rental_2_address", comparable_rental_2_total_units: 43, comparable_rental_1_full_market_value: 43, comparable_rental_1_dist_from_coop_in_miles: 456.7, comparable_rental_2_building_classification: "some updated comparable_rental_2_building_classification", manhattan_condominium_property_neighborhood: "some updated manhattan_condominium_property_neighborhood", comparable_rental_2_gross_income_per_sqft: 456.7, manhattan_condominium_property_condo_section: "some updated manhattan_condominium_property_condo_section", council_district: 43, comparable_rental_2_full_market_value: 43, comparable_rental_2_dist_from_coop_in_miles: 456.7, manhattan_condominium_property_boro_block_lot: "some updated manhattan_condominium_property_boro_block_lot", comparable_rental_2_est_gross_income: 43, manhattan_condominium_property_gross_income_per_sqft: 456.7, comparable_rental_2_neighborhood: "some updated comparable_rental_2_neighborhood", comparable_rental_1_gross_income_per_sqft: 456.7, comparable_rental_1_address: "some updated comparable_rental_1_address", community_board: 43, postcode: 43}
  @invalid_attrs %{comparable_rental_1_est_gross_income: nil, comparable_rental_2_market_value_per_sqft: nil, latitude: nil, manhattan_condominium_property_full_market_value: nil, manhattan_condominium_property_market_value_per_sqft: nil, comparable_rental_1_market_value_per_sqft: nil, comparable_rental_1_building_classification: nil, manhattan_condominium_property_total_units: nil, bbl: nil, longitude: nil, manhattan_condominium_property_building_classification: nil, comparable_rental_1_neighborhood: nil, comparable_rental_1_gross_sqft: nil, manhattan_condominium_property_est_gross_income: nil, borough: nil, census_tract: nil, manhattan_condominium_property_year_built: nil, comparable_rental_1_year_built: nil, comparable_rental_2_year_built: nil, comparable_rental_1_boro_block_lot: nil, nta: nil, comparable_rental_2_gross_sqft: nil, comparable_rental_2_boro_block_lot: nil, manhattan_condominium_property_address: nil, manhattan_condominium_property_gross_sqft: nil, bin: nil, comparable_rental_1_total_units: nil, comparable_rental_2_address: nil, comparable_rental_2_total_units: nil, comparable_rental_1_full_market_value: nil, comparable_rental_1_dist_from_coop_in_miles: nil, comparable_rental_2_building_classification: nil, manhattan_condominium_property_neighborhood: nil, comparable_rental_2_gross_income_per_sqft: nil, manhattan_condominium_property_condo_section: nil, council_district: nil, comparable_rental_2_full_market_value: nil, comparable_rental_2_dist_from_coop_in_miles: nil, manhattan_condominium_property_boro_block_lot: nil, comparable_rental_2_est_gross_income: nil, manhattan_condominium_property_gross_income_per_sqft: nil, comparable_rental_2_neighborhood: nil, comparable_rental_1_gross_income_per_sqft: nil, comparable_rental_1_address: nil, community_board: nil, postcode: nil}

  def fixture(:property) do
    {:ok, property} = Datasets.create_property(@create_attrs)
    property
  end

  describe "index" do
    test "lists all properties", %{conn: conn} do
      conn = get(conn, Routes.property_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Properties"
    end
  end

  describe "new property" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.property_path(conn, :new))
      assert html_response(conn, 200) =~ "New Property"
    end
  end

  describe "create property" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.property_path(conn, :create), property: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.property_path(conn, :show, id)

      conn = get(conn, Routes.property_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Property"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.property_path(conn, :create), property: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Property"
    end
  end

  describe "edit property" do
    setup [:create_property]

    test "renders form for editing chosen property", %{conn: conn, property: property} do
      conn = get(conn, Routes.property_path(conn, :edit, property))
      assert html_response(conn, 200) =~ "Edit Property"
    end
  end

  describe "update property" do
    setup [:create_property]

    test "redirects when data is valid", %{conn: conn, property: property} do
      conn = put(conn, Routes.property_path(conn, :update, property), property: @update_attrs)
      assert redirected_to(conn) == Routes.property_path(conn, :show, property)

      conn = get(conn, Routes.property_path(conn, :show, property))
      assert html_response(conn, 200) =~ "some updated comparable_rental_1_building_classification"
    end

    test "renders errors when data is invalid", %{conn: conn, property: property} do
      conn = put(conn, Routes.property_path(conn, :update, property), property: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Property"
    end
  end

  describe "delete property" do
    setup [:create_property]

    test "deletes chosen property", %{conn: conn, property: property} do
      conn = delete(conn, Routes.property_path(conn, :delete, property))
      assert redirected_to(conn) == Routes.property_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.property_path(conn, :show, property))
      end
    end
  end

  defp create_property(_) do
    property = fixture(:property)
    {:ok, property: property}
  end
end
