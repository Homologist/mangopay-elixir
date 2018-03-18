defmodule MangopayTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "get authorization hash" do
    assert Mangopay.authorization() =~ ~r/bearer/
  end
end
