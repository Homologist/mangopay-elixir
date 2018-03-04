defmodule WalletTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash
    end
    use_cassette "wallet/create" do
      Mangopay.Wallet.create wallet_hash
    end
    :ok
  end

  test "create wallet" do
    use_cassette "wallet/create" do
      assert {:ok, response} = Mangopay.Wallet.create wallet_hash
      assert List.first(Poison.decode!(response.body)["Owners"]) == created_user["Id"]
    end
  end

  test "update wallet" do
    use_cassette "wallet/update" do
      assert  {:ok, response} = Mangopay.Wallet.update created_user["Id"], update_wallet_hash
      assert Poison.decode!(response.body)["Tag"] == update_wallet_hash["Tag"]
    end
  end

  test "get user" do
    use_cassette "wallet/get" do
      assert {:ok, response} = Mangopay.Wallet.get created_wallet["Id"]
      assert Poison.decode!(response.body)["Id"] == created_wallet["Id"]
    end
  end

  test "all wallet by user" do
    use_cassette "wallet/user/all" do
      assert {:ok, response} = Mangopay.Wallet.all_by_user created_user["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
