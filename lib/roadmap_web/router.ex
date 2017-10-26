defmodule RoadmapWeb.Router do
  use RoadmapWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RoadmapWeb do
    pipe_through :api
  end
end
