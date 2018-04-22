defmodule MangoPay.Card do
  @moduledoc """
  Functions for MangoPay [credit cards](https://docs.mangopay.com/endpoints/v2.01/cards#e177_the-card-registration-object).
  """

  alias MangoPay.User, as: User
  alias MangoPay.Transaction, as: Transaction

  use MangoPay.Query.Base
  set_path "cards"

  @doc """
  Get a card object.

  ## Examples

      {:ok, card} = MangoPay.Card.get("card_id")

  """
  def get id do
    _get id
  end

  @doc """
  Get a card object.

  ## Examples

      card = MangoPay.Card.get!("card_id")

  """
  def get! id do
    _get! id
  end

  @doc """
  Get a card registration object.

  ## Examples

      {:ok, card} = MangoPay.Card.get_registration("card_id")

  """
  def get_registration id do
    _get ["cardregistrations", id]
  end

  @doc """
  Create a card registration object.

  ## Examples

      {:ok, card} = MangoPay.Card.create("params")

  """
  def create params do
    _create params, ["cardregistrations"]
  end

  @doc """
  Create a card registration object.

  ## Examples
      params      = %{
        "Tag": "custom meta",
        "UserId": "8494514",
        "Currency": "EUR",
        "CardType": "CB_VISA_MASTERCARD"
      }
      {:ok, card} = MangoPay.Card.update("id", "params")

  """
  def update id, params do
    _update params, ["cardregistrations", id]
  end

  @doc """
  All card by card fingerprint.

  ## Examples

      {:ok, card} = MangoPay.Card.all_by_fingerprint("fingerprint")

  """
  def all_by_fingerprint id, query \\ nil do
    _all [resource(), "fingerprints", id], query
  end

  @doc """
  All cards for a user.

  ## Examples

      {:ok, card} = MangoPay.Card.all_by_user("user_id")

  """
  def all_by_user id, query \\ nil do
    _all [User.path(), id, resource()], query
  end

  @doc """
  All users by card fingerprint.

  ## Examples

      {:ok, card} = MangoPay.Card.all_by_fingerprint("fingerprint")

  """
  def all_user_by_fingerprint fingerprint, query \\ nil do
    _all [resource(), "fingerprints", fingerprint, User.path()], query
  end

  @doc """
  Deactivate a card for a user.

  ## Examples

      {:ok, card} = MangoPay.Card.deactivate("card_id", %{Active: false})

  """
  def deactivate id, params do
    _update params, id
  end

  @doc """
  All transactions for a card fingerprint.

  ## Examples

      {:ok, card} = MangoPay.Card.all_transactions_by_fingerprint("fingerprint")

  """
  def all_transactions_by_fingerprint fingerprint, query \\ nil do
    _all [resource(), "fingerprints", "#{fingerprint}", Transaction.path()], query
  end
end
