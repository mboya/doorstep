# frozen_string_literal: true

class StockResource < JSONAPI::Resource
  attributes :warehouse_id, :product_id, :product

  def fetchable_fields
    super - %i[warehouse_id product_id]
  end

  def product
    {
      id: @model.product_id,
      name: @model.product.name,
      soh: @model.quantity,
      available: @model.available,
      reserved: @model.reserved
    }
  end
end
