defmodule MangoPay.Authorization do
  @moduledoc false

  @authorization_header %{"Accept-Encoding": "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Content-Type": "application/x-www-form-urlencoded", "Host": "api.sandbox.mangopay.com", "Content-Length": "29"}

  @doc """
  Get a authorization token.

  ## Examples

      token = MangoPay.Authorization.pull_token

  """
  def pull_token do
    time = Time.utc_now
    case Agent.start(fn -> nil end, name: :token) do
      {:ok, _} -> post_authorization() |> get_token()
      _        -> case Agent.get(:token, &(&1)) do
        %{token: _, expires: expire_date} when expire_date < time
          -> post_authorization()
            |> get_token()
        %{token: token_string, expires: _} when token_string == nil
          -> post_authorization()
            |> get_token()
        _ -> Agent.get(:token, &(&1))[:token]
      end
    end
  end

  @doc """
   Ask for authorization token to MangoPay
  """
  def post_authorization do
    :post |> MangoPay.request!("/v2.01/oauth/token", "{}", authorization_header()) |> get_decoded_response
  end

  defp get_decoded_response response do
    response.body |> :zlib.gunzip() |> Poison.decode!()
  end

  defp get_token token do
    update_map = %{token: "#{token["token_type"]} #{token["access_token"]}", expires: "#{Time.add(Time.utc_now, token["expires_in"])}"}
    :ok = Agent.update(:token, fn _ -> update_map end)
    "#{token["token_type"]} #{token["access_token"]}"
  end

  defp authorization_header do
    MangoPay.base_header |> Map.merge(@authorization_header) |> Map.merge(%{"Authorization": "Basic #{encoded_login_and_passphrase()}"})
  end

  defp encoded_login_and_passphrase do
    encode MangoPay.client()[:id], MangoPay.client()[:passphrase]
  end

  defp encode(login, passphrase), do: Base.encode64 "#{login}:#{passphrase}"
end
