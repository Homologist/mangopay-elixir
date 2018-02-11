defmodule Mangopay.PreAuthorization do
  use Mangopay.Query.Base, "preauthorizations"
  set_action "preauthorizations", [{:get}, {:create, "card/direct"}]

  def cancel id, params do
    _update id, params
  end

  def all_by_card id do
    _all [card(id), resource]
  end

  def all_by_user id do
    _all [user(id), resource]
  end
end
