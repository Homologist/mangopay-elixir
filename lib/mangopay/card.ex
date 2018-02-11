defmodule Mangopay.Card do
  use Mangopay.Query.Base, "cards"
  set_action "cards", [{:get}, {:create}, {:update},{:all}]
  def get_registration id do
    _get ["cardregistrations", id]
  end

  def create params do
    _create params, "cardregistrations"
  end

  def update id, params do
    _update params, ["cardregistrations", id]
  end

  def all_fingerprints do
    _all [resource, "fingerprints"]
  end

  def all_by_user id do
    _all [Mangopay.User.path, "#{id}", resource]
  end

  def deactivate id, params do
    _update params, id
  end

  def all_transactions_by_fingerprint fingerprint do
    _all [resource, "fingerprints", "#{fingerprint}", Mangopay.Transaction.path]
  end
end
