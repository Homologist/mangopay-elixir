defmodule EventTest do
  use Helper
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    :ok
  end

  test "all event" do
    use_cassette "event/all" do
      assert {:ok, response} = Mangopay.Event.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
