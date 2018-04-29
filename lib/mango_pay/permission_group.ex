defmodule MangoPay.PermissionGroup do
  @moduledoc """
  Functions for MangoPay [permission group](https://docs.mangopay.com/endpoints/v2.01/permission-groups#e905_the-permission-group-object).
  """
  use MangoPay.Query.Base
  set_path "clients/permissiongroups"

  @doc """
  Get a permission_group.

  ## Examples
      {:ok, permission_group} = MangoPay.PermissionGroup.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a permission_group.

  ## Examples
      permission_group = MangoPay.PermissionGroup.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a permission_group.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Name": "Users only",
        "Scopes": %{
          "ClientDetails": %{
            "Read": false,
            "Edit": false,
            "Create": false
          }
        }
      }
      {:ok, permission_group} = MangoPay.PermissionGroup.create(params)

  """
  def create params do
    _create params
  end

  @doc """
  Create a permission_group.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Name": "Users only",
        "Scopes": %{
          "ClientDetails": %{
            "Read": false,
            "Edit": false,
            "Create": false
          }
        }
      }
      permission_group = MangoPay.PermissionGroup.create!(params)

  """
  def create! params do
    _create! params
  end

  @doc """
  Update a permission_group.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Name": "Users only",
        "Scopes": %{
          "ClientDetails": %{
            "Read": false,
            "Edit": false,
            "Create": false
          }
        }
      }
      {:ok, permission_group} = MangoPay.PermissionGroup.update(id, params)

  """
  def update id, params do
    _update params, id
  end

  @doc """
  Update a permission_group.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Name": "Users only",
        "Scopes": %{
          "ClientDetails": %{
            "Read": false,
            "Edit": false,
            "Create": false
          }
        }
      }
      permission_group = MangoPay.PermissionGroup.update(id, params)

  """
  def update! id, params do
    _update! params, id
  end

  @doc """
  List all permission groups.

  ## Examples
      query                    = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      {:ok, permission_groups} = MangoPay.PermissionGroups.all(query)

  """
  def all(query \\ %{}) do
    _all(nil, query)
  end

  @doc """
  List all permission groups.

  ## Examples
      query             = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      permission_groups = MangoPay.PermissionGroups.all!(query)

  """
  def all!(query \\ %{}) do
    _all!(nil, query)
  end
end
