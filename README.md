# Cosmo – Exploring ElixirLang's Phoenix / Ecto / Absinthe

![cosmo_homepage_banner.jpg](./priv/static/images/cosmo_homepage_banner.jpg)

This project is using two separate datasets:

* [2014_us_cities.csv](https://github.com/plotly/datasets/blob/master/2014_us_cities.csv)	– (From CSV datasets used in Plotly API examples.)
* [ikqj-pyhc/rows.csv](https://data.cityofnewyork.us/api/views/ikqj-pyhc/rows.csv) – The Department of Finance (DOF) is required by NY State law to value condominiums or cooperatives as if they were residential rental apartment buildings. DOF uses income information from rental properties similar in physical features and location to the condominiums or cooperatives. DOF applies this income data to the condominium or cooperative and determine its value in the same way DOF values rental apartment buildings. Update Schedule: Annually.

These are exposed through a number of different interfaces:

* Web-based CRUD endpoints (REST)
* Web-based query endpoint (querystring)
* GraphQL endpoint

## Query: Type City
![__tyoe_city.graphql.png](./priv/static/images/graphiql/__type_city.graphql.png)

## Query: List Cities
![list_cities.graphql.png](./priv/static/images/graphiql/list_cities.graphql.png)

## Query: Var List Cities
![var_list_cities.graphql.png](./priv/static/images/graphiql/var_list_cities.graphql.png)

## Query: Get City
![get_city.graphql.png](./priv/static/images/graphiql/get_city.graphql.png)

## Mutation: Create City
![create_city.graphql.png](./priv/static/images/graphiql/create_city.graphql.png)

## Query: Type Property
![__tyoe_property.graphql.png](./priv/static/images/graphiql/__type_property.graphql.png)

## Query: List Properties
![list_properties.graphql.png](./priv/static/images/graphiql/list_properties.graphql.png)

## Query: Var List Properties
![var_list_properties.graphql.png](./priv/static/images/graphiql/var_list_properties.graphql.png)

## Query: Get Property
![get_property.graphql.png](./priv/static/images/graphiql/get_property.graphql.png)
