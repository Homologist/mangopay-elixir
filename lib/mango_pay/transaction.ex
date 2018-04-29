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
  def all id do
    _all id
  end

  @doc """
  List all transactions.

  ## Examples
      transactions = MangoPay.Transaction.all!

  """
  def all! id do
    _all! id
  end

  @doc """
  List all transactions by user.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_user("user_id")

  """
  def all_by_user id do
    _all [MangoPay.User.path(id), resource()]
  end

  @doc """
  List all transactions by user.

  ## Examples

      transactions = MangoPay.Transaction.all_by_user!("user_id")

  """
  def all_by_user! id do
    _all! [MangoPay.User.path(id), resource()]
  end

  @doc """
  List all transactions by wallet.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_wallet("wallet_id")

  """
  def all_by_wallet id do
    _all [MangoPay.Wallet.path(id), resource()]
  end

  @doc """
  List all transactions by wallet.

  ## Examples

      transactions = MangoPay.Transaction.all_by_wallet!("wallet_id")

  """
  def all_by_wallet! id do
    _all! [MangoPay.Wallet.path(id), resource()]
  end

  @doc """
  List all transactions by dispute.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_dispute("dispute_id")

  """
  def all_by_dispute id do
    _all [MangoPay.Dispute.path(id), resource()]
  end

  @doc """
  List all transactions by dispute.

  ## Examples

      transactions = MangoPay.Transaction.all_by_dispute!("dispute_id")

  """
  def all_by_dispute! id do
    _all! [MangoPay.Dispute.path(id), resource()]
  end

  @doc """
  List all transactions by client.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_client("client_id")

  """
  def all_by_client id do
    _all [MangoPay.Client.path(id), resource()]
  end

  @doc """
  List all transactions by client.

  ## Examples

      transactions = MangoPay.Transaction.all_by_client!("client_id")

  """
  def all_by_client! id do
    _all! [MangoPay.Client.path(id), resource()]
  end

  @doc """
  List all transactions by client wallet.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_client_wallet("funds_type", "currency")

  """
  def all_by_client_wallet funds_type, currency do
    _all ["clients", "wallets", funds_type, currency, resource()]
  end

  @doc """
  List all transactions by client wallet.

  ## Examples

      transactions = MangoPay.Transaction.all_by_client_wallet!("funds_type", "currency")

  """
  def all_by_client_wallet! funds_type, currency do
    _all! ["clients", "wallets", funds_type, currency, resource()]
  end

  @doc """
  List all transactions by pre authorization.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_pre_authorization("pre_authorization_id")

  """
  def all_by_pre_authorization id do
    _all [MangoPay.PreAuthorization.path(id), resource()]
  end

  @doc """
  List all transactions by pre authorization.

  ## Examples

      transactions = MangoPay.Transaction.all_by_pre_authorization!("pre_authorization_id")

  """
  def all_by_pre_authorization! id do
    _all! [MangoPay.PreAuthorization.path(id), resource()]
  end

  @doc """
  List all transactions by bank account.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_bank_account("bank_account_id")

  """
  def all_by_bank_account id do
    _all [MangoPay.BankAccount.path(id), resource()]
  end

  @doc """
  List all transactions by bank account.

  ## Examples

      transactions = MangoPay.Transaction.all_by_bank_account!("bank_account_id")

  """
  def all_by_bank_account! id do
    _all! [MangoPay.BankAccount.path(id), resource()]
  end

  @doc """
  List all transactions by credit card.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_card("card_id")

  """
  def all_by_card id do
    _all [MangoPay.Card.path(id), resource()]
  end

  @doc """
  List all transactions by credit card.

  ## Examples

      transactions = MangoPay.Transaction.all_by_card!("card_id")

  """
  def all_by_card! id do
    _all! [MangoPay.Card.path(id), resource()]
  end

  @doc """
  List all transactions by mandate.

  ## Examples

      {:ok, transactions} = MangoPay.Transaction.all_by_mandate("mandate_id")

  """
  def all_by_mandate id do
    _all [MangoPay.Mandate.path(id), resource()]
  end

  @doc """
  List all transactions by mandate.

  ## Examples

      transactions = MangoPay.Transaction.all_by_mandate!("mandate_id")

  """
  def all_by_mandate! id do
    _all! [MangoPay.Mandate.path(id), resource()]
  end
end
