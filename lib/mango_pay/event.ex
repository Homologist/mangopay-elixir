defmodule MangoPay.Event do
  @moduledoc """
  Functions for MangoPay [event](https://docs.mangopay.com/endpoints/v2.01/events#e251_the-event-object).
  """
  use MangoPay.Query.Base
  set_path "events"

  @doc """
  List all disputes.

  ## Examples
      query         = %{
                        "Page": 1,
                        "Per_Page": 25,
                        "Sort": "CreationDate:DESC",
                        "BeforeDate": 1463440221,
                        "AfterDate": 1431817821,
                        "EventType": "PAYIN_NORMAL_CREATED"
      }
      {:ok, events} = MangoPay.Event.all(query)

  """
  def all(query \\ %{}) do
    _all(nil, query)
  end

  @doc """
  List all disputes.

  ## Examples
      query  = %{
                 "Page": 1,
                 "Per_Page": 25,
                 "Sort": "CreationDate:DESC",
                 "BeforeDate": 1463440221,
                 "AfterDate": 1431817821,
                 "EventType": "PAYIN_NORMAL_CREATED"
      }
      events = MangoPay.Event.all!(query)

  """
  def all!(query \\ %{}) do
    _all!(nil, query)
  end
end
