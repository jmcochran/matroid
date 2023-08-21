defmodule Matroid.CircuitsMatroid do
  @required_keys ~w[ground_set circuits]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :circuits]

  alias Matroid.OrderAxioms
  alias Matroid.SetOperators
  alias Matroid.ExchangeAxioms

  defimpl Matroid do
    @spec ground_set(%Matroid.CircuitsMatroid{}) :: %MapSet{}
    def ground_set(%Matroid.CircuitsMatroid{ground_set: gs, circuits: _cs}), do: gs

    # This is incorrect
    @spec base?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def base?(%Matroid.CircuitsMatroid{ground_set: _gs, circuits: _cs} = cm, set) do
      cm |> base_sets |> MapSet.member?(set)
    end

    @spec independent?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def independent?(%Matroid.CircuitsMatroid{ground_set: gs, circuits: cs}, set) do
      MapSet.subset?(set, gs) and
        cs |> Enum.all?(fn c -> not MapSet.subset?(c, set) end)
    end

    @spec circuit?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def circuit?(%Matroid.CircuitsMatroid{ground_set: _gs, circuits: cs}, set) do
      MapSet.member?(cs, set)
    end

    def base_sets(%Matroid.CircuitsMatroid{ground_set: gs, circuits: cs} = cm) do
      cm |> independent_sets |> SetOperators.maximal
    end

    def independent_sets(%Matroid.CircuitsMatroid{ground_set: gs, circuits: _cs} = cm) do
      cm |> dependent_sets |> (fn ds -> SetOperators.opposite(gs, ds) end).()
    end

    def dependent_sets(%Matroid.CircuitsMatroid{ground_set: gs, circuits: cs}) do
      SetOperators.uppercone(gs, cs)
    end

    def circuit_sets(%Matroid.CircuitsMatroid{ground_set: _gs, circuits: cs}) do
      cs
    end
  end

  @spec new(nonempty_list(any), nonempty_list(list(any))) ::
          {:error, reason: String.t()} | {:ok, %Matroid.CircuitsMatroid{circuits: MapSet.t(), ground_set: MapSet.t()}}
  def new(gs, cs) when length(gs) > 0 do
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
