defmodule Mangopay.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_natural_factory do
        %{
          Tag: "Test natural user",
          Email: "my@email.com",
          FirstName: "John",
          LastName: "Doe",
          Address: %{
            AddressLine1: "Le Palais Royal",
            AddressLine2: "8 Rue de Montpensier",
            City: "Paris",
            Region: "",
            PostalCode: "755001",
            Country: "FR"
          },
          Birthday: 1_300_186_358,
          Birthplace: "Paris",
          Nationality: "FR",
          CountryOfResidence: "FR",
          Occupation: "Worker",
          IncomeRange: 1
        }
      end

      def user_legal_factory do
        %{
          Tag: "custom meta",
          HeadquartersAddress: %{
            AddressLine1: "1 Mangopay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          LegalPersonType: "BUSINESS",
          Name: "Mangopay Ltd",
          LegalRepresentativeAddress: %{
            AddressLine1: "1 Mangopay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          LegalRepresentativeBirthday: 1_463_496_101,
          LegalRepresentativeCountryOfResidence: "ES",
          LegalRepresentativeNationality: "FR",
          LegalRepresentativeEmail: "support@mangopay.com",
          LegalRepresentativeFirstName: "Joe",
          LegalRepresentativeLastName: "Blogs",
          Email: "support@mangopay.com",
          CompanyNumber: "LU72HN11"
        }
      end

      def update_user_legal_factory do
        %{
          Tag: "custom meta",
          Name: "Mangopay Ltd",
          HeadquartersAddress: %{
            AddressLine1: "1 Mangopay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          LegalPersonType: "BUSINESS",
          LegalRepresentativeAddress: %{
            AddressLine1: "1 Mangopay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          LegalRepresentativeBirthday: 1_463_496_101,
          LegalRepresentativeCountryOfResidence: "ES",
          LegalRepresentativeNationality: "FR",
          LegalRepresentativeEmail: "support@mangopay.com",
          LegalRepresentativeFirstName: "Joe",
          LegalRepresentativeLastName: "Blogs",
          CompanyNumber: "LU72HN11"
        }
      end

      def update_user_natural_factory do
        %{
          Tag: "custom meta",
          FirstName: "Joe",
          LastName: "Blogs",
          Address: %{
            AddressLine1: "1 Mangopay Street",
            AddressLine2: "The Loop",
            City: "Paris",
            Region: "Ile de France",
            PostalCode: "755001",
            Country: "FR"
          },
          Birthday: 1_463_496_101,
          Nationality: "GB",
          CountryOfResidence: "FR",
          Occupation: "Carpenter",
          IncomeRange: 2,
          Email: "support@mangopay.com"
        }
      end

      def created_user do
        created_natural_user(__MODULE__)
      end

      def created_natural_user(module_name \\ nil) do
        get_json(Enum.join(["", module_name(__MODULE__), "user", "natural", "create.json"], "/"))
      end

      def created_user_bis do
        created_natural_user_bis(__MODULE__)
      end

      def created_natural_user_bis(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "user", "natural", "create_bis.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_legal_user(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "user", "legal", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end
    end
  end
end
