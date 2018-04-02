defmodule Mangopay.WalletFactory do
  defmacro __using__([]) do
    quote do
      
      
      def created_wallet(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(["", Factories.SharedFunctions.module_name(__MODULE__), "wallet", "create.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

      def created_wallet_bis(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "wallet", "create_bis.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def wallet_factory do
        %{
          Tag: "custom meta",
          Owners: [build(:created_user)["Id"]],
          Description: "My big project",
          Currency: "EUR"
        }
      end

      def wallet_bis_factory do
        %{
          Tag: "custom meta",
          Owners: [build(:created_user_bis)["Id"]],
          Description: "My big project",
          Currency: "EUR"
        }
      end

      def update_wallet_factory do
        %{
          Tag: "custom meta",
          Description: "My big project"
        }
      end

      def create_wallet_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/wallet/create" do
          Mangopay.Wallet.create(build(:wallet))
        end
      end

      def create_wallet_bis_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/wallet/create_bis" do
          Mangopay.Wallet.create(build(:wallet_bis))
        end
      end
    end
  end
end
