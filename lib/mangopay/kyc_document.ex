defmodule Mangopay.KycDocument do
  use Mangopay.Query.Base, "kyc/documents"
  set_action "kyc/documents", [{:get}, {:all}]

  def create_to_user user_id, params do
    _create params, [user(user_id), resource]
  end

  def submit user_id, kyc_document_id, params do
    _update params, user_resource(user_id, kyc_document_id)
  end

  def create_page_to_user_kyc_document user_id, kyc_document_id, params do
    _create params, user_resource(user_id, kyc_document_id) ++ ["pages"]
  end

  def all_by_user user_id do
    [user(user_id), resource] |> _all
  end
end
