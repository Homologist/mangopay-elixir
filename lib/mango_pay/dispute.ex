defmodule MangoPay.Dispute do
  @moduledoc """
  Functions for MangoPay [dispute](https://docs.mangopay.com/endpoints/v2.01/disputes#e176_the-dispute-object) object.
  """
  use MangoPay.Query.Base
  set_action "disputes", [{:get}, {:update}, {:all}]

  @doc """
  Close a dispute.

  ## Examples

      {:ok, dispute} = MangoPay.Dispute.close("dispute_id")

  """
  def close id do
    _update %{}, id
  end

  @doc """
  Submit a dispute.

  ## Examples
      params         = %{
          "ContestedFunds": %{
            "Currency": "EUR",
            "Amount": 12
        }
      }
      {:ok, dispute} = MangoPay.Dispute.submit("dispute_id", params)

  """
  def submit id, params do
    _update params, resource_submit(id)
  end

  @doc """
  Resubmit a dispute.

  ## Examples

      {:ok, dispute} = MangoPay.Dispute.resubmit("dispute_id")

  """
  def resubmit id do
    _update %{}, resource_submit(id)
  end

  @doc """
  All disputes for user.

  ## Examples

      {:ok, dispute} = MangoPay.Dispute.all_by_user("user_id")

  """
  def all_by_user id, query \\ nil do
    _all [MangoPay.User.path(id), resource()], query
  end

  @doc """
  All disputes for a wallet.

  ## Examples

      {:ok, dispute} = MangoPay.Dispute.all_by_wallet("user_id")

  """
  def all_by_wallet id, query \\ nil do
    _all [MangoPay.Wallet.path(id), resource()], query
  end

  @doc """
  All disputes for that need settling.

  ## Examples

      {:ok, dispute} = MangoPay.Dispute.all_by_pending_settlement()

  """
  def all_by_pending_settlement do
    _all [resource(), "pendingsettlement"]
  end

  defp resource_submit(id) do
    [resource(id), "submit"]
  end
end
