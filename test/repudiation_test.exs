defmodule RepudiationTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.UserFactory
  use Mangopay.WalletFactory
  use Mangopay.DisputeFactory
  use Mangopay.TransferFactory
  use Mangopay.RepudiationFactory
  use Helper

  setup_all do
    create_dispute_cassette()
    get_repudiation_cassette()
    :ok
  end

  test "get" do
    use_cassette "#{module_name(__MODULE__)}/repudiation/get" do
      assert {:ok, response} = Mangopay.Repudiation.get(build(:created_repudiation)["Id"])
      assert Poison.decode!(response.body)["Id"] == build(:created_repudiation)["Id"]
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end
end
