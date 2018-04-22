defmodule MangoPay.PayOut do
  @moduledoc """
  Functions for MangoPay [pay out](https://docs.mangopay.com/endpoints/v2.01/payouts#e227_the-payout-object).
  """
  use MangoPay.Query.Base
  set_action "payouts", [{:get}, {:create, ["payouts", "bankwire"]}]

  @doc """
  Get a pay_out.

  ## Examples
      {:ok, pay_out} = MangoPay.PayOut.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a pay_out.

  ## Examples
      pay_out = MangoPay.PayOut.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a pay out.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Fees": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "BankAccountId": "14213351",
        "DebitedWalletId": "8519987",
        "BankWireRef": "invoice 7282"
      }
      {:ok, pay_out} = MangoPay.PayOut.create(params)

  """
  def create params do
    _create params
  end

  @doc """
  Create a pay out.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Fees": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "BankAccountId": "14213351",
        "DebitedWalletId": "8519987",
        "BankWireRef": "invoice 7282"
      }
      pay_out = MangoPay.PayOut.create!(params)

  """
  def create! params do
    _create! params
  end
end
