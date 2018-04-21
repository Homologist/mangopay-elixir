defmodule MangoPayTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "get authorization hash" do
    assert MangoPay.authorization() =~ ~r/bearer/
  end
end
