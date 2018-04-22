defmodule MangoPay.SettlementTransfer do
  @moduledoc """
  Functions for MangoPay settlement transfer.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/settlement-transfers#e237_the-settlement-transfer-object
  """
  use MangoPay.Query.Base
  set_action "settlements", [{:get}]

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
end
