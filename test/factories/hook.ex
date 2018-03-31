defmodule Mangopay.HookFactory do
  defmacro __using__(_opts) do
    quote do
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
    end
  end
end
