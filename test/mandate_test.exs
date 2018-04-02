defmodule MandateTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.UserFactory
  use Mangopay.BankAccountFactory
  use Mangopay.MandateFactory
  use Helper

  setup_all do
    create_mandate_cassette()
    :ok
  end

  test "create mandate" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/mandate/create" do
      assert {:ok, response} = Mangopay.Mandate.create(build(:mandate))
      assert Poison.decode!(response.body)["Status"] == "CREATED"
      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end
  end

  test "cancel mandate" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/mandate/cancel" do
      assert {:ok, response} =
               Mangopay.Mandate.cancel(build(:created_user)["Id"], build(:update_mandate))

      assert Poison.decode!(response.body)["Tag"] == build(:cancel_mandate)["Tag"]
    end
  end

  test "get user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/mandate/get" do
      assert {:ok, response} = Mangopay.Mandate.get(build(:created_mandate)["Id"])
      assert Poison.decode!(response.body)["Id"] == build(:created_mandate)["Id"]
    end
  end

  test "all mandate" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/mandate/all" do
      assert {:ok, response} = Mangopay.Mandate.all()
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all mandate by user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/mandate/user/all" do
      Mangopay.Mandate.create(build(:mandate))
      assert {:ok, response} = Mangopay.Mandate.all_by_user(build(:created_user)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all mandate by user and bank_account" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/mandate/user/bank_account/all" do
      assert {:ok, response} =
               Mangopay.Mandate.all_by_user_and_bank_account(
                 build(:created_user)["Id"],
                 build(:created_bank_account)["Id"]
               )

      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
