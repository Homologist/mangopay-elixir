defmodule MangoPay.PayOut do
  @moduledoc """
  Functions for MangoPay [pay out](https://docs.mangopay.com/endpoints/v2.01/payouts#e227_the-payout-object).
  """
  use MangoPay.Query.Base
  set_action "payouts", [{:get}, {:create, ["payouts", "bankwire"]}]
end
