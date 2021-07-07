defmodule MyAppWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(MyAppWeb.Schema.Scalars)

  import_types(MyAppWeb.Schema.DrinkTypes)

  query do
    import_fields(:drink_queries)
  end

  mutation do
    import_fields(:drink_mutations)
  end

  # def context(ctx) do
  #   loader =
  #     Dataloader.new()
  #     |> Dataloader.add_source(MyAppWeb.Data, MyAppWeb.Data.data())

  #   Map.put(ctx, :loader, loader)
  # end

  # def plugins do
  #   [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  # end
end
