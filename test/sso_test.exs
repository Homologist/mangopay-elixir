defmodule SsoTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.UserFactory
  use Mangopay.PermissionGroupFactory
  use Mangopay.SsoFactory
  use Helper

  setup_all do
    create_user_cassette()
    create_permission_group_cassette()
    create_sso_cassette()
    :ok
  end

  test "create sso" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/create" do
      assert {:ok, response} = Mangopay.Sso.create(sso_hash())
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "update sso" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/update" do
      assert {:ok, response} = Mangopay.Sso.update(created_sso()["Id"], update_sso_hash())
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "get sso" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/get" do
      assert {:ok, response} = Mangopay.Sso.get(created_sso()["Id"])
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "all sso" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/all" do
      assert {:ok, response} = Mangopay.Sso.all()
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "extend invitation sso" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/extend_invitation/update" do
      assert {:ok, response} = Mangopay.Sso.extend_invitation(created_sso()["Id"])
      assert Poison.decode!(response.body)["Tag"] == "custom meta"
    end
  end

  test "all by permission group sso" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/permission_group/all" do
      assert {:ok, response} =
               Mangopay.Sso.all_by_permission_group(created_permission_group()["Id"])

      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
