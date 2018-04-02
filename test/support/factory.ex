defmodule Mangopay.Factory do
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use ExMachina
  defmacro __using__(opts \\ nil) do
    quote do
    end
  end
end
