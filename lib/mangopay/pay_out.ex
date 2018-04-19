defmodule Mangopay.PayOut do
  use Mangopay.Query.Base
  set_action "payouts", [{:get}, {:create, ["payouts", "bankwire"]}]
end
