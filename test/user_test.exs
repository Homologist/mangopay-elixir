defmodule UserTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use Helper

  setup_all do
    create_user_cassette()

    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/legal/create" do
      MangoPay.User.Legal.create(build(:user_legal))
    end

    :ok
  end

  test "create natural user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/natural/create" do
      assert {:ok, _} = MangoPay.User.Natural.create(build(:user_natural))
    end

    assert response = MangoPay.User.Natural.create!(build(:user_natural))
    assert Poison.decode!(response.body)["Tag"] == "Test natural user"
  end

  test "update natural user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/natural/update" do
      assert {:ok, response} =
               MangoPay.User.Natural.update(
                 build(:created_natural_user)["Id"],
                 build(:update_user_natural)
               )

      assert Poison.decode!(response.body)["Id"] == build(:created_natural_user)["Id"]
    end

    assert response =
             MangoPay.User.Natural.update!(
               build(:created_natural_user)["Id"],
               build(:update_user_natural)
             )

    assert Poison.decode!(response.body)["Id"] == build(:created_natural_user)["Id"]
  end

  test "create legal user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/legal/create" do
      assert {:ok, _} = MangoPay.User.Legal.create(build(:user_legal))
    end

    assert response = MangoPay.User.Legal.create!(build(:user_legal))
    assert Poison.decode!(response.body)["Tag"] == "Test legal user"
  end

  test "update legal user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/legal/update" do
      assert {:ok, response} =
               MangoPay.User.Legal.update(
                 build(:created_legal_user)["Id"],
                 build(:update_user_legal)
               )

      assert Poison.decode!(response.body)["Id"] == build(:created_legal_user)["Id"]
    end

    assert response =
             MangoPay.User.Legal.update!(
               build(:created_legal_user)["Id"],
               build(:update_user_legal)
             )

    assert Poison.decode!(response.body)["Id"] == build(:created_legal_user)["Id"]
  end

  test "get  user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/get" do
      assert {:ok, response} = MangoPay.User.get(build(:created_legal_user)["Id"])
      assert Poison.decode!(response.body)["Id"] == build(:created_legal_user)["Id"]
    end

    assert response = MangoPay.User.get!(build(:created_legal_user)["Id"])
    assert Poison.decode!(response.body)["Id"] == build(:created_legal_user)["Id"]
  end

  test "get emoney  user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/emoney/get" do
      assert {:ok, response} = MangoPay.User.get_emoney(build(:created_legal_user)["Id"])
      assert Poison.decode!(response.body)["UserId"] == build(:created_legal_user)["Id"]
    end

    assert response = MangoPay.User.get_emoney!(build(:created_legal_user)["Id"])
    assert Poison.decode!(response.body)["UserId"] == build(:created_legal_user)["Id"]
  end

  test "all  user" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/all" do
      assert {:ok, response} = MangoPay.User.all()
      assert Enum.count(Poison.decode!(response.body)) > 0
    end

    assert response = MangoPay.User.all!()
    assert Enum.count(Poison.decode!(response.body)) > 0
  end
end
