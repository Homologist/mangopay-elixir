defmodule RepudiationTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.WalletFactory
  use MangoPay.DisputeFactory
  use MangoPay.TransferFactory
  use MangoPay.RepudiationFactory
  use Helper

  setup_all do
    create_dispute_cassette()
    get_repudiation_cassette()
    :ok
  end

  test "get" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/repudiation/get" do
      assert {:ok, response} = MangoPay.Repudiation.get(build(:created_repudiation)["Id"])
      assert Poison.decode!(response.body)["Id"] == build(:created_repudiation)["Id"]
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end

    assert response = MangoPay.Repudiation.get!(build(:created_repudiation)["Id"])
    assert Poison.decode!(response.body)["Id"] == build(:created_repudiation)["Id"]
    assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
  end
end
