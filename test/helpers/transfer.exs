ExUnit.start()

defmodule TransferHelper do
  defmacro __using__(opts \\ nil) do
    quote do
      def fixture_path(path) do
        "fixture/vcr_cassettes" <> path
      end

      def get_json(path) do
        a = fixture_path(path) |> File.read!() |> Poison.decode!() |> List.last()
        b = a["response"]["body"]

        case Poison.decode(b) do
          {:ok, val} -> val
          {:error, message} -> b
        end
      end

      def created_transfer(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "transfer", "create.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

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

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def create_transfer_cassette do
        use_cassette "#{module_name(__MODULE__)}/transfer/create" do
          Mangopay.Transfer.create(transfer_hash())
        end
      end
    end
  end
end
