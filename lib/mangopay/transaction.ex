defmodule Mangopay.Transaction do
  use Mangopay.Query.Base, "transactions"
  set_action "transactions", [{:all}]

  def all_by_user id do
    _all [user(id), resource()]
  end

  def all_by_wallet id do
    _all [wallet(id), resource()]
  end

  def all_by_dispute id do
    _all [dispute(id), resource()]
  end

  def all_by_client id do
    _all [client(id), resource()]
  end

  def all_by_client_wallet funds_type, currency do
    _all ["clients", "wallets", funds_type, currency, resource()]
  end

  def all_by_pre_authorization id do
    _all [pre_authorization(id), resource()]
  end

  def all_by_bank_account id do
    _all [bank_account(id), resource()]
  end

  def all_by_card id do
    _all [card(id), resource()]
  end

  def all_by_mandate id do
    _all [mandate(id), resource()]
  end
end
