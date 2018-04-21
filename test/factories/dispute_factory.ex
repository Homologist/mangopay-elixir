defmodule MangoPay.DisputeFactory do
  defmacro __using__([]) do
    quote do
      def created_dispute_factory(module_name \\ nil) do
        List.first(
          Factories.SharedFunctions.get_json(
            Enum.join(
              Enum.filter(
                ["", Factories.SharedFunctions.module_name(__MODULE__), "dispute", "all.json"],
                &(!is_nil(&1))
              ),
              "/"
            )
          )
        )
      end

      def dispute_factory do
        %{}
      end

      def dispute_hook_factory do
        %{}
      end

      def update_dispute_factory do
        %{
          Tag: "custom meta"
        }
      end

      def created_dispute_bis_factory do
        {:ok, response} = MangoPay.Dispute.all()
        response = Poison.decode!(response.body)
        List.last(Enum.filter(response, fn x -> x["RepudiationId"] end))
      end

      def created_dispute_transaction_factory do
        response = build(:created_dispute_bis)
        id = response["Id"]
        {:ok, response} = MangoPay.Transaction.all_by_dispute(id)
        List.last(Poison.decode!(response.body))
      end

      def created_dispute_user_factory do
        response = build(:created_dispute_transaction)
        id = response["AuthorId"]
        {:ok, response} = MangoPay.User.get(id)
        Poison.decode!(response.body)
      end

      def created_dispute_wallet_factory do
        response = build(:created_dispute_transaction)
        id = response["DebitedWalletId"]
        {:ok, response} = MangoPay.Wallet.get(id)
        Poison.decode!(response.body)
      end
    end
  end
end
