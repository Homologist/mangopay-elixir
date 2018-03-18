ExUnit.start()

defmodule WalletHelper do
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
      def created_wallet(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "wallet", "create.json"], & !is_nil(&1)), "/")
      end

      def created_wallet_bis(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "wallet", "create_bis.json"], & !is_nil(&1)), "/")
      end

      def wallet_hash do
        %{
          "Tag": "custom meta",
          "Owners": [ created_user()["Id"] ],
          "Description": "My big project",
          "Currency": "EUR"
        }
      end

      def wallet_hash_bis do
        %{
          "Tag": "custom meta",
          "Owners": [ created_user_bis()["Id"] ],
          "Description": "My big project",
          "Currency": "EUR"
        }
      end

      def update_wallet_hash do
        %{
          "Tag": "custom meta",
          "Description": "My big project"
        }
      end

      def create_wallet_cassette do
        use_cassette "#{module_name(__MODULE__)}/wallet/create" do
          Mangopay.Wallet.create wallet_hash()
        end
      end

      def create_wallet_bis_cassette do
        use_cassette "#{module_name(__MODULE__)}/wallet/create_bis" do
          Mangopay.Wallet.create wallet_hash_bis()
        end
      end
    end
  end
end
