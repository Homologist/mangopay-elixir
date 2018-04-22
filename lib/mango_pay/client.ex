defmodule MangoPay.Client do
  @moduledoc """
  Functions for MangoPay [client](https://docs.mangopay.com/endpoints/v2.01/clients#e200_the-client-object).
  """
  use MangoPay.Query.Base, "clients"

  @doc """
  Get a client object.

  ## Examples

      {:ok, client} = MangoPay.Client.get("client_id")

  """
  def get do
    _get nil
  end

  @doc """
  Update a client.

  ## Examples
      params        = {
        "PrimaryButtonColour": "#508c4a",
        "PrimaryThemeColour": "#d0ae5f",
        "AdminEmails": [ "support@mangopay.com" ],
        "TechEmails": [ "support@mangopay.com" ],
        "BillingEmails": [ "support@mangopay.com" ],
        "FraudEmails": [ "support@mangopay.com" ],
        "HeadquartersAddress": {
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "TaxNumber": "FR52BSSS",
        "PlatformType": "MARKETPLACE",
        "PlatformDescription": "We are a marketplace specialised in rare flipflops for Europe and America. ",
        "PlatformURL": "https://www.mangopay.com"
      }
      {:ok, client} = MangoPay.Client.update(params)

  """
  def update params do
    _update(params, nil)
  end

  @doc """
  Update logo of client.
  The base64 encoded file which needs to be uploaded

  ## Examples

      {:ok, client} = MangoPay.Client.update_logo(%{File: "blablaha"})

  """
  def update_logo params do
    _update params, nil
  end
end
