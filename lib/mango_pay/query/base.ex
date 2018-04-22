defmodule MangoPay.Query.Base do
  defmacro __using__(opts \\ nil) do
    quote do
      import MangoPay.Query.Path
      import MangoPay.Query.Get
      import MangoPay.Query.Create
      import MangoPay.Query.Put
      import MangoPay.Query.All

      if is_binary(unquote(opts)) do
        set_path(unquote(opts))
      end

      set_get()
      set_create()
      set_put()
      set_all()

      defp user_resource(user_id, resource_id), do: [MangoPay.User.path(user_id), resource(), "#{resource_id}"]
    end
  end
end
