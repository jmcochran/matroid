defmodule Matroid.ExchangeAxiomsTest do
  use ExUnit.Case, async: true
  use Matroid.SetFixtures, [:set_system_1, :set_system_2, :set_system_3]
  alias Matroid.ExchangeAxioms

  describe "size 1 ground set" do
    test "middle_basis?/2" do
      assert ExchangeAxioms.middle_basis?(@ground_set_1, @bases_1a)
      assert ExchangeAxioms.middle_basis?(@ground_set_1, @power_set_1)
      assert ExchangeAxioms.middle_basis?(@ground_set_1, @singleton_set_1)
      assert ExchangeAxioms.middle_basis?(@ground_set_1, @trivial_set_1)
      assert ExchangeAxioms.middle_basis?(@ground_set_1, @empty_set_1)
    end

    test "weak_basis_exchange?/1" do
      assert ExchangeAxioms.weak_basis_exchange?(@bases_1a)
      refute ExchangeAxioms.weak_basis_exchange?(@power_set_1)
      assert ExchangeAxioms.weak_basis_exchange?(@singleton_set_1)
      assert ExchangeAxioms.weak_basis_exchange?(@trivial_set_1)
      assert ExchangeAxioms.weak_basis_exchange?(@empty_set_1)
    end

    test "augmentation?/1" do
      assert ExchangeAxioms.augmentation?(@independent_sets_1a)
      assert ExchangeAxioms.augmentation?(@power_set_1)
      assert ExchangeAxioms.augmentation?(@singleton_set_1)
      assert ExchangeAxioms.augmentation?(@trivial_set_1)
      assert ExchangeAxioms.augmentation?(@empty_set_1)
    end

    test "reduction?/1" do
      assert ExchangeAxioms.reduction?(@spanning_sets_1a)
      assert ExchangeAxioms.reduction?(@power_set_1)
      assert ExchangeAxioms.reduction?(@singleton_set_1)
      assert ExchangeAxioms.reduction?(@trivial_set_1)
      assert ExchangeAxioms.reduction?(@empty_set_1)
    end

    test "contraction?/2" do
      assert ExchangeAxioms.contraction?(@ground_set_1, @dependent_sets_1a)
      assert ExchangeAxioms.contraction?(@ground_set_1, @power_set_1)
      assert ExchangeAxioms.contraction?(@ground_set_1, @singleton_set_1)
      assert ExchangeAxioms.contraction?(@ground_set_1, @trivial_set_1)
      assert ExchangeAxioms.contraction?(@ground_set_1, @empty_set_1)
    end

    test "extension?/2" do
      assert ExchangeAxioms.extension?(@ground_set_1, @nonspanning_sets_1a)
      assert ExchangeAxioms.extension?(@ground_set_1, @power_set_1)
      assert ExchangeAxioms.extension?(@ground_set_1, @singleton_set_1)
      assert ExchangeAxioms.extension?(@ground_set_1, @trivial_set_1)
      assert ExchangeAxioms.extension?(@ground_set_1, @empty_set_1)
    end

    test "elimination?/2" do
      assert ExchangeAxioms.elimination?(@ground_set_1, @circuits_1a)
      refute ExchangeAxioms.elimination?(@ground_set_1, @power_set_1)
      assert ExchangeAxioms.elimination?(@ground_set_1, @singleton_set_1)
      assert ExchangeAxioms.elimination?(@ground_set_1, @trivial_set_1)
      assert ExchangeAxioms.elimination?(@ground_set_1, @empty_set_1)
    end

    test "covering?/2" do
      assert ExchangeAxioms.covering?(@ground_set_1, @hyperplanes_1a)
      assert ExchangeAxioms.covering?(@ground_set_1, @power_set_1)
      assert ExchangeAxioms.covering?(@ground_set_1, @singleton_set_1)
      assert ExchangeAxioms.covering?(@ground_set_1, @trivial_set_1)
      assert ExchangeAxioms.covering?(@ground_set_1, @empty_set_1)
    end
  end

  describe "size 2 ground set" do
    test "middle_basis?/2" do
      assert ExchangeAxioms.middle_basis?(@ground_set_2, @bases_2a)
      assert ExchangeAxioms.middle_basis?(@ground_set_2, @bases_2b)
      assert ExchangeAxioms.middle_basis?(@ground_set_2, @power_set_2)
      assert ExchangeAxioms.middle_basis?(@ground_set_2, @singleton_set_2)
      assert ExchangeAxioms.middle_basis?(@ground_set_2, @trivial_set_2)
      assert ExchangeAxioms.middle_basis?(@ground_set_2, @empty_set_2)
    end

    test "weak_basis_exchange?/1" do
      assert ExchangeAxioms.weak_basis_exchange?(@bases_2a)
      assert ExchangeAxioms.weak_basis_exchange?(@bases_2b)
      refute ExchangeAxioms.weak_basis_exchange?(@power_set_2)
      assert ExchangeAxioms.weak_basis_exchange?(@singleton_set_2)
      assert ExchangeAxioms.weak_basis_exchange?(@trivial_set_2)
      assert ExchangeAxioms.weak_basis_exchange?(@empty_set_2)
    end

    test "augmentation?/1" do
      assert ExchangeAxioms.augmentation?(@independent_sets_2a)
      assert ExchangeAxioms.augmentation?(@independent_sets_2b)
      assert ExchangeAxioms.augmentation?(@power_set_2)
      assert ExchangeAxioms.augmentation?(@singleton_set_2)
      assert ExchangeAxioms.augmentation?(@trivial_set_2)
      assert ExchangeAxioms.augmentation?(@empty_set_2)
    end

    test "reduction?/1" do
      assert ExchangeAxioms.reduction?(@spanning_sets_2a)
      assert ExchangeAxioms.reduction?(@spanning_sets_2b)
      assert ExchangeAxioms.reduction?(@power_set_2)
      assert ExchangeAxioms.reduction?(@singleton_set_2)
      assert ExchangeAxioms.reduction?(@trivial_set_2)
      assert ExchangeAxioms.reduction?(@empty_set_2)
    end

    test "contraction?/2" do
      assert ExchangeAxioms.contraction?(@ground_set_2, @dependent_sets_2a)
      assert ExchangeAxioms.contraction?(@ground_set_2, @dependent_sets_2b)
      assert ExchangeAxioms.contraction?(@ground_set_2, @power_set_2)
      assert ExchangeAxioms.contraction?(@ground_set_2, @singleton_set_2)
      assert ExchangeAxioms.contraction?(@ground_set_2, @trivial_set_2)
      assert ExchangeAxioms.contraction?(@ground_set_2, @empty_set_2)
    end

    test "extension?/2" do
      assert ExchangeAxioms.extension?(@ground_set_2, @nonspanning_sets_2a)
      assert ExchangeAxioms.extension?(@ground_set_2, @nonspanning_sets_2b)
      assert ExchangeAxioms.extension?(@ground_set_2, @power_set_2)
      assert ExchangeAxioms.extension?(@ground_set_2, @singleton_set_2)
      assert ExchangeAxioms.extension?(@ground_set_2, @trivial_set_2)
      assert ExchangeAxioms.extension?(@ground_set_2, @empty_set_2)
    end

    test "elimination?/2" do
      assert ExchangeAxioms.elimination?(@ground_set_2, @circuits_2a)
      assert ExchangeAxioms.elimination?(@ground_set_2, @circuits_2b)
      refute ExchangeAxioms.elimination?(@ground_set_2, @power_set_2)
      assert ExchangeAxioms.elimination?(@ground_set_2, @singleton_set_2)
      assert ExchangeAxioms.elimination?(@ground_set_2, @trivial_set_2)
      assert ExchangeAxioms.elimination?(@ground_set_2, @empty_set_2)
    end

    test "covering?/2" do
      assert ExchangeAxioms.covering?(@ground_set_2, @hyperplanes_2a)
      assert ExchangeAxioms.covering?(@ground_set_2, @hyperplanes_2b)
      assert ExchangeAxioms.covering?(@ground_set_2, @power_set_2)
      assert ExchangeAxioms.covering?(@ground_set_2, @singleton_set_2)
      assert ExchangeAxioms.covering?(@ground_set_2, @trivial_set_2)
      assert ExchangeAxioms.covering?(@ground_set_2, @empty_set_2)
    end
  end

  describe "size 3 ground set" do
    test "middle_basis?/2" do
      assert ExchangeAxioms.middle_basis?(@ground_set_3, @good_basis_3)
      assert ExchangeAxioms.middle_basis?(@ground_set_3, @trivial_3)
      assert ExchangeAxioms.middle_basis?(@ground_set_3, @power_set_3)
      refute ExchangeAxioms.middle_basis?(@ground_set_3, @bad_basis_3)
    end

    test "weak_basis_exchange?/1" do
      assert ExchangeAxioms.weak_basis_exchange?(@good_basis_3)
      assert ExchangeAxioms.weak_basis_exchange?(@trivial_3)
      refute ExchangeAxioms.weak_basis_exchange?(@power_set_3)
      assert ExchangeAxioms.weak_basis_exchange?(@singleton_3)
      refute ExchangeAxioms.weak_basis_exchange?(@bad_basis_3)
    end

    test "augmentation?/1" do
      assert ExchangeAxioms.augmentation?(@independent_set_3)
      assert ExchangeAxioms.augmentation?(@trivial_3)
      assert ExchangeAxioms.augmentation?(@power_set_3)
      assert ExchangeAxioms.augmentation?(@singleton_3)
      refute ExchangeAxioms.augmentation?(@bad_basis_3)
    end

    test "reduction?/1" do
      assert ExchangeAxioms.reduction?(@spanning_set_3)
      assert ExchangeAxioms.reduction?(@trivial_3)
      assert ExchangeAxioms.reduction?(@power_set_3)
      assert ExchangeAxioms.reduction?(@singleton_3)
      refute ExchangeAxioms.reduction?(@bad_basis_3)
    end

    test "contraction?/2" do
      assert ExchangeAxioms.contraction?(@ground_set_3, @dependent_set_3)
      assert ExchangeAxioms.contraction?(@ground_set_3, @trivial_3)
      assert ExchangeAxioms.contraction?(@ground_set_3, @power_set_3)
    end

    test "extension?/2" do
      assert ExchangeAxioms.extension?(@ground_set_3, @nonspanning_set_3)
      assert ExchangeAxioms.extension?(@ground_set_3, @trivial_3)
      assert ExchangeAxioms.extension?(@ground_set_3, @power_set_3)
    end

    test "elimination?/2" do
      assert ExchangeAxioms.elimination?(@ground_set_3, @circuit_3)
      assert ExchangeAxioms.elimination?(@ground_set_3, @trivial_3)
      refute ExchangeAxioms.elimination?(@ground_set_3, @power_set_3)
    end

    test "covering?/2" do
      assert ExchangeAxioms.covering?(@ground_set_3, @hyperplane_3)
      assert ExchangeAxioms.covering?(@ground_set_3, @trivial_3)
      assert ExchangeAxioms.covering?(@ground_set_3, @power_set_3)
    end
  end
end
