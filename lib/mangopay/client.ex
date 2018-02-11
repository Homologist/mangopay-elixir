defmodule Mangopay.Client do
  use Mangopay.Query.Base, "clients"
  set_action "clients", [{:get}, {:update}]

  def update_logo id, params do
    _update params, [resource, id]
  end
end
