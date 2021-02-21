defmodule Aoc.Year2018.Day02.InventoryManagementSystemTest do
  use Aoc.DayCase
  doctest Aoc.Year2018.Day02.InventoryManagementSystem, import: true

  alias Aoc.Year2018.Day02.InventoryManagementSystem

  describe "part_1/1" do
    test "examples" do
    end

    @tag day: 02, year: 2018
    test "input", %{input: input} do
      assert input |> InventoryManagementSystem.part_1() == 5904
    end
  end

  describe "part_2/1" do
    test "examples" do
    end

    @tag day: 02, year: 2018
    test "input", %{input: input} do
      assert input |> InventoryManagementSystem.part_2() == "jiwamotgsfrudclzbyzkhlrvp"
    end
  end
end
