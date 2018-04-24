defmodule MangoPayTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "get authorization hash" do
    assert MangoPay.pull_token() =~ ~r/bearer/
  end
end
