ExUnit.start()

defmodule RefundHelper do
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
      def created_refund(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "refund", "pay_in", "create.json"], & !is_nil(&1)), "/")
      end
      def refund_pay_in_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 450
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          }
        }
      end

      def refund_transfer_hash do
        %{"Tag": "custom meta", "AuthorId": created_user()["Id"]}
      end


      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end
      def create_pay_in_refund_cassette do
        use_cassette "#{module_name(__MODULE__)}/refund/pay_in/create" do
          Mangopay.Refund.PayIn.create created_pay_in()["Id"], refund_pay_in_hash()
        end
      end

      def create_transfer_refund_cassette do
        use_cassette "#{module_name(__MODULE__)}/refund/transfer/create" do
          Mangopay.Refund.Transfer.create created_transfer()["Id"], transfer_hash()
        end
      end
    end
  end
end
