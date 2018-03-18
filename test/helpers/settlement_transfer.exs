ExUnit.start()

defmodule SettlementTransferHelper do
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

      def created_settlement_transfer(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "settlement_transfer", "create.json"], & !is_nil(&1)), "/")
      end

      def settlement_transfer_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_repudiation()["AuthorId"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 12
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 0
          }
        }
      end

      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end

      def create_settlement_transfer_cassette do
        use_cassette "#{module_name(__MODULE__)}/settlement_transfer/create" do
          Mangopay.SettlementTransfer.create created_repudiation()["Id"], settlement_transfer_hash()
        end
      end
    end
  end
end
