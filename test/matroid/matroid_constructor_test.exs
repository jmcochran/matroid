defmodule MatroidConstructorTest do
  use ExUnit.Case, async: true
  use Matroid.UniformSetFixtures, [
    :uniform_set_system_1_2,
    :uniform_set_system_2_2,
    :uniform_set_system_1_3,
    :uniform_set_system_2_3,
    :uniform_set_system_3_3
  ]
  use Matroid.ProjectiveSetFixtures, [
    :projective_set_system_1_2,
    :projective_set_system_2_2
  ]
  use Matroid.TinyMatroidSetFixtures, [
    :tiny_matroid_set_system_0_0,
    :tiny_matroid_set_system_1_0,
    :tiny_matroid_set_system_1_1,
    :tiny_matroid_set_system_2_0,
    :tiny_matroid_set_system_2_1,
    :tiny_matroid_set_system_2_2,
    :tiny_matroid_set_system_2_3
  ]

  alias Matroid.CircuitsMatroid
  alias Matroid.BasesMatroid

  setup_all do
    %{
      circuits_matroid_u12: CircuitsMatroid.new(@ground_set_u12 |> MapSet.to_list, @circuits_u12 |> MapSet.to_list),
      bases_matroid_u12: BasesMatroid.new(@ground_set_u12 |> MapSet.to_list, @bases_u12 |> MapSet.to_list),
      circuits_matroid_u22: CircuitsMatroid.new(@ground_set_u22 |> MapSet.to_list, @circuits_u22 |> MapSet.to_list),
      bases_matroid_u22: BasesMatroid.new(@ground_set_u22 |> MapSet.to_list, @bases_u22 |> MapSet.to_list),
      circuits_matroid_u13: CircuitsMatroid.new(@ground_set_u13 |> MapSet.to_list, @circuits_u13 |> MapSet.to_list),
      bases_matroid_u13: BasesMatroid.new(@ground_set_u13 |> MapSet.to_list, @bases_u13 |> MapSet.to_list),
      circuits_matroid_u23: CircuitsMatroid.new(@ground_set_u23 |> MapSet.to_list, @circuits_u23 |> MapSet.to_list),
      bases_matroid_u23: BasesMatroid.new(@ground_set_u23 |> MapSet.to_list, @bases_u23 |> MapSet.to_list),
      circuits_matroid_u33: CircuitsMatroid.new(@ground_set_u33 |> MapSet.to_list, @circuits_u33 |> MapSet.to_list),
      bases_matroid_u33: BasesMatroid.new(@ground_set_u33 |> MapSet.to_list, @bases_u33 |> MapSet.to_list),
      circuits_matroid_p12: CircuitsMatroid.new(@ground_set_p12 |> MapSet.to_list, @circuits_p12 |> MapSet.to_list),
      bases_matroid_p12: BasesMatroid.new(@ground_set_p12 |> MapSet.to_list, @bases_p12 |> MapSet.to_list),
      circuits_matroid_p22: CircuitsMatroid.new(@ground_set_p22 |> MapSet.to_list, @circuits_p22 |> MapSet.to_list),
      bases_matroid_p22: BasesMatroid.new(@ground_set_p22 |> MapSet.to_list, @bases_p22 |> MapSet.to_list),
      circuits_matroid_t00: CircuitsMatroid.new(@ground_set_t00 |> MapSet.to_list, @circuits_t00 |> MapSet.to_list),
      bases_matroid_t00: BasesMatroid.new(@ground_set_t00 |> MapSet.to_list, @bases_t00 |> MapSet.to_list),
      circuits_matroid_t10: CircuitsMatroid.new(@ground_set_t10 |> MapSet.to_list, @circuits_t10 |> MapSet.to_list),
      bases_matroid_t10: BasesMatroid.new(@ground_set_t10 |> MapSet.to_list, @bases_t10 |> MapSet.to_list),
      circuits_matroid_t11: CircuitsMatroid.new(@ground_set_t11 |> MapSet.to_list, @circuits_t11 |> MapSet.to_list),
      bases_matroid_t11: BasesMatroid.new(@ground_set_t11 |> MapSet.to_list, @bases_t11 |> MapSet.to_list),
      circuits_matroid_t20: CircuitsMatroid.new(@ground_set_t20 |> MapSet.to_list, @circuits_t20 |> MapSet.to_list),
      bases_matroid_t20: BasesMatroid.new(@ground_set_t20 |> MapSet.to_list, @bases_t20 |> MapSet.to_list),
      circuits_matroid_t21: CircuitsMatroid.new(@ground_set_t21 |> MapSet.to_list, @circuits_t21 |> MapSet.to_list),
      bases_matroid_t21: BasesMatroid.new(@ground_set_t21 |> MapSet.to_list, @bases_t21 |> MapSet.to_list),
      circuits_matroid_t22: CircuitsMatroid.new(@ground_set_t22 |> MapSet.to_list, @circuits_t22 |> MapSet.to_list),
      bases_matroid_t22: BasesMatroid.new(@ground_set_t22 |> MapSet.to_list, @bases_t22 |> MapSet.to_list),
      circuits_matroid_t23: CircuitsMatroid.new(@ground_set_t23 |> MapSet.to_list, @circuits_t23 |> MapSet.to_list),
      bases_matroid_t23: BasesMatroid.new(@ground_set_t23 |> MapSet.to_list, @bases_t23 |> MapSet.to_list)
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
    {CircuitsMatroid, :circuits_matroid_p12},
    {BasesMatroid, :bases_matroid_p12},
    {CircuitsMatroid, :circuits_matroid_p22},
    {BasesMatroid, :bases_matroid_p22},
    {CircuitsMatroid, :circuits_matroid_t00},
    {BasesMatroid, :bases_matroid_t00},
    {CircuitsMatroid, :circuits_matroid_t10},
    {BasesMatroid, :bases_matroid_t10},
    {CircuitsMatroid, :circuits_matroid_t11},
    {BasesMatroid, :bases_matroid_t11},
    {CircuitsMatroid, :circuits_matroid_t20},
    {BasesMatroid, :bases_matroid_t20},
    {CircuitsMatroid, :circuits_matroid_t21},
    {BasesMatroid, :bases_matroid_t21},
    {CircuitsMatroid, :circuits_matroid_t22},
    {BasesMatroid, :bases_matroid_t22},
    {CircuitsMatroid, :circuits_matroid_t23},
    {BasesMatroid, :bases_matroid_t23}
  ] do
    describe "#{mat_type} new/2, #{matroid}" do
      setup do
        %{mat_type: unquote(mat_type), matroid: unquote(matroid)}
      end
      test "matroid creation", context do
        mt = context[:mat_type]
        mat = context[context[:matroid]]
        assert {:ok, %^mt{}} = mat
      end
    end
  end
end
