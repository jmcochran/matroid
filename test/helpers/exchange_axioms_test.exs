defmodule Matroid.ExchangeAxiomsTest do
  use ExUnit.Case
  alias Matroid.ExchangeAxioms

  @ground_set MapSet.new([1,2,3])
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
  @good_basis MapSet.new([
    MapSet.new([1,2]),
    MapSet.new([1,3]),
    MapSet.new([2,3])
  ])
  @bad_basis MapSet.new([
    MapSet.new([1,2,3]),
    MapSet.new([3]),
    MapSet.new([])
  ])

  test "middle_basis" do
    assert ExchangeAxioms.middle_basis(@ground_set, @good_basis)
    assert ExchangeAxioms.middle_basis(@ground_set, @trivial)
    assert ExchangeAxioms.middle_basis(@ground_set, @power_set)
    refute ExchangeAxioms.middle_basis(@ground_set, @bad_basis)
  end

  test "weak_basis_exchange" do
    assert ExchangeAxioms.weak_basis_exchange(@good_basis)
    assert ExchangeAxioms.weak_basis_exchange(@trivial)
    refute ExchangeAxioms.weak_basis_exchange(@power_set)
    refute ExchangeAxioms.weak_basis_exchange(@bad_basis)
  end

  test "augmentation" do
    assert ExchangeAxioms.augmentation(@power_set)
    assert ExchangeAxioms.augmentation(@trivial)
    assert ExchangeAxioms.augmentation(@good_basis)
    refute ExchangeAxioms.augmentation(@bad_basis)
  end

  test "reduction" do
    assert ExchangeAxioms.reduction(@power_set)
    assert ExchangeAxioms.reduction(@trivial)
    assert ExchangeAxioms.reduction(@good_basis)
    refute ExchangeAxioms.reduction(@bad_basis)
  end

  test "contraction" do
    assert true
  end

  test "extension" do
    assert true
  end
end
