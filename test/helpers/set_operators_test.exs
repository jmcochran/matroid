defmodule Matroid.SetOperatorsTest do
  use ExUnit.Case
  alias Matroid.SetOperators

  @ground_set MapSet.new([1,2,3])
  @empty_set MapSet.new([])
  @power_set MapSet.new([
    MapSet.new([1,2,3]),
    MapSet.new([1,2]),
    MapSet.new([1,3]),
    MapSet.new([2,3]),
    MapSet.new([1]),
    MapSet.new([2]),
    MapSet.new([3]),
    MapSet.new([])
  ])
  @trivial MapSet.new([MapSet.new([])])
  @pairs_list [
    {1, 1}, {1, 2}, {1, 3},
    {2, 1}, {2, 2}, {2, 3},
    {3, 1}, {3, 2}, {3, 3}
  ]
  @inclusive_pairs_list [
    {MapSet.new([]), MapSet.new([])},
    {MapSet.new([]), MapSet.new([1])},
    {MapSet.new([]), MapSet.new([2])},
    {MapSet.new([]), MapSet.new([3])},
    {MapSet.new([]), MapSet.new([1, 2])},
    {MapSet.new([]), MapSet.new([1, 3])},
    {MapSet.new([]), MapSet.new([2, 3])},
    {MapSet.new([]), MapSet.new([1, 2, 3])},
    {MapSet.new([1]), MapSet.new([1])},
    {MapSet.new([1]), MapSet.new([1, 2])},
    {MapSet.new([1]), MapSet.new([1, 3])},
    {MapSet.new([1]), MapSet.new([1, 2, 3])},
    {MapSet.new([2]), MapSet.new([2])},
    {MapSet.new([2]), MapSet.new([1, 2])},
    {MapSet.new([2]), MapSet.new([2, 3])},
    {MapSet.new([2]), MapSet.new([1, 2, 3])},
    {MapSet.new([3]), MapSet.new([3])},
    {MapSet.new([3]), MapSet.new([1, 3])},
    {MapSet.new([3]), MapSet.new([2, 3])},
    {MapSet.new([3]), MapSet.new([1, 2, 3])},
    {MapSet.new([1, 2]), MapSet.new([1, 2])},
    {MapSet.new([1, 2]), MapSet.new([1, 2, 3])},
    {MapSet.new([1, 3]), MapSet.new([1, 3])},
    {MapSet.new([1, 3]), MapSet.new([1, 2, 3])},
    {MapSet.new([2, 3]), MapSet.new([2, 3])},
    {MapSet.new([2, 3]), MapSet.new([1, 2, 3])},
    {MapSet.new([1, 2, 3]), MapSet.new([1, 2, 3])}
  ]
  @trivial_inclusive_pairs_list [
    {MapSet.new([]), MapSet.new([])}
  ]
  @strict_inclusive_pairs_list [
    {MapSet.new([]), MapSet.new([1])},
    {MapSet.new([]), MapSet.new([2])},
    {MapSet.new([]), MapSet.new([3])},
    {MapSet.new([]), MapSet.new([1, 2])},
    {MapSet.new([]), MapSet.new([1, 3])},
    {MapSet.new([]), MapSet.new([2, 3])},
    {MapSet.new([]), MapSet.new([1, 2, 3])},
    {MapSet.new([1]), MapSet.new([1, 2])},
    {MapSet.new([1]), MapSet.new([1, 3])},
    {MapSet.new([1]), MapSet.new([1, 2, 3])},
    {MapSet.new([2]), MapSet.new([1, 2])},
    {MapSet.new([2]), MapSet.new([2, 3])},
    {MapSet.new([2]), MapSet.new([1, 2, 3])},
    {MapSet.new([3]), MapSet.new([1, 3])},
    {MapSet.new([3]), MapSet.new([2, 3])},
    {MapSet.new([3]), MapSet.new([1, 2, 3])},
    {MapSet.new([1, 2]), MapSet.new([1, 2, 3])},
    {MapSet.new([1, 3]), MapSet.new([1, 2, 3])},
    {MapSet.new([2, 3]), MapSet.new([1, 2, 3])}
  ]

  test("power_set") do
    assert SetOperators.power_set(@ground_set) == @power_set
    assert SetOperators.power_set(@empty_set) == @trivial
  end

  test("pairs") do
    assert Enum.sort(SetOperators.pairs(@ground_set)) == Enum.sort(@pairs_list)
    assert SetOperators.pairs(@empty_set) == []
  end

  test("inclusive_pairs") do
    assert Enum.sort(SetOperators.inclusive_pairs(@power_set)) == Enum.sort(@inclusive_pairs_list)
    assert Enum.sort(SetOperators.inclusive_pairs(@trivial)) == @trivial_inclusive_pairs_list
  end

  test("strict_inclusive_pairs") do
    assert Enum.sort(SetOperators.strict_inclusive_pairs(@power_set)) == Enum.sort(@strict_inclusive_pairs_list)
    assert Enum.sort(SetOperators.strict_inclusive_pairs(@trivial)) == []
  end

  test("uppercone") do
    assert SetOperators.uppercone(@ground_set, @empty_set) == @empty_set
    assert SetOperators.uppercone(@ground_set, @trivial) == @power_set
  end
end
