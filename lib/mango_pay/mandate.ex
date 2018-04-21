defmodule MangoPay.Mandate do
  use MangoPay.Query.Base
  set_action "mandates", [{:get}, {:create, ["mandates", "directdebit/web"]}, {:all}]

  def cancel mandate_id, params do
    _update params, [resource(), "#{mandate_id}", "cancel"]
  end

  def all_by_user id, query \\ nil do
    _all [MangoPay.User.path(id), resource()], query
  end

  def all_by_user_and_bank_account user_id, bank_account_id, query \\ nil do
    _all [MangoPay.User.path(user_id), MangoPay.BankAccount.path(bank_account_id), resource()], query
  end
end
