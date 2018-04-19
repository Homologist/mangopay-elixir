defmodule Mangopay.Sso do
  use Mangopay.Query.Base
  set_action "clients/ssos", [{:get}, {:create}, {:update}, {:all}]

  def extend_invitation id do
   _update %{}, [resource(), "#{id}", "extendinvitation"]
  end

  def all_by_permission_group(id, query \\ nil) do
    _all([Mangopay.Client.path(), "permissiongroups", id, "ssos"], query)
  end
end
