defmodule Mangopay.Query.Put do
  defmacro set_put do
    quote do
      def _update_path(url_list) when is_list(url_list) do
        List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end)
      end

      def _update_path(id) do
        "/" <> resource() <> "/#{id}"
      end

      def _update_params(id_or_list, params) do
        {:put, _update_path(id_or_list), params, ""}
      end

      defp _update(params, id_or_list) do
        id_or_list |> _update_params(params) |> Mangopay.request
      end

      defp _update!(params, id_or_list) do
        id_or_list |> _update_params(params) |> Mangopay.request!
      end
    end
  end
end
