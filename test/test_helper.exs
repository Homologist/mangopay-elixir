Code.require_file("test/helpers/user.exs")
Code.require_file("test/helpers/bank_account.exs")
Code.require_file("test/helpers/card.exs")
Code.require_file("test/helpers/client.exs")
Code.require_file("test/helpers/mandate.exs")
Code.require_file("test/helpers/preauthorization.exs")
Code.require_file("test/helpers/wallet.exs")
Code.require_file("test/helpers/pay_in.exs")
Code.require_file("test/helpers/pay_out.exs")
Code.require_file("test/helpers/dispute.exs")
Code.require_file("test/helpers/dispute_document.exs")
Code.require_file("test/helpers/client_wallet.exs")
Code.require_file("test/helpers/hook.exs")
Code.require_file("test/helpers/permission_group.exs")
Code.require_file("test/helpers/ubo_declaration.exs")
Code.require_file("test/helpers/reporting.exs")
Code.require_file("test/helpers/repudiation.exs")
Code.require_file("test/helpers/settlement_transfer.exs")
Code.require_file("test/helpers/refund.exs")
Code.require_file("test/helpers/transfer.exs")
Code.require_file("test/helpers/sso.exs")
Code.require_file("test/helpers/kyc_document.exs")
ExUnit.start()

defmodule Helper do
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

      def module_name(module) do
        module |> to_string |> String.downcase() |> String.split(".") |> Enum.at(1)
      end
    end
  end
end
