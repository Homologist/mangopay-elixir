ExUnit.start()

defmodule MangoPay.DisputeDocumentFactory do
  defmacro __using__([]) do
    quote do
      def created_dispute_document(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "dispute_document",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_dispute_document_page(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "dispute_document_page",
                "get.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def dispute_document_hash do
        %{
          Tag: "custom meta",
          Type: "DELIVERY_PROOF"
        }
      end

      def dispute_document_page_hash do
        %{
          File:
            "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAEBAQEBAQEBAQEBAQECAgMCAgICAgQDAwIDBQQFBQUE BAQFBgcGBQUHBgQEBgkGBwgICAgIBQYJCgkICgcICAj/2wBDAQEBAQICAgQCAgQIBQQFCAgICAgI CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAyADIDAREA AhEBAxEB/8QAGwAAAgMBAQEA"
        }
      end

      def get_dispute_document do
        {:ok, response} = MangoPay.DisputeDocument.all_by_dispute(build(:created_dispute)["Id"])
        id = List.first(Poison.decode!(response.body))["Id"]
        MangoPay.DisputeDocument.get(id)
      end

      def create_dispute_document_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/all" do
          MangoPay.Dispute.all()
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/dispute/all" do
          MangoPay.DisputeDocument.all_by_dispute(build(:created_dispute)["Id"])
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/create" do
          get_dispute_document()
        end
      end
    end
  end
end
