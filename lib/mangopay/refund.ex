defmodule Mangopay.Refund do
  use Mangopay.Query.Base
  set_action "refunds", [{:get}]

  defmodule PayIn do
    use Mangopay.Query.Base, "refunds"
    def create pay_in_id, params do
      _create params, [Mangopay.PayIn.path(pay_in_id), resource()]
    end
  end

  defmodule Transfer do
    use Mangopay.Query.Base, "refunds"
    def create transfer_id, params do
      _create params, [Mangopay.Transfer.path(transfer_id), resource()]
    end
  end

  def all_by_pay_out id, query \\ nil do
    _all [Mangopay.PayOut.path(id), resource()], query
  end

  def all_by_pay_in id, query \\ nil do
    _all [Mangopay.PayIn.path(id), resource()], query
  end

  def all_by_transfer id, query \\ nil do
    _all [Mangopay.Transfer.path(id), resource()], query
  end

  def all_by_repudiation id, query \\ nil do
    _all [Mangopay.Repudiation.path(id), resource()], query
  end
end
