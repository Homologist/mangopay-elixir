defmodule MangoPay.Query.Path do
  @moduledoc false
  defmacro set_path(path) do
    quote do
      defp resource do
        unquote(path)
      end

      defp resource(id) do
        "#{resource()}/#{id}"
      end

      @doc """
      Get path called.
    
      ## Examples
          "/users/id" = MangoPay.User.path(id)
    
      """
      def path(), do: resource()
      def path(id), do: resource(id)
    end
  end
end
