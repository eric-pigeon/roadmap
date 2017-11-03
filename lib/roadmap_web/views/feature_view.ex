defmodule RoadmapWeb.FeatureView do
  use RoadmapWeb, :view
  alias RoadmapWeb.FeatureView

  def render("index.json", %{features: features}) do
    render_many(features, FeatureView, "feature.json")
  end

  def render("show.json", %{feature: feature}) do
    render_one(feature, FeatureView, "feature.json")
  end

  def render("feature.json", %{feature: feature}) do
    %{id: feature.id,
      name: feature.name,
      effort: feature.effort,
      value: feature.value}
  end
end
