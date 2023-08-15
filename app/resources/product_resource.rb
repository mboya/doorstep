# frozen_string_literal: true

class ProductResource < JSONAPI::Resource
  attributes :code, :name, :supplier_ids, :product_price_ids

  has_many :suppliers
  has_many :product_prices
end
