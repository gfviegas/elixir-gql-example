defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :graphql do
    # plug MyAppWeb.Context
  end

  scope "/api" do
    pipe_through([:graphql])

    forward("/", Absinthe.Plug, schema: MyAppWeb.Schema)
  end

  if Mix.env() == :dev do
    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: MyAppWeb.Schema, interface: :playground)
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: MyAppWeb.Telemetry)
    end
  end
end
