defmodule MangoPay.BankAccount do
  use MangoPay.Query.Base, "bankaccounts"

  def get_by_user user_id, bank_account_id do
    _get user_resource(user_id, bank_account_id)
  end

  def create_iban id, params do
    _create params, user_resource(id, "iban")
  end

  def create_us id, params do
    _create params, user_resource(id, "us")
  end

  def create_ca id, params do
    _create params, user_resource(id, "ca")
  end

  def create_gb id, params do
    _create params, user_resource(id, "gb")
  end

  def create_other id, params do
    _create params, user_resource(id, "other")
  end

  def all_by_user id, query \\ nil do
    _all [MangoPay.User.path(id), resource()], query
  end

  def deactivate id, bank_account_id, params do
    _update params, user_resource(id, bank_account_id)
  end
end
