defmodule TransferTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash
    end
    use_cassette "user/natural/create_bis" do
      Mangopay.User.Natural.create user_natural_hash
    end
    use_cassette "wallet/create" do
      Mangopay.Wallet.create wallet_hash
    end
    use_cassette "wallet/create_bis" do
      Mangopay.Wallet.create wallet_hash_bis
    end


    use_cassette "card/registration/create" do
      Mangopay.Card.create card_hash
    end

    use_cassette "card/registrationdata" do
      Mangopay.request {:post, created_registration_card["CardRegistrationURL"] , created_registration_card_preregistrationdata}
    end

    use_cassette "card/update" do
      Mangopay.Card.update created_registration_card["Id"], update_card_hash
    end

    use_cassette "card/get" do
      Mangopay.Card.get updated_card["CardId"]
    end

    use_cassette "pay_in/card/direct/create" do
      Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash
    end
    Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash


    use_cassette "transfer/create" do
      Mangopay.Transfer.create transfer_hash
    end
    :ok
  end

  test "get transfer" do
    use_cassette "transfer/get" do
      assert  {:ok, response} = Mangopay.Transfer.get created_transfer["Id"]
      assert Poison.decode!(response.body)["Tag"] == transfer_hash[:Tag]
    end
  end

  test "create transfer" do
    use_cassette "transfer/create" do
      assert  {:ok, response} = Mangopay.Transfer.create transfer_hash
      assert Poison.decode!(response.body)["Tag"] == transfer_hash[:Tag]
      assert Poison.decode!(response.body)["ResultMessage"] == "Success"
    end
  end
end
