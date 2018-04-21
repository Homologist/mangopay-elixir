defmodule MangoPay.Event do
  use MangoPay.Query.Base
  set_action "events", [{:all}]
end
