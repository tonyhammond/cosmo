defmodule Cosmo.Query.City do
  import Ecto.Query

  alias Cosmo.{Datasets.City,Repo}

  def by_id(id) when is_integer(id) and id > 0 do
    q = from c in City,
      where: c.id == ^id,
      order_by: c.id
    Repo.all(q)
  end

  def by_nam(nam) do
    # lc_nam = String.downcase(nam)
    q = from c in City,
      # where: fragment("lower(?)", c.nam) == ^lc_nam,
      where: ilike(c.nam, ^"%#{nam}%"),
      order_by: c.id
    Repo.all(q)
  end

end
