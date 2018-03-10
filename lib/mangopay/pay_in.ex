defmodule Mangopay.PayIn do
  use Mangopay.Query.Base, "payins"
  set_action "payins", [{:get}]

  def card_details(payin_id) do
    _get [resource(), "card/web", payin_id, "extended"]
  end

  defmodule Card do
    defmodule Web do
      use Mangopay.Query.Base, "payins/card/web"
      set_action "payins/card/web", [{:create}]
    end

    defmodule Direct do
      use Mangopay.Query.Base, "payins/card/direct"
      set_action "payins/card/direct", [{:create}]
    end

    defmodule PreAuthorized do
      use Mangopay.Query.Base, "payins/preauthorized/direct"
      set_action "payins/preauthorized/direct", [{:create}]
    end
  end

  defmodule BankWire do
    defmodule Wallet do
      use Mangopay.Query.Base, "clients/payins/bankwire/direct"
      set_action "clients/payins/bankwire/direct", [{:create}]
    end

    defmodule Direct do
      use Mangopay.Query.Base, "payins/bankwire/direct"
      set_action "payins/bankwire/direct", [{:create}]
    end
  end

  defmodule DirectDebit do
    defmodule Web do
      use Mangopay.Query.Base, "payins/directdebit/web"
      set_action "payins/directdebit/web", [{:create}]
    end

    defmodule Direct do
      use Mangopay.Query.Base, "payins/directdebit/direct"
      set_action "payins/directdebit/direct", [{:create}]
    end
  end
end
