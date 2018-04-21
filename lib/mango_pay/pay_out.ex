defmodule MangoPay.PayOut do
  use MangoPay.Query.Base
  set_action "payouts", [{:get}, {:create, ["payouts", "bankwire"]}]
end
