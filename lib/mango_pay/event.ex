defmodule MangoPay.Event do
  @moduledoc """
  Functions for MangoPay event.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/events#e251_the-event-object
  """
  use MangoPay.Query.Base
  set_action "events", [{:all}]
end
