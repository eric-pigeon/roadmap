defmodule RoadmapWeb.PageController do
  use RoadmapWeb, :controller

  def index(conn, _params), do: render conn, "index.html"
end
