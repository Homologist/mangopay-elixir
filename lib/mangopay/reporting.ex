defmodule Mangopay.Reporting do
  use Mangopay.Query.Base, "reports"
  set_action "reports", [{:get}, {:all}]

  defmodule Wallet do
    use Mangopay.Query.Base, "reports"
    set_action "reports", [{:create, ["reports", "transactions"]}]
  end

  defmodule Transaction do
    use Mangopay.Query.Base, "reports"
    set_action "reports", [{:create, ["reports", "transactions"]}]
  end
end
