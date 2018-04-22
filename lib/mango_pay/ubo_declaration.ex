defmodule MangoPay.UboDeclaration do
  @moduledoc """
  Functions for MangoPay [ubo declaration](https://docs.mangopay.com/endpoints/v2.01/ubo-declarations#e918_the-ubo-declaration-object).
  """
  use MangoPay.Query.Base
  set_action "ubodeclarations", [{:get}, {:update}, {:all}]

  @doc """
  Create a ubo declaration.

  ## Examples
      params                 = %{
        "Tag": "custom meta",
        "DeclaredUBOs": [ "8494514" ]
      }
      {:ok, ubo_declaration} = MangoPay.UboDeclaration.create("ubo_declaration_id", params)

  """
  def create(id, params) do
    _create params, ["users", id, "ubodeclarations"]
  end
end
