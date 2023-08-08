# frozen_string_literal: true

class ProductResource < JSONAPI::Resource
  attributes :code, :name, :supplier_ids

  has_many :suppliers
end
