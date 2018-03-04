defmodule ReportingTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "reporting/transaction/create" do
      Mangopay.Reporting.Transaction.create reporting_transaction_hash
    end
    use_cassette "reporting/wallet/create" do
      Mangopay.Reporting.Wallet.create reporting_wallet_hash
    end
    use_cassette "reporting/all" do
      assert {:ok, response} = Mangopay.Reporting.all
    end
    :ok
  end

  test "create reporting transaction" do
    use_cassette "reporting/transaction/create" do
      assert {:ok, response} = Mangopay.Reporting.Transaction.create reporting_transaction_hash
      assert Poison.decode!(response.body)["Status"] == "PENDING"
    end
  end

  test "create reporting wallet" do
    use_cassette "reporting/wallet/create" do
      assert {:ok, response} = Mangopay.Reporting.Wallet.create reporting_wallet_hash
      assert Poison.decode!(response.body)["Status"] == "PENDING"
    end
  end

  test "get reporting" do
    use_cassette "reporting/get" do
      assert {:ok, response} = Mangopay.Reporting.get created_reporting_transaction["Id"]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
      assert Poison.decode!(response.body)["Id"] == created_reporting_transaction["Id"]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
    end
  end

  test "all reporting" do
    use_cassette "reporting/all" do
      assert {:ok, response} = Mangopay.Reporting.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
