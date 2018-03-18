ExUnit.start()

defmodule ClientHelper do
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

      def created_client(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "client", "get.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

      def update_client_hash do
        %{
          PlatformDescription:
            "We are a marketplace specialised in rare flipflops for Europe and America. "
        }
      end

      def update_logo_client_hash do
        %{
          File:
            "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAEBAQEBAQEBAQEBAQECAgMCAgICAgQDAwIDBQQFBQUE BAQFBgcGBQUHBgQEBgkGBwgICAgIBQYJCgkICgcICAj/2wBDAQEBAQICAgQCAgQIBQQFCAgICAgI CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAyADIDAREA AhEBAxEB/8QAGwAAAgMBAQEA"
        }
      end

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end

      def all_client_wallet do
        use_cassette "#{module_name(__MODULE__)}/client_wallet/all" do
          Mangopay.ClientWallet.all()
        end
      end

      def get_client_cassette do
        use_cassette "#{module_name(__MODULE__)}/client/get" do
          Mangopay.Client.get()
        end
      end
    end
  end
end
