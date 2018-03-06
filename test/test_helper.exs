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
        created_natural_user()
      end

      def created_natural_user do
        get_json "/user/natural/create.json"
      end

      def created_user_bis do
        created_natural_user_bis
      end

      def created_natural_user_bis do
        get_json "/user/natural/create_bis.json"
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

      def created_wallet do
        get_json "/wallet/create.json"
      end

      def created_wallet_bis do
        get_json "/wallet/create_bis.json"
      end

      def created_mandate do
        get_json "/mandate/create.json"
      end

      def created_hook do
        List.first(get_json "/hook/all.json")
      end

      def created_preauthorization do
        get_json "/preauthorization/create.json"
      end

      def created_preauthorization_bis do
        get_json "/preauthorization/create_bis.json"
      end

      def created_client_wallet do
        List.first(get_json("/client_wallet/all.json"))
      end

      def created_dispute do
        List.first(get_json("/dispute/all.json"))
      end

      def created_transfer do
        get_json "/transfer/create.json"
      end

      def created_repudiation do
        get_json "/repudiation/get.json"
      end

      def created_reporting_transaction do
        get_json "/reporting/transaction/create.json"
      end

      def created_reporting_wallet do
        get_json "/reporting/wallet/create.json"
      end

      def created_dispute_document do
        get_json "/dispute_document/create.json"
      end

      def created_dispute_document_page do
        get_json "/dispute_document_page/get.json"
      end

      def created_kyc_document do
        get_json "/kyc_document/user/create.json"
      end

      def created_kyc_document_page do
        get_json "/kyc_document_page/user/create.json"
      end

      def created_ubo_declaration do
        get_json "/ubo_declaration/user/get.json"
      end

      def created_sso do
        get_json "/sso/create.json"
      end

      def created_permission_group do
        get_json "/permission_group/create.json"
      end

      def created_client do
        get_json "/client/get.json"
      end

      def created_pay_in do
        get_json "/pay_in/card/direct/create.json"
      end

      def created_pay_out do
        get_json "/pay_out/create.json"
      end

      def created_refund do
        get_json "/refund/pay_in/create.json"
      end

      def created_settlement_transfer do
        get_json "/settlement_transfer/create.json"
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
          "Name": "Mangopay Ltd",
          "LegalRepresentativeAddress": %{
            "AddressLine1": "1 Mangopay Street",
            "AddressLine2": "The Loop",
            "City": "Paris",
            "Region": "Ile de France",
            "PostalCode": "755001",
            "Country": "FR"
          },
        "LegalRepresentativeBirthday": 1463496101, "LegalRepresentativeCountryOfResidence": "ES", "LegalRepresentativeNationality": "FR", "LegalRepresentativeEmail": "support@mangopay.com", "LegalRepresentativeFirstName": "Joe", "LegalRepresentativeLastName": "Blogs", "LegalPersonType": "BUSINESS", "CompanyNumber": "LU72HN11"}
      end

      def update_user_natural_hash do
        %{"Tag": "custom meta", "FirstName": "Joe", "LastName": "Blogs", "Address": %{"AddressLine1": "1 Mangopay Street", "AddressLine2": "The Loop", "City": "Paris", "Region": "Ile de France", "PostalCode": "755001", "Country": "FR"}, "Birthday": 1463496101, "Nationality": "GB", "CountryOfResidence": "FR", "Occupation": "Carpenter", "IncomeRange": 2, "Email": "support@mangopay.com"}
      end

      def card_hash do
        %{"Tag": "custom meta", "UserId": created_natural_user()["Id"], "Currency": "EUR", "CardType": "CB_VISA_MASTERCARD"}
      end

      def created_registration_card_preregistrationdata do
        "data=#{created_registration_card()["PreregistrationData"]}&accessKeyRef=#{created_registration_card()["AccessKey"]}&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"
      end

      def update_card_hash do
        %{"RegistrationData": created_registration_card_registrationdata()}
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
          "BankAccountId": created_bank_account()["Id"],
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

      def mandate_hash do
        %{
          "Tag": "custom meta",
          "BankAccountId": "14213351",
          "Culture": "EN",
          "ReturnURL": "http://www.my-site.com/returnURL/"
        }
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

      def ubo_declaration_hash do
        %{
          "Tag": "custom meta",
          "Status": "CREATED",
          "DeclaredUBOs": [ List.first(created_ubo_declaration()["DeclaredUBOs"])["UserId"] ]
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

      def permission_group_hash do
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
          "CreditedWalletId": created_wallet()["Id"],
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
          "CreditedWalletId": created_wallet()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "SecureModeReturnURL": "http://www.my-site.com/returnURL",
          "CardId": created_card()["Id"],
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
          "CreditedWalletId": created_wallet()["Id"],
          "DebitedFunds": %{
            "Currency": "EUR",
            "Amount": 550
          },
          "Fees": %{
            "Currency": "EUR",
            "Amount": 3
          },
          "PreauthorizationId": created_preauthorization_bis["Id"]
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
        Mangopay.UboDeclaration.get first_ubo_declaration["Id"]
      end
    end
  end
end
