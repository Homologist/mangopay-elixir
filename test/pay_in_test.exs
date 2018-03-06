defmodule PayInTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash()
    end
    use_cassette "bank_account/iban/create" do
      Mangopay.BankAccount.create_iban created_user()["Id"], bank_account_iban_hash()
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
      Mangopay.Card.get updated_card()["CardId"]
    end

    use_cassette "wallet/create" do
      Mangopay.Wallet.create wallet_hash()
    end
    use_cassette "pay_in/card/web/create" do
      Mangopay.PayIn.Card.Web.create pay_in_card_web_hash()
    end
    use_cassette "pay_in/card/direct/create" do
      Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash()
    end
    use_cassette "mandate/create" do
      Mangopay.Mandate.create mandate_hash()
    end
    use_cassette "preauthorization/create_bis" do
      Mangopay.PreAuthorization.create preauthorization_hash()
    end

    use_cassette "pay_in/card/pre_authorized/create" do
      Mangopay.PayIn.Card.PreAuthorized.create pay_in_card_preauthorized_hash()
    end
    :ok
  end

  test "get pay in card web" do
    use_cassette "pay_in/card/web/get" do
      assert {:ok, response} = Mangopay.PayIn.get created_pay_in()["Id"]
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in card web" do
    use_cassette "pay_in/card/web/create" do
      assert {:ok, response} = Mangopay.PayIn.Card.Web.create pay_in_card_web_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in card direct" do
    use_cassette "pay_in/card/direct/create" do
      assert {:ok, response} = Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash()
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in card preauthorized" do
    use_cassette "pay_in/card/pre_authorized/create" do
      assert {:ok, response} = Mangopay.PayIn.Card.PreAuthorized.create pay_in_card_preauthorized_hash()
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create pay in bank wire wallet" do
    use_cassette "pay_in/bank_wire/wallet/create" do
      assert {:ok, response} = Mangopay.PayIn.BankWire.Wallet.create pay_in_bank_wire_wallet_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in bank wire direct" do
    use_cassette "pay_in/bank_wire/direct/create" do
      assert {:ok, response} = Mangopay.PayIn.BankWire.Direct.create pay_in_bank_wire_direct_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in direct-debit web" do
    use_cassette "pay_in/direct_debit/web/create" do
      assert {:ok, response} = Mangopay.PayIn.DirectDebit.Web.create pay_in_directdebit_web_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create pay in direct-debit direct" do
    use_cassette "pay_in/direct_debit/direct/create" do
      assert {:ok, response} = Mangopay.PayIn.DirectDebit.Direct.create pay_in_directdebit_direct_hash()
      assert Poison.decode!(response.body)["Status"] == "FAILED"
    end
  end
end
