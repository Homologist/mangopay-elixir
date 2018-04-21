defmodule MangoPay.Transfer do
  use MangoPay.Query.Base
  set_action "transfers", [{:get}, {:create}]
end
