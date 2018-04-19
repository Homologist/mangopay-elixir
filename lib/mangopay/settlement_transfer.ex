defmodule Mangopay.SettlementTransfer do
  use Mangopay.Query.Base
  set_action "settlements", [{:get}]

  def create id, params do
    _create params, [Mangopay.Repudiation.path(id), "settlementtransfer"]
  end
end
