defmodule DisputeTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use WalletHelper
  use TransferHelper
  use DisputeHelper

  setup_all do
    all_dispute_cassette()
    created_dispute_user()
    :ok
  end

  test "update dispute" do
    use_cassette "#{module_name(__MODULE__)}/dispute/update" do
      assert  {:ok, response} = Mangopay.Dispute.update created_dispute_user()[:Id], update_dispute_hash()
      assert Poison.decode!(response.body)["Tag"] == update_dispute_hash()["Tag"]
    end
  end

  test "get dispute" do
    use_cassette "#{module_name(__MODULE__)}/dispute/get" do
      assert {:ok, response} = Mangopay.Dispute.get created_dispute()["Id"]
      assert Poison.decode!(response.body)["Id"] == created_dispute()["Id"]
    end
  end

  test "all dispute by user" do
    use_cassette "#{module_name(__MODULE__)}/dispute/user/all" do
      assert {:ok, response} = Mangopay.Dispute.all_by_user created_dispute_user()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all dispute by wallet" do
    use_cassette "#{module_name(__MODULE__)}/dispute/wallet/all" do
      assert {:ok, response} = Mangopay.Dispute.all_by_wallet created_dispute_wallet()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all dispute by pending settlement" do
    use_cassette "#{module_name(__MODULE__)}/dispute/pending_settlement/all" do
      assert {:ok, response} = Mangopay.Dispute.all_by_pending_settlement
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all dispute" do
    use_cassette "#{module_name(__MODULE__)}/dispute/all" do
      assert {:ok, response} = Mangopay.Dispute.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  def created_dispute_transaction do
    response = created_dispute_bis()
    id = response["Id"]
    {:ok, response} = Mangopay.Transaction.all_by_dispute(id)
    List.last Poison.decode!(response.body)
  end

  def created_dispute_user do
    response = created_dispute_transaction()
    id = response["AuthorId"]
    {:ok, response} = Mangopay.User.get(id)
    Poison.decode!(response.body)
  end

  def created_dispute_wallet do
    response  = created_dispute_transaction()
    id = response["DebitedWalletId"]
    {:ok, response} = Mangopay.Wallet.get(id)
    Poison.decode!(response.body)
  end
end
