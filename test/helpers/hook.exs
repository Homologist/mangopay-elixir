ExUnit.start()

defmodule HookHelper do
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

      def created_hook(module_name \\ nil) do
        List.first(get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "hook", "all.json"], & !is_nil(&1)), "/"))
      end

      def hook_hash do
        %{
          "Tag": "custom meta",
          "EventType": "PAYIN_NORMAL_CREATED",
          "Url": "http://www.my-site.com/hooks/"
        }
      end

      def update_hook_hash do
        %{
          "Tag": "custom meta",
          "Status": "ENABLED",
          "Url": "http://www.my-site.com/hooks/"
        }
      end

      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end

      def create_hook_cassette do
        use_cassette "#{module_name(__MODULE__)}/hook/create" do
          Mangopay.Hook.create hook_hash()
        end

        use_cassette "#{module_name(__MODULE__)}/hook/all" do
          Mangopay.Hook.all
        end
      end
    end
  end
end
