defmodule Matroid.SetOperatorsTest do
  use ExUnit.Case, async: true
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
  @power_set_maximal MapSet.new([
    MapSet.new([1,2,3])
  ])
  @trivial MapSet.new([MapSet.new([])])
  @trivial_opposite MapSet.new([
    MapSet.new([1]),
    MapSet.new([2]),
    MapSet.new([3]),
    MapSet.new([1,2]),
    MapSet.new([1,3]),
    MapSet.new([2,3]),
    MapSet.new([1,2,3])
  ])
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
  @basis MapSet.new([
    MapSet.new([1, 2]),
    MapSet.new([1, 3]),
    MapSet.new([2, 3])
  ])
  @basis_uppercone MapSet.new([
    MapSet.new([1, 2]),
    MapSet.new([1, 3]),
    MapSet.new([2, 3]),
    MapSet.new([1, 2, 3])
  ])
  @basis_lowercone MapSet.new([
    MapSet.new([1, 2]),
    MapSet.new([1, 3]),
    MapSet.new([2, 3]),
    MapSet.new([1]),
    MapSet.new([2]),
    MapSet.new([3]),
    MapSet.new([])
  ])
  @basis_opposite MapSet.new([
    MapSet.new([]),
    MapSet.new([1]),
    MapSet.new([2]),
    MapSet.new([3]),
    MapSet.new([1, 2, 3])
  ])
  @singleton MapSet.new([
    MapSet.new([1])
  ])
  @singleton_uppercone MapSet.new([
    MapSet.new([1]),
    MapSet.new([1, 2]),
    MapSet.new([1, 3]),
    MapSet.new([1, 2, 3])
  ])
  @singleton_lowercone MapSet.new([
    MapSet.new([1]),
    MapSet.new([])
  ])
  @singleton_opposite MapSet.new([
    MapSet.new([]),
    MapSet.new([2]),
    MapSet.new([3]),
    MapSet.new([1, 2]),
    MapSet.new([1, 3]),
    MapSet.new([2, 3]),
    MapSet.new([1, 2, 3])
  ])

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
    test "returns the upper cone of a basis" do
      assert SetOperators.uppercone(@ground_set, @basis) == @basis_uppercone
    end

    test "returns the upper cone of a singleton" do
      assert SetOperators.uppercone(@ground_set, @singleton) == @singleton_uppercone
    end

    test "returns the upper cone of a power set" do
      assert SetOperators.uppercone(@ground_set, @power_set) == @power_set
    end

    test "returns the empty set for the empty set" do
      assert SetOperators.uppercone(@ground_set, @empty_set) == @empty_set
    end

    test "returns the power set for the trivial set" do
      assert SetOperators.uppercone(@ground_set, @trivial) == @power_set
    end
  end

  describe "lowercone/2" do
    test "returns the lower cone of a basis" do
      assert SetOperators.lowercone(@ground_set, @basis) == @basis_lowercone
    end

    test "returns the lower cone of a singleton" do
      assert SetOperators.lowercone(@ground_set, @singleton) == @singleton_lowercone
    end

    test "returns the lower cone of a power set" do
      assert SetOperators.lowercone(@ground_set, @power_set) == @power_set
    end

    test "returns the empty set for the empty set" do
      assert SetOperators.lowercone(@ground_set, @empty_set) == @empty_set
    end

    test "returns the trivial set for the trivial set" do
      assert SetOperators.lowercone(@ground_set, @trivial) == @trivial
    end
  end

  describe "maximal/1" do
    test "returns the maximal elements of a basis" do
      assert SetOperators.maximal(@basis) == @basis
    end

    test "returns the maximal elements of a singleton" do
      assert SetOperators.maximal(@singleton) == @singleton
    end

    test "returns the maximal elements of a power set" do
      assert SetOperators.maximal(@power_set) == @power_set_maximal
    end

    test "returns the empty set for the empty set" do
      assert SetOperators.maximal(@empty_set) == @empty_set
    end

    test "returns the trivial set for the trivial set" do
      assert SetOperators.maximal(@trivial) == @trivial
    end
  end

  describe "minimal/1" do
    test "returns the minimal elements of a basis" do
      assert SetOperators.minimal(@basis) == @basis
    end

    test "returns the minimal elements of a singleton" do
      assert SetOperators.minimal(@singleton) == @singleton
    end

    test "returns the minimal elements of a power set" do
      assert SetOperators.minimal(@power_set) == @trivial
    end

    test "returns the empty set for the empty set" do
      assert SetOperators.minimal(@empty_set) == @empty_set
    end

    test "returns the trivial set for the trivial set" do
      assert SetOperators.minimal(@trivial) == @trivial
    end
  end

  describe "opposite/2" do
    test "returns the opposite of a basis" do
      assert SetOperators.opposite(@ground_set, @basis) == @basis_opposite
    end

    test "returns the opposite of a singleton" do
      assert SetOperators.opposite(@ground_set, @singleton) == @singleton_opposite
    end

    test "returns the opposite of a power set" do
      assert SetOperators.opposite(@ground_set, @power_set) == @empty_set
    end

    test "returns the power set for the empty set" do
      assert SetOperators.opposite(@ground_set, @empty_set) == @power_set
    end

    test "returns the opposite set for the trivial set" do
      assert SetOperators.opposite(@ground_set, @trivial) == @trivial_opposite
    end
  end
end
