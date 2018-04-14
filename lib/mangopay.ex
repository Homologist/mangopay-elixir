defmodule Mangopay do
  @base_header %{"User-Agent": "Elixir", "Content-Type": "application/json"}

  @authorization_header %{"Accept-Encoding": "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Content-Type": "application/x-www-form-urlencoded", "Host": "api.sandbox.mangopay.com", "Content-Length": "29"}

  @payline_header %{"Accept-Encoding": "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Accept": "*/*", "Host": "homologation-webpayment.payline.com"}

  @moduledoc """
  Documentation for Mangopay.
  The elixir client for Mangopay API.

  The goal of this project is to allow user to communicate with Mangopay API
  in elixir.
  """

  def base_header do
    @base_header
  end

  def base_url do
    "https://api.sandbox.mangopay.com"
  end

  def client do
    Application.get_env(:mangopay, :client)
  end

  def version do
    "v2.01"
  end

  def version_and_client_id do
    "/#{version()}/#{Mangopay.client_id()}"
  end

  defp authorization_header do
    @base_header |> Map.merge(@authorization_header) |> Map.merge(%{"Authorization": "Basic #{encoded_login_and_passphrase()}"})
  end

  defp encoded_login_and_passphrase do
    encode client()[:id], client()[:passphrase]
  end

  defp encode(login, passphrase), do: Base.encode64 "#{login}:#{passphrase}"

  def request(tuple) when is_tuple(tuple) do
    request(elem(tuple, 0), elem(tuple, 1), elem(tuple, 2), elem(tuple, 3))
  end

  def request!(tuple) when is_tuple(tuple) do
    request!(elem(tuple, 0), elem(tuple, 1), elem(tuple, 2), elem(tuple, 3))
  end

  defp full_header_request(method, url, body, headers) do
    {method, url, decode_map(body), headers}
      |> authorization_params()
      |> payline_params()
  end

  defp authorization_params {method, url, body, headers} do
    headers = case headers do
      ""  -> Map.merge(base_header(), %{"Authorization": "#{authorization()}"})
      _   -> headers
    end
    {method, url, body, headers}
  end

  defp payline_params {method, url, body, headers} do
    if String.contains?(url, "payline") do
      {method, url, body, cond_payline(headers)}
    else
      {method, cond_mangopay(url), body, headers}
    end
  end

  defp cond_payline headers do
    headers
    |> Map.update!(:"Content-Type", fn _ -> "application/x-www-form-urlencoded" end)
    |> Map.merge(@payline_header)
  end

  defp cond_mangopay url do
    base_url() <> version_and_client_id() <> url
  end

  defp decode_map body do
    cond do
      is_map body    -> Poison.encode! body
      is_list body   -> Poison.encode! body
      is_binary body -> body
    end
  end

  def request(method, url, body \\ "", headers \\ "") do
    {method, url, body, headers} = full_header_request(method, url, body, headers)
    case Mix.env do
      :dev  -> HTTPoison.request(method, url, body, headers, [{"timeout", 4600}])
      :test -> HTTPoison.request(method, url, body, headers, [{"timeout", 15600}])
    end
  end

  def request!(method, url, body \\ "", headers \\ "") do
    {method, url, body, headers} = full_header_request(method, url, body, headers)
    case Mix.env do
      :dev  -> HTTPoison.request!(method, url, body, headers, [{"timeout", 4600}])
      :test -> HTTPoison.request!(method, url, body, headers, [{"timeout", 15600}])
    end
  end

  def post_authorization do
    :post |> request!("/v2.01/oauth/token", "{}", authorization_header()) |> get_decoded_response
  end

  defp get_decoded_response response do
    response.body |> :zlib.gunzip() |> Poison.decode!()
  end

  defp get_token token do
    update_map = %{token: "#{token["token_type"]} #{token["access_token"]}", expires: "#{Time.add(Time.utc_now, token["expires_in"])}"}
    :ok = Agent.update(:token, fn _ -> update_map end)
    "#{token["token_type"]} #{token["access_token"]}"
  end

  def authorization do
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

  def client_id do
    client()[:id]
  end
end
