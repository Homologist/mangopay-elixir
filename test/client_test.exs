defmodule ClientTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Mangopay.Factory
  use Helper
  use ClientHelper

  test "get client" do
    use_cassette "#{module_name(__MODULE__)}/client/get" do
      assert {:ok, response} = Mangopay.Client.get()
      assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
    end
  end

  test "update client" do
    use_cassette "#{module_name(__MODULE__)}/client/update" do
      assert {:ok, response} = Mangopay.Client.update(update_client_hash())
      assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
    end
  end

  test "update_logo client iban" do
    use_cassette "#{module_name(__MODULE__)}/client/logo/update" do
      assert {:ok, response} = Mangopay.Client.update_logo(update_logo_client_hash())
      assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
    end
  end
end
