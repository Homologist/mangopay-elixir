
defmodule Mangopay.TransactionFactory do
  defmacro __using__(_opts) do
    quote do
      def user_legal_hash do
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

      def update_user_legal_hash do
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

      def hook_hash do
        %{
          Tag: "custom meta",
          EventType: "PAYIN_NORMAL_CREATED",
          Url: "http://www.my-site.com/hooks/"
        }
      end

      def update_hook_hash do
        %{
          Tag: "custom meta",
          Status: "ENABLED",
          Url: "http://www.my-site.com/hooks/"
        }
      end

      def ubo_declaration_hash do
        %{
          Tag: "custom meta",
          DeclaredUBOs: [created_user()["Id"]]
        }
      end

      def update_ubo_declaration_hash do
        %{
          Tag: "custom meta",
          Status: "CREATED",
          DeclaredUBOs: [List.first(created_ubo_declaration()["DeclaredUBOs"])["UserId"]]
        }
      end

      def transfer_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedUserId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 499
          },
          Fees: %{
            Currency: "EUR",
            Amount: 2
          },
          DebitedWalletId: created_wallet()["Id"],
          CreditedWalletId: created_wallet_bis()["Id"]
        }
      end

      def reporting_transaction_hash do
        %{
          Tag: "custom meta",
          CallbackURL: "http://www.my-site.com/callbackURL/",
          DownloadFormat: "CSV",
          Sort: "CreationDate:DESC",
          Preview: false,
          Filters: %{
            Type: ["PAYIN"],
            Status: ["SUCCEEDED"],
            Nature: ["REGULAR"],
            MinDebitedFundsAmount: 430,
            MinDebitedFundsCurrency: "EUR",
            MaxDebitedFundsAmount: 8790,
            MaxDebitedFundsCurrency: "EUR",
            MinFeesAmount: 120,
            MinFeesCurrency: "EUR",
            MaxFeesAmount: 4550,
            MaxFeesCurrency: "EUR",
            AuthorId: created_user()["Id"],
            WalletId: created_wallet()["Id"]
          },
          Columns: ["Id", "CreationDate"]
        }
      end

      def reporting_wallet_hash do
        %{
          Tag: "custom meta",
          CallbackURL: "http://www.my-site.com/callbackURL/",
          DownloadFormat: "CSV",
          Sort: "CreationDate:DESC",
          Preview: false,
          Filters: %{
            AfterDate: 1_431_817_821,
            BeforeDate: 1_463_440_221,
            OwnerId: "blabla",
            Currency: "EUR",
            MinBalanceAmount: 123,
            MinBalanceCurrency: "EUR",
            MaxBalanceAmount: 123,
            MaxBalanceCurrency: "EUR"
          },
          Columns: [
            "Id",
            "Tag",
            "CreationDate",
            "Owners",
            "Description",
            "BalanceAmount",
            "BalanceCurrency",
            "Currency",
            "FundsType"
          ]
        }
      end

      def kyc_document_hash do
        %{
          Tag: "custom meta",
          Type: "IDENTITY_PROOF"
        }
      end

      def submit_kyc_document_hash do
        %{
          Tag: "custom meta",
          Status: "VALIDATION_ASKED"
        }
      end

      def kyc_document_page_hash do
        %{
          File: Base.encode64(File.read!("test/kyc_document_spec.png"))
        }
      end

      def permission_group_hash do
        %{
          Tag: "custom meta",
          Name: "Users only"
        }
      end

      def update_permission_group_hash do
        %{
          Tag: "custom meta update",
          Name: "Users only"
        }
      end

      def extend_invitation_sso_hash do
        %{}
      end

      def sso_hash do
        %{
          Tag: "custom meta",
          FirstName: "Joe",
          LastName: "Blogs",
          Email: "#{created_user()["Id"]}@mangopay.com",
          PermissionGroupId: created_permission_group()["Id"]
        }
      end

      def update_sso_hash do
        %{
          Tag: "custom meta",
          FirstName: "Joe",
          LastName: "Blogs",
          PermissionGroupId: created_permission_group()["Id"],
          Active: true
        }
      end

      def refund_pay_in_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 450
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          }
        }
      end

      def refund_transfer_hash do
        %{Tag: "custom meta", AuthorId: created_user()["Id"]}
      end

      def settlement_transfer_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_repudiation()["AuthorId"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 12
          },
          Fees: %{
            Currency: "EUR",
            Amount: 0
          }
        }
      end
    end
  end
end
