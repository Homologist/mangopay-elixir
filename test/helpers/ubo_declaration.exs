ExUnit.start()

defmodule UboDeclarationHelper do
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
      def created_ubo_declaration(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "ubo_declaration", "user", "get.json"], & !is_nil(&1)), "/")
      end
      def ubo_declaration_hash do
        %{
          "Tag": "custom meta",
          "DeclaredUBOs": [ created_user()["Id"] ]
        }
      end

      def update_ubo_declaration_hash do
        %{
          "Tag": "custom meta",
          "Status": "CREATED",
          "DeclaredUBOs": [ List.first(created_ubo_declaration()["DeclaredUBOs"])["UserId"] ]
        }
      end

      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end

      def first_ubo_declaration do
        {:ok, response} = Mangopay.UboDeclaration.all
        response.body |> Poison.decode! |> List.first
      end

      def get_ubo_declaration do
        Mangopay.UboDeclaration.get first_ubo_declaration()["Id"]
      end

      def create_ubo_declaration_cassette do
        use_cassette "#{module_name(__MODULE__)}/ubo_declaration/user/all" do
          Mangopay.UboDeclaration.all
        end

        use_cassette "#{module_name(__MODULE__)}/ubo_declaration/user/get" do
          get_ubo_declaration()
        end

        use_cassette "#{module_name(__MODULE__)}/ubo_declaration/update" do
          Mangopay.UboDeclaration.update created_ubo_declaration()["Id"], update_ubo_declaration_hash()
        end
      end
    end
  end
end
