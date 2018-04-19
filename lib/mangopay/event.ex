defmodule Mangopay.Event do
  use Mangopay.Query.Base
  set_action "events", [{:all}]
end
