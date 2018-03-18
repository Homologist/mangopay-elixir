ExUnit.start()

defmodule PermissionGroupHelper do
  defmacro __using__(opts \\ nil) do
    quote do
      def fixture_path(path) do
        "fixture/vcr_cassettes" <> path
      end

      def get_json(path) do
        a = fixture_path(path) |> File.read!() |> Poison.decode!() |> List.last()
        b = a["response"]["body"]

        case Poison.decode(b) do
          {:ok, val} -> val
          {:error, message} -> b
        end
      end

      def created_permission_group(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "permission_group", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

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

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def create_permission_group_cassette do
        use_cassette "#{module_name(__MODULE__)}/permission_group/create" do
          Mangopay.PermissionGroup.create(permission_group_hash())
        end
      end

      def get_permission_group_casssette do
        use_cassette "#{module_name(__MODULE__)}/permission_group/get" do
          Mangopay.PermissionGroup.get(created_permission_group()["Id"])
        end
      end
    end
  end
end
