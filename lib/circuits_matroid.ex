defmodule Matroid.CircuitsMatroid do
  @required_keys ~w[ground_set circuits]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :circuits]

  defimpl Matroid do
    @spec includes?(%Matroid.CircuitsMatroid{}, any) :: boolean
    def includes?(%Matroid.CircuitsMatroid{ground_set: _gs, circuits: cs}, set), do: set in cs
    @spec ground_set(%Matroid.CircuitsMatroid{}) :: any
    def ground_set(%Matroid.CircuitsMatroid{ground_set: gs, circuits: _cs}), do: gs
  end

  def new(gs, cs) when is_list(gs) and is_list(cs) do
    # TODO: add validations
    %Matroid.CircuitsMatroid{ground_set: gs, circuits: cs}
  end
end
