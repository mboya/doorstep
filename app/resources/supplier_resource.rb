# frozen_string_literal: true

class SupplierResource < JSONAPI::Resource
  attributes :code, :name, :product_ids

  has_many :products
end
