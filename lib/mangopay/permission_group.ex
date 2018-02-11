defmodule Mangopay.PermissionGroup do
  use Mangopay.Query.Base, "clients/permissiongroups"
  set_action "clients/permissiongroups", [{:get}, {:create}, {:update},{:all}]
end
