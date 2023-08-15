# frozen_string_literal: true

class UserResource < JSONAPI::Resource
  caching
  attributes :names, :phone, :country_code, :wallet

  def names
    "#{@model.last_name}, #{@model.first_name}"
  end

  def wallet
    {
      credit: '0'.to_i ||= @model.wallet.credit_in_cents,
      debit: '0'.to_i ||= @model&.wallet&.debit_in_cents
    }
  end

end
