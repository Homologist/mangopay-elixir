defmodule UboDeclarationTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "user/natural/create" do
      Mangopay.User.Natural.create user_natural_hash()
    end
    use_cassette "ubo_declaration/user/all" do
      Mangopay.UboDeclaration.all
    end
    use_cassette "ubo_declaration/user/get" do
      get_ubo_declaration
    end
    use_cassette "ubo_declaration/update" do
      Mangopay.UboDeclaration.update created_ubo_declaration()["Id"], update_ubo_declaration_hash()
    end
    :ok
  end

  test "get ubo_declaration" do
    use_cassette "ubo_declaration/get" do
      assert  {:ok, response} = Mangopay.UboDeclaration.get created_ubo_declaration()["Id"]
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "create ubo_declaration" do
#    use_cassette "ubo_declaration/user/create" do
#      assert  {:ok, response} = Mangopay.UboDeclaration.create_to_user created_user()["Id"], ubo_declaration_hash()
#      assert Poison.decode!(response.body)["Status"] == "CREATED"
#    end
  end

  test "update ubo_declaration" do
    use_cassette "ubo_declaration/update" do
      assert  {:ok, response} = Mangopay.UboDeclaration.update created_ubo_declaration()["Id"], update_ubo_declaration_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
    end
  end

  test "all ubo_declaration" do
    use_cassette "ubo_declaration/user/update" do
      assert  {:ok, response} = Mangopay.UboDeclaration.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
