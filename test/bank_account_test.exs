defmodule BankAccountTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use BankAccountHelper

  setup_all do
    create_user_cassette()
    create_bank_account_cassette()
    :ok
  end

  def create do
    use_cassette "#{module_name(__MODULE__)}/bank_account/iban/create" do
      Mangopay.BankAccount.create_iban created_user()["Id"], bank_account_iban_hash()
    end
  end

  test "get by user bank_account" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/get" do
      assert {:ok, response} = Mangopay.BankAccount.get_by_user created_user()["Id"], created_bank_account()["Id"]
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "all bank_account by user" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/user/all" do
      assert {:ok, response} = Mangopay.BankAccount.all_by_user created_user()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "create bank_account iban" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/iban/create" do
      assert  {:ok, response} = Mangopay.BankAccount.create_iban created_user()["Id"], bank_account_iban_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "create bank_account us" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/us/create" do
      assert {:ok, response} = Mangopay.BankAccount.create_us created_user()["Id"], bank_account_us_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "create bank_account ca" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/ca/create" do
      assert {:ok, response} = Mangopay.BankAccount.create_ca created_user()["Id"], bank_account_ca_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "create bank_account gb" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/gb/create" do
      assert {:ok, response} = Mangopay.BankAccount.create_gb created_user()["Id"], bank_account_gb_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "create bank_account other" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/other/create" do
      assert {:ok, response} = Mangopay.BankAccount.create_other created_user()["Id"], bank_account_other_hash()
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "deactivate bank_account" do
    use_cassette "#{module_name(__MODULE__)}/bank_account/deactivate" do
      created_user()["Id"]
      created_bank_account()["Id"]
      deactivate_bank_account_hash()
      assert  {:ok, response} = Mangopay.BankAccount.deactivate created_user()["Id"], created_bank_account()["Id"], deactivate_bank_account_hash()
      assert(Poison.decode!(response.body)["UserId"] == created_user()["Id"])
    end
  end
end
