defmodule Mangopay.ClientWallet do
  use Mangopay.Query.Base, "clients/wallets"
  set_action "client/wallets", [{:get}, {:all}]

  def get funds_type, currency_iso_code do
    _get [resource, "#{currency_iso_code}", "#{funds_type}"]
  end
end
