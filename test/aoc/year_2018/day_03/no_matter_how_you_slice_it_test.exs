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
      assert fabric |> Map.fetch({1,1}) == {:ok, []}
      assert fabric |> Map.fetch({4,4}) == :error
    end

    test "select_fabric_tile/4 returns an error if the tile does not exist" do
      res = NoMatterHowYouSliceIt.build_fabric(3)
      |> NoMatterHowYouSliceIt.select_fabric_tile(4, 4, "2")
      assert res === :error
    end

    test "select_fabric_tile/4 returns a new fabric with the updated title if the tile exists" do
      res = NoMatterHowYouSliceIt.build_fabric(3)
      |> NoMatterHowYouSliceIt.select_fabric_tile(2, 2, "2")
      assert res |> Map.fetch({2,2}) === {:ok, ["2"]}
    end

    test "compute_fabric_area_tiles/4 returns an array of coordinate pairs for a given zero point, width, and height" do
      res = NoMatterHowYouSliceIt.compute_fabric_area_tiles(2, 3, 3, 4)
      assert res == [{4, 6}, {4, 5}, {4, 4}, {4, 3}, {3, 6}, {3, 5}, {3, 4}, {3, 3}, {2, 6}, {2, 5}, {2, 4}, {2, 3}]
    end

    test "select_fabric_tiles/2 returns a fabric with tiles selected" do
      fabric = NoMatterHowYouSliceIt.build_fabric(5)
      tiles = NoMatterHowYouSliceIt.compute_fabric_area_tiles(1, 1, 2, 3)
      selected_fabric = NoMatterHowYouSliceIt.select_fabric_tiles(fabric, tiles, "2")
      assert selected_fabric ==  %{{3, 3} => [], {4, 0} => [], {2, 1} => ["2"], {2, 2} => ["2"], {0, 0} => [], {2, 0} => [], {0, 2} => [], {4, 5} => [], {5, 1} => [], {3, 1} => [], {1, 3} => ["2"], {5, 4} => [], {3, 5} => [], {0, 3} => [], {1, 0} => [], {3, 4} => [], {1, 5} => [], {3, 0} => [], {4, 1} => [], {5, 2} => [], {2, 4} => [], {1, 2} => ["2"], {1, 4} => [], {4, 2} => [], {2, 3} => ["2"], {5, 3} => [], {5, 5} => [], {1, 1} => ["2"], {3, 2} => [], {4, 3} => [], {2, 5} => [], {0, 5} => [], {0, 4} => [], {4, 4} => [], {5, 0} => [], {0, 1} => []}
    end
  end

  describe "part_2/1" do
    test "examples" do

    end

    @tag day: 03, year: 2018
    test "input", %{input: input} do
      assert input |> NoMatterHowYouSliceIt.part_2() == "650"
    end
  end
end
