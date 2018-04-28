defmodule MangoPay.CardFactory do
  @moduledoc false
  defmacro __using__([]) do
    quote do
      def created_registration_card(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "card",
                "registration",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_registration_card_bis(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "card", "create_bis.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_registration_card_registrationdata(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "card",
                "registrationdata.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_card(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "card", "get.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_card_bis(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "card", "create_bis.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def updated_card(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "card", "update.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def card_hash do
        %{
          Tag: "custom meta",
          UserId: build(:created_natural_user)["Id"],
          Currency: "EUR",
          CardType: "CB_VISA_MASTERCARD"
        }
      end

      def created_registration_card_preregistrationdata do
        "data=#{created_registration_card()["PreregistrationData"]}&accessKeyRef=#{
          created_registration_card()["AccessKey"]
        }&cardNumber=4706750000000017&cardExpirationDate=1219&cardCvx=123"
      end

      def created_registration_card_preregistrationdata(registration_card) do
        "data=#{registration_card["PreregistrationData"]}&accessKeyRef=#{
          registration_card["AccessKey"]
        }&cardNumber=4706750000000017&cardExpirationDate=1219&cardCvx=123"
      end

      def update_card_hash do
        %{RegistrationData: created_registration_card_registrationdata()}
      end

      def update_card_hash(registration_data) do
        %{RegistrationData: registration_data}
      end

      def deactivate_card_hash do
        %{Active: "false"}
      end

      def update_card_cassette do
        {:ok, response} = MangoPay.Card.create(card_hash())
        registration_card = Poison.decode!(response.body)

        response =
          MangoPay.request!(
            :post,
            registration_card["CardRegistrationURL"],
            created_registration_card_preregistrationdata(registration_card)
          )

        registration_data = response.body
        MangoPay.Card.update(registration_card["Id"], update_card_hash(registration_data))
      end

      def create_card_cassette do
        module_name = Factories.SharedFunctions.module_name(__MODULE__)

        use_cassette "#{module_name}/user/natural/create" do
          MangoPay.User.Natural.create(build(:user_natural))
        end

        use_cassette "#{module_name}/user/legal/create" do
          MangoPay.User.Legal.create(build(:user_legal))
        end

        use_cassette "#{module_name}/card/registration/create" do
          MangoPay.Card.create(card_hash())
        end

        use_cassette "#{module_name}/card/registrationdata" do
          {:ok, response} = MangoPay.Card.create(card_hash())
          registration_card = Poison.decode!(response.body)

          MangoPay.request(
            :post,
            registration_card["CardRegistrationURL"],
            created_registration_card_preregistrationdata(registration_card)
          )
        end

        use_cassette "#{module_name}/card/update" do
          update_card_cassette()
        end

        use_cassette "#{module_name}/card/create" do
          MangoPay.Card.get(updated_card()["CardId"])
        end

        use_cassette "#{module_name}/card/get" do
          MangoPay.Card.get(updated_card()["CardId"])
        end
      end

      def create_card_bis_cassette do
        module_name = Factories.SharedFunctions.module_name(__MODULE__)

        use_cassette "#{module_name}/user/natural/create" do
          MangoPay.User.Natural.create(build(:user_natural))
        end

        use_cassette "#{module_name}/user/legal/create" do
          MangoPay.User.Legal.create(build(:user_legal))
        end

        use_cassette "#{module_name}/card/registration/create" do
          MangoPay.Card.create(card_hash())
        end

        use_cassette "#{module_name}/card/registrationdata" do
          {:ok, response} = MangoPay.Card.create(card_hash())
          registration_card = Poison.decode!(response.body)

          MangoPay.request(
            :post,
            registration_card["CardRegistrationURL"],
            created_registration_card_preregistrationdata(registration_card)
          )
        end

        use_cassette "#{module_name}/card/update" do
          update_card_cassette()
        end

        use_cassette "#{module_name}/card/create" do
          MangoPay.Card.get(updated_card()["CardId"])
        end

        use_cassette "#{module_name}/card/create_bis" do
          {:ok, response} = MangoPay.Card.create(card_hash())
          body = Poison.decode!(response.body)

          {:ok, response} =
            MangoPay.request(
              :post,
              body["CardRegistrationURL"],
              "data=#{body["PreregistrationData"]}&accessKeyRef=#{body["AccessKey"]}&cardNumber=4706750000000017&cardExpirationDate=1219&cardCvx=123"
            )

          data = response.body
          {:ok, response} = MangoPay.Card.update(body["Id"], %{RegistrationData: data})
          body = Poison.decode!(response.body)
          MangoPay.Card.get(body["CardId"])
        end

        use_cassette "#{module_name}/card/get" do
          MangoPay.Card.get(updated_card()["CardId"])
        end
      end
    end
  end
end
