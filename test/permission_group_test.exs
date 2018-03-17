defmodule PermissionGroupTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Helper

  setup_all do
    create_permission_group_casssette()
    get_permission_group_casssette()
    :ok
  end

  test "get permission_group" do
    use_cassette "#{module_name(__MODULE__)}/permission_group/get" do
      assert  {:ok, response} = Mangopay.PermissionGroup.get created_permission_group()["Id"]
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "all permission_group" do
    use_cassette "#{module_name(__MODULE__)}/permission_group/all" do
      assert {:ok, response} = Mangopay.PermissionGroup.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "create permission_group" do
    use_cassette "#{module_name(__MODULE__)}/permission_group/create" do
      assert  {:ok, response} = Mangopay.PermissionGroup.create permission_group_hash()
      assert Poison.decode!(response.body)["tag"] == permission_group_hash()["tag"]
    end
  end

  test "update permission_group" do
    use_cassette "#{module_name(__MODULE__)}/permission_group/update" do
      assert  {:ok, response} = Mangopay.PermissionGroup.update created_permission_group()["Id"], update_permission_group_hash()
      assert Poison.decode!(response.body)["Tag"] == "custom meta update"
    end
  end
end
