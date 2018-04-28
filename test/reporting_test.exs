defmodule ReportingTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.WalletFactory
  use MangoPay.ReportingFactory
  use Helper

  setup_all do
    create_user_cassette()
    create_wallet_cassette()
    create_transaction_reporting_cassette()
    create_wallet_reporting_cassette()
    all_reporting_cassette()
    :ok
  end

  test "create reporting transaction" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/transaction/create" do
      assert {:ok, response} =
               MangoPay.Reporting.Transaction.create(build(:reporting_transaction))

      assert Poison.decode!(response.body)["Status"] == "PENDING"
    end

    assert response = MangoPay.Reporting.Transaction.create!(build(:reporting_transaction))
    assert Poison.decode!(response.body)["Status"] == "PENDING"
  end

  test "create reporting wallet" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/wallet/create" do
      assert {:ok, response} = MangoPay.Reporting.Wallet.create(build(:reporting_wallet))
      assert Poison.decode!(response.body)["Status"] == "PENDING"
    end

    assert response = MangoPay.Reporting.Wallet.create!(build(:reporting_wallet))
    assert Poison.decode!(response.body)["Status"] == "PENDING"
  end

  test "get reporting" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/get" do
      assert {:ok, response} = MangoPay.Reporting.get(build(:created_reporting_transaction)["Id"])
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
      assert Poison.decode!(response.body)["Id"] == build(:created_reporting_transaction)["Id"]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
    end

    assert response = MangoPay.Reporting.get!(build(:created_reporting_transaction)["Id"])
    assert Poison.decode!(response.body)["ResultMessage"] == "Success"
    assert Poison.decode!(response.body)["Id"] == build(:created_reporting_transaction)["Id"]
    assert Poison.decode!(response.body)["ResultMessage"] == "Success"
  end

  test "all reporting" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/all" do
      assert {:ok, response} = MangoPay.Reporting.all()
      assert length(Poison.decode!(response.body)) > 0
    end

    assert response = MangoPay.Reporting.all!()
    assert length(Poison.decode!(response.body)) > 0
  end
end
