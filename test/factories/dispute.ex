defmodule Mangopay.DisputeFactory do
  defmacro __using__(_opts) do
    quote do
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
    end
  end
end
