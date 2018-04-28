defmodule SettlementTransferTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.WalletFactory
  use MangoPay.TransferFactory
  use MangoPay.DisputeFactory
  use MangoPay.RepudiationFactory
  use MangoPay.SettlementTransferFactory
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
               MangoPay.SettlementTransfer.get(created_settlement_transfer()["Id"])
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
    assert response =
             MangoPay.SettlementTransfer.get!(created_settlement_transfer()["Id"])

    assert Poison.decode!(response.body)["Tag"] == "custom meta"
  end

  test "create settlement_transfer" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/settlement_transfer/create" do
      assert {:ok, response} =
               MangoPay.SettlementTransfer.create(
                 build(:created_repudiation)["Id"],
                 build(:settlement_transfer)
               )

      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
    assert response =
             MangoPay.SettlementTransfer.create!(
               build(:created_repudiation)["Id"],
               build(:settlement_transfer)
             )
    assert Poison.decode!(response.body)["Tag"] == "custom meta"
  end
end
