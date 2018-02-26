defmodule MangopayTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney


  setup_all do
    HTTPoison.start
  end

  test "get authorization hash" do
    use_cassette "authorization" do
      assert Mangopay.authorization =~ ~r/bearer/
    end
  end
end
