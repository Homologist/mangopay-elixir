ExUnit.start()

defmodule Mangopay.RefundFactory do
  defmacro __using__([]) do
    quote do
      def created_refund_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "refund", "pay_in", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def refund_pay_in_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
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

      def refund_transfer_factory do
        %{Tag: "custom meta", AuthorId: build(:created_user)["Id"]}
      end
    end
  end
end
