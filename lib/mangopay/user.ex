defmodule Mangopay.User do
  use Mangopay.Query.Base, "users"
  set_action "users", [{:all}]

  def get_emoney id do
    _get [resource, "#{id}", "emoney"]
  end

  defmodule Natural do
    use Mangopay.Query.Base, "users/natural"
    set_action "users/natural", [{:create}, {:update}]
  end

  defmodule Legal do
    use Mangopay.Query.Base, "users/legal"
    set_action "users/legal", [{:create}, {:update}]
  end
end
