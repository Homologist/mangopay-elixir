defmodule PayInTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use BankAccountHelper
  use MandateHelper
  use CardHelper
  use PreauthorizationHelper
  use WalletHelper
  use PayInHelper

  setup_all do
    create_card_bis_cassette()
    create_bank_account_cassette()
    create_wallet_cassette()
    create_pay_in_web_cassette()
    create_pay_in_direct_cassette()
    create_mandate_cassette()
    create_preauthorization_cassette()
    create_pay_in_preauthorized_cassette()
    :ok
  end

  test "get pay in card web" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/card/web/get" do
      assert {:ok, response} = Mangopay.PayIn.get(created_pay_in()["Id"])
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in card web" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/card/web/create" do
      assert {:ok, response} = Mangopay.PayIn.Card.Web.create(pay_in_card_web_hash())
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in card direct" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/card/direct/create" do
      assert {:ok, response} = Mangopay.PayIn.Card.Direct.create(pay_in_card_direct_hash())
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in card preauthorized" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/card/pre_authorized/create" do
      assert {:ok, response} =
               Mangopay.PayIn.Card.PreAuthorized.create(pay_in_card_preauthorized_hash())

      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in bank wire wallet" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/bank_wire/wallet/create" do
      assert {:ok, response} =
               Mangopay.PayIn.BankWire.Wallet.create(pay_in_bank_wire_wallet_hash())

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in bank wire direct" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/bank_wire/direct/create" do
      assert {:ok, response} =
               Mangopay.PayIn.BankWire.Direct.create(pay_in_bank_wire_direct_hash())

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in direct-debit web" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/direct_debit/web/create" do
      assert {:ok, response} =
               Mangopay.PayIn.DirectDebit.Web.create(pay_in_directdebit_web_hash())

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in direct-debit direct" do
    use_cassette "#{module_name(__MODULE__)}/pay_in/direct_debit/direct/create" do
      assert {:ok, response} =
               Mangopay.PayIn.DirectDebit.Direct.create(pay_in_directdebit_direct_hash())

      assert Poison.decode!(response.body)["Status"] == "FAILED"
    end
  end
end
