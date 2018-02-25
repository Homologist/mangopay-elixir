ExUnit.start()

defmodule Helper do
  def fixture_path path do
    "fixture/vcr_cassettes" <> path
  end
  def created_user path do
    a = File.read!(path) |> Poison.decode! |> List.last
    b = a["response"]["body"] |> Poison.decode!
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
end
