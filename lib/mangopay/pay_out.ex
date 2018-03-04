defmodule Mangopay.PayOut do
  use Mangopay.Query.Base, "payouts"
  set_action "payouts", [{:get}, {:create, ["payouts", "bankwire"]}]
end
