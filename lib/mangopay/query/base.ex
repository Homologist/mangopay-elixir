defmodule Mangopay.Query.Base do

  defmacro __using__(opts \\ nil) do
    quote do
      import Mangopay.Query.Interface
      def _get_path(url_list) when is_list(url_list) do
        {:get, List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end), ""}
      end

      def _get_path(id) do
        {:get, "/" <> resource() <> "/#{id}", ""}
      end

      def _get(url_params) do
          _get_path(url_params) |> Mangopay.request
      end

      def _create_path(params) do
        {:post, "/" <> resource(), params}
      end

      def _create_path(params, url_list) when is_list(url_list) do
        {:post, List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end), params}
      end

      def _create_path(params, id) do
        {:post, "/" <> resource() <> "#{id}", params}
      end

      def _create(params, url_list \\ nil) do
        case url_list do
          nil -> _create_path(params)
          _   -> _create_path(params, url_list)
        end
        |> Mangopay.request
      end

      def _update_path(params, url_list) when is_list(url_list) do
        {:put, List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end), params}
      end

      def _update_path(params, id) do
        {:put, "/" <> resource() <> "/#{id}", params}
      end

      def _update(params, id_or_url_list) do
        _update_path(params, id_or_url_list) |> Mangopay.request
      end

      def _all_path(url_list) when is_list(url_list) do
        {:get, List.foldl(url_list, "", fn x, acc -> "#{acc}" <> "/#{x}" end), ""}
      end

      def _all_path(id) do
        {:get, "/" <> resource() <> "/#{id}", ""}
      end

      def _all_path do
        {:get, "/" <> resource(), ""}
      end

      def _all(id_or_url_list \\ nil) do
        case id_or_url_list do
          nil -> _all_path()
          _ -> _all_path(id_or_url_list)
        end
        |> Mangopay.request
      end

      def resource do
        unquote(opts)
      end

      def resource(id) do
        "#{resource()}/#{id}"
      end

      def path do
        unquote(opts)
      end

      def user(), do: "users"
      def user(id), do: user() <> "/#{id}"
      def card(), do: "cards"
      def card(id), do: card() <> "/#{id}"
      def payin(), do: "payins"
      def payin(id), do: payin() <> "/#{id}"
      def transfer(), do: "transfers"
      def transfer(id), do: transfer() <> "/#{id}"
      def payout(), do: "payouts"
      def payout(id), do: payout() <> "/#{id}"
      def repudiation(), do: "repudiations"
      def repudiation(id), do: repudiation() <> "/#{id}"
      def dispute(), do: "disputes"
      def dispute(id), do: dispute() <> "/#{id}"
      def mandate(), do: "mandates"
      def mandate(id), do: mandate() <> "/#{id}"
      def wallet(), do: "wallets"
      def wallet(id), do: wallet() <> "/#{id}"
      def client(), do: "clients"
      def client(id), do: client() <> "/#{id}"
      def client_wallet(), do: "clients/wallets"
      def client_wallet(id), do: client_wallet() <> "/#{id}"
      def bank_account(), do: "bankaccounts"
      def bank_account(id), do: bank_account() <> "/#{id}"
      def pre_authorization(), do: "preauthorizations"
      def pre_authorization(id), do: pre_authorization() <> "/#{id}"
      def user_resource(user_id, resource_id), do: [user(user_id), resource(), "#{resource_id}"]
    end
  end
end
