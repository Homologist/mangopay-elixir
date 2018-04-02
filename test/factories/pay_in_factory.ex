ExUnit.start()

defmodule Mangopay.PayInFactory do
  defmacro __using__([]) do
    quote do
      def created_pay_in_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "pay_in", "card", "direct", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def pay_in_card_web_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          CreditedUserId: build(:created_user)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          ReturnURL: "http://www.my-site.com/returnURL/",
          CreditedWalletId: created_wallet(__MODULE__)["Id"],
          CardType: "CB_VISA_MASTERCARD",
          SecureMode: "DEFAULT",
          Culture: "EN",
          TemplateURLOptions: %{
            Payline: "https://www.mysite.com/template/"
          },
          StatementDescriptor: "Mar2016"
        }
      end

      def pay_in_card_direct_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          CreditedWalletId: created_wallet(__MODULE__)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          SecureModeReturnURL: "http://www.my-site.com/returnURL",
          CardId: created_card(__MODULE__)["Id"],
          SecureMode: "DEFAULT",
          Billing: %{
            Address: %{
              AddressLine1: "1 Mangopay Street",
              AddressLine2: "The Loop",
              City: "Paris",
              Region: "Ile de France",
              PostalCode: "755001",
              Country: "FR"
            }
          },
          StatementDescriptor: "Mar2016"
        }
      end

      def pay_in_card_preauthorized_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          CreditedWalletId: created_wallet(__MODULE__)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          PreauthorizationId: created_preauthorization(__MODULE__)["Id"]
        }
      end

      def pay_in_bank_wire_direct_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          CreditedWalletId: created_wallet()["Id"],
          DeclaredDebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          DeclaredFees: %{
            Currency: "EUR",
            Amount: 3
          }
        }
      end

      def pay_in_bank_wire_wallet_factory do
        %{
          Tag: "custom meta",
          CreditedWalletId: "CREDIT_EUR",
          DeclaredDebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          DeclaredFees: %{
            Currency: "EUR",
            Amount: 3
          }
        }
      end

      def pay_in_directdebit_web_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          ReturnURL: "http://www.my-site.com/returnURL/",
          CreditedWalletId: created_wallet()["Id"],
          DirectDebitType: "SOFORT",
          SecureMode: "DEFAULT",
          Culture: "EN",
          TemplateURLOptions: %{
            Payline: "https://www.mysite.com/template/"
          }
        }
      end

      def pay_in_directdebit_direct_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          CreditedWalletId: created_wallet()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          MandateId: build(:created_mandate)["Id"],
          StatementDescriptor: "Nov2016"
        }
      end
    end
  end
end
