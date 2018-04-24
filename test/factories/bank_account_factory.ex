defmodule MangoPay.BankAccountFactory do
  @moduledoc false
  defmacro __using__([]) do
    quote do
      def created_bank_account_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "bank_account",
                "iban",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def bank_account_iban_factory do
        %{
          Tag: "custom meta",
          OwnerAddress: %{
            AddressLine1: "1 MangoPay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          OwnerName: "Joe Blogs",
          IBAN: "FR3020041010124530725S03383",
          BIC: "CRLYFRPP"
        }
      end

      def bank_account_us_factory do
        %{
          Tag: "custom meta",
          OwnerAddress: %{
            AddressLine1: "1 MangoPay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          OwnerName: "Joe Blogs",
          AccountNumber: "11696419",
          ABA: "071000288",
          DepositAccountType: "CHECKING"
        }
      end

      def bank_account_ca_factory do
        %{
          Tag: "custom meta",
          OwnerAddress: %{
            AddressLine1: "1 MangoPay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          OwnerName: "Joe Blogs",
          BranchCode: "00152",
          InstitutionNumber: "614",
          AccountNumber: "11696419",
          BankName: "The Big Bank"
        }
      end

      def bank_account_gb_factory do
        %{
          Tag: "custom meta",
          OwnerAddress: %{
            AddressLine1: "1 MangoPay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          OwnerName: "Joe Blogs",
          SortCode: "010039",
          AccountNumber: "11696419"
        }
      end

      def bank_account_other_factory do
        %{
          Tag: "custom meta",
          OwnerAddress: %{
            AddressLine1: "1 MangoPay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          OwnerName: "Joe Blogs",
          Country: "FR",
          BIC: "CRLYFRPP",
          AccountNumber: "11696419"
        }
      end

      def deactivate_bank_account_factory do
        %{
          Active: false
        }
      end
    end
  end
end
