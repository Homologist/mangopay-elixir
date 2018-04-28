defmodule ClientWalletTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.ClientWalletFactory
  use Helper

  setup_all do
    create_client_wallet_cassette()
    :ok
  end

  test "get client_wallet by fund type" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/client_wallet/get" do
      assert {:ok, response} =
               MangoPay.ClientWallet.all_by_funds_type(created_client_wallet()["FundsType"])

      assert Poison.decode!(response.body)[:Tag] == created_client_wallet()["Tag"]
    end

    assert response =
             MangoPay.ClientWallet.all_by_funds_type!(created_client_wallet()["FundsType"])

    assert Poison.decode!(response.body)[:Tag] == created_client_wallet()["Tag"]
  end

  test "get client_wallet by funds type by currency" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/client_wallet/funds_type/currency/get" do
      assert {:ok, response} =
               MangoPay.ClientWallet.get_by_funds_type_and_currency(
                 created_client_wallet()["FundsType"],
                 created_client_wallet()["Balance"]["Currency"]
               )

      assert Poison.decode!(response.body)["FundsType"] == "FEES"
    end

    assert response =
             MangoPay.ClientWallet.get_by_funds_type_and_currency!(
               created_client_wallet()["FundsType"],
               created_client_wallet()["Balance"]["Currency"]
             )

    assert Poison.decode!(response.body)["FundsType"] == "FEES"
  end

  test "all client wallet" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/client_wallet/all" do
      assert {:ok, response} = MangoPay.ClientWallet.all()
      assert length(Poison.decode!(response.body)) > 0
    end

    assert response = MangoPay.ClientWallet.all!()
    assert length(Poison.decode!(response.body)) > 0
  end
end
