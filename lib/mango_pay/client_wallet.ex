defmodule MangoPay.ClientWallet do
  @moduledoc """
  Functions for MangoPay client wallets.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/client-wallets#e271_the-client-wallet-object
  """
  use MangoPay.Query.Base
  set_action "clients/wallets", [{:all}]

  @doc """
  All a client wallet by fund type.

  ## Examples

      {:ok, client_wallet} = MangoPay.ClientWallet.get_by_funds_type("funds_type")

  """
  def all_by_funds_type funds_type do
    _get [resource(), "#{funds_type}"]
  end

  @doc """
  Get a client wallet by fund type and currency.

  ## Examples

      {:ok, client_wallet} = MangoPay.ClientWallet.get_by_funds_type_and_currency("funds_type", "currency")

  """
  def get_by_funds_type_and_currency funds_type, currency_iso_code do
    _get [resource(), "#{funds_type}", "#{currency_iso_code}"]
  end
end
