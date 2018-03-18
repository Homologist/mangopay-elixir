ExUnit.start()

defmodule UserHelper do
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
        created_natural_user(__MODULE__)
      end

      def created_natural_user(module_name\\nil) do
        get_json Enum.join(["", module_name(__MODULE__), "user", "natural", "create.json"], "/")
      end

      def created_user_bis do
        created_natural_user_bis(__MODULE__)
      end

      def created_natural_user_bis(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "user", "natural", "create_bis.json"], & !is_nil(&1)), "/")
      end

      def created_legal_user(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "user", "legal", "create.json"], & !is_nil(&1)), "/")
      end

      def user_natural_hash do
        %{"Tag": "Test natural user","Email": "my@email.com","FirstName": "John","LastName": "Doe","Address": %{"AddressLine1": "Le Palais Royal","AddressLine2": "8 Rue de Montpensier","City": "Paris","Region": "","PostalCode": "755001","Country": "FR"},"Birthday": 1300186358,"Birthplace": "Paris","Nationality": "FR","CountryOfResidence": "FR","Occupation": "Worker","IncomeRange": 1}
      end

      def user_legal_hash do
        %{
          "Tag": "custom meta",
          "HeadquartersAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
          "LegalPersonType": "BUSINESS",
          "Name": "Mangopay Ltd",
          "LegalRepresentativeAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
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
            "PostalCode": "755001",
            "Country": "FR"
          },
          "LegalPersonType": "BUSINESS",
          "LegalRepresentativeAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
        "LegalRepresentativeBirthday": 1463496101, "LegalRepresentativeCountryOfResidence": "ES", "LegalRepresentativeNationality": "FR", "LegalRepresentativeEmail": "support@mangopay.com", "LegalRepresentativeFirstName": "Joe", "LegalRepresentativeLastName": "Blogs", "CompanyNumber": "LU72HN11"}
      end

      def update_user_natural_hash do
        %{"Tag": "custom meta", "FirstName": "Joe", "LastName": "Blogs", "Address": %{"AddressLine1": "1 Mangopay Street", "AddressLine2": "The Loop", "City": "Paris", "Region": "Ile de France", "PostalCode": "755001", "Country": "FR"}, "Birthday": 1463496101, "Nationality": "GB", "CountryOfResidence": "FR", "Occupation": "Carpenter", "IncomeRange": 2, "Email": "support@mangopay.com"}
      end
      def module_name(module) do
        module |> to_string |> String.downcase |> String.split(".") |> Enum.at(1)
      end

      def create_user_cassette do
        module_name = module_name(__MODULE__)
        use_cassette "#{module_name}/user/natural/create" do
          Mangopay.User.Natural.create user_natural_hash()
        end
      end

      def create_user_bis_cassette do
        use_cassette "#{module_name(__MODULE__)}/user/natural/create_bis" do
          Mangopay.User.Natural.create user_natural_hash()
        end
      end
    end
  end
end
