defmodule Mangopay.Query.Create do
  defmacro set_create do
    quote do
      def _create_path do
        "/" <> resource()
      end

      def _create_path(url_list) when is_list(url_list) do
        List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end)
      end

      def _create_path(id) do
        "/" <> resource() <> "#{id}"
      end

      def _create_params(id_or_list, params) do
        id_or_list
        |> case do
          nil -> {:post, _create_path(), params, ""}
          _   -> {:post, _create_path(id_or_list), params, ""}
        end
      end

      defp _create(params, id_or_list \\ nil) do
        id_or_list
        |> _create_params(params)
        |> Mangopay.request
      end

      defp _create!(params, id_or_list \\ nil) do
        id_or_list
        |> _create_params(params)
        |> Mangopay.request!
      end
    end
  end
end
