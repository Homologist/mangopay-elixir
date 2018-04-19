defmodule Mangopay.Query.All do
  defmacro set_all do
    quote do
      def _all_path(url_list) when is_list(url_list) do
        List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end)
      end

      def _all_path(id) do
        "/" <> resource() <> "/#{id}"
      end

      def _all_path do
        "/" <> resource()
      end

      def _all_params(id_or_list, params) do
        id_or_list
        |> case do
          nil -> {:get, _all_path(), params}
          _ -> {:get, _all_path(id_or_list), params}
        end
      end

      defp _all(id_or_list \\ nil, params \\ nil) do
        id_or_list
        |> _all_params(params)
        |> Mangopay.request
      end

      defp _all!(id_or_list \\ nil, params \\ nil) do
        id_or_list
        |> _all_params(params)
        |> Mangopay.request!
      end
    end
  end
end
