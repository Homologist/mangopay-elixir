ExUnit.start()

defmodule Mangopay.DisputeDocumentFactory do
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

      def created_dispute_document(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "dispute_document", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_dispute_document_page(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "dispute_document_page", "get.json"],
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
        {:ok, response} = Mangopay.DisputeDocument.all_by_dispute(build(:created_dispute)["Id"])
        id = List.first(Poison.decode!(response.body))["Id"]
        Mangopay.DisputeDocument.get(id)
      end

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def create_dispute_document_cassette do
        use_cassette "#{module_name(__MODULE__)}/dispute/all" do
          Mangopay.Dispute.all()
        end

        use_cassette "#{module_name(__MODULE__)}/dispute_document/dispute/all" do
          Mangopay.DisputeDocument.all_by_dispute(build(:created_dispute)["Id"])
        end

        use_cassette "#{module_name(__MODULE__)}/dispute_document/create" do
          get_dispute_document()
        end
      end
    end
  end
end
