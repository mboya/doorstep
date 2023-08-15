# frozen_string_literal: true

class WarehouseResource < JSONAPI::Resource
  attributes :code, :name, :whse_type, :route_id

  has_one :route
  has_many :stocks
end
