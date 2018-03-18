ExUnit.start()

defmodule KycDocumentHelper do
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

      def created_kyc_document(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "kyc_document", "user", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_kyc_document_page(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "kyc_document_page", "user", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def kyc_document_hash do
        %{
          Tag: "custom meta",
          Type: "IDENTITY_PROOF"
        }
      end

      def submit_kyc_document_hash do
        %{
          Tag: "custom meta",
          Status: "VALIDATION_ASKED"
        }
      end

      def kyc_document_page_hash do
        %{
          File: Base.encode64(File.read!("test/kyc_document_spec.png"))
        }
      end

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def create_kyc_document_cassette do
        use_cassette "#{module_name(__MODULE__)}/kyc_document/user/create" do
          Mangopay.KycDocument.create_to_user(created_user()["Id"], kyc_document_hash())
        end

        use_cassette "#{module_name(__MODULE__)}/kyc_document/user/create_page" do
          Mangopay.KycDocument.create_page_to_user_kyc_document(
            created_user()["Id"],
            created_kyc_document()["Id"],
            kyc_document_page_hash()
          )
        end

        use_cassette "#{module_name(__MODULE__)}/kyc_document/submit" do
          Mangopay.KycDocument.submit(
            created_user()["Id"],
            created_kyc_document()["Id"],
            submit_kyc_document_hash()
          )
        end
      end
    end
  end
end
