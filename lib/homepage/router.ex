defmodule Homepage.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :homepage
  get "/", Homepage.Controllers.Pages, :index, as: :page
end
