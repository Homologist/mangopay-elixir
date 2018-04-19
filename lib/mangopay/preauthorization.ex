defmodule Mangopay.PreAuthorization do
  use Mangopay.Query.Base
  set_action "preauthorizations", [{:get}, {:create, "/card/direct"}]

  def cancel id, params do
    _update params, id
  end

  def all_by_card id, query \\ nil do
    _all [Mangopay.Card.path(id), resource()], query
  end

  def all_by_user id, query \\ nil do
    _all [Mangopay.User.path(id), resource()], query
  end
end
