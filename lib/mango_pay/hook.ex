defmodule MangoPay.Hook do
  @moduledoc """
  Functions for MangoPay [hook](https://docs.mangopay.com/endpoints/v2.01/hooks#e246_the-hook-object).
  """
  use MangoPay.Query.Base
  set_action "hooks", [{:get}, {:create}, {:update}, {:all}]
end
