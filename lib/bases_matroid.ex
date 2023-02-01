defmodule BasesMatroid do
  @required_keys ~w[ground_set bases]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :bases]

  defimpl Matroid do
    # TODO: fix this implementation
    @spec includes?(%BasesMatroid{}, %MapSet{}) :: boolean
    def includes?(%BasesMatroid{ground_set: _gs, bases: bs}, set) do
      bs |> Enum.reduce(false, fn (b, acc) -> acc or (set |> MapSet.subset?(MapSet.new(b))) end)
    end
    @spec ground_set(%BasesMatroid{}) :: any
    def ground_set(%BasesMatroid{ground_set: gs, bases: _bs}), do: gs
  end


  @spec new(nonempty_list(any), nonempty_list(list(any))) ::
          {:error} | {:ok, %BasesMatroid{bases: MapSet.t(), ground_set: MapSet.t()}}
  def new(gs, bs) when length(gs) > 0 and length(bs) > 0 do
    with gs_set <- MapSet.new(gs),
         bs_set <- MapSet.new(bs |> Enum.map(fn b -> MapSet.new(b) end))
    do
      {:ok, %BasesMatroid{ground_set: gs_set, bases: bs_set}}
    else
      _ -> {:error}
    end
  end
end
