defmodule Mangopay.WalletFactory do
  defmacro __using__(_opts) do
    quote do
      def wallet_hash do
        %{
          Tag: "custom meta",
          Owners: [created_user()["Id"]],
          Description: "My big project",
          Currency: "EUR"
        }
      end

      def wallet_hash_bis do
        %{
          Tag: "custom meta",
          Owners: [created_user_bis()["Id"]],
          Description: "My big project",
          Currency: "EUR"
        }
      end

      def update_wallet_hash do
        %{
          Tag: "custom meta",
          Description: "My big project"
        }
      end
    end
  end
end
