defmodule Mangopay.Reporting do
  use Mangopay.Query.Base
  set_action "reports", [{:get}, {:all}]

  defmodule Wallet do
    use Mangopay.Query.Base
    set_action "reports/wallets", [{:create}]
  end

  defmodule Transaction do
    use Mangopay.Query.Base
    set_action "reports/transactions", [{:create}]
  end
end
