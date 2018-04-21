defmodule MangoPay.Hook do
  use MangoPay.Query.Base
  set_action "hooks", [{:get}, {:create}, {:update}, {:all}]
end
