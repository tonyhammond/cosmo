defmodule CosmoWeb.Plugs.Cool do
  @moduledoc """
  Plug to put up an :info/:error flash message based on testing parity
  of a random number.
  """

  import Plug.Conn
  require Integer

  def init(opts), do: opts

  def call(conn, _opts) do
    rand = Enum.random(0..99)
    test = Integer.is_even(rand)

    if test do
      Phoenix.Controller.put_flash(conn, :info,
        "Cool (rand: #{rand}, test, #{test})")
    else
      Phoenix.Controller.put_flash(conn, :error,
        "! Error: Not cool (rand: #{rand}, test, #{test})")
    end
  end
end
