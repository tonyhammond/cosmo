defmodule CosmoWeb.Plugs.Cool do
  import Plug.Conn

  require Integer

  def init(options), do: options

  def call(conn, _opts) do
    rand = Enum.random(0..99)
    test = Integer.is_even(rand)

    if test do
      conn |> Phoenix.Controller.put_flash(:info, "Cool! (rand: #{rand}, test, #{test})")
    else
      conn
      |> Phoenix.Controller.put_flash(:error, "! Error: Not cool (rand: #{rand}, test, #{test})")
    end
  end
end
