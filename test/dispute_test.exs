defmodule DisputeTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.WalletFactory
  use MangoPay.TransferFactory
  use MangoPay.DisputeFactory
  use Helper

  setup_all do
    all_dispute_cassette()
    build(:created_dispute_user)
    :ok
  end

  test "update dispute" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/update" do
      assert {:ok, response} =
               MangoPay.Dispute.update(build(:created_dispute_user)[:Id], build(:update_dispute))
      assert Poison.decode!(response.body)["Tag"] == build(:update_dispute)["Tag"]
    end
    assert response =
             MangoPay.Dispute.update!(build(:created_dispute_user)[:Id], build(:update_dispute))
    assert Poison.decode!(response.body)["Tag"] == build(:update_dispute)["Tag"]
  end

  test "get dispute" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/get" do
      assert {:ok, response} = MangoPay.Dispute.get(build(:created_dispute)["Id"])
      assert Poison.decode!(response.body)["Id"] == build(:created_dispute)["Id"]
    end
    assert response = MangoPay.Dispute.get!(build(:created_dispute)["Id"])
    assert Poison.decode!(response.body)["Id"] == build(:created_dispute)["Id"]
  end

  test "all dispute by user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/user/all" do
      assert {:ok, response} = MangoPay.Dispute.all_by_user(build(:created_dispute_user)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
    assert response = MangoPay.Dispute.all_by_user!(build(:created_dispute_user)["Id"])
    assert length(Poison.decode!(response.body)) > 0
  end

  test "all dispute by wallet" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/wallet/all" do
      assert {:ok, response} =
               MangoPay.Dispute.all_by_wallet(build(:created_dispute_wallet)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
    assert response =
             MangoPay.Dispute.all_by_wallet!(build(:created_dispute_wallet)["Id"])
    assert length(Poison.decode!(response.body)) > 0
  end

  test "all dispute by pending settlement" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/pending_settlement/all" do
      assert {:ok, response} = MangoPay.Dispute.all_by_pending_settlement()
      assert length(Poison.decode!(response.body)) > 0
    end
    assert response = MangoPay.Dispute.all_by_pending_settlement!()
    assert length(Poison.decode!(response.body)) > 0
  end

  test "all dispute" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/all" do
      assert {:ok, response} = MangoPay.Dispute.all()
      assert length(Poison.decode!(response.body)) > 0
    end
    assert response = MangoPay.Dispute.all!()
    assert length(Poison.decode!(response.body)) > 0
  end
end
