defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def reports_generator(file) do
    file
    |> Parser.parse_file()
    |> Enum.reduce(%{"foods" => %{}, "sum_items" => %{}}, fn [id, food, price], report ->
      food_frequency = food_frequency(report["foods"], food)
      sum_items = sum_items_per_id(report["sum_items"], id, price)
      %{report | "foods" => food_frequency, "sum_items" => sum_items}
    end)
  end

  defp sum_items_per_id(sum_items, id, price) do
    if Map.has_key?(sum_items, id) do
      Map.put(sum_items, id, sum_items[id] + price)
    else
      Map.put(sum_items, id, price)
    end
  end

  defp food_frequency(foods, food) do
    if Map.has_key?(foods, food) do
      Map.put(foods, food, foods[food] + 1)
    else
      Map.put(foods, food, 1)
    end
  end
end
