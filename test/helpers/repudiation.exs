ExUnit.start()

defmodule RepudiationHelper do
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
      def created_repudiation(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "repudiation", "get.json"], & !is_nil(&1)), "/")
      end

      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end
      def get_repudiation_cassette do
        use_cassette "#{module_name(__MODULE__)}/repudiation/get" do
          Mangopay.Repudiation.get created_dispute_bis()["RepudiationId"]
        end
      end
    end
  end
end
