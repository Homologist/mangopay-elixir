defmodule Mangopay.Transfer do
  use Mangopay.Query.Base
  set_action "transfers", [{:get}, {:create}]
end
