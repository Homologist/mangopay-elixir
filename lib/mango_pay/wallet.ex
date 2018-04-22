defmodule MangoPay.Wallet do
  @moduledoc """
  Functions for MangoPay [wallet](https://docs.mangopay.com/endpoints/v2.01/wallets#e20_the-wallet-object).
  """
  use MangoPay.Query.Base
  set_action "wallets", [{:get}, {:create}, {:update}]

  @doc """
  List all wallets by user.

  ## Examples

      {:ok, wallets} = MangoPay.Wallet.all_by_user("wallet_id")

  """
  def all_by_user id, query \\ nil do
    _all [MangoPay.User.path(id), MangoPay.Wallet.path()], query
  end
end
