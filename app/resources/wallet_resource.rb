# frozen_string_literal: true

class WalletResource < JSONAPI::Resource
  attributes :credit_in_cents, :debit_in_cents
end
