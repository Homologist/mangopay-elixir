defmodule Mangopay.PermissionGroupFactory do
  defmacro __using__(_opts) do
    quote do
      def permission_group_hash do
        %{
          Tag: "custom meta",
          Name: "Users only"
        }
      end

      def update_permission_group_hash do
        %{
          Tag: "custom meta update",
          Name: "Users only"
        }
      end
    end
  end
end
