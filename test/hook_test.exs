defmodule HookTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "hook/create" do
      Mangopay.Hook.create hook_hash()
    end
    use_cassette "hook/all" do
      assert {:ok, response} = Mangopay.Hook.all
    end
    :ok
  end

  test "create hook" do
    use_cassette "hook/create" do
      assert {:ok, response} = Mangopay.Hook.create hook_hash()
      assert Poison.decode!(response.body)["errors"]["EventType"] == "A hook has already been registered for this EventType"
    end
  end

  test "update hook" do
    use_cassette "hook/update" do
      assert  {:ok, response} = Mangopay.Hook.update created_hook()["Id"], update_hook_hash()
      assert Poison.decode!(response.body)["Tag"] == update_hook_hash()[:Tag]
    end
  end

  test "get hook" do
    use_cassette "hook/get" do
      assert {:ok, response} = Mangopay.Hook.get created_hook()["Id"]
      assert Poison.decode!(response.body)["Id"] == created_hook()["Id"]
    end
  end

  test "all hook" do
    use_cassette "hook/all" do
      assert {:ok, response} = Mangopay.Hook.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
