defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def reports_generator(file) do
    file
    |> Parser.parse_file()
    |> Enum.reduce(%{}, fn [id, _food, price], report ->
      IO.inspect(report)

      sum_items(report, id, price)
    end)
  end

  defp sum_items(report, id, price) do
    if Map.has_key?(report, id) do
      Map.put(report, id, report[id] + price)
    else
      Map.put(report, id, price)
    end
  end
end
