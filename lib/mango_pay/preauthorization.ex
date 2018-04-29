defmodule MangoPay.PreAuthorization do
  @moduledoc """
  Functions for MangoPay [pre authorization](https://docs.mangopay.com/endpoints/v2.01/preauthorizations#e183_the-preauthorization-object).
  """
  use MangoPay.Query.Base
  set_path "preauthorizations"

  @doc """
  Get a preauthorization.

  ## Examples
      {:ok, preauthorization} = MangoPay.PreAuthorization.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a preauthorization.

  ## Examples
      preauthorization = MangoPay.PreAuthorization.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a preauthorization.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Billing": %{
          "Address": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
            "Country": "FR"
          }
        },
        "SecureMode": "DEFAULT",
        "CardId": "14213157",
        "SecureModeReturnURL": "http://www.my-site.com/returnURL"
      }
      {:ok, preauthorization} = MangoPay.PreAuthorization.create(params)

  """
  def create params do
    _create params, "/card/direct"
  end

  @doc """
  Create a preauthorization.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "AuthorId": "8494514",
        "DebitedFunds": %{
          "Currency": "EUR",
          "Amount": 12
        },
        "Billing": %{
          "Address": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
            "Country": "FR"
          }
        },
        "SecureMode": "DEFAULT",
        "CardId": "14213157",
        "SecureModeReturnURL": "http://www.my-site.com/returnURL"
      }
      preauthorization = MangoPay.PreAuthorization.create!(params)

  """
  def create! params do
    _create! params, "/card/direct"
  end

  @doc """
  Cancel a preauthorization.

  ## Examples
      params                  = %{
        "Tag": "custom meta",
        "PaymentStatus": "CANCELED"
      }
      {:ok, preauthorization} = MangoPay.PreAuthorization.cancel("preauthorization_id", params)

  """
  def cancel id, params do
    _update params, id
  end

  @doc """
  Cancel a preauthorization.

  ## Examples
      params                  = %{
        "Tag": "custom meta",
        "PaymentStatus": "CANCELED"
      }
      preauthorization = MangoPay.PreAuthorization.cancel!("preauthorization_id", params)

  """
  def cancel! id, params do
    _update! params, id
  end

  @doc """
  List all preauthorizations for a credit card.

  ## Examples

      {:ok, preauthorizations} = MangoPay.PreAuthorization.all_by_card("card_id")

  """
  def all_by_card id do
    _all [MangoPay.Card.path(id), resource()]
  end

  @doc """
  List all preauthorizations for a credit card.

  ## Examples

      preauthorizations = MangoPay.PreAuthorization.all_by_card!("card_id")

  """
  def all_by_card! id do
    _all! [MangoPay.Card.path(id), resource()]
  end

  @doc """
  List all preauthorizations for a user.

  ## Examples

      {:ok, preauthorizations} = MangoPay.PreAuthorization.all_by_user("user_id")

  """
  def all_by_user id do
    _all [MangoPay.User.path(id), resource()]
  end

  @doc """
  List all preauthorizations for a user.

  ## Examples

      preauthorizations = MangoPay.PreAuthorization.all_by_user!("user_id")

  """
  def all_by_user! id do
    _all! [MangoPay.User.path(id), resource()]
  end
end
