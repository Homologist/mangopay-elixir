defmodule RefundTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash()
    end

    use_cassette "user/natural/create_bis" do
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
    use_cassette "wallet/create_bis" do
      Mangopay.Wallet.create wallet_hash_bis()
    end

    use_cassette "pay_in/card/direct/create" do
      Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash()
    end
    Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash()

    use_cassette "transfer/create" do
      Mangopay.Transfer.create transfer_hash()
    end
    use_cassette "refund/transfer/create" do
      Mangopay.Refund.Transfer.create created_transfer()["Id"], transfer_hash()
    end
    use_cassette "refund/pay_in/create" do
      Mangopay.Refund.PayIn.create created_pay_in()["Id"], refund_pay_in_hash()
    end

    use_cassette "pay_out/create" do
      Mangopay.PayOut.create pay_out_hash()
    end
    use_cassette "refund/dispute/create_bis" do
      created_dispute_bis()
    end
    use_cassette "repudiation/get" do
      Mangopay.Repudiation.get created_dispute_bis()["RepudiationId"]
    end
    :ok
  end

  test "get refund" do
    use_cassette "refund/get" do
      assert {:ok, response} = Mangopay.Refund.get created_refund()["Id"]
      assert Poison.decode!(response.body)["Id"] == created_refund()["Id"]
    end
  end

  test "create refund in pay in direct" do
    use_cassette "refund/pay_in/create" do
      assert {:ok, response} = Mangopay.Refund.PayIn.create created_pay_in()["Id"], refund_pay_in_hash()
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "create refund transfer direct" do
    use_cassette "refund/transfer/create" do
      assert {:ok, response} = Mangopay.Refund.Transfer.create created_transfer()["Id"], refund_transfer_hash()
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "all refund by pay in" do
    use_cassette "refund/pay_in/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_pay_in created_pay_in()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all by pay_out" do
    use_cassette "refund/pay_out/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_pay_out created_pay_out()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all by transfer" do
    use_cassette "refund/transfer/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_transfer created_transfer()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all by repudiation" do
    use_cassette "refund/repudiation/all" do
      assert  {:ok, response} = Mangopay.Refund.all_by_repudiation created_repudiation()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end
end
