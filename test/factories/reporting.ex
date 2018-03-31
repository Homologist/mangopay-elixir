defmodule Mangopay.ReportingFactory do
  defmacro __using__(_opts) do
    quote do
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
    end
  end
end
