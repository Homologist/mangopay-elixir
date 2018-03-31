defmodule Mangopay.Factory do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use ExMachina
  use Mangopay.UserFactory
  use Mangopay.WalletFactory
  use Mangopay.CardFactory
  use Mangopay.BankAccountFactory
  use Mangopay.ClientFactory
  use Mangopay.DisputeFactory
  use Mangopay.DisputeDocumentFactory
  use Mangopay.HookFactory
  use Mangopay.KycDocumentFactory
  use Mangopay.MandateFactory
  use Mangopay.PayInFactory
  use Mangopay.PayOutFactory
  use Mangopay.PermissionGroupFactory
  use Mangopay.PreauthorizationFactory
  use Mangopay.RefundFactory
  use Mangopay.ReportingFactory
  use Mangopay.SettlementTransferFactory
  use Mangopay.SsoFactory
  use Mangopay.TransactionFactory
  use Mangopay.TransferFactory
  use Mangopay.UboDeclarationFactory
end
