ExUnit.start()
{:ok, _} = Application.ensure_all_started(:ex_machina)

defmodule Helper do
  defmacro __using__([]) do
    quote do
      use ExMachina

      def create_user_cassette do
        module_name = Factories.SharedFunctions.module_name(__MODULE__)

        use_cassette "#{module_name}/user/natural/create" do
          MangoPay.User.Natural.create(build(:user_natural))
        end
      end

      def create_user_bis_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/natural/create_bis" do
          MangoPay.User.Natural.create(build(:user_natural))
        end
      end

      def create_bank_account_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/user/natural/create" do
          MangoPay.User.Natural.create(build(:user_natural))
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/bank_account/iban/create" do
          MangoPay.BankAccount.create_iban(build(:created_user)["Id"], build(:bank_account_iban))
        end
      end

      def create_client_wallet_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/client_wallet/all" do
          MangoPay.ClientWallet.all()
        end
      end

      def create_dispute_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/all" do
          MangoPay.Dispute.all()
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/create" do
          build(:created_dispute)
        end
      end

      def create_dispute_bis_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/dispute/create_bis" do
          build(:created_dispute_bis)
        end
      end

      def all_dispute_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/dispute/all" do
          MangoPay.Dispute.all()
        end
      end

      def create_kyc_document_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create" do
          MangoPay.KycDocument.create(build(:created_user)["Id"], build(:kyc_document))
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create_page" do
          MangoPay.KycDocument.create_page(
            build(:created_user)["Id"],
            build(:created_kyc_document)["Id"],
            build(:kyc_document_page)
          )
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/submit" do
          MangoPay.KycDocument.submit(
            build(:created_user)["Id"],
            build(:created_kyc_document)["Id"],
            build(:submit_kyc_document)
          )
        end
      end

      def create_kyc_document_bis_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create_bis" do
          MangoPay.KycDocument.create(build(:created_user)["Id"], build(:kyc_document_bis))
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/user/create_page_bis" do
          MangoPay.KycDocument.create_page(
            build(:created_user)["Id"],
            build(:created_kyc_document_bis)["Id"],
            build(:kyc_document_page_bis)
          )
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/kyc_document/submit_bis" do
          MangoPay.KycDocument.submit(
            build(:created_user)["Id"],
            build(:created_kyc_document_bis)["Id"],
            build(:submit_kyc_document)
          )
        end
      end

      def create_mandate_cassette do
        create_bank_account_cassette()

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/mandate/create" do
          MangoPay.Mandate.create(build(:mandate))
        end
      end

      def create_pay_in_web_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/web/create" do
          MangoPay.PayIn.Card.Web.create(build(:pay_in_card_web))
        end
      end

      def create_pay_in_direct_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/direct/create" do
          MangoPay.PayIn.Card.Direct.create(build(:pay_in_card_direct))
        end
      end

      def create_pay_in_direct_bis_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/direct/create_bis" do
          MangoPay.PayIn.Card.Direct.create(build(:pay_in_card_direct))
        end
      end

      def create_preauthorization_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/preauthorization/create" do
          MangoPay.PreAuthorization.create(build(:preauthorization))
        end
      end

      def create_preauthorization_bis_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/preauthorization/create_bis" do
          MangoPay.PreAuthorization.create(build(:preauthorization))
        end
      end

      def create_pay_in_preauthorized_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/pay_in/card/pre_authorized/create" do
          MangoPay.PayIn.Card.PreAuthorized.create(build(:pay_in_card_preauthorized))
        end
      end

      def create_pay_in_refund_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/pay_in/create" do
          MangoPay.Refund.PayIn.create(build(:created_pay_in)["Id"], build(:refund_pay_in))
        end
      end

      def create_transfer_refund_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/transfer/create" do
          MangoPay.Refund.Transfer.create(build(:created_transfer)["Id"], build(:transfer))
        end
      end

      def create_transfer_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/transfer/create" do
          MangoPay.Transfer.create(build(:transfer))
        end
      end

      def create_transfer_bis_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/transfer/create_bis" do
          MangoPay.Transfer.create(build(:transfer))
        end
      end

      def create_settlement_transfer_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/settlement_transfer/create" do
          MangoPay.SettlementTransfer.create(
            build(:created_repudiation)["Id"],
            build(:settlement_transfer)
          )
        end
      end

      def get_repudiation_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/repudiation/get" do
          MangoPay.Repudiation.get(build(:created_dispute_bis)["RepudiationId"])
        end
      end

      def first_ubo_declaration do
        {:ok, response} = MangoPay.UboDeclaration.all()
        response.body |> Poison.decode!() |> List.first()
      end

      def get_ubo_declaration do
        MangoPay.UboDeclaration.get(first_ubo_declaration()["Id"])
      end

      def create_ubo_declaration_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/ubo_declaration/user/all" do
          MangoPay.UboDeclaration.all()
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/ubo_declaration/user/get" do
          get_ubo_declaration()
        end

        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/ubo_declaration/update" do
          MangoPay.UboDeclaration.update(
            build(:created_ubo_declaration)["Id"],
            build(:update_ubo_declaration)
          )
        end
      end
    end
  end
end
