defmodule Matroid.OrderAxioms do
  alias Matroid.SetOperators

  def antichain?(%MapSet{} = subsets) do
    for a <- subsets, b <- subsets do
      MapSet.equal?(a,b) || not MapSet.subset?(a,b)
    end
    |> Enum.all?()
  end

  def descending?(%MapSet{} = subsets) do
    for a <- subsets, b <- SetOperators.power_set(a) do
      MapSet.member?(subsets, b)
    end
    |> Enum.all?
  end

  def ascending?(%MapSet{} = ground_set, %MapSet{} = subsets) do
    for a <- subsets, b <- SetOperators.power_set(ground_set), MapSet.subset?(a, b) do
      MapSet.member?(subsets, b)
    end
    |> Enum.all?
  end
end
