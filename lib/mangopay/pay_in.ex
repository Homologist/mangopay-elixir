defmodule Mangopay.PayIn do
  use Mangopay.Query.Base, "payins"
  set_action "payins", [{:get}]

  def card_details(payin_id) do
    _get [resource, "card/web", payin_id, "extended"]
  end

  defmodule Card do
    use Mangopay.Query.Base, "payins/card"
    set_action "payins/card", [{:get}]

    def create_web params do
      _create params, [resource, "web"]
    end

    def create_direct params do
      _create params, [resource, "direct"]
    end

    def create_preauthorized params do
      _create params, [resource, "preauthorized"]
    end
  end

  defmodule BankWire do
    use Mangopay.Query.Base, "payins/bank_wire"
    set_action "payins/bankwire", [{:get}]

    def create_web params do
      _create params, [client, resource]
    end

    def create_direct params do
      _create params, [resource, "direct"]
    end
  end

  defmodule Direct.Debit do
    use Mangopay.Query.Base, "payins/diretdebit"
    set_action "payins/directdebit", [{:get}]

    def create_web params do
      _create params, [resource, "web"]
    end

    def create_direct params do
      _create params, [resource, "direct"]
    end
  end
end
