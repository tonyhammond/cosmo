defmodule Cosmo.Datasets.Query.City do
  import Ecto.Query

  alias Cosmo.{Datasets.Schemas.City, Repo}

  def by_id(id) when is_integer(id) and id > 0 do
    q =
      from c in City,
        where: c.id == ^id,
        order_by: c.id,
        limit: 1

    Repo.one(q)
  end

  def by_nam(nam) do
    q =
      from c in City,
        where: ilike(c.nam, ^"%#{nam}%"),
        order_by: c.id

    Repo.all(q)
  end
end
