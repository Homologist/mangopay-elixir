defmodule Mangopay.Transaction do
  use Mangopay.Query.Base
  set_action "transactions", [{:all}]

  def all_by_user id, query \\ nil do
    _all [Mangopay.User.path(id), resource()], query
  end

  def all_by_wallet id, query \\ nil do
    _all [Mangopay.Wallet.path(id), resource()], query
  end

  def all_by_dispute id, query \\ nil do
    _all [Mangopay.Dispute.path(id), resource()], query
  end

  def all_by_client id, query \\ nil do
    _all [Mangopay.Client.path(id), resource()], query
  end

  def all_by_client_wallet funds_type, currency, query \\ nil do
    _all ["clients", "wallets", funds_type, currency, resource()], query
  end

  def all_by_pre_authorization id, query \\ nil do
    _all [Mangopay.PreAuthorization.path(id), resource()], query
  end

  def all_by_bank_account id, query \\ nil do
    _all [Mangopay.BankAccount.path(id), resource()], query
  end

  def all_by_card id, query \\ nil do
    _all [Mangopay.Card.path(id), resource()], query
  end

  def all_by_mandate id, query \\ nil do
    _all [Mangopay.Mandate.path(id), resource()], query
  end
end
