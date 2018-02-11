defmodule Mangopay.Event do
  use Mangopay.Query.Base, "events"
  set_action "events", [{:all}]
end
