defmodule Mangopay.Sso do
  use Mangopay.Query.Base, "clients/ssos"
  set_action "clients/ssos", [{:get}, {:create}, {:update},{:all}]

  def extend_inviation id, params do
   _update params, [resource, "#{id}", "extendinvitation"]
  end

  def all_by_permission_group(id) do
    _all([client, "permissiongroups", id, "ssos"])
  end
end
