# frozen_string_literal: true

class RouteResource < JSONAPI::Resource
  attributes :code, :name, :product_ids

  has_many :warehouses

  def fetchable_fields
    super - [:product_ids]
  end
end
