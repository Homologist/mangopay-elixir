ExUnit.start()

defmodule Helper do
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

      def created_user do
        created_natural_user
      end

      def created_natural_user do
        get_json "/user/natural/create.json"
      end

      def created_legal_user do
        get_json "/user/legal/create.json"
      end

      def created_registration_card do
        get_json "/card/registration/create.json"
      end

      def created_registration_card_bis do
        get_json "/card/create_bis.json"
      end

      def created_registration_card_registrationdata do
        get_json "/card/registrationdata.json"
      end

      def created_card do
        get_json "/card/get.json"
      end

      def updated_card do
        get_json "/card/update.json"
      end

      def created_bank_account do
        get_json "/bank_account/iban/create.json"
      end

      def user_natural_hash do
        %{"Tag": "Test natural user","Email": "my@email.com","FirstName": "John","LastName": "Doe","Address": %{"AddressLine1": "Le Palais Royal","AddressLine2": "8 Rue de Montpensier","City": "Paris","Region": "","PostalCode": "75001","Country": "FR"},"Birthday": 1300186358,"Birthplace": "Paris","Nationality": "FR","CountryOfResidence": "FR","Occupation": "Worker","IncomeRange": 1}
      end

      def user_legal_hash do
        %{
          "Tag": "custom meta",
          "HeadquartersAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
            "Country": "FR"
          },
          "LegalPersonType": "BUSINESS",
          "Name": "Mangopay Ltd",
          "LegalRepresentativeAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
            "Country": "FR"
          },
          "LegalRepresentativeBirthday": 1463496101,
          "LegalRepresentativeCountryOfResidence": "ES",
          "LegalRepresentativeNationality": "FR",
          "LegalRepresentativeEmail": "support@mangopay.com",
          "LegalRepresentativeFirstName": "Joe",
          "LegalRepresentativeLastName": "Blogs",
          "Email": "support@mangopay.com",
          "CompanyNumber": "LU72HN11"
        }
      end

      def update_user_legal_hash do
        %{"Tag": "custom meta", "Name": "Mangopay Ltd", "HeadquartersAddress": %{
          "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
            "Country": "FR"
          },
          "LegalPersonType": "BUSINESS",
          "Name": "Mangopay Ltd",
          "LegalRepresentativeAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
            "Country": "FR"
          },
        "LegalRepresentativeBirthday": 1463496101, "LegalRepresentativeCountryOfResidence": "ES", "LegalRepresentativeNationality": "FR", "LegalRepresentativeEmail": "support@mangopay.com", "LegalRepresentativeFirstName": "Joe", "LegalRepresentativeLastName": "Blogs", "LegalPersonType": "BUSINESS", "CompanyNumber": "LU72HN11"}
      end

      def update_user_natural_hash do
        %{"Tag": "custom meta", "FirstName": "Joe", "LastName": "Blogs", "Address": %{"AddressLine1": "1 Mangopay Street", "AddressLine2": "The Loop", "City": "Paris", "Region": "Ile de France", "PostalCode": "75001", "Country": "FR"}, "Birthday": 1463496101, "Nationality": "GB", "CountryOfResidence": "FR", "Occupation": "Carpenter", "IncomeRange": 2, "Email": "support@mangopay.com"}
      end

      def card_hash do
        %{"Tag": "custom meta", "UserId": created_natural_user["Id"], "Currency": "EUR", "CardType": "CB_VISA_MASTERCARD"}
      end

      def created_registration_card_preregistrationdata do
        "data=#{created_registration_card["PreregistrationData"]}&accessKeyRef=#{created_registration_card["AccessKey"]}&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"
      end

      def update_card_hash do
        %{"RegistrationData": created_registration_card_registrationdata}
      end

      def deactivate_card_hash do
        %{"Active": "false"}
      end

      def bank_account_iban_hash do
        %{
          "Tag": "custom meta",
          "OwnerAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
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
            "PostalCode": "75001",
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
            "PostalCode": "75001",
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
            "PostalCode": "75001",
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
            "PostalCode": "75001",
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

      def update_client_hash do
        %{"PlatformDescription": "We are a marketplace specialised in rare flipflops for Europe and America. "}
      end

      def update_logo_client_hash do
        %{"File": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAEBAQEBAQEBAQEBAQECAgMCAgICAgQDAwIDBQQFBQUE BAQFBgcGBQUHBgQEBgkGBwgICAgIBQYJCgkICgcICAj/2wBDAQEBAQICAgQCAgQIBQQFCAgICAgI CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAyADIDAREA AhEBAxEB/8QAGwAAAgMBAQEA"}
      end
    end
  end
end
