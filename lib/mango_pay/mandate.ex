defmodule MangoPay.Mandate do
  @moduledoc """
  Functions for MangoPay mandate.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/mandates#e230_the-mandate-object
  """
  use MangoPay.Query.Base
  set_action "mandates", [{:get}, {:create, ["mandates", "directdebit/web"]}, {:all}]

  @doc """
  Cancel a mandate object.

  ## Examples
      {:ok, mandate} = MangoPay.Mandate.cancel("mandate_id")

  """
  def cancel mandate_id do
    _update %{}, [resource(), "#{mandate_id}", "cancel"]
  end

  @doc """
  List all mandates for a user.

  ## Examples
      {:ok, mandates} = MangoPay.Mandate.all_by_user("user_id")

  """
  def all_by_user user_id, query \\ nil do
    _all [MangoPay.User.path(user_id), resource()], query
  end

  @doc """
  List all mandates for a bank account.

  ## Examples
      {:ok, mandates} = MangoPay.Mandate.all_by_bank_account("user_id", "bank_account_id")

  """
  def all_by_bank_account user_id, bank_account_id, query \\ nil do
    _all [MangoPay.User.path(user_id), MangoPay.BankAccount.path(bank_account_id), resource()], query
  end
end
