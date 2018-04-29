defmodule MangoPay.ClientWallet do
  @moduledoc """
  Functions for MangoPay client [wallets](https://docs.mangopay.com/endpoints/v2.01/client-wallets#e271_the-client-wallet-object).
  """
  use MangoPay.Query.Base
  set_path "clients/wallets"

  @doc """
  All a client wallets.

  ## Examples

      {:ok, client_wallets} = MangoPay.ClientWallet.all

  """
  def all(query \\ %{}) do
    _all(nil, query)
  end

  @doc """
  All a client wallets.

  ## Examples

      client_wallets = MangoPay.ClientWallet.all!

  """
  def all!(query \\ %{}) do
    _all!(nil, query)
  end

  @doc """
  All a client wallet by fund type.

  ## Examples

      {:ok, client_wallet} = MangoPay.ClientWallet.get_by_funds_type(funds_type, query)

  """
  def all_by_funds_type(funds_type, query \\ %{}) do
    _all [resource(), "#{funds_type}"], query
  end

  @doc """
  All a client wallet by fund type.

  ## Examples

      client_wallet = MangoPay.ClientWallet.get_by_funds_type!(funds_type, query)

  """
  def all_by_funds_type! funds_type, query \\ %{} do
    _all! [resource(), "#{funds_type}"], query
  end

  @doc """
  Get a client wallet by fund type and currency.

  ## Examples

      {:ok, client_wallet} = MangoPay.ClientWallet.get_by_funds_type_and_currency("funds_type", "currency")

  """
  def get_by_funds_type_and_currency funds_type, currency_iso_code do
    _get [resource(), "#{funds_type}", "#{currency_iso_code}"]
  end

  @doc """
  Get a client wallet by fund type and currency.

  ## Examples

      client_wallet = MangoPay.ClientWallet.get_by_funds_type_and_currency!("funds_type", "currency")

  """
  def get_by_funds_type_and_currency! funds_type, currency_iso_code do
    _get! [resource(), "#{funds_type}", "#{currency_iso_code}"]
  end
end
