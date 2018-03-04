defmodule RepudiationTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "repudiation/dispute/create_bis" do
      created_dispute_bis
    end
    use_cassette "repudiation/get" do
      Mangopay.Repudiation.get created_dispute_bis["RepudiationId"]
    end
    :ok
  end

  test "get" do
    use_cassette "repudiation/get" do
      assert {:ok, response} = Mangopay.Repudiation.get created_repudiation["Id"]
      assert Poison.decode!(response.body)["Id"] == created_repudiation["Id"]
      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end
  end
end
