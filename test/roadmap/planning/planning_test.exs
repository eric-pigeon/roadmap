defmodule Roadmap.PlanningTest do
  use Roadmap.DataCase

  alias Roadmap.Planning

  describe "features" do
    alias Roadmap.Planning.Feature

    @valid_attrs %{name: "some name", effort: 50, value: 50}
    @update_attrs %{name: "some updated name", effort: 50, value: -50}
    @invalid_attrs %{name: nil}

    def feature_fixture(attrs \\ %{}) do
      {:ok, feature} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Planning.create_feature()

      feature
    end

    test "list_features/0 returns all features" do
      feature = feature_fixture()
      assert Planning.list_features() == [feature]
    end

    test "get_feature!/1 returns the feature with given id" do
      feature = feature_fixture()
      assert Planning.get_feature!(feature.id) == feature
    end

    test "create_feature/1 with valid data creates a feature" do
      assert {:ok, %Feature{} = feature} = Planning.create_feature(@valid_attrs)
      assert feature.name == "some name"
    end

    test "create_feature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Planning.create_feature(@invalid_attrs)
    end

    test "update_feature/2 with valid data updates the feature" do
      feature = feature_fixture()
      assert {:ok, feature} = Planning.update_feature(feature, @update_attrs)
      assert %Feature{} = feature
      assert feature.name == "some updated name"
    end

    test "update_feature/2 with invalid data returns error changeset" do
      feature = feature_fixture()
      assert {:error, %Ecto.Changeset{}} = Planning.update_feature(feature, @invalid_attrs)
      assert feature == Planning.get_feature!(feature.id)
    end

    test "delete_feature/1 deletes the feature" do
      feature = feature_fixture()
      assert {:ok, %Feature{}} = Planning.delete_feature(feature)
      assert_raise Ecto.NoResultsError, fn -> Planning.get_feature!(feature.id) end
    end

    test "change_feature/1 returns a feature changeset" do
      feature = feature_fixture()
      assert %Ecto.Changeset{} = Planning.change_feature(feature)
    end
  end
end
