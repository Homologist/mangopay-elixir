defmodule Mangopay.UboDeclarationFactory do
  defmacro __using__(_opts) do
    quote do
      def ubo_declaration_hash do
        %{
          Tag: "custom meta",
          DeclaredUBOs: [created_user()["Id"]]
        }
end
      def update_ubo_declaration_hash do
        %{
          Tag: "custom meta",
          Status: "CREATED",
          DeclaredUBOs: [List.first(created_ubo_declaration()["DeclaredUBOs"])["UserId"]]
        }
      end
    end
  end
end
