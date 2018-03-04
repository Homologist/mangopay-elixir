defmodule Mangopay.SettlementTransfer do
  use Mangopay.Query.Base, "settlements"
  set_action "settlements", [{:get}]

  def create id, params do
    _create params, [repudiation(id), "settlementtransfer"]
  end
end
