ExUnit.start()

defmodule ReportingHelper do
  defmacro __using__(opts \\ nil) do
    quote do
      def fixture_path(path) do
        "fixture/vcr_cassettes" <> path
      end

      def get_json(path) do
        a = fixture_path(path) |> File.read!() |> Poison.decode!() |> List.last()
        b = a["response"]["body"]

        case Poison.decode(b) do
          {:ok, val} -> val
          {:error, message} -> b
        end
      end

      def created_reporting_transaction(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "reporting", "transaction", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_reporting_wallet(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "reporting", "wallet", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_kyc_document(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "kyc_document", "user", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
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

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def create_transaction_reporting_cassette do
        use_cassette "#{module_name(__MODULE__)}/reporting/transaction/create" do
          Mangopay.Reporting.Transaction.create(reporting_transaction_hash())
        end
      end

      def create_wallet_reporting_cassette do
        use_cassette "#{module_name(__MODULE__)}/reporting/wallet/create" do
          Mangopay.Reporting.Wallet.create(reporting_wallet_hash())
        end
      end

      def all_reporting_cassette do
        use_cassette "#{module_name(__MODULE__)}/reporting/all" do
          Mangopay.Reporting.all()
        end
      end
    end
  end
end
