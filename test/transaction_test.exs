defmodule TransactionTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash()
    end
    use_cassette "wallet/create" do
      Mangopay.Wallet.create wallet_hash()
    end
    use_cassette "client_wallet/all" do
      Mangopay.ClientWallet.all
    end
    use_cassette "bank_account/iban/create" do
      Mangopay.BankAccount.create_iban created_user()["Id"], bank_account_iban_hash()
    end
    use_cassette "dispute/all" do
      Mangopay.Dispute.all
    end
    use_cassette "dispute/create" do
      created_dispute()
    end

    use_cassette "wallet/create" do
      Mangopay.Wallet.create wallet_hash()
    end
    use_cassette "client_wallet/all" do
      Mangopay.ClientWallet.all
    end

    use_cassette "card/registration/create" do
      Mangopay.Card.create card_hash()
    end
    use_cassette "card/registrationdata" do
      Mangopay.request {:post, created_registration_card()["CardRegistrationURL"] , created_registration_card_preregistrationdata()}
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

    use_cassette "preauthorization/create" do
      Mangopay.PreAuthorization.create preauthorization_hash()
    end

    use_cassette "client/get" do
      Mangopay.Client.get
    end

    use_cassette "mandate/create" do
      Mangopay.Mandate.create mandate_hash()
    end
    :ok
  end

  test "all transaction by user" do
    use_cassette "transaction/user/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_user created_user()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by wallet" do
    use_cassette "transaction/wallet/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_wallet created_wallet()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by dispute" do
    use_cassette "transaction/dispute/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_dispute created_dispute()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by client" do
    use_cassette "transaction/client/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_client created_client()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all transaction by client_wallet" do
    use_cassette "transaction/client_wallet/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_client_wallet created_client_wallet()["FundsType"], created_client_wallet()["Currency"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all transaction by preauthorization" do
    use_cassette "transaction/preauthorization/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_pre_authorization created_preauthorization()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by bank_account" do
    use_cassette "transaction/bank_account/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_bank_account created_bank_account()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by card" do
    use_cassette "transaction/card/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_card created_card()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by mandate" do
    use_cassette "transaction/mandate/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_mandate created_mandate()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end
end
