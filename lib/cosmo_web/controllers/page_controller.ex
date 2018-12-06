defmodule CosmoWeb.PageController do
  @moduledoc """
  Controller actions for page_path routes.
  """

  use CosmoWeb, :controller

  plug CosmoWeb.Plugs.Controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
