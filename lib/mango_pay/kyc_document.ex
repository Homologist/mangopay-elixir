defmodule MangoPay.KycDocument do
  @moduledoc """
  Functions for MangoPay [kyc document](https://docs.mangopay.com/endpoints/v2.01/kyc-documents#e204_the-kyc-document-object).
  """
  use MangoPay.Query.Base
  set_path "kyc/documents"

  @doc """
  Get a kyc document.

  ## Examples
      id                  = Id of a kyc document object
      {:ok, kyc_document} = MangoPay.KycDocument.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a kyc document.

  ## Examples
      id           = Id of a kyc document object
      kyc_document = MangoPay.KycDocument.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  List all kyc_documents.

  ## Examples
      query                = %{
                               "Page": 1,
                               "Per_Page": 25,
                               "Sort": "CreationDate:DESC",
                               "BeforeDate": 1463440221,
                               "AfterDate": 1431817821,
                               "Status": "CREATED, SUCCEEDED",
                               "Type": "IDENTITY_PROOF,ADDRESS_PROOF"
      }
      {:ok, kyc_documents} = MangoPay.KycDocuments.all(query)

  """
  def all(query \\ %{}) do
    _all(nil, query)
  end

  @doc """
  List all kyc documents.

  ## Examples
      query         = %{
                        "Page": 1,
                        "Per_Page": 25,
                        "Sort": "CreationDate:DESC",
                        "BeforeDate": 1463440221,
                        "AfterDate": 1431817821,
                        "Status": "CREATED, SUCCEEDED",
                        "Type": "IDENTITY_PROOF,ADDRESS_PROOF"
      }
      kyc_documents = MangoPay.KycDocuments.all!(query)

  """
  def all!(query \\ %{}) do
    _all!(nil, query)
  end

  @doc """
  Create a kyc document for a user.

  ## Examples
      user_id             = Id of a user object
      params              = %{
        "Tag": "custom meta",
        "Type": "IDENTITY_PROOF"
      }
      {:ok, kyc_document} = MangoPay.KycDocument.create(user_id, params)

  """
  def create user_id, params do
    _create params, [MangoPay.User.path(user_id), resource()]
  end

  @doc """
  Create a kyc document for a user.

  ## Examples
      user_id      = Id of a user object
      params       = %{
        "Tag": "custom meta",
        "Type": "IDENTITY_PROOF"
      }
      kyc_document = MangoPay.KycDocument.create!(user_id, params)

  """
  def create! user_id, params do
    _create! params, [MangoPay.User.path(user_id), resource()]
  end

  @doc """
  Submit a kyc document for a user and kyc document.

  ## Examples
      user_id             = Id of a user object
      params              = %{
        "Tag": "custom meta",
        "Status": "VALIDATION_ASKED"
      }
      {:ok, kyc_document} = MangoPay.KycDocument.submit(user_id, params)

  """
  def submit user_id, kyc_document_id, params do
    _update params, user_resource(user_id, kyc_document_id)
  end

  @doc """
  Submit a kyc document for a user and kyc document.

  ## Examples
      user_id             = Id of a user object
      params      = %{
        "Tag": "custom meta",
        "Status": "VALIDATION_ASKED"
      }
      kyc_document = MangoPay.KycDocument.submit!("user_id", params)

  """
  def submit! user_id, kyc_document_id, params do
    _update! params, user_resource(user_id, kyc_document_id)
  end

  @doc """
  Create a page for a kyc document and user.

  ## Examples
      user_id             = Id of a user object
      kyc_document_id     = Id of a kyc document object
      params              = %{
                              "Tag": "custom meta",
                              "Type": "IDENTITY_PROOF"
      }
      {:ok, kyc_document} = MangoPay.KycDocument.create_page(user_id, kyc_document_id, params)

  """
  def create_page user_id, kyc_document_id, params do
    _create params, user_resource(user_id, kyc_document_id) ++ ["pages"]
  end

  @doc """
  Create a page for a kyc document and user.

  ## Examples
      params      = %{
        "Tag": "custom meta",
        "Type": "IDENTITY_PROOF"
      }
      kyc_document = MangoPay.KycDocument.create_page!("user_id", "kyc_document_id", params)

  """
  def create_page! user_id, kyc_document_id, params do
    _create! params, user_resource(user_id, kyc_document_id) ++ ["pages"]
  end

  @doc """
  All kyc documents for a user.

  ## Examples
      user_id       = Id of a user object
      query         = %{
                        "Page": 1,
                        "Per_Page": 25,
                        "Sort": "CreationDate:DESC",
                        "BeforeDate": 1463440221,
                        "AfterDate": 1431817821,
                        "Status": "CREATED, SUCCEEDED",
      }
      {:ok, kyc_documents} = MangoPay.KycDocument.all_by_user(user_id, query)

  """
  def all_by_user user_id, query \\ %{} do
    [MangoPay.User.path(user_id), resource()] |> _all(query)
  end

  @doc """
  All kyc documents for a user.

  ## Examples
      user_id       = Id of a user object
      query         = %{
                        "Page": 1,
                        "Per_Page": 25,
                        "Sort": "CreationDate:DESC",
                        "BeforeDate": 1463440221,
                        "AfterDate": 1431817821,
                        "Status": "CREATED, SUCCEEDED",
      }
      kyc_documents = MangoPay.KycDocument.all_by_user!(user_id, query)

  """
  def all_by_user! user_id, query \\ %{} do
    [MangoPay.User.path(user_id), resource()] |> _all!(query)
  end
end
