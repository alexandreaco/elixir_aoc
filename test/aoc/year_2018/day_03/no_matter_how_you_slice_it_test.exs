defmodule Aoc.Year2018.Day03.NoMatterHowYouSliceItTest do
  use Aoc.DayCase
  doctest Aoc.Year2018.Day03.NoMatterHowYouSliceIt, import: true

  alias Aoc.Year2018.Day03.NoMatterHowYouSliceIt

  describe "part_1/1" do
    test "examples" do

    end

    @tag day: 03, year: 2018
    test "input", %{input: input} do
      assert input |> NoMatterHowYouSliceIt.part_1() == input
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