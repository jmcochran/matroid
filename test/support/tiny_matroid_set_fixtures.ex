defmodule Matroid.TinyMatroidSetFixtures do
  def tiny_matroid_set_system_0_0 do
    quote do
      @ground_set_t00 MapSet.new([])
      @bases_t00 MapSet.new([
        MapSet.new([])
      ])
      @independent_sets_t00 MapSet.new([
        MapSet.new([])
      ])
      @dependent_sets_t00 MapSet.new([])
      @spanning_sets_t00 MapSet.new([
        MapSet.new([])
      ])
      @non_spanning_sets_t00 MapSet.new([])
      @circuits_t00 MapSet.new([])
      @hyperplanes_t00 MapSet.new([])
    end
  end

  def tiny_matroid_set_system_1_0 do
    quote do
      @ground_set_t10 MapSet.new([1])
      @bases_t10 MapSet.new([
        MapSet.new([])
      ])
      @independent_sets_t10 MapSet.new([
        MapSet.new([])
      ])
      @dependent_sets_t10 MapSet.new([
        MapSet.new([1])
      ])
      @spanning_sets_t10 MapSet.new([
        MapSet.new([]),
        MapSet.new([1])
      ])
      @non_spanning_sets_t10 MapSet.new([])
      @circuits_t10 MapSet.new([
        MapSet.new([1])
      ])
      @hyperplanes_t10 MapSet.new([])
    end
  end

  def tiny_matroid_set_system_1_1 do
    quote do
      @ground_set_t11 MapSet.new([1])
      @bases_t11 MapSet.new([
        MapSet.new([1])
      ])
      @independent_sets_t11 MapSet.new([
        MapSet.new([]),
        MapSet.new([1])
      ])
      @dependent_sets_t11 MapSet.new([])
      @spanning_sets_t11 MapSet.new([
        MapSet.new([1])
      ])
      @non_spanning_sets_t11 MapSet.new([
        MapSet.new([])
      ])
      @circuits_t11 MapSet.new([])
      @hyperplanes_t11 MapSet.new([
        MapSet.new([])
      ])
    end
  end

  def tiny_matroid_set_system_2_0 do
    quote do
      @ground_set_t20 MapSet.new([1, 2])
      @bases_t20 MapSet.new([
        MapSet.new([])
      ])
      @independent_sets_t20 MapSet.new([
        MapSet.new([])
      ])
      @dependent_sets_t20 MapSet.new([
        MapSet.new([])
      ])
      @spanning_sets_t20 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([1, 2])
      ])
      @non_spanning_sets_t20 MapSet.new([])
      @circuits_t20 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2])
      ])
      @hyperplanes_t20 MapSet.new([])
    end
  end

  def tiny_matroid_set_system_2_1 do
    quote do
      @ground_set_t21 MapSet.new([1, 2])
      @bases_t21 MapSet.new([
        MapSet.new([2])
      ])
      @independent_sets_t21 MapSet.new([
        MapSet.new([]),
        MapSet.new([2])
      ])
      @dependent_sets_t21 MapSet.new([
        MapSet.new([1]),
        MapSet.new([1, 2])
      ])
      @spanning_sets_t21 MapSet.new([
        MapSet.new([2]),
        MapSet.new([1, 2])
      ])
      @non_spanning_sets_t21 MapSet.new([
        MapSet.new([]),
        MapSet.new([1])
      ])
      @circuits_t21 MapSet.new([
        MapSet.new([1])
      ])
      @hyperplanes_t21 MapSet.new([
        MapSet.new([1])
      ])
    end
  end

  def tiny_matroid_set_system_2_2 do
    quote do
      @ground_set_t22 MapSet.new([1, 2])
      @bases_t22 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2])
      ])
      @independent_sets_t22 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2])
      ])
      @dependent_sets_t22 MapSet.new([
        MapSet.new([1, 2])
      ])
      @spanning_sets_t22 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([1, 2])
      ])
      @non_spanning_sets_t22 MapSet.new([
        MapSet.new([])
      ])
      @circuits_t22 MapSet.new([
        MapSet.new([1, 2])
      ])
      @hyperplanes_t22 MapSet.new([
        MapSet.new([])
      ])
    end
  end

  def tiny_matroid_set_system_2_3 do
    quote do
      @ground_set_t23 MapSet.new([1, 2])
      @bases_t23 MapSet.new([
        MapSet.new([1, 2])
      ])
      @independent_sets_t23 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([1, 2])
      ])
      @dependent_sets_t23 MapSet.new([])
      @spanning_sets_t23 MapSet.new([
        MapSet.new([1, 2])
      ])
      @non_spanning_sets_t23 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2])
      ])
      @circuits_t23 MapSet.new([])
      @hyperplanes_t23 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2])
      ])
    end
  end

  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture) do
       apply(__MODULE__, fixture, [])
    end
  end
end
