defmodule MangoPay.Sso do
  @moduledoc """
  Functions for MangoPay [Sso](https://docs.mangopay.com/endpoints/v2.01/sso#e872_the-sso-object).
  """
  use MangoPay.Query.Base
  set_action "clients/ssos", [{:get}, {:create}, {:update}, {:all}]

  @doc """
  Extend sso invitation.

  ## Examples

      {:ok, sso} = MangoPay.Sso.extend_invitation("sso_id")

  """
  def extend_invitation id do
   _update %{}, [resource(), "#{id}", "extendinvitation"]
  end

  @doc """
  List all sso by permission group.

  ## Examples

      {:ok, sso} = MangoPay.Sso.all_by_permission_group("sso_id")

  """
  def all_by_permission_group(id, query \\ nil) do
    _all([MangoPay.Client.path(), "permissiongroups", id, "ssos"], query)
  end
end
