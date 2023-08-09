defmodule Matroid.CircuitsMatroid do
  @required_keys ~w[ground_set circuits]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :circuits]

  alias Matroid.OrderAxioms
  alias Matroid.ExchangeAxioms

  defimpl Matroid do
    @spec includes?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def includes?(%Matroid.CircuitsMatroid{ground_set: _gs, circuits: cs}, set) do
      MapSet.member?(cs, set)
    end
    @spec ground_set(%Matroid.CircuitsMatroid{}) :: %MapSet{}
    def ground_set(%Matroid.CircuitsMatroid{ground_set: gs, circuits: _cs}), do: gs
  end

  @spec new(nonempty_list(any), nonempty_list(list(any))) ::
          {:error, reason: String.t()} | {:ok, %Matroid.CircuitsMatroid{circuits: MapSet.t(), ground_set: MapSet.t()}}
  def new(gs, cs) when length(gs) > 0 and length(cs) > 0 do
    with gs_set <- MapSet.new(gs),
         cs_set <- MapSet.new(cs |> Enum.map(fn c -> MapSet.new(c) end)),
         false <- MapSet.member?(cs_set, MapSet.new([])),
         true <- OrderAxioms.antichain?(cs_set),
         true <- ExchangeAxioms.elimination?(gs_set, cs_set)
    do
      {:ok, %Matroid.CircuitsMatroid{ground_set: gs_set, circuits: cs_set}}
    else
      _ -> {:error, "CircuitsMatroid validation failure"}
    end
  end

  def new(_gs, _bs) do
    {:error, "CircuitsMatroid validation failure"}
  end
end
