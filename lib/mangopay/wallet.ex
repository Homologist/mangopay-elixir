defmodule Mangopay.Wallet do
  use Mangopay.Query.Base, "wallets"
  set_action "wallets", [{:get}, {:create}, {:update}]

  def all_by_user id do
    _all [user(id), wallet]
  end
end
