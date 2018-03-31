defmodule TransferTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Mangopay.Factory
  use Helper
  use UserHelper
  use BankAccountHelper
  use WalletHelper
  use PreauthorizationHelper
  use CardHelper
  use MandateHelper
  use PayInHelper
  use TransferHelper

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
    use_cassette "#{module_name(__MODULE__)}/transfer/get" do
      assert {:ok, response} = Mangopay.Transfer.get(created_transfer()["Id"])
      assert Poison.decode!(response.body)["Tag"] == transfer_hash()[:Tag]
    end
  end

  test "create transfer" do
    use_cassette "#{module_name(__MODULE__)}/transfer/create" do
      assert {:ok, response} = Mangopay.Transfer.create(transfer_hash())
      assert Poison.decode!(response.body)["Tag"] == transfer_hash()[:Tag]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
    end
  end
end
