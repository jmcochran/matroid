defmodule CircuitsMatroidTest do
  use ExUnit.Case, async: true
  use Matroid.SetFixtures, [:set_system_1, :set_system_2]
  alias Matroid.CircuitsMatroid

  setup_all do
    %{
      matroid_1a: CircuitsMatroid.new(@ground_set_1 |> MapSet.to_list, @circuits_1a |> MapSet.to_list),
      matroid_2a: CircuitsMatroid.new(@ground_set_2 |> MapSet.to_list, @circuits_2a |> MapSet.to_list),
      matroid_2b: CircuitsMatroid.new(@ground_set_2 |> MapSet.to_list, @circuits_2b |> MapSet.to_list)
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
end
