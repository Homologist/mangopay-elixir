defmodule MangoPay.PermissionGroup do
  use MangoPay.Query.Base
  set_action "clients/permissiongroups", [{:get}, {:create}, {:update}, {:all}]
end
