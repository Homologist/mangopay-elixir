defmodule Mangopay.Query.Base do
  defmacro __using__(opts \\ nil) do
    quote do
      import Mangopay.Query.Interface
      def _get_path(url_list) when is_list(url_list) do
        List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end)
      end

      def _get_path(id) do
        "/" <> resource() <> "/#{id}"
      end

      defp _get_params(id_or_list) do
        {:get, _get_path(id_or_list), "", ""}
      end

      def _get(id_or_list) do
        id_or_list |> _get_params() |> Mangopay.request
      end

      def _get!(id_or_list) do
        id_or_list |> _get_params() |> Mangopay.request!
      end

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

      def _create(params, id_or_list \\ nil) do
        id_or_list
        |> _create_params(params)
        |> Mangopay.request
      end

      def _create!(params, id_or_list \\ nil) do
        id_or_list
        |> _create_params(params)
        |> Mangopay.request!
      end

      def _update_path(url_list) when is_list(url_list) do
        List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end)
      end

      def _update_path(id) do
        "/" <> resource() <> "/#{id}"
      end

      def _update_params(id_or_list, params) do
        {:put, _update_path(id_or_list), params, ""}
      end

      def _update(params, id_or_list) do
        id_or_list |> _update_params(params) |> Mangopay.request
      end

      def _update!(params, id_or_list) do
        id_or_list |> _update_params(params) |> Mangopay.request!
      end

      def _all_path(url_list) when is_list(url_list) do
        List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end)
      end

      def _all_path(id) do
        "/" <> resource() <> "/#{id}"
      end

      def _all_path do
        "/" <> resource()
      end

      def _all_params(id_or_list) do
        id_or_list
        |> case do
          nil -> {:get, _all_path(), "", ""}
          _ -> {:get, _all_path(id_or_list), "", ""}
        end
      end

      def _all(id_or_list \\ nil) do
        id_or_list
        |> _all_params()
        |> Mangopay.request
      end

      def _all!(id_or_list \\ nil) do
        id_or_list
        |> _all_params()
        |> Mangopay.request!
      end

      def resource do
        unquote(opts)
      end

      def resource(id) do
        "#{resource()}/#{id}"
      end

      def path(), do: unquote(opts)
      def path(id) do
        unquote(opts) <> "/#{id}"
      end

      def user_resource(user_id, resource_id), do: [user(user_id), resource(), "#{resource_id}"]
    end
  end
end
