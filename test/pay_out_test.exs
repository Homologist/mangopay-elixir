defmodule PayOutTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash()
    end
    use_cassette "bank_account/iban/create" do
      Mangopay.BankAccount.create_iban created_user["Id"], bank_account_iban_hash()
    end
    use_cassette "card/registration/create" do
      Mangopay.Card.create card_hash()
    end

    use_cassette "card/registrationdata" do
      Mangopay.request {:post, created_registration_card()["CardRegistrationURL"] , created_registration_card_preregistrationdata()}
    end

    use_cassette "card/update" do
      Mangopay.Card.update created_registration_card()["Id"], update_card_hash()
    end

    use_cassette "card/get" do
      Mangopay.Card.get updated_card["CardId"]
    end

    use_cassette "wallet/create" do
      Mangopay.Wallet.create wallet_hash()
    end
    use_cassette "pay_in/card/direct/create" do
      Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash()
    end

    use_cassette "pay_out/create" do
      Mangopay.PayOut.create pay_out_hash()
    end
    :ok
  end

  test "create pay_out" do
    use_cassette "pay_out/create" do
      assert {:ok, response} = Mangopay.PayOut.create pay_out_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "get pay_out" do
    use_cassette "pay_out/get" do
      assert {:ok, response} = Mangopay.PayOut.get created_pay_out()["Id"]
      assert Poison.decode!(response.body)["Id"] == created_pay_out()["Id"]
    end
  end
end
