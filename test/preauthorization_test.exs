defmodule PreauthorizationTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.UserFactory
  use Mangopay.CardFactory
  use Mangopay.PreauthorizationFactory
  use Helper

  setup_all do
    create_card_cassette()
    create_preauthorization_cassette()
    cancel_preauthorization_cassette()
    :ok
  end

  test "create preauthorization" do
    use_cassette "preauthorization/create" do
      assert {:ok, response} = Mangopay.PreAuthorization.create(preauthorization_hash())
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "cancel preauthorization" do
    use_cassette "#{module_name(__MODULE__)}/preauthorization/cancel" do
      assert {:ok, response} =
               Mangopay.PreAuthorization.cancel(
                 created_preauthorization()["Id"],
                 cancel_preauthorization_hash()
               )

      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "get user" do
    use_cassette "#{module_name(__MODULE__)}/preauthorization/get" do
      assert {:ok, response} = Mangopay.PreAuthorization.get(created_preauthorization()["Id"])
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end

  test "all preauthorization by user" do
    use_cassette "#{module_name(__MODULE__)}/preauthorization/user/all" do
      assert {:ok, response} = Mangopay.PreAuthorization.all_by_user(build(:created_user)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all preauthorization by card" do
    use_cassette "#{module_name(__MODULE__)}/preauthorization/card/all" do
      assert {:ok, response} = Mangopay.PreAuthorization.all_by_card(created_card()["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
