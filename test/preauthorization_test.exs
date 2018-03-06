defmodule PreauthorizationTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash()
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

    use_cassette "preauthorization/cancel" do
      Mangopay.PreAuthorization.cancel created_preauthorization()["Id"], cancel_preauthorization_hash()
    end
    :ok
  end

  test "create preauthorization" do
    use_cassette "preauthorization/create" do
      assert {:ok, response} = Mangopay.PreAuthorization.create preauthorization_hash()
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "cancel preauthorization" do
    use_cassette "preauthorization/cancel" do
      assert  {:ok, response} = Mangopay.PreAuthorization.cancel created_preauthorization()["Id"], cancel_preauthorization_hash()
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "get user" do
    use_cassette "preauthorization/get" do
      assert {:ok, response} = Mangopay.PreAuthorization.get created_preauthorization()["Id"]
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "all preauthorization by user" do
    use_cassette "preauthorization/user/all" do
      assert {:ok, response} = Mangopay.PreAuthorization.all_by_user created_user()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all preauthorization by card" do
    use_cassette "preauthorization/card/all" do
      assert {:ok, response} = Mangopay.PreAuthorization.all_by_card created_card()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
