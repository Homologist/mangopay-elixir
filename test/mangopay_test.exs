defmodule MangopayTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney


  setup_all do
    HTTPoison.start
  end

  test "get request" do
    use_cassette "httpoison_get" do
      assert HTTPoison.get!("http://example.com").body =~ ~r/Example Domain/
    end
  end

  test "get authorization hash" do
    use_cassette "authorization" do
      assert Mangopay.authorization["token_type"] =~ ~r/bearer/
    end
  end
end
