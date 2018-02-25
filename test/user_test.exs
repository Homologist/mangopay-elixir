defmodule UserTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "create natural user" do
    use_cassette "user/natural/create" do
      assert  {:ok, _} = Mangopay.User.Natural.create Helper.user_natural_hash
    end
  end

  test "update natural user" do
    use_cassette "user/natural/update" do
      assert  {:ok, response} = Mangopay.User.Natural.update Helper.created_user(Helper.fixture_path("/user/natural/create.json"))["Id"], Helper.update_user_natural_hash
      assert Poison.decode!(response.body)["Id"] == Helper.created_user(Helper.fixture_path("/user/natural/create.json"))["Id"]
    end
  end

  test "create legal user" do
    use_cassette "user/legal/create" do
      assert {:ok, _} = Mangopay.User.Legal.create Helper.user_legal_hash
    end
  end

  test "update legal user" do
    use_cassette "user/legal/update" do
      assert  {:ok, response} = Mangopay.User.Legal.update Helper.created_user(Helper.fixture_path("/user/legal/create.json"))["Id"], Helper.update_user_legal_hash
      assert Poison.decode!(response.body)["Id"] == Helper.created_user(Helper.fixture_path("/user/legal/create.json"))["Id"]
    end
  end

  test "get  user" do
    use_cassette "user/get" do
      assert {:ok, response} = Mangopay.User.get Helper.created_user(Helper.fixture_path("/user/legal/create.json"))["Id"]
      assert Poison.decode!(response.body)["Id"] == Helper.created_user(Helper.fixture_path("/user/legal/create.json"))["Id"]
    end
  end

  test "get emoney  user" do
    use_cassette "user/emoney/get" do
      assert {:ok, response} = Mangopay.User.get_emoney Helper.created_user(Helper.fixture_path("/user/legal/create.json"))["Id"]
      assert Poison.decode!(response.body)["UserId"] == Helper.created_user(Helper.fixture_path("/user/legal/create.json"))["Id"]
    end
  end

  test "all  user" do
    use_cassette "user/all" do
      assert {:ok, response} = Mangopay.User.all
      assert Enum.count(Poison.decode!(response.body)) > 0
    end
  end
end
