defmodule MangoPay.Mandate do
  @moduledoc """
  Functions for MangoPay [mandate](https://docs.mangopay.com/endpoints/v2.01/mandates#e230_the-mandate-object).
  """
  use MangoPay.Query.Base
  set_path "mandates"

  @doc """
  Get a mandate.

  ## Examples
      {:ok, mandate} = MangoPay.Mandate.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a mandate.

  ## Examples
      mandate = MangoPay.Mandate.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a mandate.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "BankAccountId": "14213351",
        "Culture": "EN",
        "ReturnURL": "http://www.my-site.com/returnURL/"
      }
      {:ok, mandate} = MangoPay.Mandate.create(params)

  """
  def create params do
    _create params, ["mandates", "directdebit/web"]
  end

  @doc """
  Create a mandate.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "BankAccountId": "14213351",
        "Culture": "EN",
        "ReturnURL": "http://www.my-site.com/returnURL/"
      }
      mandate = MangoPay.Mandate.create!(params)

  """
  def create! params do
    _create! params, ["mandates", "directdebit/web"]
  end

  @doc """
  List all mandates.

  ## Examples
      {:ok, mandates} = MangoPay.Mandates.all()

  """
  def all() do
    _all()
  end

  @doc """
  List all mandates.

  ## Examples
      mandates = MangoPay.Mandates.all!()

  """
  def all!() do
    _all!()
  end

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
