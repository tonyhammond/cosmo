defmodule CosmoWeb.Plugs.Controller do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> assign(:controller_module, Phoenix.Controller.controller_module(conn))
  end
end
