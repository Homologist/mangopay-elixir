defmodule Mangopay.SsoFactory do
  defmacro __using__(_opts) do
    quote do
      def extend_invitation_sso_hash do
        %{}
      end

      def sso_hash do
        %{
          Tag: "custom meta",
          FirstName: "Joe",
          LastName: "Blogs",
          Email: "#{created_user()["Id"]}@mangopay.com",
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
    end
  end
end
