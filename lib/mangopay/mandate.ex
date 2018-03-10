defmodule Mangopay.Mandate do
  use Mangopay.Query.Base, "mandates"
  set_action "mandates", [{:get}, {:create, ["mandates", "directdebit/web"]}, {:all}]

  def cancel mandate_id, params do
    _update params, [resource(), "#{mandate_id}", "cancel"]
  end

  def all_by_user id do
    _all [user(id), resource()]
  end

  def all_by_user_and_bank_account user_id, bank_account_id do
    _all [user(user_id), bank_account(bank_account_id), resource()]
  end
end
