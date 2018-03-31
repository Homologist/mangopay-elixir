defmodule Mangopay.RefundFactory do
  defmacro __using__(_opts) do
    quote do
      def refund_pay_in_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 450
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          }
        }
      end

      def refund_transfer_hash do
        %{Tag: "custom meta", AuthorId: created_user()["Id"]}
      end
    end
  end
end
