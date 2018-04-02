defmodule HookTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Mangopay.Factory
  use Mangopay.HookFactory
  use Helper

  setup_all do
    create_hook_cassette()
    :ok
  end

  test "create hook" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/create" do
      assert {:ok, response} = Mangopay.Hook.create(hook_hash())

      assert Poison.decode!(response.body)["errors"]["EventType"] ==
               "A hook has already been registered for this EventType"
    end
  end

  test "update hook" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/update" do
      assert {:ok, response} = Mangopay.Hook.update(created_hook()["Id"], update_hook_hash())
      assert Poison.decode!(response.body)["Tag"] == update_hook_hash()[:Tag]
    end
  end

  test "get hook" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/get" do
      assert {:ok, response} = Mangopay.Hook.get(created_hook()["Id"])
      assert Poison.decode!(response.body)["Id"] == created_hook()["Id"]
    end
  end

  test "all hook" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/all" do
      assert {:ok, response} = Mangopay.Hook.all()
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
