defmodule MangoPay.SettlementTransfer do
  use MangoPay.Query.Base
  set_action "settlements", [{:get}]

  def create id, params do
    _create params, [MangoPay.Repudiation.path(id), "settlementtransfer"]
  end
end
