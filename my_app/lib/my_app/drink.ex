defmodule MyApp.Drink do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "drinks" do
    field :abv, :integer
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(drink, attrs) do
    drink
    |> cast(attrs, [:name, :name, :abv, :type])
    |> validate_required([:name, :name, :abv, :type])
  end
end
