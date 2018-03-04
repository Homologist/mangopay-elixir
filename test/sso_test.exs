defmodule SsoTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash
    end
    use_cassette "permission_group/create" do
      Mangopay.PermissionGroup.create permission_group_hash
    end
    use_cassette "sso/create" do
      Mangopay.Sso.create sso_hash
    end
    :ok
  end

  test "create sso" do
    use_cassette "sso/create" do
      assert {:ok, response} = Mangopay.Sso.create sso_hash
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "update sso" do
    use_cassette "sso/update" do
      assert  {:ok, response} = Mangopay.Sso.update created_sso["Id"], update_sso_hash
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "get sso" do
    use_cassette "sso/get" do
      assert {:ok, response} = Mangopay.Sso.get created_sso["Id"]
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "all sso" do
    use_cassette "sso/all" do
      assert {:ok, response} = Mangopay.Sso.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "extend invitation sso" do
    use_cassette "sso/extend_invitation/update" do
      assert  {:ok, response} = Mangopay.Sso.extend_invitation created_sso["Id"]
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "all by permission group sso" do
    use_cassette "sso/permission_group/all" do
      assert {:ok, response} = Mangopay.Sso.all_by_permission_group created_permission_group["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
