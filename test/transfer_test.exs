defmodule TransferTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.BankAccountFactory
  use MangoPay.WalletFactory
  use MangoPay.PreauthorizationFactory
  use MangoPay.CardFactory
  use MangoPay.MandateFactory
  use MangoPay.PayInFactory
  use MangoPay.TransferFactory
  use Helper

  setup_all do
    create_user_cassette()
    create_user_bis_cassette()
    create_wallet_cassette()
    create_wallet_bis_cassette()
    create_card_cassette()
    create_pay_in_direct_cassette()
    create_transfer_cassette()
    :ok
  end

  test "get transfer" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/transfer/get" do
      assert {:ok, response} = MangoPay.Transfer.get(build(:created_transfer)["Id"])
      assert Poison.decode!(response.body)["Tag"] == build(:transfer)[:Tag]
    end
  end

  test "create transfer" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/transfer/create" do
      assert {:ok, response} = MangoPay.Transfer.create(build(:transfer))
      assert Poison.decode!(response.body)["Tag"] == build(:transfer)[:Tag]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
    end
  end
end
