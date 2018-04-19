defmodule Mangopay.Query.Base do
  defmacro __using__(opts \\ nil) do
    quote do
      import Mangopay.Query.Interface
      import Mangopay.Query.Path
      import Mangopay.Query.Get
      import Mangopay.Query.Create
      import Mangopay.Query.Put
      import Mangopay.Query.All

      if is_binary(unquote(opts)) do
        set_path(unquote(opts))
      end
      set_get()
      set_create()
      set_put()
      set_all()
      def user_resource(user_id, resource_id), do: [Mangopay.User.path(user_id), resource(), "#{resource_id}"]
    end
  end
end
