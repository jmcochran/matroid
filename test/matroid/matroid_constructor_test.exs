defmodule MatroidConstructorTest do
  use ExUnit.Case, async: true
  use Matroid.UniformSetFixtures, [
    :uniform_set_system_1_2,
    :uniform_set_system_2_2,
    :uniform_set_system_1_3,
    :uniform_set_system_2_3,
    :uniform_set_system_3_3
  ]
  alias Matroid.CircuitsMatroid
  alias Matroid.BasesMatroid

  setup_all do
    %{
      circuit_matroid_u12: CircuitsMatroid.new(@ground_set_u12 |> MapSet.to_list, @circuits_u12 |> MapSet.to_list),
      bases_matroid_u12: BasesMatroid.new(@ground_set_u12 |> MapSet.to_list, @bases_u12 |> MapSet.to_list),

      circuit_matroid_u22: CircuitsMatroid.new(@ground_set_u22 |> MapSet.to_list, @circuits_u22 |> MapSet.to_list),
      bases_matroid_u22: BasesMatroid.new(@ground_set_u22 |> MapSet.to_list, @bases_u22 |> MapSet.to_list),

      circuit_matroid_u13: CircuitsMatroid.new(@ground_set_u13 |> MapSet.to_list, @circuits_u13 |> MapSet.to_list),
      bases_matroid_u13: BasesMatroid.new(@ground_set_u13 |> MapSet.to_list, @bases_u13 |> MapSet.to_list),

      circuit_matroid_u23: CircuitsMatroid.new(@ground_set_u23 |> MapSet.to_list, @circuits_u23 |> MapSet.to_list),
      bases_matroid_u23: BasesMatroid.new(@ground_set_u23 |> MapSet.to_list, @bases_u23 |> MapSet.to_list),

      circuit_matroid_u33: CircuitsMatroid.new(@ground_set_u33 |> MapSet.to_list, @circuits_u33 |> MapSet.to_list),
      bases_matroid_u33: BasesMatroid.new(@ground_set_u33 |> MapSet.to_list, @bases_u33 |> MapSet.to_list)
    }
  end

  for {mat_type, matroid} <- [
    {CircuitsMatroid, :circuits_matroid_u12},
    {BasesMatroid, :bases_matroid_u12},
    {CircuitsMatroid, :circuits_matroid_u22},
    {BasesMatroid, :bases_matroid_u22},
    {CircuitsMatroid, :circuits_matroid_u13},
    {BasesMatroid, :bases_matroid_u13},
    {CircuitsMatroid, :circuits_matroid_u23},
    {BasesMatroid, :bases_matroid_u23},
    {CircuitsMatroid, :circuits_matroid_u33},
    {BasesMatroid, :bases_matroid_u33},
  ] do
    setup do
      %{
        mat_type: unquote(mat_type),
        matroid: unquote(matroid)
      }
    end
    describe "#{mat_type} new/2, #{matroid}" do
      test "matroid creation", context do
        mt = context[:mat_type]
        mat = context[context[:matroid]]
        assert {:ok, %^mt{}} = mat
      end
    end
  end
end
