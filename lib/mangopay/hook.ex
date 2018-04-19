defmodule Mangopay.Hook do
  use Mangopay.Query.Base
  set_action "hooks", [{:get}, {:create}, {:update}, {:all}]
end
