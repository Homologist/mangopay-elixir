defmodule MangoPay do
  @moduledoc """
  The elixir client for MangoPay API.

  This module is the root of all the application.

  ## Configuring
  Set your API key by configuring the :mangopay application.

  ```
    config :mangopay, client_id: YOUR_MANGOPAY_CLIENT_ID
    config :mangopay, passphrase: MANGOPAY_PLATFORM_KEY
  ```
  """

  @base_header %{"User-Agent": "Elixir", "Content-Type": "application/json"}

  @payline_header %{"Accept-Encoding": "gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Accept": "*/*", "Host": "homologation-webpayment.payline.com"}

  def base_header do
    @base_header
  end

  @doc """
  Returns MANGOPAY_BASE_URL
  """
  def base_url do
    "https://api.sandbox.mangopay.com"
  end


  @doc """
  Returns MANGOPAY_CLIENT
  """
  def client do
    Application.get_env(:mangopay, :client)
  end

  def mangopay_version do
    "v2.01"
  end

  def mangopay_version_and_client_id do
    "/#{mangopay_version()}/#{MangoPay.client()[:id]}"
  end

  @doc """
  Request to mangopay web API.

  ## Examples

      response = MangoPay.request!("get", "users")

  """
  def request! {method, url, body, headers} do
    request!(method, url, body, headers)
  end

  def request! {method, url, query} do
    request!(:get, url, "", "", query)
  end

  def request!(method, url, body \\ "", headers \\ "", query \\ %{}) do
    {method, url, body, headers, _} = full_header_request(method, url, body, headers, query)
    filter_and_send(method, url, body, headers, query, true)
  end

  @doc """
  Request to mangopay web API.

  ## Examples

      {:ok, response} = MangoPay.request({"get", "users", nil, nil})

  """
  def request {method, url, body, headers} do
    request(method, url, body, headers)
  end

  def request {method, url, query} do
    request(:get, url, "", "", query)
  end

  @doc """
  Request to mangopay web API.

  ## Examples

      {:ok, response} = MangoPay.request("get", "users")

  """
  def request(method, url, body \\ "", headers \\ "", query \\ %{}) do
    {method, url, body, headers, query} = full_header_request(method, url, body, headers, query)
    filter_and_send(method, url, body, headers, query, false)
  end

  defp full_header_request(method, url, body, headers, query) do
    {method, url, decode_map(body), headers, query}
      |> authorization_params()
      |> payline_params()
  end

  defp authorization_params {method, url, body, headers, query} do
    headers = case headers do
      %{"Authorization": _}   -> headers
      _  -> Map.merge(base_header(), %{"Authorization": "#{MangoPay.Authorization.pull_token()}"})
    end
    {method, url, body, headers, query}
  end

  defp payline_params {method, url, body, headers, query} do
    if String.contains?(url, "payline") do
      {method, url, body, cond_payline(headers), query}
    else
      {method, cond_mangopay(url), body, headers, query}
    end
  end

  defp cond_payline headers do
    headers
    |> Map.update!(:"Content-Type", fn _ -> "application/x-www-form-urlencoded" end)
    |> Map.merge(@payline_header)
  end

  defp cond_mangopay url do
    base_url() <> mangopay_version_and_client_id() <> url
  end

  defp decode_map body do
    cond do
      is_map body    -> Poison.encode! body
      is_list body   -> Poison.encode! body
      is_binary body -> body
    end
  end
  # default request send to mangopay
  defp filter_and_send(method, url, body, headers, query, bang) do
    cond do
      bang ->
        case {Mix.env, method} do
          {:dev, _}  -> HTTPoison.request!(method, url, body, headers, [params: query, timeout: 4600, recv_timeout: 5000])
          {:test, _} -> HTTPoison.request!(method, url, body, headers, [params: query, timeout: 500000, recv_timeout: 500000])
        end
      true ->
        case {Mix.env, method, query} do
          {:dev, _, _}  -> HTTPoison.request(method, url, body, headers, [params: query, timeout: 4600, recv_timeout: 5000])
          {:test, _, _} -> HTTPoison.request(method, url, body, headers, [params: query, timeout: 500000, recv_timeout: 500000])
        end
    end
  end
end
