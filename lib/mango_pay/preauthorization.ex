defmodule MangoPay.PreAuthorization do
  @moduledoc """
  Functions for MangoPay preauthorization.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/preauthorizations#e183_the-preauthorization-object
  """
  use MangoPay.Query.Base
  set_action "preauthorizations", [{:get}, {:create, "/card/direct"}]

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
  List all preauthorizations for a credit card.

  ## Examples

      {:ok, preauthorizations} = MangoPay.PreAuthorization.all_by_card("card_id")

  """
  def all_by_card id, query \\ nil do
    _all [MangoPay.Card.path(id), resource()], query
  end

  @doc """
  List all preauthorizations for a user.

  ## Examples

      {:ok, preauthorizations} = MangoPay.PreAuthorization.all_by_user("user_id")

  """
  def all_by_user id, query \\ nil do
    _all [MangoPay.User.path(id), resource()], query
  end
end
