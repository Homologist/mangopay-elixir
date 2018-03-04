defmodule SettlementTransferTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash
    end
    use_cassette "settlement/dispute/create_bis" do
      created_dispute_bis
    end
    use_cassette "repudiation/get" do
      Mangopay.Repudiation.get created_dispute_bis["RepudiationId"]
    end
    use_cassette "settlement_transfer/create" do
      Mangopay.SettlementTransfer.create created_repudiation["Id"], settlement_transfer_hash
    end

    :ok
  end

  test "get settlement_transfer" do
    use_cassette "settlement_transfer/get" do
      assert  {:ok, response} = Mangopay.SettlementTransfer.get created_settlement_transfer["Id"]
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "create settlement_transfer" do
    use_cassette "settlement_transfer/create" do
      assert {:ok, response} = Mangopay.SettlementTransfer.create created_repudiation["Id"], settlement_transfer_hash
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end
end
