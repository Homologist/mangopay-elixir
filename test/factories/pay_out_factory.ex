ExUnit.start()

defmodule MangoPay.PayOutFactory do
  defmacro __using__([]) do
    quote do
      def created_pay_out(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "pay_out", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def pay_out_hash do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 12
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          BankAccountId: build(:created_bank_account)["Id"],
          DebitedWalletId: created_wallet()["Id"],
          BankWireRef: "invoice 7282"
        }
      end

      def create_pay_out_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_out/create" do
          MangoPay.PayOut.create(pay_out_hash())
        end
      end
    end
  end
end
