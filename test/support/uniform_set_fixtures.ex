defmodule Matroid.UniformSetFixtures do
  def uniform_set_system_1_2 do
    quote do
      @ground_set_u12 MapSet.new([1, 2])
      @bases_u12 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2])
      ])
      @independent_sets_u12 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2])
      ])
      @dependent_sets_u12 MapSet.new([
        MapSet.new([1, 2])
      ])
      @spanning_sets_u12 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([1, 2])
      ])
      @non_spanning_sets_u12 MapSet.new([
        MapSet.new([])
      ])
      @circuits_u12 MapSet.new([
        MapSet.new([1, 2])
      ])
      @hyperplanes_u12 MapSet.new([
        MapSet.new([])
      ])
    end
  end

  def uniform_set_system_2_2 do
    quote do
      @ground_set_u22 MapSet.new([1, 2])
      @bases_u22 MapSet.new([
        MapSet.new([1, 2])
      ])
      @independent_sets_u22 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([1, 2])
      ])
      @dependent_sets_u22 MapSet.new([])
      @spanning_sets_u22 MapSet.new([
        MapSet.new([1, 2])
      ])
      @nons_spanning_sets_u22 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2])
      ])
      @circuits_u22 MapSet.new([])
      @hyperplanes_u22 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2])
      ])
    end
  end

  def uniform_set_system_1_3 do
    quote do
      @ground_set_u13 MapSet.new([1, 2, 3])
      @bases_u13 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3])
      ])
      @independent_sets_u13 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3])
      ])
      @dependent_sets_u13 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3]),
        MapSet.new([1, 2, 3])
      ])
      @spanning_sets_u13 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3]),
        MapSet.new([1, 2, 3])
      ])
      @nonspanning_sets_u13 MapSet.new([
        MapSet.new([])
      ])
      @circuits_u13 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3])
      ])
      @hyperplanes_u13 MapSet.new([
        MapSet.new([])
      ])
    end
  end

  def uniform_set_system_2_3 do
    quote do
      @ground_set_u23 MapSet.new([1, 2, 3])
      @bases_u23 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3])
      ])
      @independent_sets_u23 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3])
      ])
      @dependent_sets_u23 MapSet.new([
        MapSet.new([1, 2, 3])
      ])
      @spanning_sets_u23 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3]),
        MapSet.new([1, 2, 3])
      ])
      @nonspanning_sets_u23 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3])
      ])
      @circuits_u23 MapSet.new([
        MapSet.new([1, 2, 3])
      ])
      @hyperplanes_u23 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3])
      ])
    end
  end

  def uniform_set_system_3_3 do
    quote do
      @ground_set_u33 MapSet.new([1, 2, 3])
      @bases_u33 MapSet.new([
        MapSet.new([1, 2, 3])
      ])
      @independent_sets_u33 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3]),
        MapSet.new([1, 2, 3])
      ])
      @dependent_sets_u33 MapSet.new([])
      @spanning_sets_u33 MapSet.new([
        MapSet.new([1, 2, 3])
      ])
      @nonspanning_sets_u33 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3])
      ])
      @circuits_u33 MapSet.new([])
      @hyperplanes_u33 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([2, 3])
      ])
    end
  end

  def uniform_set_system_1_4 do
    quote do
      @ground_set_u14 MapSet.new([1, 2, 3, 4])
      @bases_u14 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4])
      ])
      @independent_sets_u14 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4])
      ])
      @dependent_sets_u14 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4]),
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4]),
        MapSet.new([1, 2, 3, 4])
      ])
      @spanning_sets_u14 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4]),
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4]),
        MapSet.new([1, 2, 3, 4])
      ])
      @nonspanning_sets_u14 MapSet.new([
        MapSet.new([])
      ])
      @circuits_u14 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4])
      ])
      @hyperplanes_u14 MapSet.new([
        MapSet.new([])
      ])
    end
  end

  def uniform_set_system_2_4 do
    quote do
      @ground_set_u24 MapSet.new([1, 2, 3, 4])
      @bases_u24 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4])
      ])
      @independent_sets_u24 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4])
      ])
      @dependent_sets_u24 MapSet.new([
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4]),
        MapSet.new([1, 2, 3, 4])
      ])
      @spanning_sets_u24 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4]),
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4]),
        MapSet.new([1, 2, 3, 4])
      ])
      @nonspanning_sets_u24 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4])
      ])
      @circuits_u24 MapSet.new([
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4])
      ])
      @hyperplanes_u24 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4])
      ])
    end
  end

  def uniform_set_system_3_4 do
    quote do
      @ground_set_u34 MapSet.new([1, 2, 3, 4])
      @bases_u34 MapSet.new([
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4])
      ])
      @independent_sets_u34 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4]),
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4])
      ])
      @dependent_sets_u34 MapSet.new([
        MapSet.new([1, 2, 3, 4])
      ])
      @spanning_sets_u34 MapSet.new([
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4]),
        MapSet.new([1, 2, 3, 4])
      ])
      @nonspanning_sets_u34 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4])
      ])
      @circuits_u34 MapSet.new([
        MapSet.new([1, 2, 3, 4])
      ])
      @hyperplanes_u34 MapSet.new([
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4])
      ])
    end
  end

  def uniform_set_system_4_4 do
    quote do
      @ground_set_u44 MapSet.new([1, 2, 3, 4])
      @bases_u44 MapSet.new([
        MapSet.new([1, 2, 3, 4])
      ])
      @independent_sets_u44 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4]),
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4]),
        MapSet.new([1, 2, 3, 4])
      ])
      @dependent_sets_u44 MapSet.new([])
      @spanning_sets_u44 MapSet.new([
        MapSet.new([1, 2, 3, 4])
      ])
      @nonsapnning_sets_u44 MapSet.new([
        MapSet.new([]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([4]),
        MapSet.new([1, 2]),
        MapSet.new([1, 3]),
        MapSet.new([1, 4]),
        MapSet.new([2, 3]),
        MapSet.new([2, 4]),
        MapSet.new([3, 4]),
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4])
      ])
      @circuits_u44 MapSet.new([])
      @hyperplanes_u44 MapSet.new([
        MapSet.new([1, 2, 3]),
        MapSet.new([1, 2, 4]),
        MapSet.new([1, 3, 4]),
        MapSet.new([2, 3, 4])
      ])
    end
  end

  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture) do
       apply(__MODULE__, fixture, [])
    end
  end
end
