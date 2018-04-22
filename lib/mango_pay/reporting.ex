defmodule MangoPay.Reporting do
  @moduledoc """
  Functions for MangoPay [reporting](https://docs.mangopay.com/endpoints/v2.01/reporting#e824_the-report-object).
  """
  use MangoPay.Query.Base
  set_path "reports"

  @doc """
  Get a reporting.

  ## Examples
      {:ok, reporting} = MangoPay.Reporting.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a reporting.

  ## Examples
      reporting = MangoPay.Reporting.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  List all reportings.

  ## Examples
      {:ok, reportings} = MangoPay.Reportings.all()

  """
  def all() do
    _all()
  end

  @doc """
  List all reportings.

  ## Examples
      reportings = MangoPay.Reportings.all!()

  """
  def all!() do
    _all!()
  end

  defmodule Wallet do
    use MangoPay.Query.Base
    set_path "reports/wallets"
    @doc """
    Create a reporting.
  
    ## Examples
        params         = %{
          "Tag": "custom meta",
          "CallbackURL": "http://www.my-site.com/callbackURL/",
          "DownloadFormat": "CSV",
          "Sort": "CreationDate:DESC",
          "Preview": false,
          "Filters": %{
            "AfterDate": 1431817821,
            "BeforeDate": 1463440221,
            "OwnerId": "blabla",
            "Currency": "EUR",
            "MinBalanceAmount": 123,
            "MinBalanceCurrency": "EUR",
            "MaxBalanceAmount": 123,
            "MaxBalanceCurrency": "EUR"
          },
          "Columns": [ "Id", "Tag", "CreationDate", "Owners", "Description", "BalanceAmount", "BalanceCurrency", "Currency", "FundsType" ]
        }
        {:ok, reporting} = MangoPay.Reporting.create(params)
  
    """
    def create params do
      _create params
    end
  
    @doc """
    Create a reporting.
  
    ## Examples
        params         = %{
          "Tag": "custom meta",
          "CallbackURL": "http://www.my-site.com/callbackURL/",
          "DownloadFormat": "CSV",
          "Sort": "CreationDate:DESC",
          "Preview": false,
          "Filters": %{
            "AfterDate": 1431817821,
            "BeforeDate": 1463440221,
            "OwnerId": "blabla",
            "Currency": "EUR",
            "MinBalanceAmount": 123,
            "MinBalanceCurrency": "EUR",
            "MaxBalanceAmount": 123,
            "MaxBalanceCurrency": "EUR"
          },
          "Columns": [ "Id", "Tag", "CreationDate", "Owners", "Description", "BalanceAmount", "BalanceCurrency", "Currency", "FundsType" ]
        }
        reporting = MangoPay.Reporting.create!(params)
  
    """
    def create! params do
      _create! params
    end
  end

  defmodule Transaction do
    use MangoPay.Query.Base
    set_path "reports/transactions"

    @doc """
    Create a reporting.
  
    ## Examples
        params         = %{
          "Tag": "custom meta",
          "CallbackURL": "http://www.my-site.com/callbackURL/",
          "DownloadFormat": "CSV",
          "Sort": "CreationDate:DESC",
          "Preview": false,
          "Filters": {
          "BeforeDate": 1463440221,
          "AfterDate": 1431817821,
          "Type": [ "PAYIN" ],
          "Status": [ "SUCCEEDED" ],
          "Nature": [ "REGULAR" ],
          "MinDebitedFundsAmount": 430,
          "MinDebitedFundsCurrency": "EUR",
          "MaxDebitedFundsAmount": 8790,
          "MaxDebitedFundsCurrency": "EUR",
          "MinFeesAmount": 120,
          "MinFeesCurrency": "EUR",
          "MaxFeesAmount": 450,
          "MaxFeesCurrency": "EUR",
          "AuthorId": "8494514",
          "WalletId": "8494559"
          },
          "Columns": [ "Id", "CreationDate" ]
        }
        {:ok, reporting} = MangoPay.Reporting.create(params)
  
    """
    def create params do
      _create params
    end
  
    @doc """
    Create a reporting.
  
    ## Examples
        params         = %{
          "Tag": "custom meta",
          "CallbackURL": "http://www.my-site.com/callbackURL/",
          "DownloadFormat": "CSV",
          "Sort": "CreationDate:DESC",
          "Preview": false,
          "Filters": {
          "BeforeDate": 1463440221,
          "AfterDate": 1431817821,
          "Type": [ "PAYIN" ],
          "Status": [ "SUCCEEDED" ],
          "Nature": [ "REGULAR" ],
          "MinDebitedFundsAmount": 430,
          "MinDebitedFundsCurrency": "EUR",
          "MaxDebitedFundsAmount": 8790,
          "MaxDebitedFundsCurrency": "EUR",
          "MinFeesAmount": 120,
          "MinFeesCurrency": "EUR",
          "MaxFeesAmount": 450,
          "MaxFeesCurrency": "EUR",
          "AuthorId": "8494514",
          "WalletId": "8494559"
          },
          "Columns": [ "Id", "CreationDate" ]
        }
        reporting = MangoPay.Reporting.create!(params)
  
    """
    def create! params do
      _create! params
    end
  end
end
