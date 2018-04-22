defmodule MangoPay.PermissionGroup do
  @moduledoc """
  Functions for MangoPay permission group.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/permission-groups#e905_the-permission-group-object
  """
  use MangoPay.Query.Base
  set_action "clients/permissiongroups", [{:get}, {:create}, {:update}, {:all}]
end
