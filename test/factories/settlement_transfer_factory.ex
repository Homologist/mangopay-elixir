ExUnit.start()

defmodule Mangopay.SettlementTransferFactory do
  defmacro __using__(opts \\ nil) do
    quote do
      def created_settlement_transfer(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "settlement_transfer", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def settlement_transfer_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_repudiation)["AuthorId"],
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
