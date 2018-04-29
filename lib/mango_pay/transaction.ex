defmodule MangoPay.Transaction do
  @moduledoc """
  Functions for MangoPay [transaction](https://docs.mangopay.com/endpoints/v2.01/transactions#e222_the-transaction-object).
  """
  use MangoPay.Query.Base
  set_path "transactions"

  @doc """
  List all transactions.

  ## Examples
      {:ok, transactions} = MangoPay.Transaction.all

  """
  def all id, query \\ %{} do
    _all id, query
  end

  @doc """
  List all transactions.

  ## Examples
      transactions = MangoPay.Transaction.all!

  """
  def all! id, query \\ %{} do
    _all! id, query
  end

  @doc """
  List all transactions by user.

  ## Examples

      user_id           = Id of a user
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      {:ok, transactions} = MangoPay.Transaction.all_by_user(user_id, query)

  """
  def all_by_user id, query \\ %{} do
    _all [MangoPay.User.path(id), resource()], query
  end

  @doc """
  List all transactions by user.

  ## Examples

      user_id           = Id of a user
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      transactions = MangoPay.Transaction.all_by_user!(user_id, query)

  """
  def all_by_user! id, query \\ %{} do
    _all! [MangoPay.User.path(id), resource()], query
  end

  @doc """
  List all transactions by wallet.

  ## Examples

      wallet_id           = Id of a wallet
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      {:ok, transactions} = MangoPay.Transaction.all_by_wallet(wallet_id, query)

  """
  def all_by_wallet id, query \\ %{} do
    _all [MangoPay.Wallet.path(id), resource()], query
  end

  @doc """
  List all transactions by wallet.

  ## Examples

      wallet_id           = Id of a wallet
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      transactions = MangoPay.Transaction.all_by_wallet!(wallet_id, query)

  """
  def all_by_wallet! id, query \\ %{} do
    _all! [MangoPay.Wallet.path(id), resource()], query
  end

  @doc """
  List all transactions by dispute.

  ## Examples

      dispute_id           = Id of a dispute
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      {:ok, transactions} = MangoPay.Transaction.all_by_dispute(dispute_id, query)

  """
  def all_by_dispute id, query \\ %{} do
    _all [MangoPay.Dispute.path(id), resource()], query
  end

  @doc """
  List all transactions by dispute.

  ## Examples

      dispute_id           = Id of a dispute
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      transactions = MangoPay.Transaction.all_by_dispute!(dispute_id, query)

  """
  def all_by_dispute! id, query \\ %{} do
    _all! [MangoPay.Dispute.path(id), resource()], query
  end

#  @doc """
#  List all transactions by client.
#
#  ## Examples
#      client_id           = Id of a client
#      {:ok, transactions} = MangoPay.Transaction.all_by_client(client_id, query)
#
#  """
#  def all_by_client id, query \\ %{} do
#    _all [MangoPay.Client.path(id), resource()], query
#  end
#
#  @doc """
#  List all transactions by client.
#
#  ## Examples
#
#      transactions = MangoPay.Transaction.all_by_client!(client_id, query)
#
#  """
#  def all_by_client! id, query \\ %{} do
#    _all! [MangoPay.Client.path(id), resource()], query
#  end

  @doc """
  List all transactions by client wallet.

  ## Examples

      funds_type   = Funds Type like, Fees or Credit
      currency     = National currency
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      {:ok, transactions} = MangoPay.Transaction.all_by_client_wallet(funds_type, currency, query)

  """
  def all_by_client_wallet funds_type, currency, query \\ %{} do
    _all ["clients", "wallets", funds_type, currency, resource()], query
  end

  @doc """
  List all transactions by client wallet.

  ## Examples
      funds_type   = Funds Type like, Fees or Credit
      currency     = National currency
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821,
        "Status": "CREATED,FAILED",
        "Nature": "REGULAR,REFUND",
        "Type": "PAYIN,PAYOUT",
        "ResultCode": "000000,009199"
      }
      transactions = MangoPay.Transaction.all_by_client_wallet!(funds_type, currency, query)

  """
  def all_by_client_wallet! funds_type, currency, query \\ %{} do
    _all! ["clients", "wallets", funds_type, currency, resource()], query
  end

  @doc """
  List all transactions by pre authorization.

  ## Examples

      pre_authorization_id = Id of a bank_account
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      {:ok, transactions}  = MangoPay.Transaction.all_by_pre_authorization(pre_authorization_id, query)

  """
  def all_by_pre_authorization id, query \\ %{} do
    _all [MangoPay.PreAuthorization.path(id), resource()], query
  end

  @doc """
  List all transactions by pre authorization.

  ## Examples

      pre_authorization_id = Id of a bank_account
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      transactions         = MangoPay.Transaction.all_by_pre_authorization!(pre_authorization_id, query)

  """
  def all_by_pre_authorization! id, query \\ %{} do
    _all! [MangoPay.PreAuthorization.path(id), resource()], query
  end

  @doc """
  List all transactions by bank account.

  ## Examples

      bank_account_id     = Id of a bank_account
      query               = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      {:ok, transactions} = MangoPay.Transaction.all_by_bank_account(bank_account_id, query)

  """
  def all_by_bank_account id, query \\ %{} do
    _all [MangoPay.BankAccount.path(id), resource()], query
  end

  @doc """
  List all transactions by bank account.

  ## Examples

      bank_account_id   = Id of a bank_account
      query             = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      transactions      = MangoPay.Transaction.all_by_bank_account!(bank_account_id, query)

  """
  def all_by_bank_account! id, query \\ %{} do
    _all! [MangoPay.BankAccount.path(id), resource()], query
  end

  @doc """
  List all transactions by credit card.

  ## Examples

      card_id   = Id of a card
      query     = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      {:ok, transactions} = MangoPay.Transaction.all_by_card(card_id, query)

  """
  def all_by_card id, query \\ %{} do
    _all [MangoPay.Card.path(id), resource()], query
  end

  @doc """
  List all transactions by credit card.

  ## Examples

      card_id   = Id of a card
      query     = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      transactions = MangoPay.Transaction.all_by_card!(card_id, query)

  """
  def all_by_card! id, query \\ %{} do
    _all! [MangoPay.Card.path(id), resource()], query
  end

  @doc """
  List all transactions by mandate.

  ## Examples

      mandate_id   = Id of a mandate
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      {:ok, transactions} = MangoPay.Transaction.all_by_mandate(mandate_id, query)

  """
  def all_by_mandate id, query \\ %{} do
    _all [MangoPay.Mandate.path(id), resource()], query
  end

  @doc """
  List all transactions by mandate.

  ## Examples
      mandate_id   = Id of a mandate
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "Status": "CREATED,FAILED",
        "ResultCode": "000000,009199"
      }
      transactions = MangoPay.Transaction.all_by_mandate!(mandate_id, query)

  """
  def all_by_mandate! id, query \\ %{} do
    _all! [MangoPay.Mandate.path(id), resource()], query
  end
end
