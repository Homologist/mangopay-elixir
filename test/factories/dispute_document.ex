defmodule Mangopay.DisputeDocumentFactory do
  defmacro __using__(_opts) do
    quote do

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

    end
  end
end
