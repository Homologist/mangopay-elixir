defmodule Mangopay.Refund do
  use Mangopay.Query.Base, "refunds"
  set_action "refunds", [{:get}]

  defmodule PayIn do
    use Mangopay.Query.Base, "refunds"
    def create pay_in_id, params do
      _create params, [payin(pay_in_id), resource()]
    end
  end

  defmodule Transfer do
    use Mangopay.Query.Base, "refunds"
    def create transfer_id, params do
      _create params, [transfer(transfer_id), resource()]
    end
  end

  def all_by_pay_out id do
    _all [payout(id), resource()]
  end

  def all_by_pay_in id do
    _all [payin(id), resource()]
  end

  def all_by_transfer id do
    _all [transfer(id), resource()]
  end

  def all_by_repudiation id do
    _all [repudiation(id), resource()]
  end
end
