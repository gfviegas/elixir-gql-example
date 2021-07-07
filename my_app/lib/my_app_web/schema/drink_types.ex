defmodule MyAppWeb.Schema.DrinkTypes do
  use Absinthe.Schema.Notation

  alias MyAppWeb.Resolvers.DrinkResolver

  #
  # Types
  #
  @desc "Tipos de Bebidas"
  enum(:drink_type, values: ["WINE", "BEER", "JUICE", "OTHER"])

  @desc "Representação de uma Bebida"
  object :drink do
    @desc "Identificador único do recurso"
    field :id, :uuid
    @desc "Nome da Bebida"
    field :name, non_null(:string)
    @desc "Tipo da Bebida"
    field :type, non_null(:drink_type)
    @desc "Teor alcóolico em % (Alcohool By Volume)"
    field :abv, non_null(:integer)
  end

  @desc "Paramêtros esperados na criação de uma nova Bebida"
  input_object :drink_create_params do
    @desc "Nome da Bebida"
    field :name, non_null(:string)
    @desc "Tipo da Bebida"
    field :type, non_null(:drink_type)
    @desc "Teor alcóolico em % (Alcohool By Volume)"
    field :abv, non_null(:integer)
  end

  @desc "Paramêtros esperados na atualização de uma Bebida"
  input_object :drink_update_params do
    @desc "Nome da Bebida"
    field :name, :string
    @desc "Tipo da Bebida"
    field :type, :drink_type
    @desc "Teor alcóolico em % (Alcohool By Volume)"
    field :abv, :integer
  end

  #
  # Queries
  #
  object :drink_queries do
    @desc "Busca uma lista de Bebidas"
    field :drinks, list_of(non_null(:drink)) do
      resolve(&DrinkResolver.list/3)
    end

    @desc "Busca um Bebida pelo seu ID"
    field :drink, :drink do
      @desc "ID da Bebida"
      arg(:id, non_null(:uuid))

      resolve(&DrinkResolver.get/3)
    end
  end

  #
  # Mutations
  #
  object :drink_mutations do
    @desc "Cria um Bebida"
    field :create_drink, non_null(:drink) do
      @desc "Dados de entrada da Bebida a ser criado"
      arg(:drink, non_null(:drink_create_params))

      resolve(&DrinkResolver.create/3)
    end

    @desc "Atualiza um Bebida"
    field :update_drink, non_null(:drink) do
      @desc "Dados de entrada da Bebida a ser criado"
      arg(:drink, non_null(:drink_update_params))

      resolve(&DrinkResolver.update/3)
    end
  end
end
