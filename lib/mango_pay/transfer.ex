defmodule MangoPay.Transfer do
  @moduledoc """
  Functions for MangoPay [transfer](https://docs.mangopay.com/endpoints/v2.01/transfers#e224_the-transfer-object) object.
  """
  use MangoPay.Query.Base
  set_action "transfers", [{:get}, {:create}]
end
