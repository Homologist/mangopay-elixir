defmodule MangoPay.Wallet do
  @moduledoc """
  Functions for MangoPay [wallet](https://docs.mangopay.com/endpoints/v2.01/wallets#e20_the-wallet-object).
  """
  use MangoPay.Query.Base
  set_path "wallets"

  @doc """
  Get a wallet.

  ## Examples
      {:ok, wallet} = MangoPay.Wallet.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a wallet.

  ## Examples
      wallet = MangoPay.Wallet.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a wallet.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Owners": [ "8494514" ],
        "Description": "My big project",
        "Currency": "EUR"
      }
      {:ok, wallet} = MangoPay.Wallet.create(params)

  """
  def create params do
    _create params
  end

  @doc """
  Create a wallet.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Owners": [ "8494514" ],
        "Description": "My big project",
        "Currency": "EUR"
      }
      wallet = MangoPay.Wallet.create!(params)

  """
  def create! params do
    _create! params
  end

  @doc """
  Update a wallet.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Description": "My big project"
      }
      {:ok, wallet} = MangoPay.Wallet.update(id, params)

  """
  def update id, params do
    _update params, id
  end

  @doc """
  Update a wallet.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Description": "My big project"
      }
      wallet = MangoPay.Wallet.update!(id, params)

  """
  def update! id, params do
    _update! params, id
  end


  @doc """
  List all wallets by user.

  ## Examples

      user_id = Id of a user
      query   = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      {:ok, wallets} = MangoPay.Wallet.all_by_user!(user_id, query)

  """
  def all_by_user id, query \\ %{} do
    _all [MangoPay.User.path(id), MangoPay.Wallet.path()], query
  end

  @doc """
  List all wallets by user.

  ## Examples
      user_id = Id of a user
      query   = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      wallets = MangoPay.Wallet.all_by_user!(user_id, query)

  """
  def all_by_user! id, query \\ %{} do
    _all! [MangoPay.User.path(id), MangoPay.Wallet.path()], query
  end
end
