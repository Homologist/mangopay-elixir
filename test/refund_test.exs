defmodule RefundTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use CardHelper
  use BankAccountHelper
  use MandateHelper
  use PreauthorizationHelper
  use WalletHelper
  use PayInHelper
  use TransferHelper
  use PayOutHelper
  use DisputeHelper
  use RepudiationHelper
  use RefundHelper

  setup_all do
    create_card_cassette()
    create_user_bis_cassette()
    create_bank_account_cassette()
    create_wallet_cassette()
    create_wallet_bis_cassette()
    create_pay_in_direct_cassette()
    Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash()
    create_transfer_cassette()
    create_transfer_refund_cassette()
    create_pay_in_refund_cassette()
    create_pay_out_cassette()
    create_dispute_bis_cassette()
    get_repudiation_cassette()
    :ok
  end

  test "get refund" do
    use_cassette "#{module_name(__MODULE__)}/refund/get" do
      assert {:ok, response} = Mangopay.Refund.get created_refund()["Id"]
      assert Poison.decode!(response.body)["Id"] == created_refund()["Id"]
    end
  end

  test "create refund in pay in direct" do
    use_cassette "#{module_name(__MODULE__)}/refund/pay_in/create" do
      assert {:ok, response} = Mangopay.Refund.PayIn.create created_pay_in()["Id"], refund_pay_in_hash()
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create refund transfer direct" do
    use_cassette "#{module_name(__MODULE__)}/refund/transfer/create" do
      assert {:ok, response} = Mangopay.Refund.Transfer.create created_transfer()["Id"], refund_transfer_hash()
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "all refund by pay in" do
    use_cassette "#{module_name(__MODULE__)}/refund/pay_in/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_pay_in created_pay_in()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all by pay_out" do
    use_cassette "#{module_name(__MODULE__)}/refund/pay_out/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_pay_out created_pay_out()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all by transfer" do
    use_cassette "#{module_name(__MODULE__)}/refund/transfer/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_transfer created_transfer()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all by repudiation" do
    use_cassette "#{module_name(__MODULE__)}/refund/repudiation/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_repudiation created_repudiation()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end
end
