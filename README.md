# Cosmo – A demo project to explore Elixir Phoenix / Absinthe

![cosmo_homepage_banner.jpg](./priv/static/images/cosmo_homepage_banner.jpg)

This project is using two separate datasets:

* [2014_us_cities.csv](https://github.com/plotly/datasets/blob/master/2014_us_cities.csv)	– (From CSV datasets used in Plotly API examples.)
* [ikqj-pyhc/rows.csv](https://data.cityofnewyork.us/api/views/ikqj-pyhc/rows.csv) – The Department of Finance (DOF) is required by NY State law to value condominiums or cooperatives as if they were residential rental apartment buildings. DOF uses income information from rental properties similar in physical features and location to the condominiums or cooperatives. DOF applies this income data to the condominium or cooperative and determine its value in the same way DOF values rental apartment buildings. Update Schedule: Annually.

These are exposed through a number of different interfaces:

* Web-based CRUD endpoints (REST)
* Web-based query endpoint (querystring)
* GraphQL interface

## Query: List cities
![graphiql_list_cities.png](./priv/static/images/graphiql_list_cities.png)

## Query: Get city
![graphiql_get_city.png](./priv/static/images/graphiql_get_city.png)

## Mutation: Create city
![graphiql_create_city.png](./priv/static/images/graphiql_create_city.png)
