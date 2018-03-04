defmodule DisputeDocumentTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "dispute/all" do
      Mangopay.Dispute.all
    end
    use_cassette "dispute_document/dispute/all" do
      Mangopay.DisputeDocument.all_by_dispute created_dispute["Id"]
    end
    use_cassette "dispute_document/create" do
      get_dispute_document
    end
#    use_cassette "dispute_document/create" do
#      Mangopay.DisputeDocument.create created_dispute["Id"], dispute_document_hash
#    end
#    use_cassette "dispute_document_page/create" do
#      Mangopay.DisputeDocument.create_page created_dispute["Id"], created_dispute_document["Id"], dispute_document_page_hash
#    end
    :ok
  end

  test "create dispute_document to dispute" do
    use_cassette "dispute_document/dispute/create" do
#      assert {:ok, response} = Mangopay.DisputeDocument.create created_dispute["Id"], dispute_document_hash
#      assert List.first(Poison.decode!(response.body)["Owners"]) == created_dispute["Id"]
    end
  end

  test "submit dispute_document to dispute document" do
    use_cassette "dispute_document/dispute/submit" do
      assert {:ok, response} = Mangopay.DisputeDocument.submit created_dispute["Id"], created_dispute_document["Id"]
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create page to dispute dispute_document" do
    use_cassette "dispute_document_page/create" do
#      assert {:ok, response} = Mangopay.DisputeDocument.create_page created_dispute["Id"], created_dispute_document["Id"], dispute_document_page_hash
 #     assert List.first(Poison.decode!(response.body)["Owners"]) == created_dispute["Id"]
    end
  end

  test "consult dispute_document" do
    use_cassette "dispute_document/consult" do
      assert {:ok, response} = Mangopay.DisputeDocument.consult created_dispute_document["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "get dispute document" do
    use_cassette "dispute_document/get" do
      assert {:ok, response} = Mangopay.DisputeDocument.get created_dispute_document["Id"]
      assert Poison.decode!(response.body)["Id"] == created_dispute_document["Id"]
    end
  end

  test "all dispute_document by dispute" do
    use_cassette "dispute_document/dispute/all" do
      assert {:ok, response} = Mangopay.DisputeDocument.all_by_dispute created_dispute["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
