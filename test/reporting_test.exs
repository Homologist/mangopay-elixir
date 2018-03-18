defmodule ReportingTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use WalletHelper
  use ReportingHelper

  setup_all do
    create_user_cassette()
    create_wallet_cassette()
    create_transaction_reporting_cassette()
    create_wallet_reporting_cassette()
    all_reporting_cassette()
    :ok
  end

  test "create reporting transaction" do
    use_cassette "#{module_name(__MODULE__)}/reporting/transaction/create" do
      assert {:ok, response} = Mangopay.Reporting.Transaction.create reporting_transaction_hash()
      assert Poison.decode!(response.body)["Status"] == "PENDING"
    end
  end

  test "create reporting wallet" do
    use_cassette "#{module_name(__MODULE__)}/reporting/wallet/create" do
      assert {:ok, response} = Mangopay.Reporting.Wallet.create reporting_wallet_hash()
      assert Poison.decode!(response.body)["Status"] == "PENDING"
    end
  end

  test "get reporting" do
    use_cassette "#{module_name(__MODULE__)}/reporting/get" do
      assert {:ok, response} = Mangopay.Reporting.get created_reporting_transaction()["Id"]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
      assert Poison.decode!(response.body)["Id"] == created_reporting_transaction()["Id"]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
    end
  end

  test "all reporting" do
    use_cassette "#{module_name(__MODULE__)}/reporting/all" do
      assert {:ok, response} = Mangopay.Reporting.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
