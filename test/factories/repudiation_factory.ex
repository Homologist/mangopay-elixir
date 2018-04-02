ExUnit.start()

defmodule Mangopay.RepudiationFactory do
  defmacro __using__(opts \\ nil) do
    quote do
      def created_repudiation_factory(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "repudiation", "get.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end
    end
  end
end
