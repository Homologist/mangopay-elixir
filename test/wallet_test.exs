defmodule WalletTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.BankAccountFactory
  use MangoPay.WalletFactory
  use Helper

  setup_all do
    create_user_cassette()
    create_wallet_cassette()
    :ok
  end

  test "create wallet" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/wallet/create" do
      assert {:ok, response} = MangoPay.Wallet.create(build(:wallet))
      assert List.first(Poison.decode!(response.body)["Owners"]) == build(:created_user)["Id"]
    end
  end

  test "update wallet" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/wallet/update" do
      assert {:ok, response} =
               MangoPay.Wallet.update(build(:created_user)["Id"], build(:update_wallet))

      assert Poison.decode!(response.body)["Tag"] == build(:update_wallet)["Tag"]
    end
  end

  test "get user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/wallet/get" do
      assert {:ok, response} = MangoPay.Wallet.get(created_wallet()["Id"])
      assert Poison.decode!(response.body)["Id"] == created_wallet()["Id"]
    end
  end

  test "all wallet by user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/wallet/user/all" do
      assert {:ok, response} = MangoPay.Wallet.all_by_user(build(:created_user)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
