defmodule MangoPay.PayIn do
  use MangoPay.Query.Base
  set_action "payins", [{:get}]

  def card_details(payin_id) do
    _get [resource(), "card/web", payin_id, "extended"]
  end

  defmodule Card do
    defmodule Web do
      use MangoPay.Query.Base
      set_action "payins/card/web", [{:create}]
    end

    defmodule Direct do
      use MangoPay.Query.Base
      set_action "payins/card/direct", [{:create}]
    end

    defmodule PreAuthorized do
      use MangoPay.Query.Base
      set_action "payins/preauthorized/direct", [{:create}]
    end
  end

  defmodule BankWire do
    defmodule Wallet do
      use MangoPay.Query.Base
      set_action "clients/payins/bankwire/direct", [{:create}]
    end

    defmodule Direct do
      use MangoPay.Query.Base
      set_action "payins/bankwire/direct", [{:create}]
    end
  end

  defmodule DirectDebit do
    defmodule Web do
      use MangoPay.Query.Base
      set_action "payins/directdebit/web", [{:create}]
    end

    defmodule Direct do
      use MangoPay.Query.Base
      set_action "payins/directdebit/direct", [{:create}]
    end
  end
end
