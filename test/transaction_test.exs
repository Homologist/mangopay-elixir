defmodule TransactionTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Helper

  setup_all do
    create_card_cassette()
    create_wallet_cassette()
    all_client_wallet()
    create_bank_account_cassette()
    create_dispute_cassette()
    create_wallet_cassette()
    create_preauthorization_cassette()
    get_client_cassette()
    create_mandate_cassette()
    :ok
  end

  test "all transaction by user" do
    use_cassette "#{module_name(__MODULE__)}/transaction/user/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_user created_user()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by wallet" do
    use_cassette "#{module_name(__MODULE__)}/transaction/wallet/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_wallet created_wallet()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by dispute" do
    use_cassette "#{module_name(__MODULE__)}/transaction/dispute/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_dispute created_dispute()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by client" do
    use_cassette "#{module_name(__MODULE__)}/transaction/client/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_client created_client()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all transaction by client_wallet" do
    use_cassette "#{module_name(__MODULE__)}/transaction/client_wallet/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_client_wallet created_client_wallet()["FundsType"], created_client_wallet()["Currency"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all transaction by preauthorization" do
    use_cassette "#{module_name(__MODULE__)}/transaction/preauthorization/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_pre_authorization created_preauthorization()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by bank_account" do
    use_cassette "#{module_name(__MODULE__)}/transaction/bank_account/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_bank_account created_bank_account()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by card" do
    use_cassette "#{module_name(__MODULE__)}/transaction/card/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_card created_card()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end

  test "all transaction by mandate" do
    use_cassette "#{module_name(__MODULE__)}/transaction/mandate/all" do
      assert {:ok, response} = Mangopay.Transaction.all_by_mandate created_mandate()["Id"]
      assert length(Poison.decode!(response.body)) == 0
    end
  end
end
