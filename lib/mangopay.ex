defmodule Mangopay do
  @token
  @base_header %{"User-Agent": "Elixir", "Content-Type": "application/json"}
  @authorization_header %{"Accept-Encoding": "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Content-Type": "application/x-www-form-urlencoded", "Host": "api.sandbox.mangopay.com", "Content-Length": "29"}
  @payline_header %{"Accept-Encoding": "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Accept": "*/*", "Host": "homologation-webpayment.payline.com"}
  @moduledoc """
  Documentation for Mangopay.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Mangopay.hello
      :world

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
    "/#{version}/#{Mangopay.client_id}"
  end

  def head do
    base_header
  end

  def authorization_header do
    Map.merge(@base_header, @authorization_header) |> Map.merge(%{"Authorization": "Basic #{encoded_login_and_passphrase}"})
  end

  def encoded_login_and_passphrase do
    login      = client[:id]
    passphrase = client[:passphrase]
    encode login, passphrase
  end

  def encode(nil, nil), do: Base.encode64 "sdk-unit-tests:cqFfFrWfCcb7UadHNxx2C9Lo6Djw8ZduLi7J9USTmu8bhxxpju"
  def encode login \\ nil, passphrase \\ nil do
    Base.encode64 "#{login}:#{passphrase}"
  end

  def request(tuple) when is_tuple(tuple) do
    request(elem(tuple, 0), elem(tuple, 1), elem(tuple, 2))
  end

  def new_request(method, url, body, headers) do
    headers = authorization_params(headers)
    {method, url, body, headers} = payline_params(method, url, body, headers)
    body = new_body body
    {method, url, body, headers}
  end

  defp authorization_params headers do
    case headers do
      ""  -> Map.merge(base_header, %{"Authorization": "#{authorization}"})
      _   -> headers
    end
  end

  defp payline_params method, url, body, headers do
    cond do
      String.contains?(url, "payline") -> headers = Map.update!(headers, :"Content-Type", fn _ -> "application/x-www-form-urlencoded" end)
      headers = Map.merge(headers, @payline_header )
      !String.contains?(url, "payline")-> url = base_url <> version_and_client_id <> url
    end
    {method, url, body, headers}
  end

  def new_body body do
    cond do
      is_map body    -> Poison.encode!(body)
      is_binary body -> body
    end
  end

  def request(method, url, body \\ "", headers \\ "") do
    {method, url, body, headers} = new_request(method, url, body, headers)
    _request(method, url, body, headers)
  end

  def request!(method, url, body \\ "", headers \\ "") do
    {method, url, body, headers} = new_request(method, url, body, headers)
    _request!(method, url, body, headers)
  end

  def _request(method, url, body, headers), do: HTTPoison.request(method, url, body, headers)
  def _request!(method, url, body, headers), do: HTTPoison.request!(method, url, body, headers)

  def process do
    Map.put(authorization_header, Authorization, "Basic #{encoded_login_and_passphrase}")
    url                = "/v2.01/oauth/token"
    {_, response} = request(:post, url, "{}", authorization_header)
    body               = response.body
    token              = :zlib.gunzip(body) |> Poison.decode!
    :ok = Agent.update(:token, fn _ -> "#{token["token_type"]} #{token["access_token"]}" end)
    "#{token["token_type"]} #{token["access_token"]}"
  end

  def authorization do
    case Agent.start(fn -> "" end, name: :token) do
      {:ok, _} -> process
      _        -> case Agent.get(:token, &(&1)) do
      ""       -> process
      _        -> Agent.get(:token, &(&1))
      end
    end
  end

  def client_id do
    client[:id]
  end
end
