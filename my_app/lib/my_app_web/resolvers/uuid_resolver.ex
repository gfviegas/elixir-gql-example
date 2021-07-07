defmodule MyAppWeb.Resolvers.UUIDResolver do
  alias Absinthe.Blueprint.Input
  alias Ecto.UUID

  def parse(%Input.String{value: value}) do
    UUID.cast(value)
  end

  def parse(%Input.Null{}) do
    {:ok, nil}
  end

  def parse(_) do
    :error
  end

  def serialize(value), do: value
end
