defmodule Mangopay.Transfer do
  use Mangopay.Query.Base, "transfers"
  set_action "transfers", [{:get}, {:create}]
end
