defmodule CosmoWeb.Plugs.Controller do
  @moduledoc """
  Plug to add the controller module name to the :assigns map.
  """

  import Plug.Conn

  def init([]), do: []

  def call(conn, []) do
    conn
    |> assign(:controller_module, Phoenix.Controller.controller_module(conn))
  end
end
