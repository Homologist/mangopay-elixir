defmodule CardTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash()
    end

    use_cassette "user/legal/create" do
      Mangopay.User.Legal.create user_legal_hash()
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
 
    use_cassette "card/create" do
      Mangopay.Card.get updated_card()["CardId"]
    end

    use_cassette "card/get" do
      Mangopay.Card.get updated_card()["CardId"]
    end
    :ok
  end

  test "create card" do
    use_cassette "card/registration/create" do
      assert  {:ok, response} = Mangopay.Card.create card_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "get card" do
    use_cassette "card/get" do
      assert  {:ok, response} = Mangopay.Card.get updated_card()["CardId"]
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "update card" do
    use_cassette "card/update" do
      assert  {:ok, response} = Mangopay.Card.update created_registration_card()["Id"], update_card_hash()
      assert Poison.decode!(response.body)["Id"] == created_registration_card()["Id"]
    end
  end

  test "all cards by fingerprints" do
    use_cassette "card/fingerprint/all" do
      assert {:ok, response} = Mangopay.Card.all_by_fingerprints created_card()["Fingerprint"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all by user" do
    use_cassette "card/user/all" do
      assert  {:ok, response} = Mangopay.Card.all_by_user created_registration_card()["UserId"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all user by fingerprint" do
    use_cassette "card/user/fingerprint/all" do
#      assert  {:ok, response} = Mangopay.Card.all_user_by_fingerprint created_card()["Fingerprint"]
#      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all transaction by fingerprint" do
    use_cassette "transaction/fingerprint/all" do
      assert {:ok, response} = Mangopay.Card.all_by_fingerprints created_card()["Fingerprint"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "deactivate card" do
    use_cassette "card/create_bis" do
      assert  {:ok, response} = Mangopay.Card.create card_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end

    use_cassette "card/deactivate" do
      assert  {:ok, response} = Mangopay.Card.deactivate created_card_bis()["Id"], deactivate_card_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end
end
