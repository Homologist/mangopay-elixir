defmodule MangoPay.User do
  @moduledoc """
  Functions for MangoPay client.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/users#e253_the-user-object
  """
  use MangoPay.Query.Base
  set_action "users", [{:get}, {:all}]

  @doc """
  Get emoney.

  ## Examples

      {:ok, client} = MangoPay.User.get_emoney("user_id")

  """
  def get_emoney id do
    _get [resource(), "#{id}", "emoney"]
  end

  defmodule Natural do
    @moduledoc """
    Functions for MangoPay user natural.

    MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/users#e253_the-user-object
    """
    use MangoPay.Query.Base
    set_action "users/natural", [{:create}, {:update}]
  end

  defmodule Legal do
    @moduledoc """
    Functions for MangoPay user legal.

    MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/users#e253_the-user-object
    """
    use MangoPay.Query.Base
    set_action "users/legal", [{:create}, {:update}]
  end
end
