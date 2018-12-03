defmodule Cosmo.Query.Property do
  import Ecto.Query

  alias Cosmo.{Datasets.Property,Repo}

  def by_id(id) when is_integer(id) and id > 0 do
    q = from p in Property,
      where: p.id == ^id,
      order_by: p.id
    Repo.all(q)
  end

  def by_addr(nam) do
    # lc_nam = String.downcase(nam)
    q = from p in Property,
      # where: fragment("lower(?)", c.nam) == ^lc_nam,
      where: ilike(p.manhattan_condominium_property_address, ^"%#{nam}%"),
      order_by: p.id
    Repo.all(q)
  end

  def by_distr(nam) do
    # lc_nam = String.downcase(nam)
    q = from p in Property,
      # where: fragment("lower(?)", c.nam) == ^lc_nam,
      where: ilike(p.manhattan_condominium_property_neighborhood, ^"%#{nam}%"),
      order_by: p.id
    Repo.all(q)
  end

  # def by_year(year) when is_integer(year) and year > 0 do
    def by_year(year) do
    q = from p in Property,
      where: p.manhattan_condominium_property_year_built == ^year,
      order_by: p.id
    Repo.all(q)
  end

end
