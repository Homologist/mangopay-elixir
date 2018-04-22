defmodule MangoPay.Event do
  @moduledoc """
  Functions for MangoPay [event](https://docs.mangopay.com/endpoints/v2.01/events#e251_the-event-object).
  """
  use MangoPay.Query.Base
  set_path "events"

  @doc """
  List all disputes.

  ## Examples
      {:ok, events} = MangoPay.Event.all()

  """
  def all() do
    _all()
  end

  @doc """
  List all disputes.

  ## Examples
      events = MangoPay.Event.all!()

  """
  def all!() do
    _all!()
  end
end
