defmodule IndependenceMatroid do
  @required_keys ~w[ground_set independent_sets]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :independent_sets]

  defimpl Matroid do
    # TODO: fix this implementation
    @spec includes?(%IndependenceMatroid{}, %MapSet{}) :: boolean
    def includes?(%IndependenceMatroid{ground_set: _gs, independent_sets: iss}, set) do
      iss |> Enum.reduce(false, fn (is, acc) -> acc or (set |> MapSet.subset?(is)) end)
    end
    @spec ground_set(%IndependenceMatroid{}) :: any
    def ground_set(%IndependenceMatroid{ground_set: gs, independent_sets: _is}), do: gs
  end

  @spec new(MapSet.t(), MapSet.t()) ::
          {:error} | {:ok, %IndependenceMatroid{ground_set: map, independent_sets: map}}
  def new(gs, is) do
    # TODO: add validations
    with is_members <- is |> Enum.reduce(fn(set, acc) -> MapSet.union(set, acc) end),
         true <- is_members |> MapSet.subset?(gs)
    do
      {:ok, %IndependenceMatroid{ground_set: gs, independent_sets: is}}
    else
      _ -> {:error}
    end
  end
end
