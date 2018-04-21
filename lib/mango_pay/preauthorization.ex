defmodule MangoPay.PreAuthorization do
  use MangoPay.Query.Base
  set_action "preauthorizations", [{:get}, {:create, "/card/direct"}]

  def cancel id, params do
    _update params, id
  end

  def all_by_card id, query \\ nil do
    _all [MangoPay.Card.path(id), resource()], query
  end

  def all_by_user id, query \\ nil do
    _all [MangoPay.User.path(id), resource()], query
  end
end
