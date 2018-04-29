defmodule MangoPay.Sso do
  @moduledoc """
  Functions for MangoPay [Sso](https://docs.mangopay.com/endpoints/v2.01/sso#e872_the-sso-object).
  """
  use MangoPay.Query.Base
  set_path "clients/ssos"

  @doc """
  Get a sso.

  ## Examples
      {:ok, sso} = MangoPay.Sso.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a sso.

  ## Examples
      sso = MangoPay.Sso.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a sso.

  ## Examples
      params     = %{
        "Tag": "custom meta",
        "EventType": "PAYIN_NORMAL_CREATED",
        "Url": "http://www.my-site.com/ssos/"
      }
      {:ok, sso} = MangoPay.Sso.create(params)

  """
  def create params do
    _create params
  end

  @doc """
  Create a sso.

  ## Examples
      params = %{
        "Tag": "custom meta",
        "EventType": "PAYIN_NORMAL_CREATED",
        "Url": "http://www.my-site.com/ssos/"
      }
      sso    = MangoPay.Sso.create!(params)

  """
  def create! params do
    _create! params
  end

  @doc """
  Update a sso.

  ## Examples
      params     = %{
        "Tag": "custom meta",
        "Status": "ENABLED",
        "Url": "http://www.my-site.com/ssos/"
      }
      {:ok, sso} = MangoPay.Sso.update(id, params)

  """
  def update id, params do
    _update params, id
  end

  @doc """
  Update a sso.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Status": "ENABLED",
        "Url": "http://www.my-site.com/ssos/"
      }
      sso = MangoPay.Sso.update(id, params)

  """
  def update! id, params do
    _update! params, id
  end

  @doc """
  List all ssos.

  ## Examples
      query = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      {:ok, ssos} = MangoPay.Sso.all(query)

  """
  def all(query \\ %{}) do
    _all(nil, query)
  end

  @doc """
  List all ssos.

  ## Examples
      query = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      ssos  = MangoPay.Sso.all!(query)

  """
  def all!(query \\ %{}) do
    _all!(nil, query)
  end

  @doc """
  Extend sso invitation.

  ## Examples

      sso_id     = Id of a Sso
      {:ok, sso} = MangoPay.Sso.extend_invitation(sso_id)

  """
  def extend_invitation id do
   _update %{}, [resource(), "#{id}", "extendinvitation"]
  end

  @doc """
  Extend sso invitation.

  ## Examples

      sso_id     = Id of a Sso
      sso = MangoPay.Sso.extend_invitation!(sso_id)

  """
  def extend_invitation! id do
   _update! %{}, [resource(), "#{id}", "extendinvitation"]
  end

  @doc """
  List all sso by permission group.

  ## Examples
      sso_id     = Id of a Sso
      query  = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      {:ok, sso} = MangoPay.Sso.all_by_permission_group(sso_id, query)

  """
  def all_by_permission_group(id, query \\ %{}) do
    _all([MangoPay.Client.path(), "permissiongroups", id, "ssos"], query)
  end

  @doc """
  List all sso by permission group.

  ## Examples
      sso_id = Id of a Sso
      query  = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      sso    = MangoPay.Sso.all_by_permission_group!(sso_id, query)

  """
  def all_by_permission_group!(id, query \\ %{}) do
    _all!([MangoPay.Client.path(), "permissiongroups", id, "ssos"], query)
  end
end
