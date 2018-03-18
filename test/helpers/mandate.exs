ExUnit.start()

defmodule MandateHelper do
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

      def created_mandate(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "mandate", "create.json"], & !is_nil(&1)), "/")
      end

      def mandate_hash do
        %{
          "Tag": "custom meta",
          "BankAccountId": created_bank_account(__MODULE__)["Id"],
          "Culture": "EN",
          "ReturnURL": "http://www.my-site.com/returnURL/"
        }
      end

      def cancel_mandate_hash do
        %{}
      end

      def update_mandate_hash do
        %{}
      end

      def create_mandate_cassette do
        create_bank_account_cassette()
        use_cassette "#{module_name(__MODULE__)}/mandate/create" do
          Mangopay.Mandate.create mandate_hash()
        end
      end
    end
  end
end
