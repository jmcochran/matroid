defmodule BasesMatroid do
  @required_keys ~w[ground_set bases]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :bases]

  defimpl Matroid do
    # TODO: fix this implementation
    def includes(%BasesMatroid{ground_set: _gs, bases: bs}, set), do: set in bs
    def ground_set(%BasesMatroid{ground_set: gs, bases: _bs}), do: gs
  end

  def new(gs, bs) when is_list(gs) and is_list(bs) do
    %BasesMatroid{ground_set: gs, bases: bs}
  end
end
