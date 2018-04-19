defmodule Mangopay.Repudiation do
  use Mangopay.Query.Base
  set_action "repudiations", [{:get}]
end
