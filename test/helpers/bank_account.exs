ExUnit.start()

defmodule BankAccountHelper do
  defmacro __using__(opts\\nil) do
    quote do
      def fixture_path path do
        "fixture/vcr_cassettes" <> path
      end

      def get_json path do
        a = fixture_path(path) |> File.read! |> Poison.decode! |> List.last
        b = a["response"]["body"]
        case Poison.decode b do
          {:ok, val}        -> val
          {:error, message} -> b
        end
      end

      def created_bank_account(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "bank_account", "iban", "create.json"], & !is_nil(&1)), "/")
      end

      def bank_account_iban_hash do
        %{
          "Tag": "custom meta",
          "OwnerAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
          "OwnerName": "Joe Blogs",
          "IBAN": "FR3020041010124530725S03383",
          "BIC": "CRLYFRPP"
        }
      end

      def bank_account_us_hash do
        %{
          "Tag": "custom meta",
          "OwnerAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
          "OwnerName": "Joe Blogs",
          "AccountNumber": "11696419",
          "ABA": "071000288",
          "DepositAccountType": "CHECKING"
        }
      end

      def bank_account_ca_hash do
        %{
          "Tag": "custom meta",
          "OwnerAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
          "OwnerName": "Joe Blogs",
          "BranchCode": "00152",
          "InstitutionNumber": "614",
          "AccountNumber": "11696419",
          "BankName": "The Big Bank"
        }
      end

      def bank_account_gb_hash do
        %{
          "Tag": "custom meta",
          "OwnerAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
          "OwnerName": "Joe Blogs",
          "SortCode": "010039",
          "AccountNumber": "11696419"
        }
      end

      def bank_account_other_hash do
        %{
          "Tag": "custom meta",
          "OwnerAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
          "OwnerName": "Joe Blogs",
          "Country": "FR",
          "BIC": "CRLYFRPP",
          "AccountNumber": "11696419"
        }
      end

      def deactivate_bank_account_hash do
        %{
          "Active": false
        }
      end

      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end

      def create_bank_account_cassette do
        use_cassette "#{module_name(__MODULE__)}/user/natural/create" do
          Mangopay.User.Natural.create user_natural_hash()
        end

        use_cassette "#{module_name(__MODULE__)}/bank_account/iban/create" do
          Mangopay.BankAccount.create_iban created_user()["Id"], bank_account_iban_hash()
        end
      end
    end
  end
end
