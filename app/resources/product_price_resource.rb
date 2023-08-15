# frozen_string_literal: true

class ProductPriceResource < JSONAPI::Resource
  attributes :product_id, :route_id, :cost_price_in_cents, :sell_price_in_cents

  filter :route_id

  has_one :product
  has_one :route
end
