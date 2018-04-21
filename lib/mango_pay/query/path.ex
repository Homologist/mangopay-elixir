defmodule MangoPay.Query.Path do
  defmacro set_path(path) do
    quote do
      defp resource do
        unquote(path)
      end

      defp resource(id) do
        "#{resource()}/#{id}"
      end

      def path(), do: resource()
      def path(id), do: resource(id)
    end
  end
end
