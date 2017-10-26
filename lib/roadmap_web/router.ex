defmodule RoadmapWeb.Router do
  use RoadmapWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RoadmapWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", RoadmapWeb do
    pipe_through :api
  end
end
