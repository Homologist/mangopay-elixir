ExUnit.start()

defmodule PayOutHelper do
  defmacro __using__(opts\\nil) do
    quote do
      def fixture_path path do
        "fixture/vcr_cassettes" <> path
      end

      def get_json path do
        a = fixture_path(path) |> File.read! |> Poison.decode! |> List.last
        b = a["response"]["body"]
        case Poison.decode b do
          {:ok, val}        -> val
          {:error, message} -> b
        end
      end

      def created_pay_out(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "pay_out", "create.json"], & !is_nil(&1)), "/")
      end

      def pay_out_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 12
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "BankAccountId": created_bank_account()["Id"],
          "DebitedWalletId": created_wallet()["Id"],
          "BankWireRef": "invoice 7282"
        }
      end

      def create_pay_out_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_out/create" do
          Mangopay.PayOut.create pay_out_hash()
        end
      end

      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end
    end
  end
end
