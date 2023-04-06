defmodule Matroid.BasesMatroid do
  @required_keys ~w[ground_set bases]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :bases]

  alias Matroid.OrderAxioms
  alias Matroid.ExchangeAxioms

  defimpl Matroid do
    @spec includes?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def includes?(%Matroid.BasesMatroid{ground_set: _gs, bases: bs}, set) do
      MapSet.member?(bs, set)
    end
    @spec ground_set(%Matroid.BasesMatroid{}) :: %MapSet{}
    def ground_set(%Matroid.BasesMatroid{ground_set: gs, bases: _bs}), do: gs
  end


  @spec new(nonempty_list(any), nonempty_list(list(any))) ::
          {:error, reason: String.t()} | {:ok, %Matroid.BasesMatroid{bases: MapSet.t(), ground_set: MapSet.t()}}
  def new(gs, bs) when length(gs) > 0 and length(bs) > 0 do
    with gs_set <- MapSet.new(gs),
         bs_set <- MapSet.new(bs |> Enum.map(fn b -> MapSet.new(b) end)),
         true <- OrderAxioms.antichain?(bs_set),
         true <- ExchangeAxioms.middle_basis?(gs_set, bs_set)
    do
      {:ok, %Matroid.BasesMatroid{ground_set: gs_set, bases: bs_set}}
    else
      _ -> {:error, "BasesMatroid validation failure"}
    end
  end

  def new(_gs, _bs) do
    {:error, "BasesMatroid validation failure"}
  end
end
