ExUnit.start()

defmodule MangoPay.TransactionFactory do
  defmacro __using__([]) do
    quote do
      def fixture_path(path) do
        "fixture/vcr_cassettes" <> path
      end

      def Factories.SharedFunctions.get_json(path) do
        a = fixture_path(path) |> File.read!() |> Poison.decode!() |> List.last()
        b = a["response"]["body"]

        case Poison.decode(b) do
          {:ok, val} -> val
          {:error, message} -> b
        end
      end

      #      def created_legal_user(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "user", "legal", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end

      #      def created_hook(module_name \\ nil) do
      #        List.first(
      #          Factories.SharedFunctions.get_json(
      #            Enum.join(
      #              Enum.filter(["", Factories.SharedFunctions.module_name(__MODULE__), "hook", "all.json"], &(!is_nil(&1))),
      #              "/"
      #            )
      #          )
      #        )
      #      end

      #      def created_client_wallet(module_name \\ nil) do
      #        List.first(
      #          Factories.SharedFunctions.get_json(
      #            Enum.join(
      #              Enum.filter(
      #                ["", Factories.SharedFunctions.module_name(__MODULE__), "client_wallet", "all.json"],
      #                &(!is_nil(&1))
      #              ),
      #              "/"
      #            )
      #          )
      #        )
      #      end

      #      def updated_card(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(["", Factories.SharedFunctions.module_name(__MODULE__), "card", "update.json"], &(!is_nil(&1))),
      #            "/"
      #          )
      #        )
      #      end

      #      def created_transfer(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(["", Factories.SharedFunctions.module_name(__MODULE__), "transfer", "create.json"], &(!is_nil(&1))),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def created_repudiation(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(["", Factories.SharedFunctions.module_name(__MODULE__), "repudiation", "get.json"], &(!is_nil(&1))),
      #            "/"
      #          )
      #        )
      #      end

      #      def created_reporting_transaction(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "reporting", "transaction", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end

      #      def created_reporting_wallet(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "reporting", "wallet", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end

      #      def created_kyc_document(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "kyc_document", "user", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def created_kyc_document_page(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "kyc_document_page", "user", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def created_ubo_declaration(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "ubo_declaration", "user", "get.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def created_sso(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(["", Factories.SharedFunctions.module_name(__MODULE__), "sso", "create.json"], &(!is_nil(&1))),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def created_permission_group(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "permission_group", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def created_refund(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "refund", "pay_in", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def created_settlement_transfer(module_name \\ nil) do
      #        Factories.SharedFunctions.get_json(
      #          Enum.join(
      #            Enum.filter(
      #              ["", Factories.SharedFunctions.module_name(__MODULE__), "settlement_transfer", "create.json"],
      #              &(!is_nil(&1))
      #            ),
      #            "/"
      #          )
      #        )
      #      end
      #
      #      def user_legal_hash do
      #        %{
      #          Tag: "custom meta",
      #          HeadquartersAddress: %{
      #            AddressLine1: "1 MangoPay Street",
      #            AddressLine2: "The Loop",
      #            City: "Paris",
      #            Region: "Ile de France",
      #            PostalCode: "755001",
      #            Country: "FR"
      #          },
      #          LegalPersonType: "BUSINESS",
      #          Name: "MangoPay Ltd",
      #          LegalRepresentativeAddress: %{
      #            AddressLine1: "1 MangoPay Street",
      #            AddressLine2: "The Loop",
      #            City: "Paris",
      #            Region: "Ile de France",
      #            PostalCode: "755001",
      #            Country: "FR"
      #          },
      #          LegalRepresentativeBirthday: 1_463_496_101,
      #          LegalRepresentativeCountryOfResidence: "ES",
      #          LegalRepresentativeNationality: "FR",
      #          LegalRepresentativeEmail: "support@mangopay.com",
      #          LegalRepresentativeFirstName: "Joe",
      #          LegalRepresentativeLastName: "Blogs",
      #          Email: "support@mangopay.com",
      #          CompanyNumber: "LU72HN11"
      #        }
      #      end
      #
      #      def update_user_legal_hash do
      #        %{
      #          Tag: "custom meta",
      #          Name: "MangoPay Ltd",
      #          HeadquartersAddress: %{
      #            AddressLine1: "1 MangoPay Street",
      #            AddressLine2: "The Loop",
      #            City: "Paris",
      #            Region: "Ile de France",
      #            PostalCode: "755001",
      #            Country: "FR"
      #          },
      #          LegalPersonType: "BUSINESS",
      #          LegalRepresentativeAddress: %{
      #            AddressLine1: "1 MangoPay Street",
      #            AddressLine2: "The Loop",
      #            City: "Paris",
      #            Region: "Ile de France",
      #            PostalCode: "755001",
      #            Country: "FR"
      #          },
      #          LegalRepresentativeBirthday: 1_463_496_101,
      #          LegalRepresentativeCountryOfResidence: "ES",
      #          LegalRepresentativeNationality: "FR",
      #          LegalRepresentativeEmail: "support@mangopay.com",
      #          LegalRepresentativeFirstName: "Joe",
      #          LegalRepresentativeLastName: "Blogs",
      #          CompanyNumber: "LU72HN11"
      #        }
      #      end
      #
      #      def hook_hash do
      #        %{
      #          Tag: "custom meta",
      #          EventType: "PAYIN_NORMAL_CREATED",
      #          Url: "http://www.my-site.com/hooks/"
      #        }
      #      end
      #
      #      def update_hook_hash do
      #        %{
      #          Tag: "custom meta",
      #          Status: "ENABLED",
      #          Url: "http://www.my-site.com/hooks/"
      #        }
      #      end
      #
      #      def ubo_declaration_hash do
      #        %{
      #          Tag: "custom meta",
      #          DeclaredUBOs: [build(:created_user)["Id"]]
      #        }
      #      end
      #
      #      def update_ubo_declaration_hash do
      #        %{
      #          Tag: "custom meta",
      #          Status: "CREATED",
      #          DeclaredUBOs: [List.first(build(:created_ubo_declaration)["DeclaredUBOs"])["UserId"]]
      #        }
      #      end
      #
      #      def transfer_hash do
      #        %{
      #          Tag: "custom meta",
      #          AuthorId: build(:created_user)["Id"],
      #          CreditedUserId: build(:created_user)["Id"],
      #          DebitedFunds: %{
      #            Currency: "EUR",
      #            Amount: 499
      #          },
      #          Fees: %{
      #            Currency: "EUR",
      #            Amount: 2
      #          },
      #          DebitedWalletId: created_wallet()["Id"],
      #          CreditedWalletId: created_wallet_bis()["Id"]
      #        }
      #      end
      #
      #      def reporting_transaction_hash do
      #        %{
      #          Tag: "custom meta",
      #          CallbackURL: "http://www.my-site.com/callbackURL/",
      #          DownloadFormat: "CSV",
      #          Sort: "CreationDate:DESC",
      #          Preview: false,
      #          Filters: %{
      #            Type: ["PAYIN"],
      #            Status: ["SUCCEEDED"],
      #            Nature: ["REGULAR"],
      #            MinDebitedFundsAmount: 430,
      #            MinDebitedFundsCurrency: "EUR",
      #            MaxDebitedFundsAmount: 8790,
      #            MaxDebitedFundsCurrency: "EUR",
      #            MinFeesAmount: 120,
      #            MinFeesCurrency: "EUR",
      #            MaxFeesAmount: 4550,
      #            MaxFeesCurrency: "EUR",
      #            AuthorId: build(:created_user)["Id"],
      #            WalletId: created_wallet()["Id"]
      #          },
      #          Columns: ["Id", "CreationDate"]
      #        }
      #      end
      #
      #      def reporting_wallet_hash do
      #        %{
      #          Tag: "custom meta",
      #          CallbackURL: "http://www.my-site.com/callbackURL/",
      #          DownloadFormat: "CSV",
      #          Sort: "CreationDate:DESC",
      #          Preview: false,
      #          Filters: %{
      #            AfterDate: 1_431_817_821,
      #            BeforeDate: 1_463_440_221,
      #            OwnerId: "blabla",
      #            Currency: "EUR",
      #            MinBalanceAmount: 123,
      #            MinBalanceCurrency: "EUR",
      #            MaxBalanceAmount: 123,
      #            MaxBalanceCurrency: "EUR"
      #          },
      #          Columns: [
      #            "Id",
      #            "Tag",
      #            "CreationDate",
      #            "Owners",
      #            "Description",
      #            "BalanceAmount",
      #            "BalanceCurrency",
      #            "Currency",
      #            "FundsType"
      #          ]
      #        }
      #      end
      #
      #      def kyc_document_hash do
      #        %{
      #          Tag: "custom meta",
      #          Type: "IDENTITY_PROOF"
      #        }
      #      end
      #
      #      def submit_kyc_document_hash do
      #        %{
      #          Tag: "custom meta",
      #          Status: "VALIDATION_ASKED"
      #        }
      #      end
      #
      #      def kyc_document_page_hash do
      #        %{
      #          File: Base.encode64(File.read!("test/kyc_document_spec.png"))
      #        }
      #      end
      #
      #      def permission_group_hash do
      #        %{
      #          Tag: "custom meta",
      #          Name: "users only"
      #        }
      #      end
      #
      #      def update_permission_group_hash do
      #        %{
      #          Tag: "custom meta update",
      #          Name: "users only"
      #        }
      #      end
      #
      #      def extend_invitation_sso_hash do
      #        %{}
      #      end
      #
      #      def sso_hash do
      #        %{
      #          Tag: "custom meta",
      #          FirstName: "Joe",
      #          LastName: "Blogs",
      #          Email: "#{build(:created_user)["Id"]}@mangopay.com",
      #          PermissionGroupId: created_permission_group()["Id"]
      #        }
      #      end
      #
      #      def update_sso_hash do
      #        %{
      #          Tag: "custom meta",
      #          FirstName: "Joe",
      #          LastName: "Blogs",
      #          PermissionGroupId: created_permission_group()["Id"],
      #          Active: true
      #        }
      #      end
      #
      #      def refund_pay_in_hash do
      #        %{
      #          Tag: "custom meta",
      #          AuthorId: build(:created_user)["Id"],
      #          DebitedFunds: %{
      #            Currency: "EUR",
      #            Amount: 450
      #          },
      #          Fees: %{
      #            Currency: "EUR",
      #            Amount: 3
      #          }
      #        }
      #      end
      #
      #      def refund_transfer_hash do
      #        %{Tag: "custom meta", AuthorId: build(:created_user)["Id"]}
      #      end
      #
      #      def settlement_transfer_hash do
      #        %{
      #          Tag: "custom meta",
      #          AuthorId: build(:created_repudiation)["AuthorId"],
      #          DebitedFunds: %{
      #            Currency: "EUR",
      #            Amount: 12
      #          },
      #          Fees: %{
      #            Currency: "EUR",
      #            Amount: 0
      #          }
      #        }
      #      end

      #      def first_ubo_declaration do
      #        {:ok, response} = MangoPay.UboDeclaration.all()
      #        response.body |> Poison.decode!() |> List.first()
      #      end
      #
      #      def get_ubo_declaration do
      #        MangoPay.UboDeclaration.get(first_ubo_declaration()["Id"])
      #      end
      #
      #      def update_card_cassette do
      #        {:ok, response} = MangoPay.Card.create(card_hash())
      #        registration_card = Poison.decode!(response.body)
      #
      #        response =
      #          MangoPay.request!(
      #            {:post, registration_card["CardRegistrationURL"],
      #             created_registration_card_preregistrationdata(registration_card)}
      #          )
      #
      #        registration_data = response.body
      #        MangoPay.Card.update(registration_card["Id"], update_card_hash(registration_data))
      #      end
      #
      #      def Factories.SharedFunctions.module_name(module) do
      #        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      #      end
      #
      #      def create_user_bis_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/natural/create_bis" do
      #          MangoPay.User.Natural.create(build(:user_natural))
      #        end
      #      end
      #
      #
      #      def create_permission_group_casssette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/permission_group/create" do
      #          MangoPay.PermissionGroup.create(permission_group_hash())
      #        end
      #      end
      #
      #      def get_permission_group_casssette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/permission_group/get" do
      #          MangoPay.PermissionGroup.get(created_permission_group()["Id"])
      #        end
      #      end
      #
      #      def all_dispute_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/all" do
      #          MangoPay.Dispute.all()
      #        end
      #      end
      #
      #      def create_hook_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/create" do
      #          MangoPay.Hook.create(hook_hash())
      #        end
      #
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/hook/all" do
      #          MangoPay.Hook.all()
      #        end
      #      end
      #
      #      def create_kyc_document_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create" do
      #          MangoPay.KycDocument.create(build(:created_user)["Id"], build(:kyc_document))
      #        end
      #
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create_page" do
      #          MangoPay.KycDocument.create_page(
      #            build(:created_user)["Id"],
      #            build(:created_kyc_document)["Id"],
      #            build(:kyc_document_page)
      #          )
      #        end
      #
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/submit" do
      #          MangoPay.KycDocument.submit(
      #            build(:created_user)["Id"],
      #            build(:created_kyc_document)["Id"],
      #            build(:submit_kyc_document)
      #          )
      #        end
      #      end
      #
      #      def create_permission_group_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/permission_group/create" do
      #          MangoPay.PermissionGroup.create(permission_group_hash())
      #        end
      #      end
      #
      #      def create_pay_in_refund_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/pay_in/create" do
      #          MangoPay.Refund.PayIn.create(build(:created_pay_in)["Id"], build(:refund_pay_in))
      #        end
      #      end
      #
      #      def create_transfer_refund_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/transfer/create" do
      #          MangoPay.Refund.Transfer.create(build(:created_transfer)["Id"], build(:transfer))
      #        end
      #      end
      #
      #      def create_sso_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/sso/create" do
      #          MangoPay.Sso.create(sso_hash())
      #        end
      #      end
      #
      #      def create_transfer_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/transfer/create" do
      #          MangoPay.Transfer.create(build(:transfer))
      #        end
      #      end
      #
      def create_transaction_reporting_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/transaction/create" do
          MangoPay.Reporting.Transaction.create(build(:reporting_transaction))
        end
      end

      #
      #      def create_wallet_reporting_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/wallet/create" do
      #          MangoPay.Reporting.Wallet.create(build(:reporting_wallet))
      #        end
      #      end
      #
      #      def all_reporting_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/all" do
      #          MangoPay.Reporting.all()
      #        end
      #      end
      #
      #      def get_repudiation_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/repudiation/get" do
      #          MangoPay.Repudiation.get(build(:created_dispute_bis)["RepudiationId"])
      #        end
      #      end
      #
      #      def create_settlement_transfer_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/settlement_transfer/create" do
      #          MangoPay.SettlementTransfer.create(
      #            build(:created_repudiation)["Id"],
      #            build(:settlement_transfer)
      #          )
      #        end
      #      end
      #
      #      def create_ubo_declaration_cassette do
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/ubo_declaration/user/all" do
      #          MangoPay.UboDeclaration.all()
      #        end
      #
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/ubo_declaration/user/get" do
      #          get_ubo_declaration()
      #        end
      #
      #        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/ubo_declaration/update" do
      #          MangoPay.UboDeclaration.update(
      #            build(:created_ubo_declaration)["Id"],
      #            build(:update_ubo_declaration)
      #          )
      #        end
      #      end
    end
  end
end
