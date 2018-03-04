defmodule Mangopay.DisputeDocument do
  use Mangopay.Query.Base, "dispute-documents"
  set_action "dispute-documents", [{:get}]

  def create id, params do
    _create params, resource_document(id)
  end

  def create_page dispute_id, dispute_document_id, params do
    _create params,  resource_document(dispute_id, dispute_document_id) ++ ["pages"]
  end

  def submit dispute_id, dispute_document_id do
    _update %{"Status": "CREATED"}, resource_document(dispute_id, dispute_document_id)
  end

  def all_by_dispute id do
    _all resource_document(id)
  end

  def consult id do
    _create %{}, [resource(id), "consult"]
  end

  def resource_document(dispute_id), do: ["disputes", dispute_id, "documents"]
  def resource_document(dispute_id, dispute_document_id), do: resource_document(dispute_id) ++ ["#{dispute_document_id}"]
end
