ExUnit.start()

defmodule Helper do
  defmacro __using__(opts\\nil) do
    quote do
      def fixture_path path do
        "fixture/vcr_cassettes" <> path
      end

      def get_json path do
        a = fixture_path(path) |> File.read! |> Poison.decode! |> List.last
        b = a["response"]["body"] |> Poison.decode!
      end

      def created_natural_user do
        get_json "/user/natural/create.json"
      end

      def created_legal_user do
        get_json "/user/legal/create.json"
      end

      def created_card do
        get_json "/card/create.json"
      end

      def created_card_bis do
        get_json "/card/create_bis.json"
      end

      def user_natural_hash do
        %{
          "Tag": "custom meta",
          "FirstName": "Joe",
          "LastName": "Blogs",
          "Address": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "75001",
            "Country": "FR"
          },
          "Birthday": 1463496101,
          "Nationality": "GB",
          "CountryOfResidence": "FR",
          "Occupation": "Carpenter",
          "IncomeRange": 2,
          "Email": "support@mangopay.com"
        }
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

      def card_registration_data do
        %{
          data: created_card["PreregistrationData"],
          accessKeyRef: created_card["AccessKey"],
          cardNumber: 4970100000000154,
          cardExpirationDate: 1217,
          cardCvx: 123
        }
      end

      def update_card_hash do
        %{"Tag": "custom meta", "RegistrationData": created_natural_user["PreregistrationData"]}
      end

      def deactivate_card_hash do
        %{"Active": "false"}
      end
    end
  end
end
