defmodule Aoc.Year2018.Day03.NoMatterHowYouSliceIt do
  @moduledoc """
  ## --- Day 3: No Matter How You Slice It ---

  The Elves managed to locate the chimney-squeeze prototype fabric for Santa's
  suit (thanks to someone who helpfully wrote its box IDs on the wall of the
  warehouse in the middle of the night). Unfortunately, anomalies are still
  affecting them - nobody can even agree on how to *cut* the fabric.

  The whole piece of fabric they're working on is a very large square - at least
  `1000` inches on each side.

  Each Elf has made a *claim* about which area of fabric would be ideal for
  Santa's suit. All claims have an ID and consist of a single rectangle with edges
  parallel to the edges of the fabric. Each claim's rectangle is defined as
  follows:

  - The number of inches between the left edge of the fabric and the left edge of the rectangle.
  - The number of inches between the top edge of the fabric and the top edge of the rectangle.
  - The width of the rectangle in inches.
  - The height of the rectangle in inches.
  A claim like `#123 @ 3,2: 5x4` means that claim ID `123` specifies a rectangle
  `3` inches from the left edge, `2` inches from the top edge, `5` inches wide,
  and `4` inches tall. Visually, it claims the square inches of fabric represented
  by `#` (and ignores the square inches of fabric represented by `.`) in the
  diagram below:

  `...........
  ...........
  ...#####...
  ...#####...
  ...#####...
  ...#####...
  ...........
  ...........
  ...........
  `The problem is that many of the claims *overlap*, causing two or more claims to
  cover part of the same areas. For example, consider the following claims:

  `#1 @ 1,3: 4x4
  #2 @ 3,1: 4x4
  #3 @ 5,5: 2x2
  `Visually, these claim the following areas:

  `........
  ...2222.
  ...2222.
  .11XX22.
  .11XX22.
  .111133.
  .111133.
  ........
  `The four square inches marked with `X` are claimed by *both `1` and `2`*. (Claim
  `3`, while adjacent to the others, does not overlap either of them.)

  If the Elves all proceed with their own plans, none of them will have enough
  fabric. *How many square inches of fabric are within two or more claims?*


  """

  @doc """

  """
  def build_fabric(size) do
    Enum.reduce(0..size, %{}, fn x, acc ->
      Enum.reduce(0..size, acc, fn y, acc ->
        Map.put(acc, {x, y}, 0)
      end)
    end)
  end

  def select_fabric_area(fabric, x, y, width, height) do
    tiles = compute_fabric_area_tiles(x, y, width, height)
    select_fabric_tiles(fabric, tiles)
  end

  def select_fabric_areas(fabric, areas) when length(areas) <= 0 do
    fabric
  end

  def select_fabric_areas(fabric, areas) do
    [%{x: x, y: y, width: width, height: height} | tail] = areas
    tiles = compute_fabric_area_tiles(x, y, width, height)
    select_fabric_tiles(fabric, tiles)
    |> select_fabric_areas(tail)
  end

  def select_fabric_tiles(fabric, tiles) do
    with true <- Enum.count(tiles) >= 1 do
      [head | tail] = tiles
      {x,y} = head
      fabric
      |> select_fabric_tile(x, y)
      |> select_fabric_tiles(tail)
    else
      _ -> fabric
    end
  end

  def compute_fabric_area_tiles(x, y, width, height) do
    x_end = width + x - 1
    y_end = height + y - 1
    Enum.reduce(x..x_end, [], fn x, acc ->
      Enum.reduce(y..y_end, acc, fn y, acc ->
        Enum.into(acc, [{x,y}])
      end)
    end)
  end

  def select_fabric_tile(fabric, x, y) do
    with {:ok, val} <- Map.fetch(fabric, {x,y}) do
      Map.put(fabric, {x,y}, val + 1)
    else
      _ ->
        :error
    end
  end

  def parse_input(input) do
    input
    |> String.split(["\n"])
    |> Enum.map(fn val ->
      split_string = String.split(val)
      coordinates = split_string
        |> Enum.at(2)
        |> String.replace(":", "")
        |> String.split([","])
      size = split_string
        |> Enum.at(3)
        |> String.split(["x"])
      %{
        x: Enum.at(coordinates, 0) |> String.to_integer,
        y: Enum.at(coordinates, 1) |> String.to_integer,
        width: Enum.at(size, 0) |> String.to_integer,
        height: Enum.at(size, 1) |> String.to_integer
      }
    end)
  end

  def part_1(input) do
    fabric = build_fabric(1000)
    areas = input
    |> parse_input

    select_fabric_areas(fabric, areas)
    |> Enum.filter(fn {_, val} ->
      val > 1
    end)
    |> Enum.count
  end

  @doc """

  """
  def part_2(input) do
    input
  end
end
