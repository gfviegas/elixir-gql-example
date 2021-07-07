defmodule MyAppWeb.Schema.Scalars do
  use Absinthe.Schema.Notation
  alias MyAppWeb.Resolvers.UUIDResolver

  @desc "Representação em UTF-8 de um ID único universal (UUID)"
  scalar :uuid, name: "UUID" do
    parse(&UUIDResolver.parse/1)
    serialize(&UUIDResolver.serialize/1)
  end
end
