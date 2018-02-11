defmodule MangopayTest do
  use ExUnit.Case
  doctest Mangopay

  test "greets the world" do
    assert Mangopay.hello() == :world
  end
end
