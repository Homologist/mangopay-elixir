defmodule MangoPay.Wallet do
  use MangoPay.Query.Base
  set_action "wallets", [{:get}, {:create}, {:update}]

  def all_by_user id, query \\ nil do
    _all [MangoPay.User.path(id), MangoPay.Wallet.path()], query
  end
end
