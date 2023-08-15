# frozen_string_literal: true

class CustomerResource < JSONAPI::Resource
  caching
  attributes :names, :phone, :country_code, :wallet, :first_name, :last_name, :password

  def names
    "#{@model.last_name}, #{@model.first_name}"
  end

  def wallet
    {
      credit: '0'.to_i ||= @model.wallet.credit_in_cents,
      debit: '0'.to_i ||= @model&.wallet&.debit_in_cents
    }
  end

  def fetchable_fields
    super - %i[first_name last_name password]
  end

  def self.updatable_fields(context)
    super - %i[first_name last_name country_code]
  end
end
