defmodule PermissionGroupTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "permission_group/create" do
      Mangopay.PermissionGroup.create permission_group_hash
    end
    use_cassette "permission_group/get" do
      Mangopay.PermissionGroup.get created_permission_group["Id"]
    end
    :ok
  end

  test "get permission_group" do
    use_cassette "permission_group/get" do
      assert  {:ok, response} = Mangopay.PermissionGroup.get created_permission_group["Id"]
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "all permission_group" do
    use_cassette "permission_group/all" do
      assert {:ok, response} = Mangopay.PermissionGroup.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "create permission_group" do
    use_cassette "permission_group/create" do
      assert  {:ok, response} = Mangopay.PermissionGroup.create permission_group_hash
      assert Poison.decode!(response.body)["tag"] == permission_group_hash["tag"]
    end
  end

  test "update permission_group" do
    use_cassette "permission_group/update" do
      assert  {:ok, response} = Mangopay.PermissionGroup.update created_permission_group["Id"], update_permission_group_hash
      assert Poison.decode!(response.body)["Tag"] == "custom meta update"
    end
  end
end
