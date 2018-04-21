defmodule MangoPay.Repudiation do
  use MangoPay.Query.Base
  set_action "repudiations", [{:get}]
end
