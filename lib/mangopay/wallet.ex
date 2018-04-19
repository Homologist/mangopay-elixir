defmodule Mangopay.Wallet do
  use Mangopay.Query.Base
  set_action "wallets", [{:get}, {:create}, {:update}]

  def all_by_user id, query \\ nil do
    _all [Mangopay.User.path(id), Mangopay.Wallet.path()], query
  end
end
