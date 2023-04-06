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
  @trivial MapSet.new([
    MapSet.new([])
  ])
  @singleton_ground_set MapSet.new([1])
  @singleton MapSet.new([
    MapSet.new([1])
  ])
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

  describe "middle_basis?/2" do
    test "returns true for a good basis" do
      assert ExchangeAxioms.middle_basis?(@ground_set, @good_basis)
    end

    test "returns true for the trivial basis" do
      assert ExchangeAxioms.middle_basis?(@ground_set, @trivial)
    end

    test "returns true for the power set" do
      assert ExchangeAxioms.middle_basis?(@ground_set, @power_set)
    end

    test "returns true for a singleton set" do
      assert ExchangeAxioms.middle_basis?(@singleton_ground_set, @singleton)
    end

    test "returns false for a bad basis" do
      refute ExchangeAxioms.middle_basis?(@ground_set, @bad_basis)
    end
  end

  describe "weak_basis_exchange?/1" do
    test "returns true for a good basis" do
      assert ExchangeAxioms.weak_basis_exchange?(@good_basis)
    end

    test "returns true for the trivial basis" do
      assert ExchangeAxioms.weak_basis_exchange?(@trivial)
    end

    test "returns false for the power set" do
      refute ExchangeAxioms.weak_basis_exchange?(@power_set)
    end

    test "returns true for a singleton set" do
      assert ExchangeAxioms.weak_basis_exchange?(@singleton)
    end

    test "returns false for a bad basis" do
      refute ExchangeAxioms.weak_basis_exchange?(@bad_basis)
    end
  end

  describe "augmentation?/1" do
    test "returns true for a good basis" do
      assert ExchangeAxioms.augmentation?(@good_basis)
    end

    test "returns true for the trivial basis" do
      assert ExchangeAxioms.augmentation?(@trivial)
    end

    test "returns true for the power set" do
      assert ExchangeAxioms.augmentation?(@power_set)
    end

    test "returns true for a singleton set" do
      assert ExchangeAxioms.augmentation?(@singleton)
    end

    test "returns false for a bad basis" do
      refute ExchangeAxioms.augmentation?(@bad_basis)
    end
  end

  describe "reduction?/1" do
    test "returns true for a good basis" do
      assert ExchangeAxioms.reduction?(@good_basis)
    end

    test "returns true for the trivial basis" do
      assert ExchangeAxioms.reduction?(@trivial)
    end

    test "returns true for the power set" do
      assert ExchangeAxioms.reduction?(@power_set)
    end

    test "returns true for a singleton set" do
      assert ExchangeAxioms.reduction?(@singleton)
    end

    test "returns false for a bad basis" do
      refute ExchangeAxioms.reduction?(@bad_basis)
    end
  end

  # describe "contraction?/2" do
  #   test "returns true for a good basis" do
  #     assert ExchangeAxioms.contraction?(@ground_set, @good_basis)
  #   end

  #   test "returns true for the trivial basis" do
  #     assert ExchangeAxioms.contraction?(@ground_set, @trivial)
  #   end

  #   test "returns true for the power set" do
  #     assert ExchangeAxioms.contraction?(@ground_set, @power_set)
  #   end

  #   test "returns false for a bad basis" do
  #     refute ExchangeAxioms.contraction?(@ground_set, @bad_basis)
  #   end
  # end

  # describe "extension?/2" do
  #   test "returns true for a good basis" do
  #     assert ExchangeAxioms.extension?(@ground_set, @good_basis)
  #   end

  #   test "returns true for the trivial basis" do
  #     assert ExchangeAxioms.extension?(@ground_set, @trivial)
  #   end

  #   test "returns true for the power set" do
  #     assert ExchangeAxioms.extension?(@ground_set, @power_set)
  #   end

  #   test "returns false for a bad basis" do
  #     refute ExchangeAxioms.extension?(@ground_set, @bad_basis)
  #   end
  # end

  # describe "elimination?/2" do
  #   test "returns true for a good basis" do
  #     assert ExchangeAxioms.elimination?(@ground_set, @good_basis)
  #   end

  #   test "returns true for the trivial basis" do
  #     assert ExchangeAxioms.elimination?(@ground_set, @trivial)
  #   end

  #   test "returns true for the power set" do
  #     assert ExchangeAxioms.elimination?(@ground_set, @power_set)
  #   end

  #   test "returns false for a bad basis" do
  #     refute ExchangeAxioms.elimination?(@ground_set, @bad_basis)
  #   end
  # end

  # describe "covering?/2" do
  #   test "returns true for a good basis" do
  #     assert ExchangeAxioms.covering?(@ground_set, @good_basis)
  #   end

  #   test "returns true for the trivial basis" do
  #     assert ExchangeAxioms.covering?(@ground_set, @trivial)
  #   end

  #   test "returns true for the power set" do
  #     assert ExchangeAxioms.covering?(@ground_set, @power_set)
  #   end

  #   test "returns false for a bad basis" do
  #     refute ExchangeAxioms.covering?(@ground_set, @bad_basis)
  #   end
  # end
end
