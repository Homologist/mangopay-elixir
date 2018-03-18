ExUnit.start()

defmodule ClientWalletHelper do
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

      def created_client_wallet(module_name \\ nil) do
        List.first(
          get_json(
            Enum.join(
              Enum.filter(
                ["", module_name(__MODULE__), "client_wallet", "all.json"],
                &(!is_nil(&1))
              ),
              "/"
            )
          )
        )
      end

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def create_client_wallet_cassette do
        use_cassette "#{module_name(__MODULE__)}/client_wallet/all" do
          Mangopay.ClientWallet.all()
        end
      end
    end
  end
end
