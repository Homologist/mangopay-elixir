defmodule MangoPay.Reporting do
  use MangoPay.Query.Base
  set_action "reports", [{:get}, {:all}]

  defmodule Wallet do
    use MangoPay.Query.Base
    set_action "reports/wallets", [{:create}]
  end

  defmodule Transaction do
    use MangoPay.Query.Base
    set_action "reports/transactions", [{:create}]
  end
end
