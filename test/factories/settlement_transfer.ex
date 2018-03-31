defmodule Mangopay.SettlementTransferFactory do
  defmacro __using__(_opts) do
    quote do
      def settlement_transfer_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_repudiation()["AuthorId"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 12
          },
          Fees: %{
            Currency: "EUR",
            Amount: 0
          }
        }
      end
    end
  end
end
