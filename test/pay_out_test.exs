defmodule PayOutTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.UserFactory
  use Mangopay.CardFactory
  use Mangopay.BankAccountFactory
  use Mangopay.PreauthorizationFactory
  use Mangopay.MandateFactory
  use Mangopay.WalletFactory
  use Mangopay.PayInFactory
  use Mangopay.PayOutFactory
  use Helper

  setup_all do
    create_card_cassette()
    create_bank_account_cassette()
    create_wallet_cassette()
    create_pay_in_direct_cassette()
    create_pay_out_cassette()
    :ok
  end

  test "create pay_out" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_out/create" do
      assert {:ok, response} = Mangopay.PayOut.create(pay_out_hash())
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "get pay_out" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_out/get" do
      assert {:ok, response} = Mangopay.PayOut.get(created_pay_out()["Id"])
      assert Poison.decode!(response.body)["Id"] == created_pay_out()["Id"]
    end
  end
end
