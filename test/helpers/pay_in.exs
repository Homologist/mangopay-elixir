ExUnit.start()

defmodule PayInHelper do
  defmacro __using__(opts \\ nil) do
    quote do
      def fixture_path(path) do
        "fixture/vcr_cassettes" <> path
      end

      def get_json(path) do
        a = fixture_path(path) |> File.read!() |> Poison.decode!() |> List.last()
        b = a["response"]["body"]

        case Poison.decode(b) do
          {:ok, val} -> val
          {:error, message} -> b
        end
      end

      def created_pay_in(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "pay_in", "card", "direct", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def pay_in_card_web_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedUserId: created_user()["Id"],
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

      def pay_in_card_direct_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
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

      def pay_in_card_preauthorized_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
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

      def pay_in_bank_wire_direct_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
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

      def pay_in_bank_wire_wallet_hash do
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

      def pay_in_directdebit_web_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
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

      def pay_in_directdebit_direct_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedWalletId: created_wallet()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          MandateId: created_mandate()["Id"],
          StatementDescriptor: "Nov2016"
        }
      end

      def create_pay_in_web_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_in/card/web/create" do
          Mangopay.PayIn.Card.Web.create(pay_in_card_web_hash())
        end
      end

      def create_pay_in_direct_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_in/card/direct/create" do
          Mangopay.PayIn.Card.Direct.create(pay_in_card_direct_hash())
        end
      end

      def create_pay_in_preauthorized_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_in/card/pre_authorized/create" do
          Mangopay.PayIn.Card.PreAuthorized.create(pay_in_card_preauthorized_hash())
        end
      end
    end
  end
end
