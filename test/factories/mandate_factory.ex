defmodule Mangopay.MandateFactory do
  defmacro __using__(opts \\ nil) do
    quote do
      require Factories.SharedFunctions
      Factories.SharedFunctions.set

      def created_mandate_factory(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "mandate", "create.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

      def mandate_factory do
        %{
          Tag: "custom meta",
          BankAccountId: build(:created_bank_account)["Id"],
          Culture: "EN",
          ReturnURL: "http://www.my-site.com/returnURL/"
        }
      end

      def cancel_mandate_factory do
        %{}
      end

      def update_mandate_factory do
        %{}
      end
    end
  end
end
