ExUnit.start()

defmodule CardHelper do
  defmacro __using__(opts \\ nil) do
    quote do
      def fixture_path(path) do
        "fixture/vcr_cassettes" <> path
      end

      def created_registration_card(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "card", "registration", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_registration_card_bis(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "card", "create_bis.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

      def created_registration_card_registrationdata(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(
              ["", module_name(__MODULE__), "card", "registrationdata.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def created_card(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "card", "get.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

      def created_card_bis(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "card", "create_bis.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

      def updated_card(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "card", "update.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

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
        {:ok, response} = Mangopay.Card.create(card_hash())
        registration_card = Poison.decode!(response.body)

        response =
          Mangopay.request!(
            {:post, registration_card["CardRegistrationURL"],
             created_registration_card_preregistrationdata(registration_card)}
          )

        registration_data = response.body
        Mangopay.Card.update(registration_card["Id"], update_card_hash(registration_data))
      end

      def create_card_cassette do
        module_name = module_name(__MODULE__)

        use_cassette "#{module_name}/user/natural/create" do
          Mangopay.User.Natural.create(user_natural_hash())
        end

        use_cassette "#{module_name}/user/legal/create" do
          Mangopay.User.Legal.create(user_legal_hash())
        end

        use_cassette "#{module_name}/card/registration/create" do
          Mangopay.Card.create(card_hash())
        end

        use_cassette "#{module_name}/card/registrationdata" do
          {:ok, response} = Mangopay.Card.create(card_hash())
          registration_card = Poison.decode!(response.body)

          Mangopay.request(
            {:post, registration_card["CardRegistrationURL"],
             created_registration_card_preregistrationdata(registration_card)}
          )
        end

        use_cassette "#{module_name}/card/update" do
          update_card_cassette()
        end

        use_cassette "#{module_name}/card/create" do
          Mangopay.Card.get(updated_card()["CardId"])
        end

        use_cassette "#{module_name}/card/get" do
          Mangopay.Card.get(updated_card()["CardId"])
        end
      end

      def create_card_bis_cassette do
        module_name = module_name(__MODULE__)

        use_cassette "#{module_name}/user/natural/create" do
          Mangopay.User.Natural.create(user_natural_hash())
        end

        use_cassette "#{module_name}/user/legal/create" do
          Mangopay.User.Legal.create(user_legal_hash())
        end

        use_cassette "#{module_name}/card/registration/create" do
          Mangopay.Card.create(card_hash())
        end

        use_cassette "#{module_name}/card/registrationdata" do
          {:ok, response} = Mangopay.Card.create(card_hash())
          registration_card = Poison.decode!(response.body)

          Mangopay.request(
            {:post, registration_card["CardRegistrationURL"],
             created_registration_card_preregistrationdata(registration_card)}
          )
        end

        use_cassette "#{module_name}/card/update" do
          update_card_cassette()
        end

        use_cassette "#{module_name}/card/create" do
          Mangopay.Card.get(updated_card()["CardId"])
        end

        use_cassette "#{module_name}/card/create_bis" do
          {:ok, response} = Mangopay.Card.create(card_hash())
          body = Poison.decode!(response.body)

          {:ok, response} =
            Mangopay.request(
              {:post, body["CardRegistrationURL"],
               "data=#{body["PreregistrationData"]}&accessKeyRef=#{body["AccessKey"]}&cardNumber=4970100000000154&cardExpirationDate=1219&cardCvx=123"}
            )

          data = response.body
          {:ok, response} = Mangopay.Card.update(body["Id"], %{RegistrationData: data})
          body = Poison.decode!(response.body)
          Mangopay.Card.get(body["CardId"])
        end

        use_cassette "#{module_name}/card/get" do
          Mangopay.Card.get(updated_card()["CardId"])
        end
      end
    end
  end
end
