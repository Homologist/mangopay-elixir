defmodule DisputeDocumentTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.WalletFactory
  use MangoPay.TransferFactory
  use MangoPay.DisputeFactory
  use MangoPay.DisputeDocumentFactory
  use Helper

  setup_all do
    create_dispute_document_cassette()

    #    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/create" do
    #      MangoPay.DisputeDocument.create build(:created_dispute)["Id"], dispute_document_hash()
    #    end
    #    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document_page/create" do
    #      MangoPay.DisputeDocument.create_page build(:created_dispute)["Id"], build(:created_dispute)_document["Id"], dispute_document_page_hash()
    #    end
    :ok
  end

  test "create dispute_document to dispute" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/dispute/create" do
      #      assert {:ok, response} = MangoPay.DisputeDocument.create build(:created_dispute)["Id"], dispute_document_hash()
      #      assert List.first(Poison.decode!(response.body)["Owners"]) == build(:created_dispute)["Id"]
    end
  end

  test "submit dispute_document to dispute document" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/dispute/submit" do
      assert {:ok, response} =
               MangoPay.DisputeDocument.submit(
                 build(:created_dispute)["Id"],
                 created_dispute_document()["Id"]
               )

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create page to dispute dispute_document" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document_page/create" do
      #      assert {:ok, response} = MangoPay.DisputeDocument.create_page build(:created_dispute)["Id"], created_dispute_document()["Id"], dispute_document_page_hash()
      #     assert List.first(Poison.decode!(response.body)["Owners"]) == build(:created_dispute)["Id"]
    end
  end

  test "consult dispute_document" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/consult" do
      assert {:ok, response} = MangoPay.DisputeDocument.consult(created_dispute_document()["Id"])
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "get dispute document" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/get" do
      assert {:ok, response} = MangoPay.DisputeDocument.get(created_dispute_document()["Id"])
      assert Poison.decode!(response.body)["Id"] == created_dispute_document()["Id"]
    end
  end

  test "all dispute_document by dispute" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute_document/dispute/all" do
      assert {:ok, response} =
               MangoPay.DisputeDocument.all_by_dispute(build(:created_dispute)["Id"])

      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
