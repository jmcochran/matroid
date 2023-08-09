defmodule Matroid.OrderAxiomsTest do
  use ExUnit.Case, async: true
  alias Matroid.OrderAxioms

  @ground_set MapSet.new([1,2,3])

  @antichain MapSet.new([
    MapSet.new([1,2]),
    MapSet.new([1,3]),
    MapSet.new([2,3])
  ])
  @ascending_family MapSet.new([
    MapSet.new([1,2]),
    MapSet.new([1,3]),
    MapSet.new([1,2,3])
  ])
  @descending_family MapSet.new([
    MapSet.new([1,2]),
    MapSet.new([1,3]),
    MapSet.new([1]),
    MapSet.new([2]),
    MapSet.new([3]),
    MapSet.new([])
  ])
  @empty_set MapSet.new()
  @trivial MapSet.new([
    MapSet.new([])
  ])
  @powerset MapSet.new([
    MapSet.new([1,2,3]),
    MapSet.new([1,2]),
    MapSet.new([1,3]),
    MapSet.new([2,3]),
    MapSet.new([1]),
    MapSet.new([2]),
    MapSet.new([3]),
    MapSet.new([])
  ])
  @some_comparable_elements MapSet.new([
    MapSet.new([1]),
    MapSet.new([2]),
    MapSet.new([1, 2])
  ])
  @all_comparable_elements MapSet.new([
    MapSet.new([1]),
    MapSet.new([1, 2]),
    MapSet.new([1, 2, 3])
  ])

  describe "antichain?/1" do
    test "returns true for an empty MapSet" do
      assert OrderAxioms.antichain?(@empty_set)
    end

    test "returns true for a MapSet with a single empty MapSet" do
      assert OrderAxioms.antichain?(@trivial)
    end

    test "returns true for a MapSet with no comparable elements" do
      assert OrderAxioms.antichain?(@antichain)
    end

    test "returns false for a MapSet with some comparable elements" do
      refute OrderAxioms.antichain?(@some_comparable_elements)
    end

    test "returns false for a MapSet with all comparable elements" do
      refute OrderAxioms.antichain?(@all_comparable_elements)
    end

    test "returns false for a MapSet with a complete powerset" do
      refute OrderAxioms.antichain?(@powerset)
    end
  end

  describe "ascending?/2" do
    test "returns true for an empty MapSet" do
      assert OrderAxioms.ascending?(@ground_set, @empty_set)
    end

    test "returns false for a MapSet with a single empty MapSet" do
      refute OrderAxioms.ascending?(@ground_set, @trivial)
    end

    test "returns true for a MapSet with a complete powerset" do
      assert OrderAxioms.ascending?(@ground_set, @powerset)
    end

    test "returns true for a MapSet with an ascending family" do
      assert OrderAxioms.ascending?(@ground_set, @ascending_family)
    end

    test "returns false for a MapSet with a descending family" do
      refute OrderAxioms.ascending?(@ground_set, @descending_family)
    end
  end

  describe "descending?/1" do
    test "returns true for an empty MapSet" do
      assert OrderAxioms.descending?(@empty_set)
    end

    test "returns true for a MapSet with a single empty MapSet" do
      assert OrderAxioms.descending?(@trivial)
    end

    test "returns true for a MapSet with a complete powerset" do
      assert OrderAxioms.descending?(@powerset)
    end

    test "returns true for a MapSet with a descending family" do
      assert OrderAxioms.descending?(@descending_family)
    end

    test "returns false for a MapSet with an ascending family" do
      refute OrderAxioms.descending?(@ascending_family)
    end
  end
end
