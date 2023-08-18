defmodule Matroid.ExchangeAxioms do
  alias Matroid.SetOperators

  def middle_basis?(%MapSet{} = ground_set, %MapSet{} = bases) do
    ground_pairs =
      ground_set
      |> SetOperators.power_set()
      |> SetOperators.inclusive_pairs()
    base_pairs = SetOperators.pairs(bases)

    for {x, y} <- ground_pairs, {a, b} <- base_pairs do
      (not MapSet.subset?(x, a)) or (not MapSet.subset?(b, y)) or
      Enum.any?(bases, fn(base) ->
        MapSet.subset?(x, base) and MapSet.subset?(base, y)
      end)
    end
    |> Enum.all?()
  end

  def weak_basis_exchange?(%MapSet{} = bases) do
    base_pairs = SetOperators.pairs(bases)

    for {a, b} <- base_pairs, member_a <- a do
      Enum.any?(b, fn(member_b) ->
        base = MapSet.delete(a, member_a)
        |> MapSet.put(member_b)

        MapSet.member?(bases, base)
      end)
    end
    |> Enum.all?()
  end

  def augmentation?(%MapSet{} = independent_sets) do
    ind_pairs = SetOperators.pairs(independent_sets)

    for {a, b} <- ind_pairs, MapSet.size(a) < MapSet.size(b) do
      MapSet.difference(b, a)
      |> Enum.any?(fn(member) ->
        MapSet.member?(independent_sets, MapSet.put(a, member))
      end)
    end
    |> Enum.all?()
  end

  def reduction?(%MapSet{} = spanning_sets) do
    span_pairs = SetOperators.pairs(spanning_sets)

    for {a, b} <- span_pairs, MapSet.size(a) > MapSet.size(b) do
      MapSet.difference(a, b)
      |> Enum.any?(fn(member) ->
        MapSet.member?(spanning_sets, MapSet.delete(a, member))
      end)
    end
    |> Enum.all?()
  end

  # non-canonical name
  def contraction?(%MapSet{} = ground_set, %MapSet{} = dependent_sets) do
    dependent_pairs = SetOperators.pairs(dependent_sets)

    for {a, b} <- dependent_pairs, x <- ground_set,
        not (MapSet.member?(dependent_sets, MapSet.intersection(a, b))) do
      MapSet.member?(dependent_sets, MapSet.union(a, b) |> MapSet.delete(x))
    end
    |> Enum.all?()
  end

  # non-canonical name
  def extension?(%MapSet{} = ground_set, %MapSet{} = nonspanning_sets) do
    nonspanning_pairs = SetOperators.pairs(nonspanning_sets)

    for {a, b} <- nonspanning_pairs, x <- ground_set,
        not (MapSet.member?(nonspanning_sets, MapSet.union(a, b))) do
      MapSet.member?(nonspanning_sets, MapSet.intersection(a, b) |> MapSet.put(x))
    end
    |> Enum.all?()
  end

  def elimination?(%MapSet{} = ground_set, %MapSet{} = circuits) do
    circuit_pairs = SetOperators.pairs(circuits)

    for {a, b} <- circuit_pairs, x <- ground_set, not MapSet.equal?(a, b) do
      ground_set |>
      Enum.any?(fn(member) ->
          MapSet.union(a, b)
          |> MapSet.delete(x)
          |> MapSet.member?(member)
      end)
    end
    |> Enum.all?()
  end

  def covering?(%MapSet{} = ground_set, %MapSet{} = hyperplanes) do
    hyperplane_pairs = SetOperators.pairs(hyperplanes)

    for {a, b} <- hyperplane_pairs, x <- ground_set, not MapSet.equal?(a, b) do
      ground_set |>
      Enum.any?(fn(member) ->
          MapSet.intersection(a, b)
          |> MapSet.put(x)
          |> MapSet.member?(member)
      end)
    end
    |> Enum.all?()
  end
end
