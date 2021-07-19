defmodule ReportsGeneratorTest do
  use ExUnit.Case
  doctest ReportsGenerator

  test "should sum each item per id" do
    file = "report_test.csv"

    expected_result = %{
      "foods" => %{
        "açaí" => 1,
        "churrasco" => 2,
        "esfirra" => 3,
        "hambúrguer" => 3,
        "pizza" => 2
      },
      "sum_items" => %{
        "1" => 68,
        "2" => 45,
        "3" => 73,
        "4" => 49,
        "5" => 18,
        "6" => 52,
        "7" => 24,
        "8" => 36
      }
    }

    assert ReportsGenerator.reports_generator(file) == expected_result
  end
end
