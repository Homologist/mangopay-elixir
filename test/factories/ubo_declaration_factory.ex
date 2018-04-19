defmodule Mangopay.UboDeclarationFactory do
  defmacro __using__([]) do
    quote do
      def created_ubo_declaration_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "ubo_declaration",
                "user",
                "get.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def ubo_declaration_factory do
        %{
          Tag: "custom meta",
          DeclaredUBOs: [build(:created_user)["Id"]]
        }
      end

      def update_ubo_declaration_factory do
        %{
          Tag: "custom meta",
          Status: "CREATED",
          DeclaredUBOs: [List.first(build(:created_ubo_declaration)["DeclaredUBOs"])["UserId"]]
        }
      end
    end
  end
end
