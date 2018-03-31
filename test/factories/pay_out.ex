defmodule Mangopay.PayOutFactory do
  defmacro __using__(_opts) do
    quote do
      def pay_out_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 12
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          BankAccountId: created_bank_account()["Id"],
          DebitedWalletId: created_wallet()["Id"],
          BankWireRef: "invoice 7282"
        }
      end
    end
  end
end
