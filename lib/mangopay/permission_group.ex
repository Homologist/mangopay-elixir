defmodule Mangopay.PermissionGroup do
  use Mangopay.Query.Base
  set_action "clients/permissiongroups", [{:get}, {:create}, {:update}, {:all}]
end
