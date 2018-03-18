defmodule SettlementTransferTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use WalletHelper
  use TransferHelper
  use DisputeHelper
  use RepudiationHelper
  use SettlementTransferHelper

  setup_all do
    create_user_cassette()
    create_user_bis_cassette()
    create_dispute_cassette()
    get_repudiation_cassette()
    create_settlement_transfer_cassette()
    :ok
  end

  test "get settlement_transfer" do
    use_cassette "#{module_name(__MODULE__)}/settlement_transfer/get" do
      assert  {:ok, response} = Mangopay.SettlementTransfer.get created_settlement_transfer()["Id"]
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "create settlement_transfer" do
    use_cassette "#{module_name(__MODULE__)}/settlement_transfer/create" do
      assert {:ok, response} = Mangopay.SettlementTransfer.create created_repudiation()["Id"], settlement_transfer_hash()
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end
end
