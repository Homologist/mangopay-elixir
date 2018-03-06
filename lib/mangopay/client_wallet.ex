defmodule Mangopay.ClientWallet do
  use Mangopay.Query.Base, "clients/wallets"
  set_action "client/wallets", [{:all}]

  def get_by_funds_type funds_type do
    _get [resource, "#{funds_type}"]
  end

  def get_by_funds_type_and_currency funds_type, currency_iso_code do
    _get [resource, "#{funds_type}", "#{currency_iso_code}"]
  end
end
