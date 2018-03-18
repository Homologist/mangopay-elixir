defmodule UboDeclarationTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use UboDeclarationHelper

  setup_all do
    create_user_cassette()
    create_ubo_declaration_cassette()
    :ok
  end

  test "get ubo_declaration" do
    use_cassette "#{module_name(__MODULE__)}/ubo_declaration/get" do
      assert  {:ok, response} = Mangopay.UboDeclaration.get created_ubo_declaration()["Id"]
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create ubo_declaration" do
#    use_cassette "#{module_name(__MODULE__)}/ubo_declaration/user/create" do
#      assert  {:ok, response} = Mangopay.UboDeclaration.create_to_user created_user()["Id"], ubo_declaration_hash()
#      assert Poison.decode!(response.body)["Status"] == "CREATED"
#    end
  end

  test "update ubo_declaration" do
    use_cassette "#{module_name(__MODULE__)}/ubo_declaration/update" do
      assert  {:ok, response} = Mangopay.UboDeclaration.update created_ubo_declaration()["Id"], update_ubo_declaration_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "all ubo_declaration" do
    use_cassette "#{module_name(__MODULE__)}/ubo_declaration/user/update" do
      assert  {:ok, response} = Mangopay.UboDeclaration.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
