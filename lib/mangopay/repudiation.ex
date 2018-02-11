defmodule Mangopay.Repudiation do
  use Mangopay.Query.Base, "repudiations"
  set_action "repudiations", [{:get}]
end
