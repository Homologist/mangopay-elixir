defmodule MangoPay.Query.Get do
  defmacro set_get do
    quote do
      def _get_path(url_list) when is_list(url_list) do
        List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end)
      end
  
      def _get_path(id) do
        "/" <> resource() <> "/#{id}"
      end
  
      def _get_params(id_or_list) do
        {:get, _get_path(id_or_list), "", ""}
      end
  
      defp _get(id_or_list) do
        id_or_list |> _get_params() |> MangoPay.request
      end
  
      defp _get!(id_or_list) do
        id_or_list |> _get_params() |> MangoPay.request!
      end
    end
  end
end
