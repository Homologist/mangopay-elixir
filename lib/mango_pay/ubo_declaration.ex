defmodule MangoPay.UboDeclaration do
  @moduledoc """
  Functions for MangoPay [ubo declaration](https://docs.mangopay.com/endpoints/v2.01/ubo-declarations#e918_the-ubo-declaration-object).
  """
  use MangoPay.Query.Base
  set_path "ubodeclarations"

  @doc """
  Get a ubo declaration.

  ## Examples
      {:ok, ubo_declaration} = MangoPay.UboDeclaration.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a ubo declaration.

  ## Examples
      ubo_declaration = MangoPay.UboDeclaration.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Update a ubo declaration.

  ## Examples
      params          = %{
        "Id": "8494514",
        "CreationDate": 12926321,
        "Tag": "custom meta",
        "UserId": "8494514",
        "Status": "CREATED",
        "RefusedReasonTypes": [ "INVALID_UBO_DETAILS" ],
        "RefusedReasonMessage": "blabla",
        "DeclaredUBOs": [ "8494514" ]
      }
      {:ok, ubo_declaration} = MangoPay.UboDeclaration.update(id, params)

  """
  def update id, params do
    _update params, id
  end

  @doc """
  Update a ubo declaration.

  ## Examples
      params          = %{
        "Id": "8494514",
        "CreationDate": 12926321,
        "Tag": "custom meta",
        "UserId": "8494514",
        "Status": "CREATED",
        "RefusedReasonTypes": [ "INVALID_UBO_DETAILS" ],
        "RefusedReasonMessage": "blabla",
        "DeclaredUBOs": [ "8494514" ]
      }
      ubo_declaration = MangoPay.UboDeclaration.update(id, params)

  """
  def update! id, params do
    _update! params, id
  end

  @doc """
  List all ubo declarations.

  ## Examples
      {:ok, ubo_declarations} = MangoPay.UboDeclaration.all()

  """
  def all() do
    _all()
  end

  @doc """
  List all ubo declarations.

  ## Examples
      ubo_declarations = MangoPay.UboDeclaration.all!()

  """
  def all!() do
    _all!()
  end

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
