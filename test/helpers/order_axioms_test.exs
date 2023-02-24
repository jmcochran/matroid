defmodule Matroid.OrderAxiomsTest do
  use ExUnit.Case
  alias Matroid.OrderAxioms

  @ground_set MapSet.new([1,2,3])
  @antichain MapSet.new([MapSet.new([1,2]), MapSet.new([1,3]), MapSet.new([2,3])])
  @non_antichain MapSet.new([MapSet.new([1]), MapSet.new([1,3])])
  @ascending_family MapSet.new([MapSet.new([1,2]), MapSet.new([1,3]), MapSet.new([1,2,3])])
  @descending_family MapSet.new([
      MapSet.new([1,2]),
      MapSet.new([1,3]),
      MapSet.new([1]),
      MapSet.new([2]),
      MapSet.new([3]),
      MapSet.new([])
    ])
  @trivial MapSet.new([MapSet.new([])])
  @full MapSet.new([
      MapSet.new([1,2,3]),
      MapSet.new([1,2]),
      MapSet.new([1,3]),
      MapSet.new([2,3]),
      MapSet.new([1]),
      MapSet.new([2]),
      MapSet.new([3]),
      MapSet.new([])
    ])

  test "antichain" do
    assert OrderAxioms.antichain(@antichain)
    assert OrderAxioms.antichain(@trivial)
    refute OrderAxioms.antichain(@non_antichain)
    refute OrderAxioms.antichain(@ascending_family)
    refute OrderAxioms.antichain(@descending_family)
    refute OrderAxioms.antichain(@full)
  end

  test "ascending family" do
    assert OrderAxioms.ascending(@ground_set, @ascending_family)
    assert OrderAxioms.ascending(@ground_set, @full)
    refute OrderAxioms.ascending(@ground_set, @descending_family)
    refute OrderAxioms.ascending(@ground_set, @antichain)
    refute OrderAxioms.ascending(@ground_set, @non_antichain)
    refute OrderAxioms.ascending(@ground_set, @trivial)
  end

  test "descending family" do
    assert OrderAxioms.descending(@descending_family)
    assert OrderAxioms.descending(@trivial)
    assert OrderAxioms.descending(@full)
    refute OrderAxioms.descending(@ascending_family)
    refute OrderAxioms.descending(@antichain)
    refute OrderAxioms.descending(@non_antichain)
  end
end
