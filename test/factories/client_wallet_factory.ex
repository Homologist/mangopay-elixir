ExUnit.start()

defmodule Mangopay.ClientWalletFactory do
  defmacro __using__([]) do
    quote do
      def created_client_wallet(module_name \\ nil) do
        List.first(
          Factories.SharedFunctions.get_json(
            Enum.join(
              Enum.filter(
                [
                  "",
                  Factories.SharedFunctions.module_name(__MODULE__),
                  "client_wallet",
                  "all.json"
                ],
                &(!is_nil(&1))
              ),
              "/"
            )
          )
        )
      end
    end
  end
end
