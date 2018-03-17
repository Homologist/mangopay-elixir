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

      def created_registration_card(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "card", "registration", "create.json"], & !is_nil(&1)), "/")
      end

      def created_registration_card_bis(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "card", "create_bis.json"], & !is_nil(&1)), "/")
      end

      def created_registration_card_registrationdata(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "card", "registrationdata.json"], & !is_nil(&1)), "/")
      end

      def created_card(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "card", "get.json"], & !is_nil(&1)), "/")
      end

      def created_card_bis(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "card", "create_bis.json"], & !is_nil(&1)), "/")
      end

      def created_bank_account(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "bank_account", "iban", "create.json"], & !is_nil(&1)), "/")
      end

      def created_wallet(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "wallet", "create.json"], & !is_nil(&1)), "/")
      end

      def created_wallet_bis(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "wallet", "create_bis.json"], & !is_nil(&1)), "/")
      end

      def created_mandate(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "mandate", "create.json"], & !is_nil(&1)), "/")
      end

      def created_hook(module_name \\ nil) do
        List.first(get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "hook", "all.json"], & !is_nil(&1)), "/"))
      end

      def created_preauthorization(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "preauthorization", "create.json"], & !is_nil(&1)), "/")
      end

      def created_preauthorization_bis(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "preauthorization", "create_bis.json"], & !is_nil(&1)), "/")
      end

      def created_client_wallet(module_name \\ nil) do
        List.first(get_json(Enum.join(Enum.filter(["", module_name(__MODULE__), "client_wallet", "all.json"], & !is_nil(&1)), "/")))
      end

      def updated_card(module_name \\ nil) do
        get_json(Enum.join(Enum.filter(["", module_name(__MODULE__), "card", "update.json"], & !is_nil(&1)), "/"))
      end

      def created_dispute(module_name \\ nil) do
        List.first(get_json(Enum.join(Enum.filter(["", module_name(__MODULE__), "dispute", "all.json"], & !is_nil(&1)), "/")))
      end

      def created_transfer(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "transfer", "create.json"], & !is_nil(&1)), "/")
      end

      def created_repudiation(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "repudiation", "get.json"], & !is_nil(&1)), "/")
      end

      def created_reporting_transaction(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "reporting", "transaction", "create.json"], & !is_nil(&1)), "/")
      end

      def created_reporting_wallet(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "reporting", "wallet", "create.json"], & !is_nil(&1)), "/")
      end

      def created_dispute_document(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "dispute_document", "create.json"], & !is_nil(&1)), "/")
      end

      def created_dispute_document_page(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "dispute_document_page", "get.json"], & !is_nil(&1)), "/")
      end

      def created_kyc_document(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "kyc_document", "user", "create.json"], & !is_nil(&1)), "/")
      end

      def created_kyc_document_page(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "kyc_document_page", "user", "create.json"], & !is_nil(&1)), "/")
      end

      def created_ubo_declaration(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "ubo_declaration", "user", "get.json"], & !is_nil(&1)), "/")
      end

      def created_sso(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "sso", "create.json"], & !is_nil(&1)), "/")
      end

      def created_permission_group(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "permission_group", "create.json"], & !is_nil(&1)), "/")
      end

      def created_client(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "client", "get.json"], & !is_nil(&1)), "/")
      end

      def created_pay_in(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "pay_in", "card", "direct", "create.json"], & !is_nil(&1)), "/")
      end

      def created_pay_out(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "pay_out", "create.json"], & !is_nil(&1)), "/")
      end

      def created_refund(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "refund", "pay_in", "create.json"], & !is_nil(&1)), "/")
      end

      def created_settlement_transfer(module_name \\ nil) do
        get_json Enum.join(Enum.filter(["", module_name(__MODULE__), "settlement_transfer", "create.json"], & !is_nil(&1)), "/")
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

      def card_hash do
        %{"Tag": "custom meta", "UserId": created_natural_user(to_string(__MODULE__))["Id"], "Currency": "EUR", "CardType": "CB_VISA_MASTERCARD"}
      end

      def created_registration_card_preregistrationdata do
        "data=#{created_registration_card()["PreregistrationData"]}&accessKeyRef=#{created_registration_card()["AccessKey"]}&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"
      end

      def created_registration_card_preregistrationdata(registration_card) do
        "data=#{registration_card["PreregistrationData"]}&accessKeyRef=#{registration_card["AccessKey"]}&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"
      end

      def update_card_hash do
        %{"RegistrationData": created_registration_card_registrationdata()}
      end

      def update_card_hash(registration_data) do
        %{"RegistrationData": registration_data}
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

      def update_client_hash do
        %{"PlatformDescription": "We are a marketplace specialised in rare flipflops for Europe and America. "}
      end

      def update_logo_client_hash do
        %{"File": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAEBAQEBAQEBAQEBAQECAgMCAgICAgQDAwIDBQQFBQUE BAQFBgcGBQUHBgQEBgkGBwgICAgIBQYJCgkICgcICAj/2wBDAQEBAQICAgQCAgQIBQQFCAgICAgI CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAyADIDAREA AhEBAxEB/8QAGwAAAgMBAQEA"}
      end

      def wallet_hash do
        %{
          "Tag": "custom meta",
          "Owners": [ created_user()["Id"] ],
          "Description": "My big project",
          "Currency": "EUR"
        }
      end

      def wallet_hash_bis do
        %{
          "Tag": "custom meta",
          "Owners": [ created_user_bis()["Id"] ],
          "Description": "My big project",
          "Currency": "EUR"
        }
      end

      def update_wallet_hash do
        %{
          "Tag": "custom meta",
          "Description": "My big project"
        }
      end

      def mandate_hash do
        %{
          "Tag": "custom meta",
          "BankAccountId": created_bank_account(__MODULE__)["Id"],
          "Culture": "EN",
          "ReturnURL": "http://www.my-site.com/returnURL/"
        }
      end

      def cancel_mandate_hash do
        %{}
      end

      def hook_hash do
        %{
          "Tag": "custom meta",
          "EventType": "PAYIN_NORMAL_CREATED",
          "Url": "http://www.my-site.com/hooks/"
        }
      end

      def update_hook_hash do
        %{
          "Tag": "custom meta",
          "Status": "ENABLED",
          "Url": "http://www.my-site.com/hooks/"
        }
      end

      def dispute_hash do
        %{}
      end

      def dispute_hook_hash do
        %{}
      end

      def update_mandate_hash do
        %{}
      end

      def update_dispute_hash do
        %{
          "Tag": "custom meta"
        }
      end

      def ubo_declaration_hash do
        %{
          "Tag": "custom meta",
          "DeclaredUBOs": [ created_user()["Id"] ]
        }
      end

      def update_ubo_declaration_hash do
        %{
          "Tag": "custom meta",
          "Status": "CREATED",
          "DeclaredUBOs": [ List.first(created_ubo_declaration()["DeclaredUBOs"])["UserId"] ]
        }
      end

      def transfer_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "CreditedUserId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 499
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 2
          },
          "DebitedWalletId": created_wallet()["Id"],
          "CreditedWalletId": created_wallet_bis()["Id"]
        }
      end

      def reporting_transaction_hash do
        %{
          "Tag": "custom meta",
          "CallbackURL": "http://www.my-site.com/callbackURL/",
          "DownloadFormat": "CSV",
          "Sort": "CreationDate:DESC",
          "Preview": false,
          "Filters": %{
          "Type": [ "PAYIN" ],
          "Status": [ "SUCCEEDED" ],
          "Nature": [ "REGULAR" ],
          "MinDebitedFundsAmount": 430,
          "MinDebitedFundsCurrency": "EUR",
          "MaxDebitedFundsAmount": 8790,
          "MaxDebitedFundsCurrency": "EUR",
          "MinFeesAmount": 120,
          "MinFeesCurrency": "EUR",
          "MaxFeesAmount": 4550,
          "MaxFeesCurrency": "EUR",
          "AuthorId": created_user()["Id"],
          "WalletId": created_wallet()["Id"]
          },
          "Columns": [ "Id", "CreationDate" ]
        }
      end

      def reporting_wallet_hash do
        %{
          "Tag": "custom meta",
          "CallbackURL": "http://www.my-site.com/callbackURL/",
          "DownloadFormat": "CSV",
          "Sort": "CreationDate:DESC",
          "Preview": false,
          "Filters": %{
            "AfterDate": 1431817821,
            "BeforeDate": 1463440221,
            "OwnerId": "blabla",
            "Currency": "EUR",
            "MinBalanceAmount": 123,
            "MinBalanceCurrency": "EUR",
            "MaxBalanceAmount": 123,
            "MaxBalanceCurrency": "EUR"
          },
          "Columns": [ "Id", "Tag", "CreationDate", "Owners", "Description", "BalanceAmount", "BalanceCurrency", "Currency", "FundsType" ]
        }
      end

      def dispute_document_hash do
        %{
          "Tag": "custom meta",
          "Type": "DELIVERY_PROOF"
        }
      end

      def dispute_document_page_hash do
        %{
          "File": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAEBAQEBAQEBAQEBAQECAgMCAgICAgQDAwIDBQQFBQUE BAQFBgcGBQUHBgQEBgkGBwgICAgIBQYJCgkICgcICAj/2wBDAQEBAQICAgQCAgQIBQQFCAgICAgI CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAyADIDAREA AhEBAxEB/8QAGwAAAgMBAQEA"
        }
      end

      def kyc_document_hash do
        %{
          "Tag": "custom meta",
          "Type": "IDENTITY_PROOF"
        }
      end

      def submit_kyc_document_hash do
        %{
          "Tag": "custom meta",
          "Status": "VALIDATION_ASKED"
        }
      end

      def kyc_document_page_hash do
        %{
          "File": Base.encode64(File.read!("test/kyc_document_spec.png"))
        }
      end

      def permission_group_hash do
        %{
          "Tag": "custom meta",
          "Name": "Users only"
        }
      end

      def update_permission_group_hash do
        %{
          "Tag": "custom meta update",
          "Name": "Users only"
        }
      end

      def extend_invitation_sso_hash do
        %{}
      end

      def sso_hash do
        %{
          "Tag": "custom meta",
          "FirstName": "Joe",
          "LastName": "Blogs",
          "Email": "#{created_user()["Id"]}@mangopay.com",
          "PermissionGroupId": created_permission_group()["Id"]
        }
      end

      def update_sso_hash do
        %{
          "Tag": "custom meta",
          "FirstName": "Joe",
          "LastName": "Blogs",
          "PermissionGroupId": created_permission_group()["Id"],
          "Active": true
        }
      end

      def preauthorization_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 5550
          },
          "Billing": %{
            "Address": %{
              "AddressLine1": "1 Mangopay Street",
              "AddressLine2": "The Loop",
              "City": "Paris",
              "Region": "Ile de France",
              "PostalCode": "755001",
              "Country": "FR"
            }
          },
          "SecureMode": "DEFAULT",
          "CardId": created_card()["Id"],
          "SecureModeReturnURL": "http://www.my-site.com/returnURL"
        }
      end

      def cancel_preauthorization_hash do
        %{
          "Tag": "custom meta",
          "PaymentStatus": "CANCELED"
        }
      end

      def pay_in_card_web_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "CreditedUserId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "ReturnURL": "http://www.my-site.com/returnURL/",
          "CreditedWalletId": created_wallet(__MODULE__)["Id"],
          "CardType": "CB_VISA_MASTERCARD",
          "SecureMode": "DEFAULT",
          "Culture": "EN",
          "TemplateURLOptions": %{
            "Payline": "https://www.mysite.com/template/"
          },
          "StatementDescriptor": "Mar2016"
        }
      end

      def pay_in_card_direct_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "CreditedWalletId": created_wallet(__MODULE__)["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "SecureModeReturnURL": "http://www.my-site.com/returnURL",
          "CardId": created_card(__MODULE__)["Id"],
          "SecureMode": "DEFAULT",
          "Billing": %{
            "Address": %{
              "AddressLine1": "1 Mangopay Street",
              "AddressLine2": "The Loop",
              "City": "Paris",
              "Region": "Ile de France",
              "PostalCode": "755001",
              "Country": "FR"
            }
          },
          "StatementDescriptor": "Mar2016"
        }
      end

      def pay_in_card_preauthorized_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "CreditedWalletId": created_wallet(__MODULE__)["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "PreauthorizationId": created_preauthorization(__MODULE__)["Id"]
        }
      end

      def pay_in_bank_wire_direct_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "CreditedWalletId": created_wallet()["Id"],
          "DeclaredDebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "DeclaredFees": %{
            "Currency": "EUR",
            "Amount": 3
          }
        }
      end

      def pay_in_bank_wire_wallet_hash do
        %{
          "Tag": "custom meta",
          "CreditedWalletId": "CREDIT_EUR",
          "DeclaredDebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "DeclaredFees": %{
            "Currency": "EUR",
            "Amount": 3
          }
        }
      end

      def pay_in_directdebit_web_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "ReturnURL": "http://www.my-site.com/returnURL/",
          "CreditedWalletId": created_wallet()["Id"],
          "DirectDebitType": "SOFORT",
          "SecureMode": "DEFAULT",
          "Culture": "EN",
          "TemplateURLOptions": %{
            "Payline": "https://www.mysite.com/template/"
          }
        }
      end

      def pay_in_directdebit_direct_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "CreditedWalletId": created_wallet()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "MandateId": created_mandate()["Id"],
          "StatementDescriptor": "Nov2016"
        }
      end

      def pay_out_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 12
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "BankAccountId": created_bank_account()["Id"],
          "DebitedWalletId": created_wallet()["Id"],
          "BankWireRef": "invoice 7282"
        }
      end

      def refund_pay_in_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_user()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 450
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          }
        }
      end

      def refund_transfer_hash do
        %{"Tag": "custom meta", "AuthorId": created_user()["Id"]}
      end

      def settlement_transfer_hash do
        %{
          "Tag": "custom meta",
          "AuthorId": created_repudiation()["AuthorId"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 12
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 0
          }
        }
      end

      def get_dispute_document do
        {:ok, response} = Mangopay.DisputeDocument.all_by_dispute created_dispute()["Id"]
        id              = List.first(Poison.decode!(response.body))["Id"]
        Mangopay.DisputeDocument.get id
      end

      def created_dispute_bis do
        {:ok, response} = Mangopay.Dispute.all
        response        = Poison.decode! response.body
        List.last(Enum.filter(response, fn x -> x["RepudiationId"] end))
      end

      def first_ubo_declaration do
        {:ok, response} = Mangopay.UboDeclaration.all
        response.body |> Poison.decode! |> List.first
      end

      def get_ubo_declaration do
        Mangopay.UboDeclaration.get first_ubo_declaration()["Id"]
      end

      def update_card_cassette do
        {:ok, response}   = Mangopay.Card.create card_hash()
        registration_card = Poison.decode! response.body
        response          = Mangopay.request! {:post, registration_card["CardRegistrationURL"] , created_registration_card_preregistrationdata(registration_card)}
        registration_data       = response.body
        Mangopay.Card.update registration_card["Id"], update_card_hash(registration_data)
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

      def create_bank_account_cassette do
        use_cassette "#{module_name(__MODULE__)}/user/natural/create" do
          Mangopay.User.Natural.create user_natural_hash()
        end

        use_cassette "#{module_name(__MODULE__)}/bank_account/iban/create" do
          Mangopay.BankAccount.create_iban created_user()["Id"], bank_account_iban_hash()
        end
      end

      def create_mandate_cassette do
        create_bank_account_cassette()
        use_cassette "#{module_name(__MODULE__)}/mandate/create" do
          Mangopay.Mandate.create mandate_hash()
        end
      end

      def create_client_wallet_cassette do
        use_cassette "#{module_name(__MODULE__)}/client_wallet/all" do
          Mangopay.ClientWallet.all
        end
      end

      def create_dispute_cassette do
        use_cassette "#{module_name(__MODULE__)}/dispute/all" do
          Mangopay.Dispute.all
        end

        use_cassette "#{module_name(__MODULE__)}/dispute/create" do
          created_dispute()
        end
      end

      def create_dispute_bis_cassette do
        use_cassette "#{module_name(__MODULE__)}/refund/dispute/create_bis" do
          created_dispute_bis()
        end
      end

      def all_client_wallet do
        use_cassette "#{module_name(__MODULE__)}/client_wallet/all" do
          Mangopay.ClientWallet.all
        end
      end

      def create_preauthorization_cassette do
        use_cassette "#{module_name(__MODULE__)}/preauthorization/create" do
          Mangopay.PreAuthorization.create preauthorization_hash()
        end
      end

      def cancel_preauthorization_cassette do
        use_cassette "#{module_name(__MODULE__)}/preauthorization/cancel" do
          Mangopay.PreAuthorization.cancel created_preauthorization()["Id"], cancel_preauthorization_hash()
        end
      end


      def create_permission_group_casssette do
        use_cassette "#{module_name(__MODULE__)}/permission_group/create" do
          Mangopay.PermissionGroup.create permission_group_hash()
        end
      end

      def get_permission_group_casssette do
        use_cassette "#{module_name(__MODULE__)}/permission_group/get" do
          Mangopay.PermissionGroup.get created_permission_group()["Id"]
        end
      end

      def get_client_cassette do
        use_cassette "#{module_name(__MODULE__)}/client/get" do
          Mangopay.Client.get
        end
      end


      def all_dispute_cassette do
        use_cassette "#{module_name(__MODULE__)}/dispute/all" do
          Mangopay.Dispute.all
        end
      end

      def create_dispute_document_cassette do
        use_cassette "#{module_name(__MODULE__)}/dispute/all" do
          Mangopay.Dispute.all
        end

        use_cassette "#{module_name(__MODULE__)}/dispute_document/dispute/all" do
          Mangopay.DisputeDocument.all_by_dispute created_dispute()["Id"]
        end

        use_cassette "#{module_name(__MODULE__)}/dispute_document/create" do
          get_dispute_document()
        end
      end

      def create_hook_cassette do
        use_cassette "#{module_name(__MODULE__)}/hook/create" do
          Mangopay.Hook.create hook_hash()
        end

        use_cassette "#{module_name(__MODULE__)}/hook/all" do
          Mangopay.Hook.all
        end
      end

      def create_kyc_document_cassette do
        use_cassette "#{module_name(__MODULE__)}/kyc_document/user/create" do
          Mangopay.KycDocument.create_to_user created_user()["Id"], kyc_document_hash()
        end

        use_cassette "#{module_name(__MODULE__)}/kyc_document/user/create_page" do
          Mangopay.KycDocument.create_page_to_user_kyc_document created_user()["Id"], created_kyc_document()["Id"], kyc_document_page_hash()
        end

        use_cassette "#{module_name(__MODULE__)}/kyc_document/submit" do
          Mangopay.KycDocument.submit created_user()["Id"], created_kyc_document()["Id"], submit_kyc_document_hash()
        end
      end

      def create_pay_in_web_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_in/card/web/create" do
          Mangopay.PayIn.Card.Web.create pay_in_card_web_hash()
        end
      end

      def create_pay_in_direct_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_in/card/direct/create" do
          Mangopay.PayIn.Card.Direct.create pay_in_card_direct_hash()
        end
      end

      def create_pay_in_preauthorized_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_in/card/pre_authorized/create" do
          Mangopay.PayIn.Card.PreAuthorized.create pay_in_card_preauthorized_hash()
        end
      end

      def create_pay_out_cassette do
        use_cassette "#{module_name(__MODULE__)}/pay_out/create" do
          Mangopay.PayOut.create pay_out_hash()
        end
      end

      def create_permission_group_cassette do
        use_cassette "#{module_name(__MODULE__)}/permission_group/create" do
          Mangopay.PermissionGroup.create permission_group_hash()
        end
      end

      def create_pay_in_refund_cassette do
        use_cassette "#{module_name(__MODULE__)}/refund/pay_in/create" do
          Mangopay.Refund.PayIn.create created_pay_in()["Id"], refund_pay_in_hash()
        end
      end

      def create_transfer_refund_cassette do
        use_cassette "#{module_name(__MODULE__)}/refund/transfer/create" do
          Mangopay.Refund.Transfer.create created_transfer()["Id"], transfer_hash()
        end
      end

      def create_sso_cassette do
        use_cassette "#{module_name(__MODULE__)}/sso/create" do
          Mangopay.Sso.create sso_hash()
        end
      end

      def create_transfer_cassette do
        use_cassette "#{module_name(__MODULE__)}/transfer/create" do
          Mangopay.Transfer.create transfer_hash()
        end
      end

      def create_transaction_reporting_cassette do
        use_cassette "#{module_name(__MODULE__)}/reporting/transaction/create" do
          Mangopay.Reporting.Transaction.create reporting_transaction_hash()
        end
      end

      def create_wallet_reporting_cassette do
        use_cassette "#{module_name(__MODULE__)}/reporting/wallet/create" do
          Mangopay.Reporting.Wallet.create reporting_wallet_hash()
        end
      end

      def all_reporting_cassette do
        use_cassette "#{module_name(__MODULE__)}/reporting/all" do
          Mangopay.Reporting.all
        end
      end

      def get_repudiation_cassette do
        use_cassette "#{module_name(__MODULE__)}/repudiation/get" do
          Mangopay.Repudiation.get created_dispute_bis()["RepudiationId"]
        end
      end

      def create_settlement_transfer_cassette do
        use_cassette "#{module_name(__MODULE__)}/settlement_transfer/create" do
          Mangopay.SettlementTransfer.create created_repudiation()["Id"], settlement_transfer_hash()
        end
      end


      def create_wallet_cassette do
        use_cassette "#{module_name(__MODULE__)}/wallet/create" do
          Mangopay.Wallet.create wallet_hash()
        end
      end

      def create_wallet_bis_cassette do
        use_cassette "#{module_name(__MODULE__)}/wallet/create_bis" do
          Mangopay.Wallet.create wallet_hash_bis()
        end
      end

      def create_card_cassette do
        module_name = module_name(__MODULE__)
        use_cassette "#{module_name}/user/natural/create" do
          Mangopay.User.Natural.create user_natural_hash()
        end

        use_cassette "#{module_name}/user/legal/create" do
          Mangopay.User.Legal.create user_legal_hash()
        end

        use_cassette "#{module_name}/card/registration/create" do
          Mangopay.Card.create card_hash()
        end

        use_cassette "#{module_name}/card/registrationdata" do
          {:ok, response}   = Mangopay.Card.create card_hash()
          registration_card = Poison.decode! response.body
          Mangopay.request {:post, registration_card["CardRegistrationURL"] , created_registration_card_preregistrationdata(registration_card)}
        end

        use_cassette "#{module_name}/card/update" do
          update_card_cassette()
        end

        use_cassette "#{module_name}/card/create" do
          Mangopay.Card.get updated_card()["CardId"]
        end

        use_cassette "#{module_name}/card/get" do
          Mangopay.Card.get updated_card()["CardId"]
        end
      end

      def create_card_bis_cassette do
        module_name = module_name(__MODULE__)
        use_cassette "#{module_name}/user/natural/create" do
          Mangopay.User.Natural.create user_natural_hash()
        end

        use_cassette "#{module_name}/user/legal/create" do
          Mangopay.User.Legal.create user_legal_hash()
        end

        use_cassette "#{module_name}/card/registration/create" do
          Mangopay.Card.create card_hash()
        end

        use_cassette "#{module_name}/card/registrationdata" do
          {:ok, response}   = Mangopay.Card.create card_hash()
          registration_card = Poison.decode! response.body
          Mangopay.request {:post, registration_card["CardRegistrationURL"] , created_registration_card_preregistrationdata(registration_card)}
        end

        use_cassette "#{module_name}/card/update" do
          update_card_cassette()
        end

        use_cassette "#{module_name}/card/create" do
          Mangopay.Card.get updated_card()["CardId"]
        end

        use_cassette "#{module_name}/card/create_bis" do
          {:ok, response} = Mangopay.Card.create card_hash()
          body = Poison.decode!(response.body)
          {:ok, response} = Mangopay.request {:post, body["CardRegistrationURL"] , "data=#{body["PreregistrationData"]}&accessKeyRef=#{body["AccessKey"]}&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"}
          data = response.body
          {:ok, response} = Mangopay.Card.update body["Id"], %{"RegistrationData": data}
          body = Poison.decode!(response.body)
          Mangopay.Card.get body["CardId"]
        end

        use_cassette "#{module_name}/card/get" do
          Mangopay.Card.get updated_card()["CardId"]
        end
      end

      def create_ubo_declaration_cassette do
        use_cassette "#{module_name(__MODULE__)}/ubo_declaration/user/all" do
          Mangopay.UboDeclaration.all
        end

        use_cassette "#{module_name(__MODULE__)}/ubo_declaration/user/get" do
          get_ubo_declaration()
        end

        use_cassette "#{module_name(__MODULE__)}/ubo_declaration/update" do
          Mangopay.UboDeclaration.update created_ubo_declaration()["Id"], update_ubo_declaration_hash()
        end
      end
    end
  end
end
