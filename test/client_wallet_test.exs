defmodule ClientWalletTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "client_wallet/all" do
      Mangopay.ClientWallet.all
   end
    :ok
  end

  test "get client_wallet by fund type" do
    use_cassette "client_wallet/get" do
      assert  {:ok, response} = Mangopay.ClientWallet.get_by_funds_type created_client_wallet()["FundsType"]
      assert Poison.decode!(response.body)[:Tag] == created_client_wallet()["Tag"]
    end
  end

  test "get client_wallet by funds type by currency" do
    use_cassette "client_wallet/funds_type/currency/get" do
      assert  {:ok, response} = Mangopay.ClientWallet.get_by_funds_type_and_currency created_client_wallet()["FundsType"], created_client_wallet()["Balance"]["Currency"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all client wallet" do
    use_cassette "client_wallet/all" do
      assert {:ok, response} = Mangopay.ClientWallet.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
