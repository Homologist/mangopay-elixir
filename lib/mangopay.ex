defmodule Mangopay do
  @token

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
    Application.get_env(:mangopay, :headers)
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
    Map.merge(base_header, %{"Accept-Encoding": "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "User-Agent": "Elixir", "Authorization": "Basic #{encoded_login_and_passphrase}", "Content-Type": "application/x-www-form-urlencoded", "Host": "api.sandbox.mangopay.com", "Content-Length": "29"})
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

  def request(method, url, body \\ "", headers \\ "") do
    cond do
      String.contains?(url, "https") -> nil
      !String.contains?(url, "https")-> url = base_url <> version_and_client_id <> url
    end
    case headers do
      "" -> auth_token = authorization
IO.inspect auth_token
            headers = Map.merge(base_header, %{"Authorization": "#{auth_token}"})
      _   -> nil
    end
IO.puts url
    body = Poison.encode!(body)
    _request(method, url, body, headers)
  end

  def _request(:post, url, body, headers), do: HTTPoison.post(url, body, headers)
  def _request(:get, url, body, headers), do: HTTPoison.get(url, headers)
  def _request(:put, url, body, headers), do: HTTPoison.put(url, body, headers)

  def process do
    headers = authorization_header
    Map.put(headers, Authorization, "Basic #{encoded_login_and_passphrase}")
    url                = "/v2.01/oauth/token"
    {status, response} = request(:post, url, "{}", headers)
    body               = response.body
    token              = :zlib.gunzip(body) |> Poison.decode!
    :ok = Agent.update(:token, fn _ -> "#{token["token_type"]} #{token["access_token"]}" end)
    "#{token["token_type"]} #{token["access_token"]}"
  end

  def authorization do
    case Agent.start(fn -> "" end, name: :token) do
      {:ok, _} -> process
      _ -> case Agent.get(:token, &(&1)) do
        "" -> process
        _  -> Agent.get(:token, &(&1))
      end
    end
  end

  def client_id do
    client[:id]
  end
end
