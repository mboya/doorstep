# frozen_string_literal: true

class ProductRouteResource < JSONAPI::Resource
  caching
  attributes :product_id, :product

  filter :route_id, required: true

  def product
    prd = @model.product
    {
      id: prd.id,
      code: prd.code,
      name: prd.name
    }
  end

  def fetchable_fields
    super - [:product_id]
  end
end
