defmodule Mangopay.Dispute do
  use Mangopay.Query.Base, "disputes"
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

  def all_by_user id do
    _all [user(id), resource()]
  end

  def all_by_wallet id do
    _all [wallet(id), resource()]
  end

  def all_by_pending_settlement do
    _all [resource(), "pendingsettlement"]
  end

  defp resource_submit(id) do
    [resource(id), "submit"]
  end
end
