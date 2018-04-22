defmodule MangoPay.Transfer do
  @moduledoc """
  Functions for MangoPay [transfer](https://docs.mangopay.com/endpoints/v2.01/transfers#e224_the-transfer-object) object.
  """
  use MangoPay.Query.Base
  set_path "transfers"

  @doc """
  Get a transfer.

  ## Examples
      {:ok, transfer} = MangoPay.Transfer.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a transfer.

  ## Examples
      transfer = MangoPay.Transfer.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a transfer.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "CreditedUserId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Fees": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "DebitedWalletId": "8519987",
        "CreditedWalletId": "8494559"
      }
      {:ok, transfer} = MangoPay.Transfer.create(params)

  """
  def create params do
    _create params
  end

  @doc """
  Create a transfer.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "CreditedUserId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Fees": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "DebitedWalletId": "8519987",
        "CreditedWalletId": "8494559"
      }
      transfer = MangoPay.Transfer.create!(params)

  """
  def create! params do
    _create! params
  end
end
