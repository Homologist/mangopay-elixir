defmodule MangoPay.User do
  @moduledoc """
  Functions for MangoPay [client](https://docs.mangopay.com/endpoints/v2.01/users#e253_the-user-object).
  """
  use MangoPay.Query.Base
  set_path "users"

  @doc """
  Get a user.

  ## Examples
      {:ok, user} = MangoPay.User.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a user.

  ## Examples
      user = MangoPay.User.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  List all users.

  ## Examples
      {:ok, users} = MangoPay.User.all

  """
  def all() do
    _all()
  end

  @doc """
  List all users.

  ## Examples
      users = MangoPay.User.all!

  """
  def all!() do
    _all!()
  end

  @doc """
  Get emoney.

  ## Examples

      {:ok, client} = MangoPay.User.get_emoney("user_id")

  """
  def get_emoney id do
    _get [resource(), "#{id}", "emoney"]
  end

  defmodule Natural do
    @moduledoc """
    Functions for MangoPay user natural.

    MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/users#e253_the-user-object
    """
    use MangoPay.Query.Base
    set_path "users/natural"

    @doc """
    Create a user.
  
    ## Examples
        params = %{
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
          "Email": "support@mangopay.com",
          "Capacity": "NORMAL"
        }
        {:ok, user} = MangoPay.User.Natural.create(params)
  
    """
    def create params do
      _create params
    end
  
    @doc """
    Create a user.
  
    ## Examples
        params = %{
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
          "Email": "support@mangopay.com",
          "Capacity": "NORMAL"
        }
        user   = MangoPay.User.Natural.create!(params)
  
    """
    def create! params do
      _create! params
    end
  
    @doc """
    Update a user.
  
    ## Examples
        params = %{
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
        {:ok, user} = MangoPay.User.Natural.update(id, params)
  
    """
    def update id, params do
      _update params, id
    end
  
    @doc """
    Update a user.
  
    ## Examples
        params = %{
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
        user   = MangoPay.User.Natural.update(id, params)
  
    """
    def update! id, params do
      _update! params, id
    end
  end

  defmodule Legal do
    @moduledoc """
    Functions for MangoPay user legal.

    MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/users#e253_the-user-object
    """
    use MangoPay.Query.Base
    set_path "users/legal"

    @doc """
    Create a user.
  
    ## Examples
        params      = %{
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
        {:ok, user} = MangoPay.UserLegal.create(params)
  
    """
    def create params do
      _create params
    end
  
    @doc """
    Create a user.
  
    ## Examples
        params    = %{
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
        user    = MangoPay.UserLegal.create!(params)
  
    """
    def create! params do
      _create! params
    end
  
    @doc """
    Update a user.
  
    ## Examples
        params    = %{
          "Tag": "custom meta",
          "HeadquartersAddress": "3 Mangopay Loop, Paris, 777",
          "Name": "Mangopay Ltd",
          "LegalRepresentativeAddress": "34bis Mangopay Circle, Paris, 777",
          "LegalRepresentativeBirthday": 1463496101,
          "LegalRepresentativeCountryOfResidence": "ES",
          "LegalRepresentativeNationality": "FR",
          "LegalRepresentativeEmail": "support@mangopay.com",
          "LegalRepresentativeFirstName": "Joe",
          "LegalRepresentativeLastName": "Blogs",
          "LegalPersonType": "BUSINESS",
          "CompanyNumber": "LU72HN11"
        }
        {:ok, user} = MangoPay.UserLegal.update(id, params)
  
    """
    def update id, params do
      _update params, id
    end
  
    @doc """
    Update a user.
  
    ## Examples
        params    = %{
          "Tag": "custom meta",
          "HeadquartersAddress": "3 Mangopay Loop, Paris, 777",
          "Name": "Mangopay Ltd",
          "LegalRepresentativeAddress": "34bis Mangopay Circle, Paris, 777",
          "LegalRepresentativeBirthday": 1463496101,
          "LegalRepresentativeCountryOfResidence": "ES",
          "LegalRepresentativeNationality": "FR",
          "LegalRepresentativeEmail": "support@mangopay.com",
          "LegalRepresentativeFirstName": "Joe",
          "LegalRepresentativeLastName": "Blogs",
          "LegalPersonType": "BUSINESS",
          "CompanyNumber": "LU72HN11"
        }
        user   = MangoPay.UserLegal.update(id, params)
  
    """
    def update! id, params do
      _update! params, id
    end
  end
end
