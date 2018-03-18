ExUnit.start()

defmodule SsoHelper do
  defmacro __using__(opts\\nil) do
    quote do
      def fixture_path path do
        "fixture/vcr_cassettes" <> path
      end

      def get_json path do
        a = fixture_path(path) |> File.read! |> Poison.decode! |> List.last
        b = a["response"]["body"]
        case Poison.decode b do
          {:ok, val}        -> val
          {:error, message} -> b
        end
      end

      def created_sso(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "sso", "create.json"], & !is_nil(&1)), "/")
      end

      def extend_invitation_sso_hash do
        %{}
      end

      def sso_hash do
        %{
          "Tag": "custom meta",
          "FirstName": "Joe",
          "LastName": "Blogs",
          "Email": "#{created_user()["Id"]}@mangopay.com",
          "PermissionGroupId": created_permission_group()["Id"]
        }
      end

      def update_sso_hash do
        %{
          "Tag": "custom meta",
          "FirstName": "Joe",
          "LastName": "Blogs",
          "PermissionGroupId": created_permission_group()["Id"],
          "Active": true
        }
      end

      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end

      def create_sso_cassette do
        use_cassette "#{module_name(__MODULE__)}/sso/create" do
          Mangopay.Sso.create sso_hash()
        end
      end
    end
  end
end
