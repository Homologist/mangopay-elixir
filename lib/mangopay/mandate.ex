defmodule Mangopay.Mandate do
  use Mangopay.Query.Base
  set_action "mandates", [{:get}, {:create, ["mandates", "directdebit/web"]}, {:all}]

  def cancel mandate_id, params do
    _update params, [resource(), "#{mandate_id}", "cancel"]
  end

  def all_by_user id, query \\ nil do
    _all [Mangopay.User.path(id), resource()], query
  end

  def all_by_user_and_bank_account user_id, bank_account_id, query \\ nil do
    _all [Mangopay.User.path(user_id), Mangopay.BankAccount.path(bank_account_id), resource()], query
  end
end
