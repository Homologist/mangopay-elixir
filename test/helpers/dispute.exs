ExUnit.start()

defmodule DisputeHelper do
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

      def created_dispute(module_name \\ nil) do
        List.first(
          get_json(
            Enum.join(
              Enum.filter(["", module_name(__MODULE__), "dispute", "all.json"], &(!is_nil(&1))),
              "/"
            )
          )
        )
      end

      def dispute_hash do
        %{}
      end

      def dispute_hook_hash do
        %{}
      end

      def update_dispute_hash do
        %{
          Tag: "custom meta"
        }
      end

      def created_dispute_bis do
        {:ok, response} = Mangopay.Dispute.all()
        response = Poison.decode!(response.body)
        List.last(Enum.filter(response, fn x -> x["RepudiationId"] end))
      end

      def create_transfer_refund_cassette do
        use_cassette "#{module_name(__MODULE__)}/refund/transfer/create" do
          Mangopay.Refund.Transfer.create(created_transfer()["Id"], transfer_hash())
        end
      end

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def create_dispute_cassette do
        use_cassette "#{module_name(__MODULE__)}/dispute/all" do
          Mangopay.Dispute.all()
        end

        use_cassette "#{module_name(__MODULE__)}/dispute/create" do
          created_dispute()
        end
      end

      def create_dispute_bis_cassette do
        use_cassette "#{module_name(__MODULE__)}/refund/dispute/create_bis" do
          created_dispute_bis()
        end
      end

      def all_dispute_cassette do
        use_cassette "#{module_name(__MODULE__)}/dispute/all" do
          Mangopay.Dispute.all()
        end
      end
    end
  end
end
