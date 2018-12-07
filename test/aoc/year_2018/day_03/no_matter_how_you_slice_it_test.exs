defmodule Aoc.Year2018.Day03.NoMatterHowYouSliceItTest do
  use Aoc.DayCase
  doctest Aoc.Year2018.Day03.NoMatterHowYouSliceIt, import: true

  alias Aoc.Year2018.Day03.NoMatterHowYouSliceIt

  describe "part_1/1" do
    test "examples" do

    end

    @tag day: 03, year: 2018
    test "input", %{input: input} do
      assert input |> NoMatterHowYouSliceIt.part_1() == 111935
    end

    test "build_fabric/1 creates a map representing a square grid with {x,y} coordinates as keys" do
      fabric = NoMatterHowYouSliceIt.build_fabric(3)
      assert fabric |> Map.keys() |> Enum.count() == 16
      assert fabric |> Map.fetch({1,1}) == {:ok, 0}
      assert fabric |> Map.fetch({4,4}) == :error
    end

    test "select_fabric_tile/3 returns an error if the tile does not exist" do
      res = NoMatterHowYouSliceIt.build_fabric(3)
      |> NoMatterHowYouSliceIt.select_fabric_tile(4,4)
      assert res === :error
    end

    test "select_fabric_tile/3 returns a new fabric with the updated title if the tile exists" do
      res = NoMatterHowYouSliceIt.build_fabric(3)
      |> NoMatterHowYouSliceIt.select_fabric_tile(2,2)
      assert res |> Map.fetch({2,2}) === {:ok, 1}
    end

    test "compute_fabric_area_tiles/4 returns an array of coordinate pairs for a given zero point, width, and height" do
      res = NoMatterHowYouSliceIt.compute_fabric_area_tiles(2, 3, 3, 4)
      assert res == [{4, 6}, {4, 5}, {4, 4}, {4, 3}, {3, 6}, {3, 5}, {3, 4}, {3, 3}, {2, 6}, {2, 5}, {2, 4}, {2, 3}]
    end

    test "select_fabric_tiles/2 returns a fabric with tiles selected" do
      fabric = NoMatterHowYouSliceIt.build_fabric(5)
      tiles = NoMatterHowYouSliceIt.compute_fabric_area_tiles(1, 1, 2, 3)
      selected_fabric = NoMatterHowYouSliceIt.select_fabric_tiles(fabric, tiles)
      assert selected_fabric == %{{3, 3} => 0, {2, 1} => 1, {2, 2} => 1, {4, 5} => 0, {5, 1} => 0, {3, 1} => 0, {1, 3} => 1, {5, 4} => 0, {3, 5} => 0, {3, 4} => 0, {1, 5} => 0, {4, 1} => 0, {5, 2} => 0, {2, 4} => 0, {1, 2} => 1, {1, 4} => 0, {4, 2} => 0, {2, 3} => 1, {5, 3} => 0, {5, 5} => 0, {1, 1} => 1, {3, 2} => 0, {4, 3} => 0, {2, 5} => 0, {4, 4} => 0, {4, 0} => 0, {0, 0} => 0, {2, 0} => 0, {0, 2} => 0, {0, 3} => 0, {1, 0} => 0, {3, 0} => 0, {0, 5} => 0, {0, 4} => 0, {5, 0} => 0, {0, 1} => 0}
    end
  end

  describe "part_2/1" do
    test "examples" do

    end

    @tag day: 03, year: 2018
    test "input", %{input: input} do
      assert input |> NoMatterHowYouSliceIt.part_2() == input
    end
  end
end
