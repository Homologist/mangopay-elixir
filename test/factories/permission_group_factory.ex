ExUnit.start()

defmodule Mangopay.PermissionGroupFactory do
  defmacro __using__([]) do
    quote do
      def created_permission_group(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "permission_group", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def permission_group_hash do
        %{
          Tag: "custom meta",
          Name: "users only"
        }
      end

      def update_permission_group_hash do
        %{
          Tag: "custom meta update",
          Name: "users only"
        }
      end

      def create_permission_group_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/permission_group/create" do
          Mangopay.PermissionGroup.create(permission_group_hash())
        end
      end

      def get_permission_group_casssette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/permission_group/get" do
          Mangopay.PermissionGroup.get(created_permission_group()["Id"])
        end
      end
    end
  end
end
