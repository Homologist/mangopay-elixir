defmodule MangoPay.Reporting do
  @moduledoc """
  Functions for MangoPay reporting.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/reporting#e824_the-report-object
  """
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
