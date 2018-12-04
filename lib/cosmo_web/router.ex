defmodule CosmoWeb.Router do
  use CosmoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CosmoWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/cities/query", CityController, :query
    get "/cities/random", CityController, :random
    get "/properties/query", PropertyController, :query
    get "/properties/random", PropertyController, :random

    resources "/cities", CityController
    resources "/properties", PropertyController
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

   scope "/api" do
     pipe_through :api

     # forward "/graphiql", Absinthe.Plug.GraphiQL,
     #   schema: Cosmo.Graphql.City

     forward "/", Absinthe.Plug,
       schema: Cosmo.Graphql.City

   end

   forward "/graphiql", Absinthe.Plug.GraphiQL,
     schema: Cosmo.Graphql.City,
     # interface: :simple,
     context: %{pubsub: Cosmo.Endpoint}

end
