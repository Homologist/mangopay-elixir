defmodule MangoPay.BankAccount do
  @moduledoc """
  Functions for MangoPay [bank account](https://docs.mangopay.com/endpoints/v2.01/bank-accounts#e24_the-bankaccount-object) API.
  """
  use MangoPay.Query.Base, "bankaccounts"

  @doc """
  Get a bank account of a user.

  ## Examples

      {:ok, client} = MangoPay.BankAccount.get_by_user("user_id")

  """
  def get_by_user user_id, bank_account_id do
    _get user_resource(user_id, bank_account_id)
  end

  @doc """
  Get a bank account of a user.

  ## Examples

      client = MangoPay.BankAccount.get_by_user!("user_id")

  """
  def get_by_user! user_id, bank_account_id do
    _get! user_resource(user_id, bank_account_id)
  end

  @doc """
  Create a iban bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "IBAN": "FR7630004000031234567890143",
        "BIC": "CRLYFRPP"
      }
      {:ok, bank_account} = MangoPay.BankAccount.create_iban("user_id", params)

  """
  def create_iban user_id, params do
    _create params, user_resource(user_id, "iban")
  end

  @doc """
  Create a iban bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "IBAN": "FR7630004000031234567890143",
        "BIC": "CRLYFRPP"
      }
      bank_account = MangoPay.BankAccount.create_iban!("user_id", params)

  """
  def create_iban! user_id, params do
    _create! params, user_resource(user_id, "iban")
  end

  @doc """
  Create a US bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "AccountNumber": "11696419",
        "ABA": "071000288",
        "DepositAccountType": "CHECKING"
      }
      {:ok, bank_account} = MangoPay.BankAccount.create_us("user_id", params)

  """
  def create_us id, params do
    _create params, user_resource(id, "us")
  end

  @doc """
  Create a US bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "AccountNumber": "11696419",
        "ABA": "071000288",
        "DepositAccountType": "CHECKING"
      }
      bank_account = MangoPay.BankAccount.create_us!("user_id", params)

  """
  def create_us! id, params do
    _create! params, user_resource(id, "us")
  end

  @doc """
  Create a CA bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "BranchCode": "00152",
        "InstitutionNumber": "614",
        "AccountNumber": "11696419",
        "BankName": "The Big Bank"
      }
      {:ok, bank_account} = MangoPay.BankAccount.create_ca("user_id", params)

  """
  def create_ca id, params do
    _create params, user_resource(id, "ca")
  end

  @doc """
  Create a CA bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "BranchCode": "00152",
        "InstitutionNumber": "614",
        "AccountNumber": "11696419",
        "BankName": "The Big Bank"
      }
      bank_account = MangoPay.BankAccount.create_ca!("user_id", params)

  """
  def create_ca! id, params do
    _create! params, user_resource(id, "ca")
  end

  @doc """
  Create a GB bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "SortCode": "010039",
        "AccountNumber": "11696419"
      }
      {:ok, bank_account} = MangoPay.BankAccount.create_gb("user_id", params)

  """
  def create_gb id, params do
    _create params, user_resource(id, "gb")
  end

  @doc """
  Create a GB bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "SortCode": "010039",
        "AccountNumber": "11696419"
      }
      bank_account = MangoPay.BankAccount.create_gb!("user_id", params)

  """
  def create_gb! id, params do
    _create! params, user_resource(id, "gb")
  end

  @doc """
  Create an other type of bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "Country": "FR",
        "BIC": "CRLYFRPP",
        "AccountNumber": "11696419"
      }
      {:ok, bank_account} = MangoPay.BankAccount.create_other("user_id", params)

  """
  def create_other id, params do
    _create params, user_resource(id, "other")
  end

  @doc """
  Create an other type of bank account.

  ## Examples
      params              = %{
        "Tag": "custom meta",
        "OwnerAddress": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "OwnerName": "Joe Blogs",
        "Country": "FR",
        "BIC": "CRLYFRPP",
        "AccountNumber": "11696419"
      }
      bank_account = MangoPay.BankAccount.create_other!("user_id", params)

  """
  def create_other! id, params do
    _create! params, user_resource(id, "other")
  end

  @doc """
  List all bank account for a user.

  ## Examples

      {:ok, bank_accounts} = MangoPay.BankAccount.all_by_user("user_id")

  """
  def all_by_user id do
    _all [MangoPay.User.path(id), resource()]
  end

  @doc """
  List all bank account for a user.

  ## Examples

      bank_accounts = MangoPay.BankAccount.all_by_user!("user_id")

  """
  def all_by_user! id do
    _all! [MangoPay.User.path(id), resource()]
  end

  @doc """
  Deactivate a bank account of a user.

  ## Examples
      params              = %{
        "Active": false
      }
      {:ok, bank_account} = MangoPay.BankAccount.deactivate("user_id", "bank_account", params)

  """
  def deactivate user_id, bank_account_id, params do
    _update params, user_resource(user_id, bank_account_id)
  end

  @doc """
  Deactivate a bank account of a user.

  ## Examples
      params              = %{
        "Active": false
      }
      {:ok, bank_account} = MangoPay.BankAccount.deactivate("user_id", "bank_account", params)

  """
  def deactivate! user_id, bank_account_id, params do
    _update! params, user_resource(user_id, bank_account_id)
  end
end
