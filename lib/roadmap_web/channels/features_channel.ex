defmodule RoadmapWeb.FeaturesChannel do
  use RoadmapWeb, :channel

  def join("features:lobby", payload, socket) do
    if authorized?(payload) do
      features = Roadmap.Planning.list_features
      features = RoadmapWeb.FeatureView.render("index.json", %{features: features})

      {:ok, features, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (features:lobby).
  # def handle_in("shout", payload, socket) do
  #   broadcast socket, "shout", payload
  #   {:noreply, socket}
  # end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
