defmodule Mangopay.TransferFactory do
  defmacro __using__(_opts) do
    quote do
      def transfer_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedUserId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 499
          },
          Fees: %{
            Currency: "EUR",
            Amount: 2
          },
          DebitedWalletId: created_wallet()["Id"],
          CreditedWalletId: created_wallet_bis()["Id"]
        }
      end

    end
  end
end
