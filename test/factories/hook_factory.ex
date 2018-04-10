ExUnit.start()

defmodule Mangopay.HookFactory do
  defmacro __using__([]) do
    quote do
      def created_hook(module_name \\ nil) do
        List.first(
          Factories.SharedFunctions.get_json(
            Enum.join(
              Enum.filter(
                ["", Factories.SharedFunctions.module_name(__MODULE__), "hook", "all.json"],
                &(!is_nil(&1))
              ),
              "/"
            )
          )
        )
      end

      def hook_hash do
        %{
          Tag: "custom meta",
          EventType: "PAYIN_NORMAL_CREATED",
          Url: "http://www.my-site.com/hooks/"
        }
      end

      def update_hook_hash do
        %{
          Tag: "custom meta",
          Status: "ENABLED",
          Url: "http://www.my-site.com/hooks/"
        }
      end

      def create_hook_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/create" do
          Mangopay.Hook.create(hook_hash())
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/all" do
          Mangopay.Hook.all()
        end
      end
    end
  end
end
