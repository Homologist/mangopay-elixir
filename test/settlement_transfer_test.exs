defmodule SettlementTransferTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.UserFactory
  use Mangopay.WalletFactory
  use Mangopay.TransferFactory
  use Mangopay.DisputeFactory
  use Mangopay.RepudiationFactory
  use Mangopay.SettlementTransferFactory
  use Helper

  setup_all do
    create_user_cassette()
    create_user_bis_cassette()
    create_dispute_cassette()
    get_repudiation_cassette()
    create_settlement_transfer_cassette()
    :ok
  end

  test "get settlement_transfer" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/settlement_transfer/get" do
      assert {:ok, response} =
               Mangopay.SettlementTransfer.get(created_settlement_transfer()["Id"])

      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "create settlement_transfer" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/settlement_transfer/create" do
      assert {:ok, response} =
               Mangopay.SettlementTransfer.create(
                 build(:created_repudiation)["Id"],
                 build(:settlement_transfer)
               )

      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end
end
