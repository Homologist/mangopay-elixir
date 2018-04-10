defmodule Mangopay.ReportingFactory do
  defmacro __using__([]) do
    quote do
      def created_reporting_transaction_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "reporting",
                "transaction",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_reporting_wallet_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "reporting",
                "wallet",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

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

      def reporting_transaction_factory do
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
            AuthorId: build(:created_user)["Id"],
            WalletId: created_wallet()["Id"]
          },
          Columns: ["Id", "CreationDate"]
        }
      end

      def reporting_wallet_factory do
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

      def create_transaction_reporting_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/transaction/create" do
          Mangopay.Reporting.Transaction.create(build(:reporting_transaction))
        end
      end

      def create_wallet_reporting_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/wallet/create" do
          Mangopay.Reporting.Wallet.create(build(:reporting_wallet))
        end
      end

      def all_reporting_cassette do
        use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/reporting/all" do
          Mangopay.Reporting.all()
        end
      end
    end
  end
end
