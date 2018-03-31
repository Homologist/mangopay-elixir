defmodule Mangopay.KycDocumentFactory do
  defmacro __using__(_opts) do
    quote do
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

    end
  end
end
