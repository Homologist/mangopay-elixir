defmodule UserTest do
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

  test "create natural user" do
    use_cassette "user/natural/create" do
      assert  {:ok, _} = Mangopay.User.Natural.create user_natural_hash
    end
  end

  test "update natural user" do
    use_cassette "user/natural/update" do
      assert  {:ok, response} = Mangopay.User.Natural.update created_natural_user["Id"], update_user_natural_hash
      assert Poison.decode!(response.body)["Id"] == created_natural_user["Id"]
    end
  end

  test "create legal user" do
    use_cassette "user/legal/create" do
      assert {:ok, _} = Mangopay.User.Legal.create user_legal_hash
    end
  end

  test "update legal user" do
    use_cassette "user/legal/update" do
      assert  {:ok, response} = Mangopay.User.Legal.update created_legal_user["Id"], update_user_legal_hash
      assert Poison.decode!(response.body)["Id"] == created_legal_user["Id"]
    end
  end

  test "get  user" do
    use_cassette "user/get" do
      assert {:ok, response} = Mangopay.User.get created_legal_user["Id"]
      assert Poison.decode!(response.body)["Id"] == created_legal_user["Id"]
    end
  end

  test "get emoney  user" do
    use_cassette "user/emoney/get" do
      assert {:ok, response} = Mangopay.User.get_emoney created_legal_user["Id"]
      assert Poison.decode!(response.body)["UserId"] == created_legal_user["Id"]
    end
  end

  test "all  user" do
    use_cassette "user/all" do
      assert {:ok, response} = Mangopay.User.all
      assert Enum.count(Poison.decode!(response.body)) > 0
    end
  end
end
