defmodule MangoPay.Dispute do
  @moduledoc """
  Functions for MangoPay [dispute](https://docs.mangopay.com/endpoints/v2.01/disputes#e176_the-dispute-object) object.
  """
  use MangoPay.Query.Base
  set_path "disputes"

  @doc """
  Get a dispute.

  ## Examples
      {:ok, dispute} = MangoPay.Dispute.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a dispute.

  ## Examples
      dispute = MangoPay.Dispute.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Update a dispute.

  ## Examples
      params         = %{
        "Tag": "custom meta"
      }
      {:ok, dispute} = MangoPay.Dispute.update(id, params)

  """
  def update id, params do
    _update params, id
  end

  @doc """
  Update a dispute.

  ## Examples
      params  = %{
        "Tag": "custom meta"
      }
      dispute = MangoPay.Dispute.update(id, params)

  """
  def update! id, params do
    _update! params, id
  end

  @doc """
  Close a dispute.

  ## Examples

      {:ok, dispute} = MangoPay.Dispute.close("dispute_id")

  """
  def close id do
    _update %{}, id
  end

  @doc """
  Close a dispute.

  ## Examples

      dispute = MangoPay.Dispute.close!("dispute_id")

  """
  def close! id do
    _update! %{}, id
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
  Submit a dispute.

  ## Examples
      params  = %{
          "ContestedFunds": %{
            "Currency": "EUR",
            "Amount": 12
        }
      }
      dispute = MangoPay.Dispute.submit!("dispute_id", params)

  """
  def submit! id, params do
    _update! params, resource_submit(id)
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
  Resubmit a dispute.

  ## Examples

      dispute = MangoPay.Dispute.resubmit!("dispute_id")

  """
  def resubmit! id do
    _update! %{}, resource_submit(id)
  end

  @doc """
  List all disputes.

  ## Examples
      query           = %{
                          "Page": 1,
                          "Per_Page": 25,
                          "Sort": "CreationDate:DESC",
                          "BeforeDate": 1463440221,
                          "AfterDate": 1431817821,
                          "DisputeType": "CONTESTABLE,RETRIEVAL",
                          "Status": "CREATED, SUCCEEDED"
                        }
      {:ok, disputes} = MangoPay.Dispute.all(query)

  """
  def all(query \\ %{}) do
    _all(nil, query)
  end

  @doc """
  List all disputes.

  ## Examples

      query    = %{
                   "Page": 1,
                   "Per_Page": 25,
                   "Sort": "CreationDate:DESC",
                   "BeforeDate": 1463440221,
                   "AfterDate": 1431817821,
                   "DisputeType": "CONTESTABLE,RETRIEVAL",
                   "Status": "CREATED, SUCCEEDED"
                 }
      disputes = MangoPay.Dispute.all(query)

  """
  def all!(query \\ %{}) do
    _all!(nil, query)
  end

  @doc """
  All disputes for user.

  ## Examples

      query          = %{
                         "Page": 1,
                         "Per_Page": 25,
                         "Sort": "CreationDate:DESC",
                         "BeforeDate": 1463440221,
                         "AfterDate": 1431817821,
                         "DisputeType": "CONTESTABLE,RETRIEVAL",
                         "Status": "CREATED, SUCCEEDED"
                       }
      {:ok, dispute} = MangoPay.Dispute.all_by_user("user_id", query)

  """
  def all_by_user id, query \\ %{} do
    _all [MangoPay.User.path(id), resource()], query
  end

  @doc """
  All disputes for user.

  ## Examples

      query   = %{
                  "Page": 1,
                  "Per_Page": 25,
                  "Sort": "CreationDate:DESC",
                  "BeforeDate": 1463440221,
                  "AfterDate": 1431817821,
                  "DisputeType": "CONTESTABLE,RETRIEVAL",
                  "Status": "CREATED, SUCCEEDED"
                }
      dispute = MangoPay.Dispute.all_by_user!("user_id", query)

  """
  def all_by_user! id, query \\ %{} do
    _all! [MangoPay.User.path(id), resource()], query
  end

  @doc """
  All disputes for a wallet.

  ## Examples

      query          = %{
                         "Page": 1,
                         "Per_Page": 25,
                         "Sort": "CreationDate:DESC",
                         "BeforeDate": 1463440221,
                         "AfterDate": 1431817821,
                         "DisputeType": "CONTESTABLE,RETRIEVAL",
                         "Status": "CREATED, SUCCEEDED"
                       }
      {:ok, dispute} = MangoPay.Dispute.all_by_wallet(wallet_id, query)

  """
  def all_by_wallet id, query \\ %{} do
    _all [MangoPay.Wallet.path(id), resource()], query
  end

  @doc """
  All disputes for a wall!et.

  ## Examples

      query   = %{
                  "Page": 1,
                  "Per_Page": 25,
                  "Sort": "CreationDate:DESC",
                  "BeforeDate": 1463440221,
                  "AfterDate": 1431817821,
                  "DisputeType": "CONTESTABLE,RETRIEVAL",
                  "Status": "CREATED, SUCCEEDED"
                }
      dispute = MangoPay.Dispute.all_by_wallet!(query)

  """
  def all_by_wallet! id, query \\ %{} do
    _all! [MangoPay.Wallet.path(id), resource()], query
  end

  @doc """
  All disputes for that need settling.

  ## Examples

      query          = %{
                         "Page": 1,
                         "Per_Page": 25,
                         "Sort": "CreationDate:DESC",
                         "BeforeDate": 1463440221,
                         "AfterDate": 1431817821,
                         "DisputeType": "CONTESTABLE,RETRIEVAL",
                         "Status": "CREATED, SUCCEEDED"
                       }
      {:ok, dispute} = MangoPay.Dispute.all_by_pending_settlement(query)

  """
  def all_by_pending_settlement(query \\ %{}) do
    _all [resource(), "pendingsettlement"], query
  end

  @doc """
  All disputes for that need settling.

  ## Examples

      query           = %{
                          "Page": 1,
                          "Per_Page": 25,
                          "Sort": "CreationDate:DESC",
                          "BeforeDate": 1463440221,
                          "AfterDate": 1431817821,
                          "DisputeType": "CONTESTABLE,RETRIEVAL",
                          "Status": "CREATED, SUCCEEDED"
                        }
      dispute = MangoPay.Dispute.all_by_pending_settlement!(query)

  """
  def all_by_pending_settlement!(query \\ %{}) do
    _all! [resource(), "pendingsettlement"], query
  end

  defp resource_submit(id) do
    [resource(id), "submit"]
  end
end
