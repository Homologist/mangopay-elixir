defmodule CardTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash
    end
    use_cassette "user/legal/create" do
      Mangopay.User.Legal.create user_legal_hash
    end
    use_cassette "card/create" do
      Mangopay.Card.create card_hash
    end
    use_cassette "card/registrationdata" do
      a = Mangopay.request {:post, created_card["CardRegistrationURL"] , card_registration_data}
    end
    use_cassette "card/update" do
      Mangopay.Card.update created_card["Id"], update_card_hash
    end
    :ok
  end

  test "create card" do
    use_cassette "card/create" do
      assert  {:ok, _} = Mangopay.Card.create card_hash
    end
  end

  test "get card" do
    use_cassette "card/get" do
      assert  {:ok, response} = Mangopay.Card.get card_hash["Id"]
    end
  end

  test "update card" do
    use_cassette "card/update" do
      assert  {:ok, response} = Mangopay.Card.update created_card["Id"], update_card_hash
      assert Poison.decode!(response.body)["Id"] == created_card["Id"]
    end
  end

  test "all cards by fingerprints" do
    use_cassette "card/fingerprint/all" do
      assert {:ok, response} = Mangopay.Card.all_by_fingerprints created_card["Fingerprint"]
      assert Enum.count(Poison.decode!(response.body)) > 0
    end
  end

  test "all by user" do
    use_cassette "card/user/all" do
      assert  {:ok, response} = Mangopay.Card.all_by_user created_card["UserId"]
IO.inspect response.body
IO.inspect "okokokokokdddd#{created_card["UserId"]}"
      assert Enum.count(Poison.decode!(response.body)) > 0
    end
  end

  test "all transaction by fingerprint" do
    use_cassette "transaction/fingerprint/all" do
      assert {:ok, response} = Mangopay.Card.all_by_fingerprints created_card["Fingerprint"]
      assert Enum.count(Poison.decode!(response.body)) > 0
    end
  end

  test "deactivate card" do
    use_cassette "card/create_bis" do
      assert  {:ok, response} = Mangopay.Card.create card_hash
    end

    use_cassette "card/deactivate" do
      assert  {:ok, response} = Mangopay.Card.deactivate created_card_bis["Id"], deactivate_card_hash
    end
  end
end
