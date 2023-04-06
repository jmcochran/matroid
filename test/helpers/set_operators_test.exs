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
  @trivial_pairs_list [
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

  describe "power_set/1" do
    test "returns the power set of a set" do
      assert SetOperators.power_set(@ground_set) == @power_set
    end

    test "returns the trivial set for the empty set" do
      assert SetOperators.power_set(@empty_set) == @trivial
    end
  end

  describe "pairs/1" do
    test "returns the pairs of a set" do
      assert Enum.sort(SetOperators.pairs(@ground_set)) == Enum.sort(@pairs_list)
    end

    test "returns the empty list for the empty set" do
      assert SetOperators.pairs(@empty_set) == []
    end

    test "returns a list of one pair of empty sets for the trivial set" do
      assert Enum.sort(SetOperators.pairs(@trivial)) == Enum.sort(@trivial_pairs_list)
    end
  end

  describe "inclusive_pairs/1" do
    test "returns the inclusive pairs of a set" do
      assert Enum.sort(SetOperators.inclusive_pairs(@power_set)) == Enum.sort(@inclusive_pairs_list)
    end

    test "returns the empty list for the empty set" do
      assert SetOperators.inclusive_pairs(@empty_set) == []
    end

    test "returns the list of trivial pairs for the empty set" do
      assert Enum.sort(SetOperators.inclusive_pairs(@trivial)) == Enum.sort(@trivial_pairs_list)
    end
  end

  describe "strict_inclusive_pairs/1" do
    test "returns the strict inclusive pairs of a set" do
      assert Enum.sort(SetOperators.strict_inclusive_pairs(@power_set)) == Enum.sort(@strict_inclusive_pairs_list)
    end

    test "returns the empty list for the empty set" do
      assert SetOperators.strict_inclusive_pairs(@empty_set) == []
    end

    test "returns the empty list for the trivial set" do
      assert SetOperators.strict_inclusive_pairs(@trivial) == []
    end
  end

  describe "uppercone/2" do
    test "returns the upper cone of a set" do
      assert SetOperators.uppercone(@ground_set, @power_set) == @power_set
    end

    test "returns the empty set for the empty set" do
      assert SetOperators.uppercone(@ground_set, @empty_set) == @empty_set
    end

    test "returns the power set for the trivial set" do
      assert SetOperators.uppercone(@ground_set, @trivial) == @power_set
    end
  end
end
