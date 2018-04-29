defmodule MangoPay.Hook do
  @moduledoc """
  Functions for MangoPay [hook](https://docs.mangopay.com/endpoints/v2.01/hooks#e246_the-hook-object).
  """
  use MangoPay.Query.Base
  set_path "hooks"

  @doc """
  Get a hook.

  ## Examples
      {:ok, hook} = MangoPay.Hook.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a hook.

  ## Examples
      hook = MangoPay.Hook.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a hook.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "EventType": "PAYIN_NORMAL_CREATED",
        "Url": "http://www.my-site.com/hooks/"
      }
      {:ok, hook} = MangoPay.Hook.create(params)

  """
  def create params do
    _create params
  end

  @doc """
  Create a hook.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "EventType": "PAYIN_NORMAL_CREATED",
        "Url": "http://www.my-site.com/hooks/"
      }
      hook = MangoPay.Hook.create!(params)

  """
  def create! params do
    _create! params
  end

  @doc """
  Update a hook.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Status": "ENABLED",
        "Url": "http://www.my-site.com/hooks/"
      }
      {:ok, hook} = MangoPay.Hook.update(id, params)

  """
  def update id, params do
    _update params, id
  end

  @doc """
  Update a hook.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "Status": "ENABLED",
        "Url": "http://www.my-site.com/hooks/"
      }
      hook = MangoPay.Hook.update!(id, params)

  """
  def update! id, params do
    _update! params, id
  end

  @doc """
  List all hooks.

  ## Examples
      query        = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      {:ok, hooks} = MangoPay.Hook.all()

  """
  def all(query \\ %{}) do
    _all(nil, query)
  end

  @doc """
  List all hooks.

  ## Examples
      query = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC"
      }
      hooks = MangoPay.Hook.all!(query)

  """
  def all!(query \\ %{}) do
    _all!(nil, query)
  end
end
