defmodule Mangopay.UserFactory do
  defmacro __using__([]) do
    quote do
      
      

      def created_user_factory do
        build(:created_natural_user)
      end

      def created_natural_user_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(Enum.join(["", Factories.SharedFunctions.module_name(__MODULE__), "user", "natural", "create.json"], "/"))
      end

      def created_user_bis_factory do
        build(:created_natural_user_bis)
      end

      def created_natural_user_bis_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "user", "natural", "create_bis.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_legal_user_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "user", "legal", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

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
    end
  end
end
