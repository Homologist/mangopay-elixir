defmodule BankAccountTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash
    end

    use_cassette "user/legal/create" do
      Mangopay.User.Legal.create user_legal_hash
    end
    :ok
  end

  def create do
    use_cassette "bank_account/iban/create" do
      Mangopay.BankAccount.create_iban created_user["Id"], bank_account_iban_hash
    end
  end

  test "get by user bank_account" do
    use_cassette "bank_account/user/get" do
      assert  {:ok, response} = Mangopay.BankAccount.get_by_user created_user["Id"], created_bank_account["Id"]
    end
  end

  test "all bank_account by user" do
    use_cassette "bank_account/user/all" do
      assert {:ok, response} = Mangopay.BankAccount.all_by_user created_user["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "create bank_account iban" do
    use_cassette "bank_account/iban/create" do
      assert  {:ok, _} = Mangopay.BankAccount.create_iban created_user["Id"], bank_account_iban_hash
    end
  end

  test "create bank_account us" do
    use_cassette "bank_account/us/create" do
      assert  {:ok, _} = Mangopay.BankAccount.create_us created_user["Id"], bank_account_us_hash
    end
  end

  test "create bank_account ca" do
    use_cassette "bank_account/ca/create" do
      assert  {:ok, _} = Mangopay.BankAccount.create_ca created_user["Id"], bank_account_ca_hash
    end
  end

  test "create bank_account gb" do
    use_cassette "bank_account/gb/create" do
      assert  {:ok, _} = Mangopay.BankAccount.create_gb created_user["Id"], bank_account_gb_hash
    end
  end

  test "create bank_account other" do
    use_cassette "bank_account/other/create" do
      assert  {:ok, _} = Mangopay.BankAccount.create_other created_user["Id"], bank_account_other_hash
    end
  end

  test "deactivate bank_account" do
    use_cassette "bank_account/deactivate" do
      assert  {:ok, response} = Mangopay.BankAccount.deactivate created_user["Id"], created_bank_account["Id"], deactivate_bank_account_hash
    end
  end
end
