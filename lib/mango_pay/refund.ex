defmodule MangoPay.Refund do
  use MangoPay.Query.Base
  set_action "refunds", [{:get}]

  defmodule PayIn do
    use MangoPay.Query.Base, "refunds"
    def create pay_in_id, params do
      _create params, [MangoPay.PayIn.path(pay_in_id), resource()]
    end
  end

  defmodule Transfer do
    use MangoPay.Query.Base, "refunds"
    def create transfer_id, params do
      _create params, [MangoPay.Transfer.path(transfer_id), resource()]
    end
  end

  def all_by_pay_out id, query \\ nil do
    _all [MangoPay.PayOut.path(id), resource()], query
  end

  def all_by_pay_in id, query \\ nil do
    _all [MangoPay.PayIn.path(id), resource()], query
  end

  def all_by_transfer id, query \\ nil do
    _all [MangoPay.Transfer.path(id), resource()], query
  end

  def all_by_repudiation id, query \\ nil do
    _all [MangoPay.Repudiation.path(id), resource()], query
  end
end
