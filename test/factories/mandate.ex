defmodule Mangopay.MandateFactory do
  defmacro __using__(_opts) do
    quote do
      def mandate_hash do
        %{
          Tag: "custom meta",
          BankAccountId: created_bank_account(__MODULE__)["Id"],
          Culture: "EN",
          ReturnURL: "http://www.my-site.com/returnURL/"
        }
      end

      def cancel_mandate_hash do
        %{}
      end

      def update_mandate_hash do
        %{}
      end

    end
  end
end
