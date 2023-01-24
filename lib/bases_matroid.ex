defmodule BasesMatroid do
  @required_keys ~w[ground_set bases]a
  @enforce_keys @required_keys
  defstruct [:ground_set, :bases]

  defimpl Matroid do
    # TODO: fix this implementation
    @spec includes?(%BasesMatroid{}, %MapSet{}) :: boolean
    def includes?(%BasesMatroid{ground_set: _gs, bases: bs}, set), do: set in bs
    @spec ground_set(%BasesMatroid{}) :: any
    def ground_set(%BasesMatroid{ground_set: gs, bases: _bs}), do: gs
  end

  @spec new(nonempty_list(%MapSet{}), nonempty_list(%MapSet{})) :: %BasesMatroid{
          ground_set: nonempty_list(%MapSet{}),
          bases: nonempty_list(%MapSet{})
        }
  def new(gs, bs) when is_list(gs) and is_list(bs) do
    # TODO: add validations
    %BasesMatroid{ground_set: gs, bases: bs}
  end
end
