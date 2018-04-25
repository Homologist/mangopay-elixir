defmodule BankAccountTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.BankAccountFactory
  use Helper

  setup_all do
    create_user_cassette()
    create_bank_account_cassette()
    :ok
  end

  def create do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/iban/create" do
      MangoPay.BankAccount.create_iban(build(:created_user)["Id"], build(:bank_account_iban))
    end
  end

  test "get by user bank_account" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/get" do
      assert {:ok, response} =
               MangoPay.BankAccount.get_by_user(
                 build(:created_user)["Id"],
                 build(:created_bank_account)["Id"]
               )

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/get" do
      assert response =
               MangoPay.BankAccount.get_by_user!(
                 build(:created_user)["Id"],
                 build(:created_bank_account)["Id"]
               )

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end
  end

  test "all bank_account by user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/user/all" do
      assert {:ok, response} = MangoPay.BankAccount.all_by_user(build(:created_user)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/user/all" do
      assert response = MangoPay.BankAccount.all_by_user!(build(:created_user)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "create bank_account iban" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/iban/create" do
      assert {:ok, response} =
               MangoPay.BankAccount.create_iban(
                 build(:created_user)["Id"],
                 build(:bank_account_iban)
               )

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/iban/create" do
      assert response =
               MangoPay.BankAccount.create_iban!(
                 build(:created_user)["Id"],
                 build(:bank_account_iban)
               )

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end
  end

  test "create bank_account us" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/us/create" do
      assert {:ok, response} =
               MangoPay.BankAccount.create_us(build(:created_user)["Id"], build(:bank_account_us))

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/us/create" do
      assert response =
               MangoPay.BankAccount.create_us!(build(:created_user)["Id"], build(:bank_account_us))

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end
  end

  test "create bank_account ca" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/ca/create" do
      assert {:ok, response} =
               MangoPay.BankAccount.create_ca(build(:created_user)["Id"], build(:bank_account_ca))

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/ca/create" do
      assert response =
               MangoPay.BankAccount.create_ca!(build(:created_user)["Id"], build(:bank_account_ca))

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end
  end

  test "create bank_account gb" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/gb/create" do
      assert {:ok, response} =
               MangoPay.BankAccount.create_gb(build(:created_user)["Id"], build(:bank_account_gb))

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/gb/create" do
      assert response =
               MangoPay.BankAccount.create_gb!(build(:created_user)["Id"], build(:bank_account_gb))

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end
  end

  test "create bank_account other" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/other/create" do
      assert {:ok, response} =
               MangoPay.BankAccount.create_other(
                 build(:created_user)["Id"],
                 build(:bank_account_other)
               )

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/other/create" do
      assert response =
               MangoPay.BankAccount.create_other!(
                 build(:created_user)["Id"],
                 build(:bank_account_other)
               )

      assert Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"]
    end
  end

  test "deactivate bank_account" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/deactivate" do
      build(:created_user)["Id"]
      build(:created_bank_account)["Id"]
      build(:deactivate_bank_account)

      assert {:ok, response} =
               MangoPay.BankAccount.deactivate(
                 build(:created_user)["Id"],
                 build(:created_bank_account)["Id"],
                 build(:deactivate_bank_account)
               )

      assert(Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"])
    end

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/deactivate" do
      build(:created_user)["Id"]
      build(:created_bank_account)["Id"]
      build(:deactivate_bank_account)

      assert response =
               MangoPay.BankAccount.deactivate!(
                 build(:created_user)["Id"],
                 build(:created_bank_account)["Id"],
                 build(:deactivate_bank_account)
               )

      assert(Poison.decode!(response.body)["UserId"] == build(:created_user)["Id"])
    end
  end
end
