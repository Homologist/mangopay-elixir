defmodule Mangopay.KycDocumentFactory do
  defmacro __using__([]) do
    quote do
      def created_kyc_document_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "kyc_document",
                "user",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_kyc_document_page_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "kyc_document_page",
                "user",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def kyc_document_factory do
        %{
          Tag: "custom meta",
          Type: "IDENTITY_PROOF"
        }
      end

      def submit_kyc_document_factory do
        %{
          Tag: "custom meta",
          Status: "VALIDATION_ASKED"
        }
      end

      def kyc_document_page_factory do
        %{
          File: Base.encode64(File.read!("test/kyc_document_spec.png"))
        }
      end
    end
  end
end
