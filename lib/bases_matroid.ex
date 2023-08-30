defmodule Matroid.BasesMatroid do
  @required_keys ~w[ground_set bases]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :bases]

  alias Matroid.OrderAxioms
  alias Matroid.SetOperators
  alias Matroid.ExchangeAxioms

  defimpl Matroid do
    @spec ground_set(%Matroid.BasesMatroid{}) :: %MapSet{}
    def ground_set(%Matroid.BasesMatroid{ground_set: gs}), do: gs

    @spec base?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def base?(%Matroid.BasesMatroid{bases: bs}, set) do
      MapSet.member?(bs, set)
    end

    @spec independent?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def independent?(%Matroid.BasesMatroid{bases: bs}, set) do
      bs |> Enum.any?(fn b -> MapSet.subset?(set, b) end)
    end

    @spec dependent?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def dependent?(%Matroid.BasesMatroid{} = bm, set) do
      not independent?(bm, set)
    end

    @spec spanning?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def spanning?(%Matroid.BasesMatroid{} = bm, set) do
      bm |> spanning_sets |> MapSet.member?(set)
    end

    @spec nonspanning?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def nonspanning?(%Matroid.BasesMatroid{} = bm, set) do
      not spanning?(bm, set)
    end

    @spec circuit?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def circuit?(%Matroid.BasesMatroid{} = bm, set) do
     bm |> circuit_sets |> MapSet.member?(set)
    end

    @spec hyperplane?(%Matroid.BasesMatroid{}, %MapSet{}) :: boolean
    def hyperplane?(%Matroid.BasesMatroid{} = bm, set) do
     bm |> hyperplane_sets |> MapSet.member?(set)
    end

    def base_sets(%Matroid.BasesMatroid{bases: bs}) do
      bs
    end

    def independent_sets(%Matroid.BasesMatroid{ground_set: gs, bases: bs}) do
      SetOperators.lowercone(gs, bs)
    end

    def dependent_sets(%Matroid.BasesMatroid{ground_set: gs} = bm) do
      bm |> independent_sets |> (fn is -> SetOperators.opposite(gs, is) end).()
    end

    def spanning_sets(%Matroid.BasesMatroid{ground_set: gs, bases: bs}) do
      SetOperators.uppercone(gs, bs)
    end

    def nonspanning_sets(%Matroid.BasesMatroid{ground_set: gs} = bm) do
      bm |> spanning_sets |> (fn ss -> SetOperators.opposite(gs, ss) end).()
    end

    def circuit_sets(%Matroid.BasesMatroid{} = bm) do
      bm |> dependent_sets |> SetOperators.minimal
    end

    def hyperplane_sets(%Matroid.BasesMatroid{} = bm) do
      bm |> nonspanning_sets |> SetOperators.maximal
    end

    def to_bases(%Matroid.BasesMatroid{ground_set: gs, bases: bs}) do
      {:ok, %Matroid.BasesMatroid{ground_set: gs, bases: bs}}
    end

    def to_circuits(%Matroid.BasesMatroid{ground_set: gs} = bm) do
      {:ok, %Matroid.CircuitsMatroid{ground_set: gs, circuits: MapSet.new(bm |> circuit_sets)}}
    end
  end


  @spec new(list(any), nonempty_list(list(any))) ::
          {:error, reason: String.t()} | {:ok, %Matroid.BasesMatroid{bases: MapSet.t(), ground_set: MapSet.t()}}
  def new(gs, bs) when is_list(gs) and is_list(bs) and length(bs) > 0 do
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
