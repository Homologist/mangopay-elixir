defmodule Mangopay.CardFactory do
  defmacro __using__(_opts) do
    quote do
      def card_hash do
        %{
          Tag: "custom meta",
          UserId: created_natural_user(to_string(__MODULE__))["Id"],
          Currency: "EUR",
          CardType: "CB_VISA_MASTERCARD"
        }
      end

      def created_registration_card_preregistrationdata do
        "data=#{created_registration_card()["PreregistrationData"]}&accessKeyRef=#{
          created_registration_card()["AccessKey"]
        }&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"
      end

      def created_registration_card_preregistrationdata(registration_card) do
        "data=#{registration_card["PreregistrationData"]}&accessKeyRef=#{
          registration_card["AccessKey"]
        }&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"
      end
    end
  end
end
