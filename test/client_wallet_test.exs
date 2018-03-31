defmodule ClientWalletTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Mangopay.Factory
  use Helper
  use ClientWalletHelper

  setup_all do
    create_client_wallet_cassette()
    :ok
  end

  test "get client_wallet by fund type" do
    use_cassette "#{module_name(__MODULE__)}/client_wallet/get" do
      assert {:ok, response} =
               Mangopay.ClientWallet.get_by_funds_type(created_client_wallet()["FundsType"])

      assert Poison.decode!(response.body)[:Tag] == created_client_wallet()["Tag"]
    end
  end

  test "get client_wallet by funds type by currency" do
    use_cassette "#{module_name(__MODULE__)}/client_wallet/funds_type/currency/get" do
      assert {:ok, response} =
               Mangopay.ClientWallet.get_by_funds_type_and_currency(
                 created_client_wallet()["FundsType"],
                 created_client_wallet()["Balance"]["Currency"]
               )

      assert Poison.decode!(response.body)["FundsType"] == "FEES"
    end
  end

  test "all client wallet" do
    use_cassette "#{module_name(__MODULE__)}/client_wallet/all" do
      assert {:ok, response} = Mangopay.ClientWallet.all()
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
