defmodule Mangopay.PreauthorizationFactory do
  defmacro __using__(_opts) do
    quote do
      def preauthorization_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 5550
          },
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
          SecureMode: "DEFAULT",
          CardId: created_card()["Id"],
          SecureModeReturnURL: "http://www.my-site.com/returnURL"
        }
      end

      def cancel_preauthorization_hash do
        %{
          Tag: "custom meta",
          PaymentStatus: "CANCELED"
        }
      end
    end
  end
end
