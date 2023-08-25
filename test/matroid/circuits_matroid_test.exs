defmodule CircuitsMatroidTest do
  use ExUnit.Case, async: true
  use Matroid.SetFixtures, [:set_system_1, :set_system_2]
  alias Matroid.CircuitsMatroid
  alias Matroid.BasesMatroid

  setup_all do
    %{
      matroid_1a: CircuitsMatroid.new(@ground_set_1 |> MapSet.to_list, @circuits_1a |> MapSet.to_list),
      matroid_2a: CircuitsMatroid.new(@ground_set_2 |> MapSet.to_list, @circuits_2a |> MapSet.to_list),
      matroid_2b: CircuitsMatroid.new(@ground_set_2 |> MapSet.to_list, @circuits_2b |> MapSet.to_list),
      bases_matroid_1a: BasesMatroid.new(@ground_set_1 |> MapSet.to_list, @bases_1a |> MapSet.to_list),
      bases_matroid_2a: BasesMatroid.new(@ground_set_2 |> MapSet.to_list, @bases_2a |> MapSet.to_list),
      bases_matroid_2b: BasesMatroid.new(@ground_set_2 |> MapSet.to_list, @bases_2b |> MapSet.to_list)
    }
  end

  describe "circuits matroids new/2" do
    test "1 member set system", context do
      assert {:ok, %CircuitsMatroid{}} = context[:matroid_1a]
    end
    test "2 member set systems", context do
      assert {:ok, %CircuitsMatroid{}} = context[:matroid_2a]
      assert {:ok, %CircuitsMatroid{}} = context[:matroid_2b]
    end
    test "invalid arguments" do
      assert {:error, "CircuitsMatroid validation failure"} = CircuitsMatroid.new("hello", "world")
    end
  end


  describe "circuits matroids base?/2" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.base?(matroid_1a, MapSet.new([1]))
      refute Matroid.base?(matroid_1a, MapSet.new([]))
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.base?(matroid_2a, MapSet.new([1]))
      refute Matroid.base?(matroid_2a, MapSet.new([1,2]))
      refute Matroid.base?(matroid_2a, MapSet.new([]))
      assert Matroid.base?(matroid_2b, MapSet.new([1,2]))
      refute Matroid.base?(matroid_2b, MapSet.new([1]))
      refute Matroid.base?(matroid_2b, MapSet.new([2]))
    end
  end

  describe "circuits matroids independent?/2" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.independent?(matroid_1a, MapSet.new([1]))
      assert Matroid.independent?(matroid_1a, MapSet.new([]))
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.independent?(matroid_2a, MapSet.new([1]))
      refute Matroid.independent?(matroid_2a, MapSet.new([1,2]))
      assert Matroid.independent?(matroid_2a, MapSet.new([]))
      assert Matroid.independent?(matroid_2b, MapSet.new([1,2]))
      assert Matroid.independent?(matroid_2b, MapSet.new([1]))
      assert Matroid.independent?(matroid_2b, MapSet.new([2]))
    end
  end

  describe "circuits matroids dependent?/2" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      refute Matroid.dependent?(matroid_1a, MapSet.new([1]))
      refute Matroid.dependent?(matroid_1a, MapSet.new([]))
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      refute Matroid.dependent?(matroid_2a, MapSet.new([1]))
      assert Matroid.dependent?(matroid_2a, MapSet.new([1,2]))
      refute Matroid.dependent?(matroid_2a, MapSet.new([]))
      refute Matroid.dependent?(matroid_2b, MapSet.new([1,2]))
      refute Matroid.dependent?(matroid_2b, MapSet.new([1]))
      refute Matroid.dependent?(matroid_2b, MapSet.new([2]))
    end
  end

  describe "circuits matroids spanning?/2" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.spanning?(matroid_1a, MapSet.new([1]))
      refute Matroid.spanning?(matroid_1a, MapSet.new([]))
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.spanning?(matroid_2a, MapSet.new([1]))
      assert Matroid.spanning?(matroid_2a, MapSet.new([1,2]))
      refute Matroid.spanning?(matroid_2a, MapSet.new([]))
      assert Matroid.spanning?(matroid_2b, MapSet.new([1,2]))
      refute Matroid.spanning?(matroid_2b, MapSet.new([1]))
      refute Matroid.spanning?(matroid_2b, MapSet.new([2]))
    end
  end

  describe "circuits matroids nonspanning?/2" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      refute Matroid.nonspanning?(matroid_1a, MapSet.new([1]))
      assert Matroid.nonspanning?(matroid_1a, MapSet.new([]))
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      refute Matroid.nonspanning?(matroid_2a, MapSet.new([1]))
      refute Matroid.nonspanning?(matroid_2a, MapSet.new([1,2]))
      assert Matroid.nonspanning?(matroid_2a, MapSet.new([]))
      refute Matroid.nonspanning?(matroid_2b, MapSet.new([1,2]))
      assert Matroid.nonspanning?(matroid_2b, MapSet.new([1]))
      assert Matroid.nonspanning?(matroid_2b, MapSet.new([2]))
    end
  end

  describe "Circuits matroids circuit?/2" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      refute Matroid.circuit?(matroid_1a, MapSet.new([1]))
      refute Matroid.circuit?(matroid_1a, MapSet.new([]))
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      refute Matroid.circuit?(matroid_2a, MapSet.new([1]))
      assert Matroid.circuit?(matroid_2a, MapSet.new([2]))
      refute Matroid.circuit?(matroid_2a, MapSet.new([1,2]))
      refute Matroid.circuit?(matroid_2a, MapSet.new([]))
      refute Matroid.circuit?(matroid_2b, MapSet.new([1,2]))
      refute Matroid.circuit?(matroid_2b, MapSet.new([1]))
      refute Matroid.circuit?(matroid_2b, MapSet.new([2]))
      refute Matroid.circuit?(matroid_2b, MapSet.new([]))
    end
  end

  describe "Circuits matroids hyperplane?/2" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      refute Matroid.hyperplane?(matroid_1a, MapSet.new([1]))
      assert Matroid.hyperplane?(matroid_1a, MapSet.new([]))
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      refute Matroid.hyperplane?(matroid_2a, MapSet.new([1]))
      assert Matroid.hyperplane?(matroid_2a, MapSet.new([2]))
      refute Matroid.hyperplane?(matroid_2a, MapSet.new([1,2]))
      refute Matroid.hyperplane?(matroid_2a, MapSet.new([]))
      refute Matroid.hyperplane?(matroid_2b, MapSet.new([1,2]))
      assert Matroid.hyperplane?(matroid_2b, MapSet.new([1]))
      assert Matroid.hyperplane?(matroid_2b, MapSet.new([2]))
      refute Matroid.hyperplane?(matroid_2b, MapSet.new([]))
    end
  end

  describe "Circuits matroids ground_set/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.ground_set(matroid_1a) == MapSet.new([1])
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.ground_set(matroid_2a) == MapSet.new([1,2])
      assert Matroid.ground_set(matroid_2b) == MapSet.new([1,2])
    end
  end

  describe "circuit matroid base_sets/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.base_sets(matroid_1a) == @bases_1a
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.base_sets(matroid_2a) == @bases_2a
      assert Matroid.base_sets(matroid_2b) == @bases_2b
    end
  end

  describe "circuit matroid independent_sets/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.independent_sets(matroid_1a) == @independent_sets_1a
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.independent_sets(matroid_2a) == @independent_sets_2a
      assert Matroid.independent_sets(matroid_2b) == @independent_sets_2b
    end
  end

  describe "circuit matroid dependent_sets/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.dependent_sets(matroid_1a) == @dependent_sets_1a
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.dependent_sets(matroid_2a) == @dependent_sets_2a
      assert Matroid.dependent_sets(matroid_2b) == @dependent_sets_2b
    end
  end

  describe "circuit matroid spanning_sets/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.spanning_sets(matroid_1a) == @spanning_sets_1a
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.spanning_sets(matroid_2a) == @spanning_sets_2a
      assert Matroid.spanning_sets(matroid_2b) == @spanning_sets_2b
    end
  end

  describe "circuit matroid nonspanning_sets/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.nonspanning_sets(matroid_1a) == @nonspanning_sets_1a
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.nonspanning_sets(matroid_2a) == @nonspanning_sets_2a
      assert Matroid.nonspanning_sets(matroid_2b) == @nonspanning_sets_2b
    end
  end

  describe "circuit matroid circuit_sets/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.circuit_sets(matroid_1a) == @circuits_1a
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.circuit_sets(matroid_2a) == @circuits_2a
      assert Matroid.circuit_sets(matroid_2b) == @circuits_2b
    end
  end

  describe "circuit matroid hyperplane_sets/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.hyperplane_sets(matroid_1a) == @hyperplanes_1a
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.hyperplane_sets(matroid_2a) == @hyperplanes_2a
      assert Matroid.hyperplane_sets(matroid_2b) == @hyperplanes_2b
    end
  end

  describe "circuits matroid to_circuits/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      assert Matroid.to_circuits(matroid_1a) == {:ok, matroid_1a}
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      assert Matroid.to_circuits(matroid_2a) == {:ok, matroid_2a}
      assert Matroid.to_circuits(matroid_2b) == {:ok, matroid_2b}
    end
  end

  describe "circuit matroid to_bases/1" do
    test "1 member set system", context do
      {:ok, matroid_1a} = context[:matroid_1a]
      {:ok, bases_matroid_1a} = context[:bases_matroid_1a]
      assert Matroid.to_bases(matroid_1a) == {:ok, bases_matroid_1a}
    end
    test "2 member set systems", context do
      {:ok, matroid_2a} = context[:matroid_2a]
      {:ok, matroid_2b} = context[:matroid_2b]
      {:ok, bases_matroid_2a} = context[:bases_matroid_2a]
      {:ok, bases_matroid_2b} = context[:bases_matroid_2b]
      assert Matroid.to_bases(matroid_2a) == {:ok, bases_matroid_2a}
      assert Matroid.to_bases(matroid_2b) == {:ok, bases_matroid_2b}
    end
  end
end
