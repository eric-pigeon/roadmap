defmodule RoadmapWeb.FeatureControllerTest do
  use RoadmapWeb.ConnCase

  alias Roadmap.Planning
  alias Roadmap.Planning.Feature

  @create_attrs %{name: "some name", effort: 50, value: 50}
  @update_attrs %{name: "some updated name", effort: 50, value: -50}
  @invalid_attrs %{name: nil}

  def fixture(:feature) do
    {:ok, feature} = Planning.create_feature(@create_attrs)
    feature
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all features", %{conn: conn} do
      conn = get conn, feature_path(conn, :index)
      assert json_response(conn, 200) == []
    end
  end

  describe "create feature" do
    test "renders feature when data is valid", %{conn: conn} do
      conn = post conn, feature_path(conn, :create), feature: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)

      conn = get conn, feature_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "name" => "some name",
        "effort" => 50,
        "value" => 50
      }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, feature_path(conn, :create), feature: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update feature" do
    setup [:create_feature]

    test "renders feature when data is valid", %{conn: conn, feature: %Feature{id: id} = feature} do
      conn = put conn, feature_path(conn, :update, feature), feature: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)

      conn = get conn, feature_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "name" => "some updated name",
        "effort" => 50,
        "value" => -50
      }
    end

    test "renders errors when data is invalid", %{conn: conn, feature: feature} do
      conn = put conn, feature_path(conn, :update, feature), feature: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete feature" do
    setup [:create_feature]

    test "deletes chosen feature", %{conn: conn, feature: feature} do
      conn = delete conn, feature_path(conn, :delete, feature)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, feature_path(conn, :show, feature)
      end
    end
  end

  defp create_feature(_) do
    feature = fixture(:feature)
    {:ok, feature: feature}
  end
end
