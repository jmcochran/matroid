defmodule Matroid.SetFixtures do
  # def set_system do
  #   quote do
  #     @ground_set
  #     @power_set
  #     @trivial_set
  #     @empty_set
  #
  #     @bases
  #     @independent_sets
  #     @dependent_sets
  #     @spanning_sets
  #     @nonspanning_sets
  #     @circuits
  #     @hyperplanes
  #   end
  # end

  def set_system_1 do
    quote do
      @ground_set_1 MapSet.new([1])
      @power_set_1 MapSet.new([
        MapSet.new([1]),
        MapSet.new([])
      ])
      @singleton_set_1 MapSet.new([
        MapSet.new([1])
      ])
      @trivial_set_1 MapSet.new([
        MapSet.new([])
      ])
      @empty_set_1 MapSet.new([])

      @bases_1a MapSet.new([
        MapSet.new([1])
      ])
      @independent_sets_1a MapSet.new([
        MapSet.new([1]),
        MapSet.new([])
      ])
      @dependent_sets_1a MapSet.new([])
      @spanning_sets_1a MapSet.new([
        MapSet.new([1])
      ])
      @nonspanning_sets_1a MapSet.new([
        MapSet.new([])
      ])
      @circuits_1a MapSet.new([])
      @hyperplanes_1a MapSet.new([
        MapSet.new([])
      ])
    end
  end

  def set_system_2 do
    quote do
      @ground_set_2 MapSet.new([1,2])
      @power_set_2 MapSet.new([
        MapSet.new([1,2]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([])
      ])
      @singleton_set_2 MapSet.new([
        MapSet.new([1])
      ])
      @trivial_set_2 MapSet.new([
        MapSet.new([])
      ])
      @empty_set_2 MapSet.new([])

      @bases_2a MapSet.new([
        MapSet.new([1])
      ])
      @independent_sets_2a MapSet.new([
        MapSet.new([1]),
        MapSet.new([])
      ])
      @dependent_sets_2a MapSet.new([
        MapSet.new([1,2]),
        MapSet.new([2])
      ])
      @spanning_sets_2a MapSet.new([
        MapSet.new([1,2]),
        MapSet.new([1])
      ])
      @nonspanning_sets_2a MapSet.new([
        MapSet.new([2]),
        MapSet.new([])
      ])
      @circuits_2a MapSet.new([
        MapSet.new([2])
      ])
      @hyperplanes_2a MapSet.new([
        MapSet.new([2])
      ])

      @bases_2b MapSet.new([
        MapSet.new([1,2])
      ])
      @independent_sets_2b MapSet.new([
        MapSet.new([1,2]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([])
      ])
      @dependent_sets_2b MapSet.new([])
      @spanning_sets_2b MapSet.new([
        MapSet.new([1,2])
      ])
      @nonspanning_sets_2b MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([])
      ])
      @circuits_2b MapSet.new([])
      @hyperplanes_2b MapSet.new([
        MapSet.new([1]),
        MapSet.new([2])
      ])
    end
  end

  def set_system_3 do
    quote do
      @ground_set_3 MapSet.new([1,2,3])
      @power_set_3 MapSet.new([
        MapSet.new([1,2,3]),
        MapSet.new([1,2]),
        MapSet.new([1,3]),
        MapSet.new([2,3]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([])
      ])
      @trivial_3 MapSet.new([
        MapSet.new([])
      ])
      @singleton_3 MapSet.new([
        MapSet.new([1])
      ])
      @good_basis_3 MapSet.new([
        MapSet.new([1,2]),
        MapSet.new([1,3]),
        MapSet.new([2,3])
      ])
      @bad_basis_3 MapSet.new([
        MapSet.new([1,2,3]),
        MapSet.new([3]),
        MapSet.new([])
      ])
      @independent_set_3 MapSet.new([
        MapSet.new([1,2]),
        MapSet.new([1,3]),
        MapSet.new([2,3]),
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([])
      ])
      @dependent_set_3 MapSet.new([
        MapSet.new([1,2,3])
      ])
      @spanning_set_3 MapSet.new([
        MapSet.new([1,2,3]),
        MapSet.new([1,2]),
        MapSet.new([1,3]),
        MapSet.new([2,3])
      ])
      @nonspanning_set_3 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3]),
        MapSet.new([])
      ])
      @circuit_3 MapSet.new([
        MapSet.new([1,2,3])
      ])
      @hyperplane_3 MapSet.new([
        MapSet.new([1]),
        MapSet.new([2]),
        MapSet.new([3])
      ])
    end
  end

  def set_system_4 do
    quote do
      @ground_set_4 MapSet.new([1,2,3,4])
    end
  end

  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture) do
       apply(__MODULE__, fixture, [])
    end
  end
end
