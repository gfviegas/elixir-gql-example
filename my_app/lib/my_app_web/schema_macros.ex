defmodule MyAppWeb.SchemaMacros do
  defmacro enum_values_desc(values) do
    expanded = Macro.expand(values, __CALLER__)

    values =
      Enum.map(expanded, fn {v, description} ->
        quote do
          value(unquote(v), description: unquote(description))
        end
      end)

    quote(do: (unquote_splicing(values)))
  end
end
