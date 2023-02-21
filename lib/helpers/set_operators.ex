defmodule Matroid.SetOperators do
  @spec power_set(MapSet.t()) :: any
  def power_set(%MapSet{} = set) do
    Enum.reduce(set, MapSet.new([MapSet.new([])]), fn(member, acc) ->
      MapSet.union(acc, Enum.into(Enum.map(acc, &MapSet.put(&1, member)), %MapSet{}))
    end)
  end

  @spec pairs(MapSet.t()) :: list
  def pairs(%MapSet{} = set) do
    set
    |> Enum.flat_map(&Enum.reduce(set, [], fn(mem, acc) -> [{mem, &1} | acc] end))
  end

  @spec inclusive_pairs(MapSet.t()) :: list
  def inclusive_pairs(%MapSet{} = set) do
    set
    |> pairs()
    |> Enum.filter(fn({a ,b}) -> MapSet.subset?(a, b) end)
  end

  @spec strict_inclusive_pairs(MapSet.t()) :: list
  def strict_inclusive_pairs(%MapSet{} = set) do
    set
    |> inclusive_pairs()
    |> Enum.reject(fn({a ,b}) -> MapSet.equal?(a, b) end)
  end
end
