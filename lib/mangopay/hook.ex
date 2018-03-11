defmodule Mangopay.Hook do
  use Mangopay.Query.Base, "hooks"
  set_action "hooks", [{:get}, {:create}, {:update}, {:all}]
end
