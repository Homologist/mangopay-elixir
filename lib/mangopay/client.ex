defmodule Mangopay.Client do
  use Mangopay.Query.Base, "clients"

  def get do
    _get nil
  end

  def update params do
    _update(params, nil)
  end

  def update_logo params do
    _update params, nil
  end
end
