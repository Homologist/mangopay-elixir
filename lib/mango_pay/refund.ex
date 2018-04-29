defmodule MangoPay.Refund do
  @moduledoc """
  Functions for MangoPay [refund](https://docs.mangopay.com/endpoints/v2.01/refunds#e316_the-refund-object).
  """
  use MangoPay.Query.Base
  set_path "refunds"

  @doc """
  Get a refund.

  ## Examples
      {:ok, refund} = MangoPay.Refund.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a refund.

  ## Examples
      refund = MangoPay.Refund.get!(id)

  """
  def get! id do
    _get! id
  end

  defmodule PayIn do
    @moduledoc """
    Functions for MangoPay [refund](https://docs.mangopay.com/endpoints/v2.01/refunds#e316_the-refund-object).
    """
    use MangoPay.Query.Base, "refunds"

    @doc """
    Create a refund for a pay in.

    ## Examples
        pay_in_id      = Id of a transfer
        params        = %{
          "Tag": "custom meta",
          "AuthorId": "8494514",
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 12
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 12
          }
        }
        {:ok, refund} = MangoPay.Refund.PayIn.create(pay_in_id, params)

    """
    def create pay_in_id, params do
      _create params, [MangoPay.PayIn.path(pay_in_id), resource()]
    end

    @doc """
    Create a refund for a pay in.

    ## Examples
        pay_in_id = Id of a transfer
        params    = %{
          "Tag": "custom meta",
          "AuthorId": "8494514",
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 12
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 12
          }
        }
        refund    = MangoPay.Refund.PayIn.create(pay_in_id, params)

    """
    def create! pay_in_id, params do
      _create! params, [MangoPay.PayIn.path(pay_in_id), resource()]
    end
  end

  defmodule Transfer do
    @moduledoc """
    Functions for MangoPay [refund](https://docs.mangopay.com/endpoints/v2.01/refunds#e316_the-refund-object).
    """
    use MangoPay.Query.Base, "refunds"
    @doc """
    Create a refund for a transfer.

    ## Examples
        transfer_id   = Id of a transfer
        params        = %{
          "Tag": "custom meta",
          "AuthorId": "8494514"
        }
        {:ok, refund} = MangoPay.Refund.Transfer.create(transfer_id, params)

    """
    def create transfer_id, params do
      _create params, [MangoPay.Transfer.path(transfer_id), resource()]
    end

    @doc """
    Create a refund for a transfer.

    ## Examples
        transfer_id   = Id of a transfer
        params        = %{
          "Tag": "custom meta",
          "AuthorId": "8494514"
        }
        refund = MangoPay.Refund.Transfer.create!(transfer_id, params)

    """
    def create! transfer_id, params do
      _create! params, [MangoPay.Transfer.path(transfer_id), resource()]
    end
  end

  @doc """
  List all refund by pay out.

  ## Examples
      pay_out_id    = Id of a transfer
      query         = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      {:ok, refund} = MangoPay.Refund.all_by_pay_out(pay_out_id, query)

  """
  def all_by_pay_out id, query \\ %{} do
    _all [MangoPay.PayOut.path(id), resource()], query
  end

  @doc """
  List all refund by pay out.

  ## Examples
      pay_out_id = Id of a transfer
      query      = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      refund     = MangoPay.Refund.all_by_pay_out!(pay_out_id, query)

  """
  def all_by_pay_out! id, query \\ %{} do
    _all! [MangoPay.PayOut.path(id), resource()], query
  end

  @doc """
  List all refunds by pay in.

  ## Examples
      pay_in_id      = Id of a transfer
      query          = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      {:ok, refunds} = MangoPay.Refund.all_by_pay_in(pay_in_id, query)

  """
  def all_by_pay_in id, query \\ %{} do
    _all [MangoPay.PayIn.path(id), resource()], query
  end

  @doc """
  List all refunds by pay in.

  ## Examples
      pay_in_id      = Id of a transfer
      query          = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      refunds        = MangoPay.Refund.all_by_pay_in!(pay_in_id, query)

  """
  def all_by_pay_in! id, query \\ %{} do
    _all! [MangoPay.PayIn.path(id), resource()], query
  end

  @doc """
  List all refunds by transfer.

  ## Examples
      transfer_id    = Id of a transfer
      query          = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      {:ok, refunds} = MangoPay.Refund.all_by_transfer(transfer_id, query)

  """
  def all_by_transfer id, query \\ %{} do
    _all [MangoPay.Transfer.path(id), resource()], query
  end

  @doc """
  List all refunds by transfer.

  ## Examples
      transfer_id = Id of a transfer
      query       = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      refunds     = MangoPay.Refund.all_by_transfer!(transfer_id, query)

  """
  def all_by_transfer! id, query \\ %{} do
    _all! [MangoPay.Transfer.path(id), resource()], query
  end

  @doc """
  List all refunds by repudiation.

  ## Examples
      repudiation_id = Id of a repudiation
      query          = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      {:ok, refunds} = MangoPay.Refund.all_by_repudiation(repudiation_id, query)

  """
  def all_by_repudiation id, query \\ %{} do
    _all [MangoPay.Repudiation.path(id), resource()], query
  end

  @doc """
  List all refunds by repudiation.

  ## Examples
      repudiation_id = Id of a repudiation
      query          = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      refunds        = MangoPay.Refund.all_by_repudiation!(repudiation_id, query)

  """
  def all_by_repudiation! id, query \\ %{} do
    _all! [MangoPay.Repudiation.path(id), resource()], query
  end
end
