defmodule MangoPay.PayIn do
  @moduledoc """
  Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
  """
  use MangoPay.Query.Base
  set_path "payins"

  @doc """
  Get a pay in.

  ## Examples
      {:ok, pay_in} = MangoPay.PayIn.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a pay in.

  ## Examples
      pay_in = MangoPay.PayIn.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Get card details.

  ## Examples

      {:ok, pay_in} = MangoPay.PayIn.get_card_details("pay_in_id")

  """
  def get_card_details(payin_id) do
    _get [resource(), "card/web", payin_id, "extended"]
  end

  defmodule Card do
    @moduledoc false
    defmodule Web do
      @moduledoc """
      Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
      """
      use MangoPay.Query.Base
      set_path "payins/card/web"
      
      @doc """
      Create a payin.
    
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "DebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "ReturnURL": "http://www.my-site.com/returnURL/",
            "CreditedWalletId": "8494559",
            "CardType": "CB_VISA_MASTERCARD",
            "SecureMode": "DEFAULT",
            "Culture": "EN",
            "TemplateURLOptions": %{
            "Payline": "https://www.mysite.com/template/"
            },
            "StatementDescriptor": "Mar2016"
          }
          {:ok, payin} = MangoPay.PayIn.Card.Web.create(params)
    
      """
      def create params do
        _create params
      end
    
      @doc """
      Create a payin.
    
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "DebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "ReturnURL": "http://www.my-site.com/returnURL/",
            "CreditedWalletId": "8494559",
            "CardType": "CB_VISA_MASTERCARD",
            "SecureMode": "DEFAULT",
            "Culture": "EN",
            "TemplateURLOptions": %{
            "Payline": "https://www.mysite.com/template/"
            },
            "StatementDescriptor": "Mar2016"
          }
          payin = MangoPay.PayIn.Card.Web.create!(params)
    
      """
      def create! params do
        _create! params
      end
    end

    defmodule Direct do
      @moduledoc """
      Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
      """
      use MangoPay.Query.Base
      set_path "payins/card/direct"

      @doc """
      Create a payin.
    
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": {
              "Currency": "EUR",
              "Amount": 12
            },
            "SecureModeReturnURL": "http://www.my-site.com/returnURL",
            "CardId": "14213157",
            "SecureMode": "DEFAULT",
            "Billing": %{
              "Address": %{
                "AddressLine1": "1 Mangopay Street",
                "AddressLine2": "The Loop",
                "City": "Paris",
                "Region": "Ile de France",
                "PostalCode": "75001",
                "Country": "FR"
              }
            },
            "StatementDescriptor": "Mar2016"
          }
          {:ok, payin} = MangoPay.PayIn.Card.Direct.create(params)
    
      """
      def create params do
        _create params
      end
    
      @doc """
      Create a payin.
    
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": {
              "Currency": "EUR",
              "Amount": 12
            },
            "SecureModeReturnURL": "http://www.my-site.com/returnURL",
            "CardId": "14213157",
            "SecureMode": "DEFAULT",
            "Billing": %{
              "Address": %{
                "AddressLine1": "1 Mangopay Street",
                "AddressLine2": "The Loop",
                "City": "Paris",
                "Region": "Ile de France",
                "PostalCode": "75001",
                "Country": "FR"
              }
            },
            "StatementDescriptor": "Mar2016"
          }
          payin = MangoPay.PayIn.Card.Direct.create!(params)
    
      """
      def create! params do
        _create! params
      end
    end

    defmodule PreAuthorized do
      @moduledoc """
      Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
      """
      use MangoPay.Query.Base
      set_path "payins/preauthorized/direct"

      @doc """
      Create a payin.
    
      ## Examples
          params       = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DebitedFunds": {
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": {
              "Currency": "EUR",
              "Amount": 12
            },
            "PreauthorizationId": "12639123"
          }
          {:ok, payin} = MangoPay.PayIn.Card.PreAuthorized.create(params)
    
      """
      def create params do
        _create params
      end
    
      @doc """
      Create a payin.
    
      ## Examples
          params       = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DebitedFunds": {
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": {
              "Currency": "EUR",
              "Amount": 12
            },
            "PreauthorizationId": "12639123"
          }
          payin = MangoPay.PayIn.Card.PreAuthorized.create!(params)
    
      """
      def create! params do
        _create! params
      end
    end
  end

  defmodule BankWire do
    @moduledoc false
    defmodule Wallet do
      @moduledoc """
      Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
      """
      use MangoPay.Query.Base
      set_path "clients/payins/bankwire/direct"

      @doc """
      Create a payin.
    
      ## Examples
          params       = %{
            "Tag": "custom meta",
            "CreditedWalletId": "CREDIT_EUR",
            "DeclaredDebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "DeclaredFees": %{
              "Currency": "EUR",
              "Amount": 12
            }
          }
          {:ok, payin} = MangoPay.PayIn.BankWire.Wallet.create(params)
    
      """
      def create params do
        _create params
      end
    
      @doc """
      Create a payin.
    
      ## Examples
          params       = %{
            "Tag": "custom meta",
            "CreditedWalletId": "CREDIT_EUR",
            "DeclaredDebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "DeclaredFees": %{
              "Currency": "EUR",
              "Amount": 12
            }
          }
          payin = MangoPay.PayIn.BankWire.Wallet.create!(params)
    
      """
      def create! params do
        _create! params
      end
    end

    defmodule Direct do
      @moduledoc """
      Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
      """
      use MangoPay.Query.Base
      set_path "payins/bankwire/direct"


      @doc """
      Create a payin.
    
      ## Examples
          params       = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DeclaredDebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "DeclaredFees": %{
              "Currency": "EUR",
              "Amount": 12
            }
          }
          {:ok, payin} = MangoPay.PayIn.Direct.create(params)
    
      """
      def create params do
        _create params
      end
    
      @doc """
      Create a payin.
    
      ## Examples
          params       = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DeclaredDebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "DeclaredFees": %{
              "Currency": "EUR",
              "Amount": 12
            }
          }
          payin = MangoPay.PayIn.BankWire.Direct.create!(params)
    
      """
      def create! params do
        _create! params
      end
    end
  end

  defmodule DirectDebit do
    @moduledoc false
    defmodule Web do
      @moduledoc """
      Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
      """
      use MangoPay.Query.Base
      set_path "payins/directdebit/web"

      @doc """
      Create a payin.
    
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DeclaredDebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "DeclaredFees": %{
              "Currency": "EUR",
              "Amount": 12
            }
          }
          {:ok, payin} = MangoPay.PayIn.DirectDebit.Web.create(params)
    
      """
      def create params do
        _create params
      end
    
      @doc """
      Create a payin.
    
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DeclaredDebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "DeclaredFees": %{
              "Currency": "EUR",
              "Amount": 12
            }
          }
          payin = MangoPay.PayIn.DirectDebit.Web.create!(params)
    
      """
      def create! params do
        _create! params
      end
    end

    defmodule Direct do
      @moduledoc """
      Functions for MangoPay [pay in](https://docs.mangopay.com/endpoints/v2.01/payins#e264_the-payin-object).
      """
      use MangoPay.Query.Base
      set_path "payins/directdebit/direct"
  
      @doc """
      Create a payin.
      
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "MandateId": "24733034",
            "StatementDescriptor": "Nov2016"
          }
          {:ok, payin} = MangoPay.PayIn.DirectDebit.Direct.create(params)
      
      """
      def create params do
        _create params
      end
      
      @doc """
      Create a payin.
      
      ## Examples
          params         = %{
            "Tag": "custom meta",
            "AuthorId": "8494514",
            "CreditedUserId": "8494514",
            "CreditedWalletId": "8494559",
            "DebitedFunds": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "Fees": %{
              "Currency": "EUR",
              "Amount": 12
            },
            "MandateId": "24733034",
            "StatementDescriptor": "Nov2016"
          }
          payin = MangoPay.PayIn.DirectDebit.Direct.create!(params)
      
      """
      def create! params do
        _create! params
      end
    end
  end
end
