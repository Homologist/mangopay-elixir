defmodule Mangopay.Reporting do
  use Mangopay.Query.Base, "reports"
  set_action "reports", [{:get}, {:all}]

  defmodule Wallet do
    use Mangopay.Query.Base, "reports/wallets"
    set_action "reports/wallets", [{:create}]
  end

  defmodule Transaction do
    use Mangopay.Query.Base, "reports/transactions"
    set_action "reports/transactions", [{:create}]
  end
end
