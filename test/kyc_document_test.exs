defmodule KycDocumentTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.KycDocumentFactory
  use Helper

  setup_all do
    create_user_cassette()
    create_kyc_document_cassette()
    :ok
  end

  test "create kyc_document to user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create" do
      assert {:ok, response} =
               MangoPay.KycDocument.create_to_user(
                 build(:created_user)["Id"],
                 build(:kyc_document)
               )

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "submit kyc_document to user kyc document" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/submit" do
      assert {:ok, response} =
               MangoPay.KycDocument.submit(
                 build(:created_user)["Id"],
                 build(:created_kyc_document)["Id"],
                 build(:submit_kyc_document)
               )

      assert Poison.decode!(response.body)["Status"] == "VALIDATION_ASKED"
    end
  end

  test "create page to user kyc_document" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create_page" do
      assert {:ok, response} =
               MangoPay.KycDocument.create_page_to_user_kyc_document(
                 build(:created_user)["Id"],
                 build(:created_kyc_document)["Id"],
                 build(:kyc_document_page)
               )

      assert response.body == ""
    end
  end

  test "get user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/get" do
      assert {:ok, response} = MangoPay.KycDocument.get(build(:created_kyc_document)["Id"])
      assert Poison.decode!(response.body)["Id"] == build(:created_kyc_document)["Id"]
    end
  end

  test "all kyc_document by user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/all" do
      assert {:ok, response} = MangoPay.KycDocument.all_by_user(build(:created_user)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all kyc_document" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/all" do
      assert {:ok, response} = MangoPay.KycDocument.all()
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
