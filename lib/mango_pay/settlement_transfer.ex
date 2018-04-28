defmodule MangoPay.SettlementTransfer do
  @moduledoc """
  Functions for MangoPay [settlement transfer](https://docs.mangopay.com/endpoints/v2.01/settlement-transfers#e237_the-settlement-transfer-object).
  """
  use MangoPay.Query.Base
  set_path "settlements"

  @doc """
  Get a settlement_transfer.

  ## Examples
      {:ok, settlement_transfer} = MangoPay.SettlementTransfer.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a settlement_transfer.

  ## Examples
      settlement_transfer = MangoPay.SettlementTransfer.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Get a client object.

  ## Examples
      params                     = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Fees": %{
          "Currency": "EUR",
          "Amount": 12
        }
      }
      {:ok, settlement_transfer} = MangoPay.SettlementTransfer.create("settlement_transfer_id", params)

  """
  def create id, params do
    _create params, [MangoPay.Repudiation.path(id), "settlementtransfer"]
  end

  @doc """
  Get a client object.

  ## Examples
      params                     = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Fees": %{
          "Currency": "EUR",
          "Amount": 12
        }
      }
      settlement_transfer = MangoPay.SettlementTransfer.create!("settlement_transfer_id", params)

  """
  def create! id, params do
    _create! params, [MangoPay.Repudiation.path(id), "settlementtransfer"]
  end
end
