ExUnit.start()

defmodule Mangopay.SsoFactory do
  defmacro __using__([]) do
    quote do
      def created_sso(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "sso", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def extend_invitation_sso_hash do
        %{}
      end

      def sso_hash do
        %{
          Tag: "custom meta",
          FirstName: "Joe",
          LastName: "Blogs",
          Email: "#{build(:created_user)["Id"]}@mangopay.com",
          PermissionGroupId: created_permission_group()["Id"]
        }
      end

      def update_sso_hash do
        %{
          Tag: "custom meta",
          FirstName: "Joe",
          LastName: "Blogs",
          PermissionGroupId: created_permission_group()["Id"],
          Active: true
        }
      end

      def create_sso_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/create" do
          Mangopay.Sso.create(sso_hash())
        end
      end
    end
  end
end
