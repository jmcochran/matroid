defmodule Matroid.CircuitsMatroid do
  @required_keys ~w[ground_set circuits]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :circuits]

  alias Matroid.OrderAxioms
  alias Matroid.SetOperators
  alias Matroid.ExchangeAxioms

  defimpl Matroid do
    @spec ground_set(%Matroid.CircuitsMatroid{}) :: %MapSet{}
    def ground_set(%Matroid.CircuitsMatroid{ground_set: gs}), do: gs

    @spec base?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def base?(%Matroid.CircuitsMatroid{} = cm, set) do
      cm |> base_sets |> MapSet.member?(set)
    end

    @spec independent?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def independent?(%Matroid.CircuitsMatroid{ground_set: gs, circuits: cs}, set) do
      MapSet.subset?(set, gs) and
        cs |> Enum.all?(fn c -> not MapSet.subset?(c, set) end)
    end

    @spec dependent?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def dependent?(%Matroid.CircuitsMatroid{} = cm, set) do
      not independent?(cm, set)
    end

    @spec spanning?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def spanning?(%Matroid.CircuitsMatroid{} = cm, set) do
      cm |> spanning_sets |> MapSet.member?(set)
    end

    @spec nonspanning?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def nonspanning?(%Matroid.CircuitsMatroid{} = cm, set) do
      not spanning?(cm, set)
    end

    @spec circuit?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def circuit?(%Matroid.CircuitsMatroid{circuits: cs}, set) do
      MapSet.member?(cs, set)
    end

    @spec hyperplane?(%Matroid.CircuitsMatroid{}, %MapSet{}) :: boolean
    def hyperplane?(%Matroid.CircuitsMatroid{} = cm, set) do
      cm |> hyperplane_sets |> MapSet.member?(set)
    end

    def base_sets(%Matroid.CircuitsMatroid{} = cm) do
      cm |> independent_sets |> SetOperators.maximal
    end

    def independent_sets(%Matroid.CircuitsMatroid{ground_set: gs} = cm) do
      cm |> dependent_sets |> (fn ds -> SetOperators.opposite(gs, ds) end).()
    end

    def dependent_sets(%Matroid.CircuitsMatroid{ground_set: gs, circuits: cs}) do
      SetOperators.uppercone(gs, cs)
    end

    def spanning_sets(%Matroid.CircuitsMatroid{ground_set: gs} = cm) do
      cm |> base_sets |> (fn bs ->SetOperators.uppercone(gs, bs) end).()
    end

    def nonspanning_sets(%Matroid.CircuitsMatroid{ground_set: gs} = cm) do
      cm |> spanning_sets |> (fn ss -> SetOperators.opposite(gs, ss) end).()
    end

    def circuit_sets(%Matroid.CircuitsMatroid{circuits: cs}) do
      cs
    end

    def hyperplane_sets(%Matroid.CircuitsMatroid{} = cm) do
      cm |> nonspanning_sets |> SetOperators.maximal
    end

    def to_bases(%Matroid.CircuitsMatroid{ground_set: gs} = cm) do
      {:ok, %Matroid.BasesMatroid{ground_set: gs, bases: MapSet.new(cm |> base_sets)}}
    end

    def to_circuits(%Matroid.CircuitsMatroid{ground_set: gs, circuits: cs}) do
      {:ok, %Matroid.CircuitsMatroid{ground_set: gs, circuits: cs}}
    end
  end

  @spec new(list(any), list(list(any))) ::
          {:error, reason: String.t()} | {:ok, %Matroid.CircuitsMatroid{circuits: MapSet.t(), ground_set: MapSet.t()}}
  def new(gs, cs) when is_list(gs) and is_list(cs) do
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
