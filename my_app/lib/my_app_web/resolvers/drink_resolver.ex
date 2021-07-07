defmodule MyAppWeb.Resolvers.DrinkResolver do
  alias MyApp.Drink

  @drinks [
    %Drink{id: Ecto.UUID.generate(), name: "Catuaba", type: "WINE", abv: 40},
    %Drink{id: Ecto.UUID.generate(), name: "Canção", type: "WINE", abv: 6},
    %Drink{id: Ecto.UUID.generate(), name: "Heineken", type: "BEER", abv: 5},
    %Drink{id: Ecto.UUID.generate(), name: "Água Igarapé", type: "OTHER", abv: 0}
  ]

  def list(_parent, _args, _context) do
    {:ok, @drinks}
  end

  def get(_parent, %{id: id}, _context) do
    drink =
      @drinks
      |> Enum.find(fn %Drink{id: drink_id} -> drink_id == id end)

    {:ok, drink}
  end

  def create(_parent, %{drink: drink_parms}, _context) do
    drink = Map.merge(%Drink{}, drink_parms)
    {:ok, drink}
  end

  def update(_parent, %{drink: _drink_parms}, _context) do
    {:ok, :to_do}
  end
end
