# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds/seeds_cities.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cosmo.Repo.insert!(%Cosmo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Cosmo.Datasets.Import.City.read_cities_file
