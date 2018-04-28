defmodule PayOutTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.CardFactory
  use MangoPay.BankAccountFactory
  use MangoPay.PreauthorizationFactory
  use MangoPay.MandateFactory
  use MangoPay.WalletFactory
  use MangoPay.PayInFactory
  use MangoPay.PayOutFactory
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
      assert {:ok, response} = MangoPay.PayOut.create(pay_out_hash())
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
    assert response = MangoPay.PayOut.create!(pay_out_hash())
    assert Poison.decode!(response.body)["Status"] == "CREATED"
  end

  test "get pay_out" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_out/get" do
      assert {:ok, response} = MangoPay.PayOut.get(created_pay_out()["Id"])
      assert Poison.decode!(response.body)["Id"] == created_pay_out()["Id"]
    end
    assert response = MangoPay.PayOut.get!(created_pay_out()["Id"])
    assert Poison.decode!(response.body)["Id"] == created_pay_out()["Id"]
  end
end
