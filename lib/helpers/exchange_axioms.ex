defmodule Matroid.ExchangeAxioms do
  alias Matroid.SetOperators

  def middle_basis(%MapSet{} = ground_set, %MapSet{} = bases) do
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
end
