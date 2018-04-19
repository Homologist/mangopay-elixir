defmodule Mangopay.Dispute do
  use Mangopay.Query.Base
  set_action "disputes", [{:get}, {:update}, {:all}]

  def close id do
    _update %{}, id
  end

  def submit id, params do
    _update params, resource_submit(id)
  end

  def resubmit id do
    _update %{}, resource_submit(id)
  end

  def all_by_user id, query \\ nil do
    _all [Mangopay.User.path(id), resource()], query
  end

  def all_by_wallet id, query \\ nil do
    _all [Mangopay.Wallet.path(id), resource()], query
  end

  def all_by_pending_settlement query \\ nil do
    _all [resource(), "pendingsettlement"], query
  end

  defp resource_submit(id) do
    [resource(id), "submit"]
  end
end
