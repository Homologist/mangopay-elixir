defmodule MangoPay.Repudiation do
  @moduledoc """
  Functions for MangoPay [repudiation](https://docs.mangopay.com/endpoints/v2.01/repudiations#e221_the-repudiation-object).
  """
  use MangoPay.Query.Base
  set_path "repudiations"

  @doc """
  Get a repudiation.

  ## Examples
      {:ok, repudiation} = MangoPay.Repudiation.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a repudiation.

  ## Examples
      repudiation = MangoPay.Repudiation.get!(id)

  """
  def get! id do
    _get! id
  end
end
