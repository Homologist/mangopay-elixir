defmodule PayInTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.UserFactory
  use Mangopay.BankAccountFactory
  use Mangopay.MandateFactory
  use Mangopay.CardFactory
  use Mangopay.PreauthorizationFactory
  use Mangopay.WalletFactory
  use Mangopay.PayInFactory
  use Helper

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
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/web/get" do
      assert {:ok, response} = Mangopay.PayIn.get(build(:created_pay_in)["Id"])
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in card web" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/web/create" do
      assert {:ok, response} = Mangopay.PayIn.Card.Web.create(build(:pay_in_card_web))
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in card direct" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/direct/create" do
      assert {:ok, response} = Mangopay.PayIn.Card.Direct.create(build(:pay_in_card_direct))
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in card preauthorized" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/pre_authorized/create" do
      assert {:ok, response} =
               Mangopay.PayIn.Card.PreAuthorized.create(build(:pay_in_card_preauthorized))

      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in bank wire wallet" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/bank_wire/wallet/create" do
      assert {:ok, response} =
               Mangopay.PayIn.BankWire.Wallet.create(build(:pay_in_bank_wire_wallet))

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in bank wire direct" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/bank_wire/direct/create" do
      assert {:ok, response} =
               Mangopay.PayIn.BankWire.Direct.create(build(:pay_in_bank_wire_direct))

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in direct-debit web" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/direct_debit/web/create" do
      assert {:ok, response} =
               Mangopay.PayIn.DirectDebit.Web.create(build(:pay_in_directdebit_web))

      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in direct-debit direct" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/direct_debit/direct/create" do
      assert {:ok, response} =
               Mangopay.PayIn.DirectDebit.Direct.create(build(:pay_in_directdebit_direct))

      assert Poison.decode!(response.body)["Status"] == "FAILED"
    end
  end
end
