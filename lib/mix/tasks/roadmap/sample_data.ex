defmodule Mix.Tasks.Roadmap.SampleData do
  use Mix.Task
  alias Roadmap.{Repo, Planning.Feature}

  def run(_args) do
    #Max.Task.run "app.start", []
    {:ok, _} = Application.ensure_all_started(:roadmap)

    IO.puts "Adding features"

    for _ <- 1..10 do
      %Feature{
        name: Faker.Commerce.En.product_name,
        value: Enum.random(-50..50),
        effort: Enum.random(-50..50)
      }
      |> Repo.insert!
    end
  end
end
