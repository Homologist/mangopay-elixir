defmodule CardTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney


  setup_all do
    HTTPoison.start
  end

#  test "create card" do
#    use_cassette "card/create" do
#      assert Mangopay.Card.get  =~ ~r/bearer/
#    end
#  end
end
