defmodule CircuitsMatroid do
  @required_keys ~w[ground_set circuits]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :circuits]

  defimpl Matroid do
    # TODO: fix this implementation
    def includes(%CircuitsMatroid{ground_set: _gs, circuits: bs}, set), do: set in bs
    def ground_set(%CircuitsMatroid{ground_set: gs, circuits: _bs}), do: gs
  end

  def new(gs, cs) when is_list(gs) and is_list(cs) do
    %CircuitsMatroid{ground_set: gs, circuits: cs}
  end
end
